# MQL4-Price
Convert unit of price.


## Description
A module that mutually converts price, value of pips unit, value of point unit.

### pips
The calculation of 1 pips is as follows.  
When currency pair with two or three digits after the decimal point (dollar circle, etc.) 0.01  
When currency pair with 4 or 5 digits after the decimal point (euro doll etc.) 0.0001

### point
The calculation of 1 point is as follows.
If the number of digits after the decimal point is 3 digits, 1 point is 0.001
If the number of digits after the decimal point is 5 digits, 1 point is 0.00001


## Requirement
- [MQL4-Assert](https://github.com/KeisukeIwabuchi/MQL4-Assert)
- [MQL4-Env](https://github.com/KeisukeIwabuchi/MQL4-Env)


## Install
1. Download Price.mqh
2. Save the file to /MQL4/Include/mql4_modules/Price/Price.mqh


## Usage
Include Price.mqh and use the method.

### PipsToPoint
Convert pips unit value to point unit value.

### PipsToPrice
Convert pips unit value to price unit value.

### PointToPips
Convert point unit value to pips unit value.

### PointToPrice
Covert point unit value to price unit value.

### PriceToPips
Convert price unit value to pips unit value.

### PriceToPoint
Convert price unit value to point unit value.

### setScale, getScale
In the default setting, when converting with currency / symbol other than 2 to 5 digits after the decimal point, conversion may not be performed correctly.
In that case, you can use the setScale method to adjust the internal variable mult used for calculation.
If you want to know the current value of scale, you can get the value with getScale. 
