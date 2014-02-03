//*****************************************************************************
//
// exercise1.c - Simple exercise1 world example.
//
// Copyright (c) 2011-2013 Texas Instruments Incorporated.  All rights reserved.
// Software License Agreement
// 
// Texas Instruments (TI) is supplying this software for use solely and
// exclusively on TI's microcontroller products. The software is owned by
// TI and/or its suppliers, and is protected under applicable copyright
// laws. You may not combine this software with "viral" open-source
// software in order to form a larger program.
// 
// THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
// NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
// NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
// CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
// DAMAGES, FOR ANY REASON WHATSOEVER.
// 
// This is part of revision 2.0.1.11577 of the EK-LM4F232 Firmware Package.
//
//*****************************************************************************
#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/rom.h"
#include "driverlib/pin_map.h"
#include "driverlib/uart.h"
#include "grlib/grlib.h"
#include "drivers/cfal96x64x16.h"
#include "utils/uartstdio.h"
#include "driverlib/gpio.h"
#include "driverlib/systick.h"
#include "driverlib/interrupt.h"
#include "utils/ustdlib.h"
#include "driverlib/timer.h"
#include "inc/hw_timer.h"
#include "inc/hw_nvic.h"
#include "inc/hw_types.h"
#include "inc/hw_ints.h"
//*****************************************************************************
//
//! \addtogroup example_list
//! <h1>exercise1 World (exercise1)</h1>
//!
//! A very simple ``exercise1 world'' example.  It simply displays ``exercise1 World!''
//! on the display and is a starting point for more complicated applications.
//! This example uses calls to the TivaWare Graphics Library graphics
//! primitives functions to update the display.  For a similar example using
//! widgets, please see ``exercise1_widget''.
//
//*****************************************************************************

//The serial port speed
#define BAUDRATE 115200
#define MAX_VAL 999999999;
//*****************************************************************************
//
// The error routine that is called if the driver library encounters an error.
//
//*****************************************************************************
#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
    UARTprintf("Library Error: line %d\n",ui32Line);
}
#endif

//*****************************************************************************
//
// Patches that were needed.
//
//*****************************************************************************
#if __STDC_VERSION__ < 199901L
#define restrict /* nothing */
#endif

//*****************************************************************************
//
// Flags that contain the current value of the interrupt indicator as displayed
// on the CSTN display.
//
//*****************************************************************************
uint32_t g_ui32Flags;
//*****************************************************************************
//
// Counter to count the number of interrupts that have been called by SysTick.
//
//*****************************************************************************
volatile uint32_t current_time = 0;
volatile uint32_t prevtime = 0;
//*****************************************************************************
//
// Stores the values to be measure. In general, measurements[0] stores minimum
// measurements[1], maximum; measurements[2] = average;
// measurements[3] = interrupt handler entry count
//
//*****************************************************************************
volatile uint32_t measurements[4];
//*****************************************************************************
//
// Stores the entry previous time to interrupt handler
//
//*****************************************************************************
volatile uint32_t prev_entrytime = 0;
//*****************************************************************************
//
// Period of timer0
//
//*****************************************************************************
const uint32_t timer0_period = 1150; // 50E6 * 0.000023
//*****************************************************************************
//
// Period of timer 1
//
//*****************************************************************************
const uint32_t timer1_period = 5000; // 50E6 * 0.0001
//*****************************************************************************
//
// Period of SysTick Timer.
//
//*****************************************************************************
const uint32_t systick_period = 6550;// 50E6 * 0.000131

tContext sContext;
//*****************************************************************************
//
// Configure the UART and its pins.  This must be called before UARTprintf().
//
//*****************************************************************************
void
ConfigureUART(void)
{
    //
    // Enable the GPIO Peripheral used by the UART.
    //
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);

    //
    // Enable UART0
    //
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);

    //
    // Configure GPIO Pins for UART mode.
    //
    ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
    ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
    ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    //
    // Use the internal 16MHz oscillator as the UART clock source.
    //
    UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC);

    //
    // Initialize the UART for console I/O.
    //
    UARTStdioConfig(0, BAUDRATE, 16000000);
}
//*****************************************************************************
//
// The interrupt handler for the for Systick interrupt.
//
//*****************************************************************************
void
SysTickIntHandler(void)
{
	if (HWREG(NVIC_ST_CTRL) & NVIC_ST_CTRL_COUNT){}
	current_time++;
}

uint32_t
GetSysTime() {
	// Wrap around has occurred but the ISR hasn't been called.
	if ((HWREG(NVIC_ST_CTRL) & NVIC_ST_CTRL_COUNT) != 0) {
		current_time++;
	}
	return systick_period * (current_time + 1) - HWREG(NVIC_ST_CURRENT);
}
//*****************************************************************************
//
// The interrupt handler for the first timer interrupt.
//
//*****************************************************************************
void
Timer0IntHandler(void)
{
	uint latency = TimerValueGet(TIMER0_BASE, TIMER_A);
    //
    // Clear the timer interrupt.
    //
    ROM_TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
    //
    // Toggle the flag for the first timer.
    //
    HWREGBITW(&g_ui32Flags, 0) ^= 1;
    // Get Minimum.
    if (latency < measurements[0]) {
    	measurements[0] = latency;
    }
    // Get Maximum.
    if (latency > measurements[1]) {
    	measurements[1]  = latency;
    }
    // Accummulate Average.
    measurements[2]+= latency;
    measurements[3]++;
}

//*****************************************************************************
//
// The interrupt handler for the second timer level 2 interrupt.
//
//*****************************************************************************
void
Timer1IntHandler(void)
{
	uint entrytime = GetSysTime();
	uint jitter;
    //
    // Clear the timer interrupt.
    //
    ROM_TimerIntClear(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
    //
    // Toggle the flag for the second timer.
    //
    HWREGBITW(&g_ui32Flags, 1) ^= 1;

//    entrytime = (current_time + 1) * systick_period - entrytime;

    if (prev_entrytime != 0) {
    	jitter = abs((int)((entrytime - prev_entrytime)-timer1_period))%systick_period;
		// Get Minimum.
		if (jitter < measurements[0]) {
			measurements[0] = jitter;
		}
		// Get Maximum.
		if (jitter > measurements[1]) {
			measurements[1]  = jitter;
		}
		// Accummulate Average.
		measurements[2]+= jitter;
		measurements[3]++;
    }
    prev_entrytime = entrytime;
}
//*****************************************************************************
//
// Sets up timer0 to count up periodically with a period of 23us.
// Its priority is 1. 0 is reserved for exception handling.
//
//*****************************************************************************
void
ConfigTimer0() {
	//Register Interrupt Handlers
	TimerIntRegister(TIMER0_BASE, TIMER_A, Timer0IntHandler);
	// Set the priority of the Timers
	// Set Timer0 as level 1 priority
	IntPrioritySet(INT_TIMER0A, 0x20);

	// Enable the timer peripherals.
	//
	ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
	//
	// Configure the two 32-bit periodic timers.
	//
	ROM_TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC_UP);
	ROM_TimerLoadSet(TIMER0_BASE, TIMER_A, timer0_period);
	//
	// Setup the interrupts for the timer timeouts.
	//
	ROM_IntEnable(INT_TIMER0A);
	ROM_TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
	//
	// Enable the timer0.
	//
	ROM_TimerEnable(TIMER0_BASE, TIMER_A);
}

//*****************************************************************************
//
// Sets up timer1 to count up periodically with a period of 131us.
// Its priority is 2. 0 is reserved for exception handling.
//
//*****************************************************************************
void
ConfigTimer1() {
	//Register Interrupt Handlers
	TimerIntRegister(TIMER1_BASE, TIMER_A, Timer1IntHandler);
	// Set the priority of the Timers
	// Set Timer1 as level 2 priority
	IntPrioritySet(INT_TIMER1A, 0x40);
	// Enable the timer peripherals.
	//
	ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);
	//
	// Configure the two 32-bit periodic timers.
	//
	ROM_TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC_UP);
	ROM_TimerLoadSet(TIMER1_BASE, TIMER_A, timer1_period);
	//
	// Setup the interrupts for the timer timeouts.
	//;
	ROM_IntEnable(INT_TIMER1A);
	ROM_TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
	//
	// Enable the timer1.
	//
	ROM_TimerEnable(TIMER1_BASE, TIMER_A);
}

//*****************************************************************************
//
// Sets up SysTick Timer to count down periodically with a period of 131us.
// Its priority is 3. 0 is reserved for exception handling.
//
//*****************************************************************************
void
ConfigSysTick() {
	 //
	// Register the interrupt handler function for Systick.
	//
	SysTickIntRegister(SysTickIntHandler);

	// Set SysTick Priority to level 3
	IntPrioritySet(FAULT_SYSTICK,0x60);

	//
	// Set up the period for the SysTick timer(Resolution 1us).
	//
	SysTickPeriodSet(systick_period);

	//
	// Enable interrupts to the processor.
	//
	IntMasterEnable();

	//
	// Enable the SysTick Interrupt.
	//
	SysTickIntEnable();

	//
	// Enable SysTick.
	//
	SysTickEnable();
}

//*****************************************************************************
//
// Print "exercise1 World!" to the display.
//
//*****************************************************************************
int
main(void)
{
    tRectangle sRect;
    //
    // Enable lazy stacking for interrupt handlers.  This allows floating-point
    // instructions to be used within interrupt handlers, but at the expense of
    // extra stack usage.
    //
    ROM_FPULazyStackingEnable();

    //
    // Set the clocking to run directly from the crystal.
    //
    ROM_SysCtlClockSet(SYSCTL_SYSDIV_4 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ |
                       SYSCTL_OSC_MAIN);

    //
    // Initialize the UART.
    //
    ConfigureUART();

    UARTprintf("exercise1, world!\n");

    //
    // Initialize the display driver.
    //
    CFAL96x64x16Init();

    //
    // Initialize the graphics context.
    //
    GrContextInit(&sContext, &g_sCFAL96x64x16);

    //
    // Fill the top 24 rows of the screen with blue to create the banner.
    //
    sRect.i16XMin = 0;
    sRect.i16YMin = 0;
    sRect.i16XMax = GrContextDpyWidthGet(&sContext) - 1;
    sRect.i16YMax = 23;
    GrContextForegroundSet(&sContext, ClrDarkBlue);
    GrRectFill(&sContext, &sRect);

    //
    // Put a white box around the banner.
    //
    GrContextForegroundSet(&sContext, ClrWhite);
    GrRectDraw(&sContext, &sRect);

    //
    // Put the application name in the middle of the banner.
    //
    GrContextFontSet(&sContext, g_psFontCm12);
    GrStringDrawCentered(&sContext, "exercise1", -1,
                         GrContextDpyWidthGet(&sContext) / 2, 10, 0);

    //
    // Flush any cached drawing operations.
    //
    GrFlush(&sContext);

    // Configure Interrupt Handler Variables.
    measurements[0] = MAX_VAL;
    measurements[1] = 0;
    measurements[2] = 0;
    measurements[3] = 0;

    /*
     * Configure Timers. Use ConfigTimer0() to setup and enable timer0
     * and ConfigTimer1() to setup and enable timer1
     */
    ConfigSysTick();
    ConfigTimer1();
    current_time = 0;

    uint number_of_loops = 0;
    char str1[5], str2[5], str3[5];
    while(1)
    {
    	/**************************
    	 * UART as Critical Section Area.
    	 **************************/
//    	if ((prevtime != HWREG(NVIC_ST_CURRENT))&&(number_of_loops < 100000)) {
//    		prevtime = HWREG(NVIC_ST_CURRENT);
//			ROM_IntMasterDisable();
//			UARTprintf("e");
//			ROM_IntMasterEnable();
//    	}

    	/*************************************
    	 * Use the commented out if statements
    	 * and comment out the IntMasterEnable() statements
		 * to use the GrStringDraw as critical section as done in my report.
		 *************************************/
//      if (prevtime != HWREG(NVIC_ST_CURRENT)) {
	  if (number_of_loops == 100000) {
          prevtime = HWREG(NVIC_ST_CURRENT);
          ROM_IntMasterDisable();
          usprintf(str1, "%d",measurements[0]);
          ROM_IntMasterEnable();
          ROM_IntMasterDisable();
          usprintf(str2, "%d",measurements[1]);
          ROM_IntMasterEnable();
          ROM_IntMasterDisable();
          usprintf(str3, "%d",measurements[2]/measurements[3]);
          ROM_IntMasterEnable();
          // Clear Screen
          sRect.i16XMin = 0;
          sRect.i16YMin = 0;
          sRect.i16XMax = GrContextDpyWidthGet(&sContext) - 1;
          sRect.i16YMax = GrContextDpyHeightGet(&sContext)-1;
          GrContextForegroundSet(&sContext, ClrBlack);
          ROM_IntMasterDisable();
          GrRectFill(&sContext, &sRect);
          ROM_IntMasterEnable();
          // Display results
          GrContextForegroundSet(&sContext, ClrWhite);
          ROM_IntMasterDisable();
          GrStringDraw(&sContext, str1, -1, 40, 22, 1);
          ROM_IntMasterEnable();
          ROM_IntMasterDisable();
          GrStringDraw(&sContext, str2, -1, 40, 34, 1);
          ROM_IntMasterEnable();
          ROM_IntMasterDisable();
          GrStringDraw(&sContext, str3, -1, 40, 46, 1);
          ROM_IntMasterEnable();
      }
	  number_of_loops++;
   }
}
