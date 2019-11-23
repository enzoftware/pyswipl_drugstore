/*Source code of expert system*/
:- use_module(library('bounds')).


coins(S, Count, Total) :-
 	% A=1, B=5, C=10, D=50, E=100
	S = [A, B, C, D, E],
	
	Av is   1,
	Bv is   5,
	Cv is  10,
	Dv is  50,
	Ev is 100,
	
	Aup is Total // Av,
	Bup is Total // Bv,
	Cup is Total // Cv,
	Dup is Total // Dv,
	Eup is Total // Ev,
	
	A in 0..Aup,
	B in 0..Bup,
	C in 0..Cup,
	D in 0..Dup,
	E in 0..Eup,
	
	VA #= A*Av,
	VB #= B*Bv,
	VC #= C*Cv,
	VD #= D*Dv,
	VE #= E*Ev,
	
	sum(S, #=, Count),
	VA + VB + VC + VD + VE #= Total,
	
	label(S).

program :-
    open('file.txt',write, Stream),
    forall(hypothesis(Disease), write(Stream,Disease)),
    close(Stream).

go:-
%hypothesis(Disease),
write('I believe that the patient have => cold').
%write(Disease).

% go(de):-
%     hypothesis(Disease),
%     write(Disease),
%     de is Disease.

/*Hypothesis that should be tested*/
hypothesis(cold) :- cold, !.
hypothesis(flu) :- flu, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(measles) :- measles, !.
hypothesis(malaria) :- malaria, !.
hypothesis(unknown). /* no diagnosis*/

/*Hypothesis Identification Rules*/

cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat).
% write('Advices and Sugestions:'),
% nl,
% write('1: Tylenol/tab'),
% nl,
% write('2: panadol/tab'),
% nl,
% write('3: Nasal spray'),
% nl,
% write('Please weare warm cloths Because'),
% nl.

flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_ache).
% write('Advices and Sugestions:'),
% nl,
% write('1: Tamiflu/tab'),
% nl,
% write('2: panadol/tab'),
% nl,
% write('3: Zanamivir/tab'),
% nl,
% write('Please take a warm bath and do salt gargling Because'),
% nl.

typhoid :-
verify(headache),
verify(abdominal_pain),
verify(poor_appetite),
verify(fever).
% write('Advices and Sugestions:'),
% nl,
% write('1: Chloramphenicol/tab'),
% nl,
% write('2: Amoxicillin/tab'),
% nl,
% write('3: Ciprofloxacin/tab'),
% nl,
% write('4: Azithromycin/tab'),
% nl,
% write('Please do complete bed rest and take soft Diet Because'),
% nl.

measles :-
verify(fever),
verify(runny_nose),
verify(rash),
verify(conjunctivitis).
% write('Advices and Sugestions:'),
% nl,
% write('1: Tylenol/tab'),
% nl,
% write('2: Aleve/tab'),
% nl,
% write('3: Advil/tab'),
% nl,
% write('4: Vitamin A'),
% nl,
% write('Please Get rest and use more liquid Because'),
% nl.

malaria :-
verify(fever),
verify(sweating),
verify(headache),
verify(nausea),
verify(vomiting),
verify(diarrhea).
% write('Advices and Sugestions:'),
% nl,
% write('1: Aralen/tab'),
% nl,
% write('2: Qualaquin/tab'),
% nl,
% write('3: Plaquenil/tab'),
% nl,
% write('4: Mefloquine'),
% nl,
% write('Please do not sleep in open air and cover your full skin Because'),
% nl.



:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))
).

/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.

/* how to ask questions */
ask(Question) :-
    % write('Does the patient have following symptom:'),
    % write(Question),
    % write('? '),
    assert(yes(Question)).
    % read(Response),
    % nl,
    % ( (Response == yes ; Response == y)
    % ->
    % assert(yes(Question)) ;
    % assert(no(Question)), fail).
:- program.