# NSDecimalNumber Comparison Inconsistencies in Objective-C

This repository demonstrates a subtle bug related to comparing `NSDecimalNumber` objects in Objective-C. The issue stems from how `NSDecimalNumber` handles numbers created from different string representations of the same value. While comparing "0.1" and "0.10" directly using `compare:` might yield `NSOrderedSame`, performing arithmetic operations on these numbers before comparison can reveal unexpected inconsistencies.

The `Bug.m` file contains code showcasing this problem. The `BugSolution.m` file provides a solution that helps mitigate this issue by ensuring consistent number representation before comparison.  This can involve using `decimalNumberWithString:` with a standardized format for decimal numbers. 

This problem highlights the importance of carefully managing the precision and representation of numbers, especially when dealing with financial or scientific computations where precision is paramount.