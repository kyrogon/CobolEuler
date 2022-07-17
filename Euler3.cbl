000100 identification division.
000200 program-id. euler3.
000300 environment division.
000400 configuration section.
000500     repository.
000600     function isPrime.
000700 data division.
000800 working-storage section.
000900     01 ws-testor        pic 9(12) value 600851475143.
001000     01 ws-remainder     pic 9(12).
001100     01 ws-prime-can     pic 9(12) value 2.
001200 procedure division.
001300 perform 100-init thru 100-exit.
001400 goback.
001500 100-init.
001600     continue.
001700 100-run.
001800     perform 
001900     until ws-prime-can > ws-testor ** 0.5
002000         divide ws-testor by ws-prime-can giving ws-remainder
002100           remainder ws-remainder
002200         if function isPrime(ws-testor) = "Y"
002300             display "Result: " ws-testor
002400             goback
002500         end-if
002600         if ws-remainder = 0
002700           and function isPrime(ws-prime-can) = "Y"
002800             perform 200-prime-found
002900         end-if
003000         add 1 to ws-prime-can
003100     end-perform.
003200 100-exit. exit.
003300 200-prime-found.
003400     divide ws-prime-can into ws-testor.
003500     move 2 to ws-prime-can.
003600 end program euler2.
