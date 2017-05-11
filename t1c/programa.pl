:- consult('cco.pl').

% Retorna comprimento da lista
len([], 0).
len([_|T], N) :- len(T, N1), N is N1 + 1.

% Retorna cadeias de pré-requisitos
precadeia(X, []) :- \+prerequisito(X, _).
precadeia(X, [Y|Lc]) :- prerequisito(X, Y), precadeia(Y, Lc).

% Retorna cadeia de pré-requisitos e tamanho da cadeia
listandcount([H|T],N) :-
  precadeia(H,T) ,
  len([H|T], N) .

% Retorna a maior cadeia
findlongestlist(L) :-
  findall(N, listandcount(_,N), Lr) ,
  max_list(Lr, M) ,
  listandcount(L,M) .

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
  findall(Dr, prerequisito(Dr,D), L) ,
  len(L, N) .

npreaux(D,N) :-
  bagof(Dr, prerequisito(Dr,D), L) ,
  len(L, N) .


% Questão 6
maispre(D) :-
  findall(M, npreaux(D,M), Lr) ,
  max_list(Lr, N) ,
  npreaux(D, N) .

% Questão 7
npos(D,N) :-
  findall(Dpr,prerequisito(D,Dpr), L),
  len(L,N) .

nposaux(D,N) :-
  bagof(Dpr,prerequisito(D,Dpr), L),
  len(L,N) .

% Questão 8
maispos(D) :-
  findall(M, nposaux(D,M), L) ,
  max_list(L, N) ,
  nposaux(D, N) .

% Questão 9
maiorcadeia(Lr) :-
  findall(L,findlongestlist(L),Lr) .
