To address this, ensure consistent number representation before comparison.  Avoid creating `NSDecimalNumber` instances directly from different string representations of the same value. Instead, use a consistent format, such as always representing the number with a fixed number of decimal places.  You might use a helper method to normalize the number string before converting it to `NSDecimalNumber` or use `-[NSDecimalNumber decimalNumberWithDecimal:]` directly from `NSDecimal` after precise creation. 

Here is an example:

```objectivec
- (NSComparisonResult) compareDecimalNumbers:(NSDecimalNumber *)num1 with:(NSDecimalNumber *)num2 {
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:10 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSDecimal decimal1, decimal2;
    [num1 decimalValue:&decimal1];
    [num2 decimalValue:&decimal2];
    NSDecimal result;
    NSDecimalRound(&result, &decimal1, 10, NSRoundPlain);
    NSDecimalRound(&result, &decimal2, 10, NSRoundPlain);
    NSDecimalNumber *roundedNum1 = [[NSDecimalNumber alloc] initWithDecimal:result];
    NSDecimalNumber *roundedNum2 = [[NSDecimalNumber alloc] initWithDecimal:result];
    return [roundedNum1 compare:roundedNum2];
}
```
This revised approach using `NSDecimalNumberHandler` and rounding guarantees consistent comparison results regardless of initial string representations.