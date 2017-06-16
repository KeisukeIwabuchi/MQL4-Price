//+------------------------------------------------------------------+
//|                                                 PriceToPoint.mq4 |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Keisuke Iwabuchi"
#property link      "https://order-button.com/"
#property version   "1.00"
#property strict


#include <mql4_modules\UnitTest\UnitTest.mqh>
#include <mql4_modules\Price\Price.mqh>


UnitTest *test;


int OnInit()
{
   int result   = 0;
   int expected = 0;
   
   test = new UnitTest("Test Price module", "test");
   
   do {
      // price = 100
      result = Price::PriceToPoint(100);
      switch(__Digits) {
         case 0: expected = 100;       break;
         case 1: expected = 1000;      break;
         case 2: expected = 10000;     break;
         case 3: expected = 100000;    break;
         case 4: expected = 1000000;   break;
         case 5: expected = 10000000;  break;
         case 6: expected = 100000000; break;
      }
      test.TestValue(result, expected);
      
      
      // price = 1.23
      result = Price::PriceToPoint(1.23);
      switch(__Digits) {
         case 0: expected = 1;       break;
         case 1: expected = 12;      break;
         case 2: expected = 123;     break;
         case 3: expected = 1230;    break;
         case 4: expected = 12300;   break;
         case 5: expected = 123000;  break;
         case 6: expected = 1230000; break;
      }
      test.TestValue(result, expected);
      
      
      // price = 1.234567
      result = Price::PriceToPoint(1.234567);
      switch(__Digits) {
         case 0: expected = 1;       break;
         case 1: expected = 12;      break;
         case 2: expected = 123;     break;
         case 3: expected = 1235;    break;
         case 4: expected = 12346;   break;
         case 5: expected = 123457;  break;
         case 6: expected = 1234568; break;
      }
      test.TestValue(result, expected);
   }
   while(test.loadNextEnvFile());
   
   delete(test);
   
   return(INIT_SUCCEEDED);
}


void OnTick(){}