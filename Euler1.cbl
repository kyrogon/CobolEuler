000100 identification division.
000200 program-id. euler1.
000300 environment division.
000400 configuration section.
000500 repository.
000600     function sumDivisibleBy.
000700 data division.
000800 working-storage section.
000900     01 ws-maximum   pic 9(4)    value 1000.
001000     01 ws-multiple  pic 9(2)    value 3.
001100     01 ws-result    pic 9(6)    value 0.
001200 procedure division.
001300 perform 100-run thru 100-exit.
001400 goback.
001500 100-run.
001600     compute ws-result = sumDivisibleBy(03, 1000)
001700         +sumDivisibleBy(05, 1000)
001800         -sumDivisibleBy(15, 1000).
001900     display ws-result space ws-multiple.
002000 100-exit. exit.
002100 end program euler1.
002200*-----------------------------------------------------------------
002300 identification division.
002400 function-id. sumDivisibleBy.
002500 data division.
002600 working-storage section.
002700     01 ws-current   pic 9(4).
002800 linkage section.
002900     01 ls-multiple  pic 9(2).
003000     01 ls-maximum   pic 9(4).
003100     01 ls-result    pic 9(6).
003200 procedure division
003300 using ls-multiple ls-maximum
003400 returning ls-result.
003500 perform 100-init thru 100-exit.
003600 goback.
003700 100-init.
003800     move 0 to ls-result.
003900 100-run.
004000     perform
004100     varying ws-current from 0 by ls-multiple
004200     until ws-current >= ls-maximum
004300         add ws-current to ls-result
004400     end-perform.
004500 100-exit. exit.
004600 end function sumDivisibleBy.
004700 