//+------------------------------------------------------------------+
//|                                                  PipsToPrice.mq4 |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Keisuke Iwabuchi"
#property link      "https://order-button.com/"
#property version   "1.00"
#property strict


#include <mql4_modules\UnitTest\UnitTest.mqh>
#include <mql4_modules\Price\Price.mqh>
#include <mql4_modules\SymbolSearch\SymbolSearch.mqh>


UnitTest *test;


int OnInit()
{
   double result   = 0;
   double expected = 0;
   
   test = new UnitTest("Test Price module", "test");
   
   do {
      // pips =  100
      result = Price::PipsToPrice(100);
      if(__Digits == 2 || __Digits == 3) {
         expected = 1;
      }
      else if(__Digits == 4 || __Digits == 5) {
         expected = 0.01;
      }
      test.TestValue(3, result, expected);
      
      
      // pips = 12.3
      result = Price::PipsToPrice(12.3);
      if(__Digits == 2 || __Digits == 3) {
         expected = 0.123;
      }
      else if(__Digits == 4 || __Digits == 5) {
         expected = 0.00123;
      }
      test.TestValue(5, result, expected);
      
      
      // pips = 1.2345678
      result = Price::PipsToPrice(1.2345678);
      if(__Digits == 2 || __Digits == 3) {
         expected = 0.012345678;
      }
      else if(__Digits == 4 || __Digits == 5) {
         expected = 0.00012345678;
      }
      test.TestValue(5, result, expected);
      
      
      // pips =  0
      result = Price::PipsToPrice(0);
      expected = 0;
      test.TestValue(8, result, expected);
      
      
      // pips = -100
      result = Price::PipsToPrice(-100);
      if(__Digits == 2 || __Digits == 3) {
         expected = -1;
      }
      else if(__Digits == 4 || __Digits == 5) {
         expected = -0.01;
      }
      test.TestValue(3, result, expected);
      
      
      // pips = -12.3
      result = Price::PipsToPrice(-12.3);
      if(__Digits == 2 || __Digits == 3) {
         expected = -0.123;
      }
      else if(__Digits == 4 || __Digits == 5) {
         expected = -0.00123;
      }
      test.TestValue(5, result, expected);
   }
   while(test.loadNextEnvFile());
   
   delete(test);
   
   return(INIT_SUCCEEDED);
}


void OnTick(){}