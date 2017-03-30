:- consult('cco.pl').

% Questão 1
discfase(D,F) :- disciplina(F, D, _).

% Questão 2
prereqfase(Dpr,F) :- prerequisito(Dpr,D) , discfase(D,F).

% Questão 3
nomeprereqnome(Npr,N) :- disciplina(_,Dpr,Npr) , prerequisito(Dpr,D) , disciplina(_,D,N).
