       identification division.
       function-id. is-prime.
       data division.
       working-storage section.
           01 ws-max-divisor   pic 9(9).9(8).
           01 ws-iter          pic 9(9).
           01 ws-temp          pic 9(12).
           01 ws-remainder     pic 9(12).
           01 ws-test-value    pic 9(12).
       linkage section.
           01 ls-test-value    pic X any length.
           01 ls-result        pic X.
       procedure division
           using ls-test-value
           returning ls-result.
       perform 100-init thru 100-exit.
       goback.
       100-init.
           move "Y" to ls-result.
           move ls-test-value to ws-test-value.
           compute ws-max-divisor = ws-test-value ** 000.5 + 1.
       100-test.
           if ws-test-value = 1 or ws-test-value = 2
               if ws-test-value = 1 then
                   move "N" to ls-result
               else 
                   move "Y" to ls-result
               end-if
           else
           perform 
           varying ws-iter from 2 by 1
           until ws-iter > ws-max-divisor
               divide ws-test-value by ws-iter giving ws-temp 
                 remainder ws-remainder
               if ws-remainder = 0
                   move "N" to ls-result
                   goback
           end-perform
           end-if.
       100-exit. exit.
       end function is-prime.
      *-----------------------------------------------------------------
       identification division.
       function-id. get-primes.
       environment division.
       configuration section.
       repository.
           function is-prime.
       data division.
       working-storage section.
           01 ws-low-value         pic 9(4).
           01 ws-high-value        pic 9(4).
           01 ws-working-var       pic 9(4). 
           01 ws-prime-list-size   pic 9(4) value 0.
           01 ws-output.
               05 ws-list-size pic 9(2).
               05 ws-prime     pic 9(4) occurs 1 to 99 times
                   depending on ws-list-size.
       linkage section.
           01 ls-low-value  pic x any length.
           01 ls-high-value pic x any length.
           01 ls-output.
               05 ls-list-size pic 9(2).
               05 ls-prime     pic 9(4) occurs 1 to 99 times 
                   depending on ls-list-size.
       procedure division using
           ls-low-value,   ls-high-value
           returning ls-output.
       perform 100-init thru 100-exit.
       goback.
       100-init.
           move ls-low-value  to ws-low-value.
           move ls-high-value to ws-high-value.
           move ws-low-value to ws-working-var.
       100-loop.
           perform varying ws-working-var from 2 by 1
               until ws-working-var > ws-high-value
               if is-prime(ws-working-var) = "Y" then
                   perform 200-append
               end-if
           end-perform.
       100-cleanup.
           move ws-output to ls-output.
       100-exit. exit.
       200-append.
           add 1 to ws-list-size.
           move ws-working-var to ws-prime(ws-list-size).
       end function get-primes.
