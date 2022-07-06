       identification division.
       program-id. euler2.
       environment division.
       configuration section.
           repository.
           function isPrime.
       data division.
       working-storage section.
           01 ws-testor        pic 9(12) value 600851475143.
           01 ws-remainder     pic 9(12).
           01 ws-prime-can     pic 9(12) value 2.
           01 ws-current       pic 9(9).
           01 ws-nprimes       pic 9(9) value 5.
           01 ws-primes.
               05 ws-prime     pic 9(12) occurs 100 times indexed by i. 
       procedure division.
       perform 100-init thru 100-exit.
       goback.
       100-init.
           continue.
       100-run.
           perform 
           until ws-prime-can > ws-testor ** 0.5
               divide ws-testor by ws-prime-can giving ws-remainder
                 remainder ws-remainder
               if function isPrime(ws-testor) = "Y"
                   display "Result: " ws-testor
                   goback
               end-if
               if ws-remainder = 0
                 and function isPrime(ws-prime-can) = "Y"
                   perform 200-prime-found
               end-if
               add 1 to ws-prime-can
           end-perform.
       100-exit. exit.
       200-prime-found.
           perform 200-append-prime.
           divide ws-prime-can into ws-testor.
           move 2 to ws-prime-can.
       200-append-prime.
           move ws-prime-can to ws-prime(i).
           set i up by 1.
       end program euler2.
      *-----------------------------------------------------------------
       identification division.
       function-id. isPrime.
       data division.
       working-storage section.
           01 ws-max-divisor   pic 9(9).9(8).
           01 ws-iter          pic 9(9).
           01 ws-temp          pic 9(12).
           01 ws-remainder     pic 9(12).
       linkage section.
           01 ls-test-value    pic 9(12).
           01 ls-result        pic X.
       procedure division
           using ls-test-value
           returning ls-result.
       perform 100-init thru 100-exit.
       goback.
       100-init.
           move "Y" to ls-result.
           compute ws-max-divisor = ls-test-value ** 000.5 + 1.
       100-test.
           perform 
           varying ws-iter from 2 by 1
           until ws-iter > ws-max-divisor
               divide ls-test-value by ws-iter giving ws-temp 
                 remainder ws-remainder
               if ws-remainder = 0
                   move "N" to ls-result
                   goback
           end-perform.
       100-exit. exit.
       end function isPrime.
