:- consult('cco.pl').

% Questão 1
precomum(Dpr, D1, D2) :-
  prerequisito(Dpr,D1) ,
  prerequisito(Dpr,D2) ,
  disciplina(_,D1,_) ,
  disciplina(_,D2,_) ,
  D1 \= D2 .

% Questão 2
precomumsaopre(D1, D2, F) :-
  disciplina(F,D1,_) ,
  disciplina(F,D2,_) ,
  precomum(_,D1,D2) ,
  prerequisito(D1,_) ,
  prerequisito(D2,_) .

%% Questão 3
prepre(Dpr, D) :-
  disciplina(_,D,_) ,
  prerequisito(Dpr1,D) ,
  prerequisito(Dpr,Dpr1) .


% Questão 4
predistante(Dpr, D) :-
  disciplina(F,D,_) ,
  prerequisito(Dpr,D) ,
  disciplina(Fpr,Dpr,_) ,
  not((F is Fpr+1)) .

% Questão 5
prefasepar(Dpr, D) :-
  prerequisito(Dpr,D) ,
  disciplina(F,Dpr,_) ,
  0 is mod(F,2) .

% Questão 6 - RESOLVIDA
precadeia(X, []) :- \+prerequisito(X, _).
precadeia(X, [Y|Lc]) :- prerequisito(X, Y), precadeia(Y, Lc).

% Questão 7
precadeiatamanho(D, T) :- true.
