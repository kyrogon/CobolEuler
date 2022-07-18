000100 identification division.
000200 function-id. isPrime.
000300 data division.
000400 working-storage section.
000500     01 ws-max-divisor   pic 9(9).9(8).
000600     01 ws-iter          pic 9(9).
000700     01 ws-temp          pic 9(12).
000800     01 ws-remainder     pic 9(12).
000900 linkage section.
001000     01 ls-test-value    pic 9(12).
001100     01 ls-result        pic X.
001200 procedure division
001300     using ls-test-value
001400     returning ls-result.
001500 perform 100-init thru 100-exit.
001600 goback.
001700 100-init.
001800     move "Y" to ls-result.
001900     compute ws-max-divisor = ls-test-value ** 000.5 + 1.
002000 100-test.
002100     perform 
002200     varying ws-iter from 2 by 1
002300     until ws-iter > ws-max-divisor
002400         divide ls-test-value by ws-iter giving ws-temp 
002500           remainder ws-remainder
002600         if ws-remainder = 0
002700             move "N" to ls-result
002800             goback
002900     end-perform.
003000 100-exit. exit.
003100 end function isPrime.
