RTOS_EX1
========

This code invsetigates the use of timers and their interrupts in the ARM Cortex M4 processor.
In the branch called part a is the code for setting up a basic real time clock RTC using systick timer.
The branch, part b investigates the calculation of jitter and interrupt latency.
The branch part c investigates the utilisation of the various interrupt handler ISRs and uses this information to 
calculate the return time for an interrupt function.
