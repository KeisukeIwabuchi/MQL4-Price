# MQL4-Price
MQL4で価格をいい感じに変換するためのモジュール


## Description
価格、pips単位の値、point単位の値を相互に変換するモジュール。  

### pips
1pipsの計算は以下の通り。  
小数点以下の桁数が2桁または3桁の通貨ペア（ドル円など）の場合0.01  
小数点以下の桁数が4桁または5桁の通貨ペア（ユーロドルなど）の場合0.0001

### point
1ポイントの計算は以下の通り。  
小数点以下の桁数が3桁の場合、1ポイントは0.001  
小数点以下の桁数が5桁の場合、1ポイントは0.00001


## Requirement
- [MQL4-Assert](https://github.com/KeisukeIwabuchi/MQL4-Assert)
- [MQL4-Env](https://github.com/KeisukeIwabuchi/MQL4-Env)


## Install
1. Download Price.mqh
2. Save the file to /MQL4/Includes/mql4_modules/Price/Price.mqh


## Usage
Price.mqhを読み込んで使用する。  

### PipsToPoint
pips単位の値をpoint単位へ変換  

### PipsToPrice
pips単位の値を価格へ変換  

### PointToPips
point単位の値をpips単位へ変換  

### PointToPrice
point単位の値を価格へ変換  

### PriceToPips
価格をpips単位へ変換  

### PriceToPoint
価格をpoint単位へ変換  

### setMult, getMult
デフォルトの設定では小数点以下2～5桁以外の通貨/シンボルで変換をおこなう場合、正しく変換できない可能性がある。  
その場合はsetMultメソッドを使用して計算に使用している内部変数multを調整することができます。  
現在のmultの値を知りたい場合は、getMultで値を得ることが可能です。  
