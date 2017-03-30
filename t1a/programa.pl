:- consult('cco.pl').

% Questão 1
discfase(D,F) :-
	disciplina(F, D, _).

% Questão 2
prereqfase(Dpr,F) :-
	prerequisito(Dpr,_) ,
	discfase(Dpr,F).

% Questão 3
nomeprereqnome(Npr,N) :-
	disciplina(_,Dpr,Npr) ,
	prerequisito(Dpr,D) ,
	disciplina(_,D,N).

% Questão 4
nomeprereqfase(Npr,Dpr,Fpr) :-
	prerequisito(Dpr,_) ,
	disciplina(Fpr,Dpr,Npr).

% Questão 5
prereqdiscfase(Dpr,D,F) :-
	prerequisito(Dpr,D) ,
	discfase(D,F).

% Questão 6
prereqdiscfaseprereq(Dpr,D,Fpr) :-
	discfase(Dpr,Fpr) ,
	prereqdiscfase(Dpr,D,_).

% Questão 7
nomeprereqdiscfase(Npr,Dpr,D,F) :-
	disciplina(_,Dpr,Npr) ,
	prereqdiscfase(Dpr,D,F).
