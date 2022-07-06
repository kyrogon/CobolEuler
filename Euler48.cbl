       identification division.
       program-id. euler48.
       data division.
       working-storage section.
           01 ws-power     pic 9(10).
           01 ws-result    pic 9(10).
           01 ws-limit     pic 9(4) value 1000.
           01 ws-current   pic 9(4) value 999.
           01 ws-x         pic 9(10).

       procedure division.
       100-init.
           accept ws-limit from command-line.
       100-run.
           perform 
           varying ws-current from 1 by 1
           until ws-current > ws-limit
               perform 200-calc-power
               add ws-power to ws-result
           end-perform.
           display ws-result.
       100-exit. exit.
       goback.
       200-calc-power.
           move 1 to ws-power.
           perform varying ws-x from 1 by 1 until ws-x > ws-current
               multiply ws-current by ws-power
           end-perform.
       end program euler48.
