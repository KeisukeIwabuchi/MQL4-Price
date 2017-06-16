//+------------------------------------------------------------------+
//|                                                  PipsToPoint.mq4 |
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
   int result   = 0;
   int expected = 0;
   
   test = new UnitTest("Test Price module", "test");
   
   do {
      // pips = 100
      result = Price::PipsToPoint(100);
      if(__Digits == 2 || __Digits == 4) {
         expected = 100;
      }
      else if(__Digits == 3 || __Digits == 5) {
         expected = 1000;
      }
      test.TestValue(result, expected);
      
      
      // pips = 12.4
      result = Price::PipsToPoint(12.4);
      if(__Digits == 2 || __Digits == 4) {
         expected = 12;
      }
      else if(__Digits == 3 || __Digits == 5) {
         expected = 124;
      }
      test.TestValue(result, expected);
      
      
      // pips = 12.5
      result = Price::PipsToPoint(12.5);
      if(__Digits == 2 || __Digits == 4) {
         expected = 13;
      }
      else if(__Digits == 3 || __Digits == 5) {
         expected = 125;
      }
      test.TestValue(result, expected);
      
      
      // pips =  0
      result = Price::PipsToPoint(0);
      expected = 0;
      test.TestValue(result, expected);
      
      
      // pips = -100
      result = Price::PipsToPoint(-100);
      if(__Digits == 2 || __Digits == 4) {
         expected = -100;
      }
      else if(__Digits == 3 || __Digits == 5) {
         expected = -1000;
      }
      test.TestValue(result, expected);
      
      
      // pips = -12.4
      result = Price::PipsToPoint(-12.4);
      if(__Digits == 2 || __Digits == 4) {
         expected = -12;
      }
      else if(__Digits == 3 || __Digits == 5) {
         expected = -124;
      }
      test.TestValue(result, expected);
   }
   while(test.loadNextEnvFile());
   
   delete(test);
   
   return(INIT_SUCCEEDED);
}


void OnTick(){}