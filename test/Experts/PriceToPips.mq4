//+------------------------------------------------------------------+
//|                                                  PriceToPips.mq4 |
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
      // price = 100, result = 10,000pips
      result = Price::PriceToPips(100);
      if(__Digits == 4 || __Digits == 5) {
         expected = 1000000;
      }
      else {
         expected = 10000;
      }
      
      test.TestValue(result, expected);
      
      
      // price = 1.23, result = 123pips
      result = Price::PriceToPips(1.23);
      if(__Digits == 4 || __Digits == 5) {
         expected = 12300;
      }
      else {
         expected = 123;
      }
      test.TestValue(0, result, expected);
      
      
      // price = 1.234567, result = 123.4567;
      result = Price::PriceToPips(1.234567);
      if(__Digits == 4 || __Digits == 5) {
         expected = 12345.67;
      }
      else {
         expected = 123.4567;
      }
      test.TestValue(4, result, expected);
   }
   while(test.loadNextEnvFile());
   
   delete(test);
   
   return(INIT_SUCCEEDED);
}


void OnTick(){}