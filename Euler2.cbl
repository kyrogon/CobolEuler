000100 identification division.
000200 program-id. euler2.
000300 environment division.
000400 configuration section.
000500     repository.
000600     function isPrime.
000700 data division.
000800 working-storage section.
000900     01 ws-testor        pic 9(12) value 600851475143.
001000     01 ws-remainder     pic 9(12).
001100     01 ws-prime-can     pic 9(12) value 2.
001200     01 ws-current       pic 9(9).
001300     01 ws-nprimes       pic 9(9) value 5.
001400     01 ws-primes.
001500         05 ws-prime     pic 9(12) occurs 100 times indexed by i. 
001600 procedure division.
001700 perform 100-init thru 100-exit.
001800 goback.
001900 100-init.
002000     continue.
002100 100-run.
002200     perform 
002300     until ws-prime-can > ws-testor ** 0.5
002400         divide ws-testor by ws-prime-can giving ws-remainder
002500           remainder ws-remainder
002600         if function isPrime(ws-testor) = "Y"
002700             display "Result: " ws-testor
002800             goback
002900         end-if
003000         if ws-remainder = 0
003100           and function isPrime(ws-prime-can) = "Y"
003200             perform 200-prime-found
003300         end-if
003400         add 1 to ws-prime-can
003500     end-perform.
003600 100-exit. exit.
003700 200-prime-found.
003800     perform 200-append-prime.
003900     divide ws-prime-can into ws-testor.
004000     move 2 to ws-prime-can.
004100 200-append-prime.
004200     move ws-prime-can to ws-prime(i).
004300     set i up by 1.
004400 end program euler2.
004500*-----------------------------------------------------------------
004600 identification division.
004700 function-id. isPrime.
004800 data division.
004900 working-storage section.
005000     01 ws-max-divisor   pic 9(9).9(8).
005100     01 ws-iter          pic 9(9).
005200     01 ws-temp          pic 9(12).
005300     01 ws-remainder     pic 9(12).
005400 linkage section.
005500     01 ls-test-value    pic 9(12).
005600     01 ls-result        pic X.
005700 procedure division
005800     using ls-test-value
005900     returning ls-result.
006000 perform 100-init thru 100-exit.
006100 goback.
006200 100-init.
006300     move "Y" to ls-result.
006400     compute ws-max-divisor = ls-test-value ** 000.5 + 1.
006500 100-test.
006600     perform 
006700     varying ws-iter from 2 by 1
006800     until ws-iter > ws-max-divisor
006900         divide ls-test-value by ws-iter giving ws-temp 
007000           remainder ws-remainder
007100         if ws-remainder = 0
007200             move "N" to ls-result
007300             goback
007400     end-perform.
007500 100-exit. exit.
007600 end function isPrime.
