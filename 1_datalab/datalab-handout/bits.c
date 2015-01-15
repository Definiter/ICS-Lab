/* 
 * CS:APP Data Lab 
 * 
 * <Hao Wang G1300012703>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
    /* only when (x, y) = (1, 1), ~(x & y) = 0, and
     * only when (x, y) = (0, 0), ~(~x & ~y) = 0 */
    return ~(x & y) & ~(~x & ~y);
}
/*
 * bitParity - returns 1 if x contains an odd number of 0's
 *   Examples: bitParity(5) = 0, bitParity(7) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 */
int bitParity(int x) {
    /* in n'th line's x, i'th bit represent whether [i, i + 2 ^ n - 1] bit
     * in original x contains an odd number of 1's (count from right)*/
    x = x ^ (x >> 1);
    x = x ^ (x >> 2);
    x = x ^ (x >> 4);
    x = x ^ (x >> 8);
    x = x ^ (x >> 16);
    return (x & 1);
}
/* 
 * anyOddBit - return 1 if any odd-numbered bit in word set to 1
 *   Examples anyOddBit(0x5) = 0, anyOddBit(0x7) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int anyOddBit(int x) {
    /* use 1010...1010 to check */
    int oddBit = (0xAA << 8) + 0xAA;
    oddBit = (oddBit << 16) + oddBit;
    return !!(oddBit & x);
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
    /* arithShift firstly, and use 000...11 as a mask.
     * ... << (32 + ~n) << 1 = ... << (31 - n) << 1 for avoid ... << 32 */
    return (x >> n) & ~(~0 << (32 + ~n) << 1);
}
/* 
 * rotateRight - Rotate x to the right by n
 *   Can assume that 0 <= n <= 31
 *   Examples: rotateRight(0x87654321,4) = 0x76543218 //wrong
 *   Examples: rotateRight(0x87654321,4) = 0x18765432
 *   Legal ops: ~ & ^ | + << >> !
 *   Max ops: 25
 *   Rating: 3 
 */
int rotateRight(int x, int n) {
    /* combine the right part and the left part */
    int negativeN = ~n + 1;
    int right = (x >> n) & ~(~0 << (32 + negativeN));
    int left = x << (32 + negativeN);
    return left | right;
}
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
    /* !isNegativeNum && !isPositiveNum */
    int isNegativeNum = (x >> 31) & 1;
    int isPositiveNum = ((~x + 1) >> 31) & 1;
    return (isNegativeNum | isPositiveNum) ^ 1;
}
/* 
 * TMax - return maximum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmax(void) {
    /* reverse 1000...0000 */
    return ~(1 << 31);
}
/* 
 * absVal - absolute value of x
 *   Example: absVal(-1) = 1.
 *   You may assume -TMax <= x <= TMax
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 4
 */
int absVal(int x) {
    /* use sign = x >> 31 as a mask, and ~sign + 1 = -sign */
    int sign = x >> 31;
    return ((x ^ sign) + ~sign + 1);
}
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
    /* use sign = x >> 31 as a mask, ~(~0 << n) is the bias when 
     * x is negative */
    int bias = (x >> 31) & ~(~0 << n);
    return (x + bias) >> n;
}
/*
 * ezFiveEighths - multiplies by 5/8 rounding toward 0,
 *   Should exactly duplicate effect of C expression (x*5/8),
 *   including overflow behavior.
 *   Examples: ezFiveEighths(22) = 13
 *             ezFiveEighths(-18) = -11
 *             ezFiveEighths(430124121) = -268043336 (overflow)
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 3
 */
int ezFiveEighths(int x) {
    /* x * 5 = x * (4 + 1) = (x << 2) + x, and use a bias when div */
    int product = (x << 2) + x;
    return (product + ((product >> 31) & 7)) >> 3;
}
/* 
 * isPositive - return 1 if x > 0, return 0 otherwise 
 *   Example: isPositive(-1) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 3
 */
int isPositive(int x) {
    /* ((x >> 31) & !) : is negative
     * !x : is zero */
    return !(((x >> 31) & 1) | !x);
}
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
    /* when sign of x and y is same, check x - y <= -1
     * when it is not same, just check sign of x */
    int signX = x >> 31;
    int signY = y >> 31;
    int sameSign = !(signX ^ signY);
    return (sameSign & ((x + ~y) >> 31)) | ((!sameSign) & signX);
}
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
    /* check half bits of x each time, and record the shift value sum */
    int flag, shift1, shift2, shift3, shift4, shift5;

    flag = !!(x >> 16);
    shift1 = flag << 4;
    x = x >> shift1;

    flag = !!(x >> 8);
    shift2 = flag << 3;
    x = x >> shift2;

    flag = !!(x >> 4);
    shift3 = flag << 2;
    x = x >> shift3;
    
    flag = !!(x >> 2);
    shift4 = flag << 1;
    x = x >> shift4;

    flag = !!(x >> 1);
    shift5 = flag;

    return shift1 + shift2 + shift3 + shift4 + shift5;
}
/* 
 * float_half - Return bit-level equivalent of expression 0.5*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_half(unsigned uf) {
    /* discuss those cases: exp = 0, exp = 1, exp > 1,
     * and remenber to round to even */
    int exp = uf & (0x7F800000);
    int sign = uf & (0x80000000);
    int frac = uf & (0x007FFFFF);
    int round = (frac & 3) == 3;
    
    if (exp == 0x7F800000) //NaN or Inf
        return uf;
    
    if (exp == 0x00000000){//exp = 0
        frac = (frac >> 1) + round;
    } else if (exp == 0x00800000){//exp = 1
        if (frac == 0x007FFFFF)
            frac = 0;
        else{
            exp = 0;
            frac = (1 << 22) + (frac >> 1) + round;
        }
    } else//exp > 1
        exp = exp - 0x00800000;
    return sign | exp | frac;
}
/* 
 * float_f2i - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int float_f2i(unsigned uf) {
    /* discuss those cases: NaN or Inf, exp = 0, exp > 0,
     * and calc the fraction part by shift*/
    int exp = (uf << 1) >> 24;
    int E = exp - 127;
    int frac = (uf & 0x007FFFFF) | 0x00FFFFFF;
    int s = 0;
    if (exp == 0){
        return 0;
    }
    if (exp == 0xFFFFFFFF){
        return 0x80000000u;
    }
    if (uf >> 31 == 0)
        s = 1;
    else
        s = -1;
    if (E < 0)
        return 0;
    if (E < 23)
        return s * (frac >> (23 - E));
    if (E < 31)
        return s * (frac << (E - 23));
    return 0x80000000u;
}
