:- consult('cco.pl').

% Predicados auxiliares.

% Retorna comprimento da lista
len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

% Questão 1
nfase(F, N) :-
  findall(_, disciplina(F,_,_), L) ,
  len(L,N) .

% Questão 2
ncurso(N) :-
  findall(_, disciplina(_,_,_), L) ,
  len(L,N) .

% Questão 3
ntempre(N) :-
  findall(D, setof(Dpr, prerequisito(Dpr,D) , L) , L) ,
  len(L,N) .

% Questão 4
nsaopre(N) :-
  findall(Dpr, prerequisito(Dpr,_), L) ,
  sort(L,Lr) ,
  len(Lr,N) .

% Questão 5
npre(D,N) :-
  findall(_, prerequisito(_,D), L) ,
  len(L,N) .

% Questão 6
maispre(N) :-
  findall(_, npre(_,N), L) ,
  len(L,N) .
