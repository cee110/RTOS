/*
 * exercise1.h
 *
 *  Created on: 29 Jan 2014
 *      Author: Administrator
 */

#ifndef EXERCISE1_H_
#define EXERCISE1_H_

#pragma GCC optimize("O0")
/*
 * Delay Macros for delay in microseconds
 * 50 cycles in one microsecond.
 * IN general, cycles = 25 + 8(n-1)
 * t = 0.5 + 0.16(n-1), where t is time in microseconds.
 */
#define Delay_us(t) {volatile int n = (100*(t) - 34)/16; while (n--);}

#endif /* EXERCISE1_H_ */
