       identification division.
       program-id. euler3.
       data division.
       working-storage section.
           01 ws-fibs.
               05 ws-fib   pic 9(7) occurs 3 times.
           01 ws-limit     pic 9(7) value 4000000.
           01 ws-result    pic 9(9) value zero.
       procedure division.
       perform 100-init thru 100-exit.
       goback.
       100-init.
           move 1 to ws-fib(1).
           move 1 to ws-fib(2).
       100-run.
           perform 200-add-next-fib until ws-fib(3) > ws-limit.
           display "Result: " ws-result.
       100-exit. exit.
       200-get-next-fib.
           add ws-fib(1) to ws-fib(2) giving ws-fib(3)
           move ws-fib(2) to ws-fib(1).
           move ws-fib(3) to ws-fib(2).
       200-add-next-fib.
           perform 200-get-next-fib.
           if function mod(ws-fib(3), 2) = 0
               add ws-fib(3) to ws-result
           end-if.
       end program euler3.