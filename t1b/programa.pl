:- consult('cco.pl').

% Questão 1
precomum(Dpr, D1, D2) :-
  prerequisito(Dpr,D1) ,
  prerequisito(Dpr,D2) ,
  disciplina(_,D1,_) ,
  disciplina(_,D2,_) ,
  D1 \= D2 .

% Questão 2
precomumsaopre(D1, D2, F) :- true.

%% Questão 3
prepre(Dpr, D) :- true.

% Questão 4
predistante(Dpr, D) :- true.

% Questão 5
prefasepar(Dpr, D) :- true.

% Questão 6 - RESOLVIDA
precadeia(X, []) :- \+prerequisito(X, _).
precadeia(X, [Y|Lc]) :- prerequisito(X, Y), precadeia(Y, Lc).

% Questão 7
precadeiatamanho(D, T) :- true.
