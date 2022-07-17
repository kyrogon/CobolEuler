000100 identification division.
000200 program-id. euler1.
000300 environment division.
000400 configuration section.
000500 repository.
000600     function sumDivisibleBy.
000700 data division.
000800 working-storage section.
000900     01 ws-result    pic 9(6)    value 0.
001000 procedure division.
001100 perform 100-run thru 100-exit.
001200 goback.
001300 100-run.
001400     compute ws-result = sumDivisibleBy(3, 1000)
001500         +sumDivisibleBy(5, 1000)
001600         -sumDivisibleBy(15, 1000).
001700     display "Result: " ws-result.
001800 100-exit. exit.
001900 end program euler1.
002000*-----------------------------------------------------------------
002100 identification division.
002200 function-id. sumDivisibleBy.
002300 data division.
002400 working-storage section.
002500     01 ws-current   pic 9(4).
002600     01 ws-multiple  pic 9(4).
002700     01 ws-maximum   pic 9(4).
002800 linkage section.
002900     01 ls-multiple  pic X any length.
003000     01 ls-maximum   pic X any length.
003100     01 ls-result    pic 9(6).
003200 procedure division
003300 using ls-multiple ls-maximum
003400 returning ls-result.
003500 perform 100-init thru 100-exit.
003600 goback.
003700 100-init.
003800     move ls-multiple to ws-multiple.
003900     move ls-maximum to ws-maximum.
004000     move 0 to ls-result.
004100 100-run.
004200     perform
004300     varying ws-current from 0 by ws-multiple
004400     until ws-current >= ws-maximum
004500         add ws-current to ls-result
004600     end-perform.
004700 100-exit. exit.
004800 end function sumDivisibleBy.
