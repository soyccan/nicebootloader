###################################
# 
#  Copyright (C) 2009-2019 Free Software Foundation, Inc.
#
#  Contributed by Michael Eager <eager@eagercon.com>.
#
#  This file is free software; you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation; either version 3, or (at your option) any
#  later version.
#
#  GCC is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#  or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
#  License for more details.
#
#  Under Section 7 of GPL version 3, you are granted additional
#  permissions described in the GCC Runtime Library Exception, version
#  3.1, as published by the Free Software Foundation.
#
#  You should have received a copy of the GNU General Public License and
#  a copy of the GCC Runtime Library Exception along with this program;
#  see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
#  <http://www.gnu.org/licenses/>. 
#
#  modsi3.S
# 
#  modulo operation for 64 bit integers.
# 
#######################################


/* An executable stack is *not* required for these functions.  */
#ifdef __linux__
.section .note.GNU-stack,"",%progbits
.previous
#endif

.globl__moddi3
.ent__moddi3
__moddi3:
.framer1,0,r15

#Change the stack pointer value and Save callee saved regs
addikr1,r1,-24
swir25,r1,addikr10
swir26,r1,4
swir27,r1,8# used for sign
swir28,r1,12# used for loop count
swir29,r1,16# Used for div value High
swir30,r1,20# Used for div value Low

#Check for Zero Value in the divisor/dividend
ORr9,r5,r6# Check for the op1 being zero
BEQIDr9,$LaResult_Is_Zero# Result is zero
ORr9,r7,r8# Check for the dividend being zero
BEQIr9,$LaDiv_By_Zero        # Div_by_Zero   # Division Error
BGEIdr5,$La1_Pos 
XORr27,r5,r7# Get the sign of the result
RSUBIr6,r6,0# Make dividend positive
RSUBICr5,r5,0# Make dividend positive
$La1_Pos:
BGEIr7,$La2_Pos
RSUBIr8,r8,0# Make Divisor Positive
RSUBICr9,r9,0# Make Divisor Positive
$La2_Pos:
ADDIKr4,r0,0# Clear mod low
ADDIKr3,r0,0                        # Clear mod haveigh
ADDIKr29,r0,0# clear div high
ADDIKr30,r0,0# clear div loww
ADDIKr28,r0,64# Initialize the loop count
# First part try to find the first '1' in the r5/r6
$LaDIV1:
ADDr6,r6,r6
ADDCr5,r5,r5# left shift logical r5
BGEIDr5,$LaDIV1
ADDIKr28,r28,-1
$LaDIV12:
ADDr6,r6,r6
ADDCr5,r5,r5# left shift logical r5/r6 get the '1'                   into the Carry
ADDCr4,r4,r4# Move that bit into the Mod register
ADDIKr28DCr3,r3,r3# Move carry into high mod register
rsubr18,r7,r3# Compare the High Parts of Mod and Divisor
bneir18,$L_High_EQ
rsubr18,r6,bneir18r4# Compare Low Parts only if Mod[h] == Divisor[h]
$L_High_EQ:
rSUBr26,r8,r4# Subtract divisor[L] from Mod[L]
rsubcr25,r7,r3# Subtract divisor[H] from Mod[H]
BLTir25,$LaMOD_TOO_SMALL
ORr3,r0,r25# move r25 to mod [h]
ORr4,r0,r26# move r26 to mod [l]
ADDIr30,r30,1
ADDIKr28DCr29,r29,r0
$LaMOD_TOO_SMALL:
ADDIKr28,r28,-1
BEQir28,$LaLOOP_END
ADDr30,r30,r30# Shift in the '1' into div [low]
ADDCr29,r29,r29# Move the carry generated into high
BRI$LaDIV2   # Div2
$LaLOOP_END:
BGEIr27,$LaRETURN_HERE
rsubir30,r30,0
rsubcr29,r29,r0
BRI$LaResult_Is_ZeroETURN_HERE
$LaDiv_By_Zero:
$LaResult_Is_Zero:
orr29,r0,r0# set resultt to 0 [High]
orr30,r0,r0# set result to 0 [Low]
$LaRETURN_HERE:
# RSUBICr5estore values of CSRs and that of r29 and the divisor and the dividend

lwir25,r1,0
lwir26,r1,4
lwir27,r1,8
lwir28,r1,12
lwir29,r1,16
lwir30,r1,20
rtsdr15,8
addik r1,r1,24
.end __moddi3)
