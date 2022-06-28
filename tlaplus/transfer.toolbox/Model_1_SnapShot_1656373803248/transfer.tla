------------------------------ MODULE transfer ------------------------------

EXTENDS Naturals, TLC

(* --algorithm transfer
variables alice_account = 10, bob_account = 10, money \in 1..20;

begin
A: alice_account := alice_account - money;
B: bob_account := bob_account + money;
C: assert alice_account >= 0;

end algorithm *)
\* BEGIN TRANSLATION (chksum(pcal) = "4f516040" /\ chksum(tla) = "aae4fbfe")
VARIABLES alice_account, bob_account, money, pc

vars == << alice_account, bob_account, money, pc >>

Init == (* Global variables *)
        /\ alice_account = 10
        /\ bob_account = 10
        /\ money \in 1..20
        /\ pc = "A"

A == /\ pc = "A"
     /\ alice_account' = alice_account - money
     /\ pc' = "B"
     /\ UNCHANGED << bob_account, money >>

B == /\ pc = "B"
     /\ bob_account' = bob_account + money
     /\ pc' = "C"
     /\ UNCHANGED << alice_account, money >>

C == /\ pc = "C"
     /\ Assert(alice_account >= 0, 
               "Failure of assertion at line 11, column 4.")
     /\ pc' = "Done"
     /\ UNCHANGED << alice_account, bob_account, money >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == A \/ B \/ C
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Tue Jun 28 08:49:52 JST 2022 by ix523
\* Created Tue Jun 28 08:39:31 JST 2022 by ix523
