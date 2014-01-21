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

//
// The interrupt handler function.
//
extern void SysTickIntHandler(void);
extern void Timer0IntHandler(void);
extern void Timer1IntHandler(void);
//*****************************************************************************
//
// Flags that contain the current value of the interrupt indicator as displayed
// on the CSTN display.
//
//*****************************************************************************
uint32_t g_ui32Flags;
//*****************************************************************************
//
// Counter to count the number of interrupts that have been called.
//
//*****************************************************************************
volatile uint32_t mytime = 0;
uint32_t prevtime = 0;
uint resolution = .000131;
uint32_t systick_period;
tContext sContext;
uint array[50];
uint arrayptr = 0;
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
//	mytime++;
}

//*****************************************************************************
//
// Custom Timer Function. Returns the current time in us.
//
//*****************************************************************************
uint
GetSysTime() {
	//Convert tick count to time
	uint tick = mytime * systick_period;
	tick += systick_period - SysTickValueGet();
	// one tick is 0.02us
	return tick * 0.02;
}
//*****************************************************************************
//
// The interrupt handler for the first timer interrupt.
//
//*****************************************************************************
void
Timer0IntHandler(void)
{
	//Capture the entry time
	array[arrayptr] = TimerValueGet(TIMER0_BASE, TIMER_A);
	arrayptr++;
	// If arrayptr = 50 disable all interrupts to stop timing
	if (arrayptr == 50) IntMasterDisable();
    //
    // Clear the timer interrupt.
    //
    ROM_TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

    //
    // Toggle the flag for the first timer.
    //
    HWREGBITW(&g_ui32Flags, 0) ^= 1;
    mytime++;
}

//*****************************************************************************
//
// The interrupt handler for the second timer interrupt.
//
//*****************************************************************************
void
Timer1IntHandler(void)
{
    //
    // Clear the timer interrupt.
    //
    ROM_TimerIntClear(TIMER1_BASE, TIMER_TIMA_TIMEOUT);

    //
    // Toggle the flag for the second timer.
    //
    HWREGBITW(&g_ui32Flags, 1) ^= 1;
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

    // *******************************
    //	Coursework Area Below!
    // ********************************

    //Register Interrupt Handlers
    IntRegister(INT_TIMER0A, Timer0IntHandler);
    IntRegister(INT_TIMER1A, Timer1IntHandler);
    TimerIntRegister(TIMER0_BASE, TIMER_A, Timer0IntHandler);
    TimerIntRegister(TIMER1_BASE, TIMER_A, Timer1IntHandler);
    // Enable the timer peripherals.
    //
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);

    //
    // Configure the two 32-bit periodic timers.
    //
    ROM_TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);
    ROM_TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC);
    ROM_TimerLoadSet(TIMER0_BASE, TIMER_A, ROM_SysCtlClockGet()*.000023);
    ROM_TimerLoadSet(TIMER1_BASE, TIMER_A, ROM_SysCtlClockGet()*.0001);

	//
    // Setup the interrupts for the timer timeouts.
    //
    ROM_IntEnable(INT_TIMER0A);
    ROM_IntEnable(INT_TIMER1A);
    ROM_TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
    ROM_TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);

    //
    // Enable the timers.
    //
    ROM_TimerEnable(TIMER0_BASE, TIMER_A);
    ROM_TimerEnable(TIMER1_BASE, TIMER_A);

    // Configure interrupt Handler
    // The SysTick and SysTick interrupt with a resolution of the system clock.
    //
	// Initialize the interrupt counter.
	//
	mytime = 0;
	//
	// Register the interrupt handler function for SysTick.
	//
	SysTickIntRegister(SysTickIntHandler);

	//
	// Set up the period for the SysTick timer(Resolution 1us).
	//
	systick_period = SysCtlClockGet()*resolution;
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


	char str[4];
	// *****
	// Timer Test Area
	// *****
	/**
	 * We need to calculate min, max and ave timer entry count.
	 */
	bool myswitch = 1;
    while(1)
    {
    	if (myswitch){
			if (prevtime != mytime) {
				prevtime = mytime;
				usprintf(str, "%d",GetSysTime());
				ROM_IntMasterDisable();
				GrStringDraw(&sContext, str, -1, 48,
							 46, 1);
				ROM_IntMasterEnable();
			}
    	}
    	// Calculate Min, Max and Ave Entry time
    	if (arrayptr >= 50 && myswitch) {
    		uint min = array[0], max = array[0];
    		uint ave = 0;
    		for (int i = 0; i < 50; i++) {
    			if (array[i] < min) min = array[i];
    			if (array[i] > max) max = array[i];
    			ave += array[i];
    		}
    		ave /= 50;
    		char str1[5], str2[5], str3[5];
    		usprintf(str1, "%d",min);
    		usprintf(str2, "%d",max);
    		usprintf(str3, "%d",ave);
    		//Clear Display
    		sRect.i16YMax = 63;
			GrContextForegroundSet(&sContext, ClrBlack);
			GrRectFill(&sContext, &sRect);
    		//Display results
			GrContextForegroundSet(&sContext, ClrWhite);
    		GrStringDraw(&sContext, str1, -1, 48, 22, 1);
    		GrStringDraw(&sContext, str2, -1, 48, 34, 1);
    		GrStringDraw(&sContext, str3, -1, 48, 46, 1);
    		myswitch = 0;//Display once
    	}
    }
}
// Latency is min 27clocks, max 1129 clocks, ave 898 clocks. I can not explain this.
