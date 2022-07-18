000100 identification division.
000200 program-id. euler3.
000300 data division.
000400 working-storage section.
000500     01 ws-fibs.
000600         05 ws-fib   pic 9(7) occurs 3 times.
000700     01 ws-limit     pic 9(7) value 4000000.
000800     01 ws-result    pic 9(9) value zero.
000900 procedure division.
001000 perform 100-init thru 100-exit.
001100 goback.
001200 100-init.
001300     move 1 to ws-fib(1).
001400     move 1 to ws-fib(2).
001500 100-run.
001600     perform 200-add-next-fib until ws-fib(3) > ws-limit.
001700     display "Result: " ws-result.
001800 100-exit. exit.
001900 200-get-next-fib.
002000     add ws-fib(1) to ws-fib(2) giving ws-fib(3)
002100     move ws-fib(2) to ws-fib(1).
002200     move ws-fib(3) to ws-fib(2).
002300 200-add-next-fib.
002400     perform 200-get-next-fib.
002500     if function mod(ws-fib(3), 2) = 0
002600         add ws-fib(3) to ws-result
002700     end-if.
002800 end program euler3.
