/*Given an array of integers, find the sum of its elements.
For example, if the array ar = [1,2,3], 1+2+3=6 so return 6.

Function Description
Complete the simpleArraySum function in the editor below. It must return the sum of the array elements as an integer.
simpleArraySum has the following parameter(s):
ar: an array of integers

Input Format
The first line contains an integer, n, denoting the size of the array.
The second line contains n space-separated integers representing the array's elements.

Constraints
0<n, ar[i] <1000

Output Format
Print the sum of the array's elements as a single integer.

Sample Input
6
1 2 3 4 10 11

Sample Output
31

Explanation
We print the sum of the array's elements: 1+2+3+4+10+11=31. */

import java.io.*
import java.math.*
import java.security.*
import java.text.*
import java.util.*
import java.util.concurrent.*
import java.util.function.*
import java.util.regex.*
import java.util.stream.*
import kotlin.collections.*
import kotlin.comparisons.*
import kotlin.io.*
import kotlin.jvm.*
import kotlin.jvm.functions.*
import kotlin.jvm.internal.*
import kotlin.ranges.*
import kotlin.sequences.*
import kotlin.text.*

/*
 * Complete the 'simpleArraySum' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY ar as parameter.
 */

fun simpleArraySum(ar: Array<Int>, arCount: Int): Int {
    var sum = 0
    for (i in 0 until arCount) {
        sum += ar[i]
    }
    return sum
}

fun main(args: Array<String>) {
    val arCount = readLine()!!.trim().toInt()

    val ar = readLine()!!.trimEnd().split(" ").map{ it.toInt() }.toTypedArray()

    val result = simpleArraySum(ar, arCount)

    println(result)
}