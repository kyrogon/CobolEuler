000100 identification division.
000200 program-id. euler48.
000300 data division.
000400 working-storage section.
000500     01 ws-power     pic 9(10).
000600     01 ws-result    pic 9(10).
000700     01 ws-limit     pic 9(4) value 1000.
000800     01 ws-current   pic 9(4) value 999.
000900     01 ws-x         pic 9(10).
001000 procedure division.
001100 100-init.
001200     accept ws-limit from command-line.
001300 100-run.
001400     perform 
001500     varying ws-current from 1 by 1
001600     until ws-current > ws-limit
001700         perform 200-calc-power
001800         add ws-power to ws-result
001900     end-perform.
002000     display ws-result.
002100 100-exit. exit.
002200 goback.
002300 200-calc-power.
002400     move 1 to ws-power.
002500     perform varying ws-x from 1 by 1 until ws-x > ws-current
002600         multiply ws-current by ws-power
002700     end-perform.
002800 end program euler48.
