% Predicate to check if X is an element of the list L.
member(X, [X|_]). 
member(X, [_|Tail]) :- member(X, Tail).

% Predicate to check if E is the first element of list L.
first(E, [E|_]).


% Predicate to find the last element of a list L.
last(E, [E]).
last(E, [_|Tail]) :- last(E, Tail).


% Predicate to find the penultimate (second-to-last) element of a list L.
penultimate(E, [E,_]).   
penultimate(E, [_|Tail]) :- penultimate(E, Tail).

% Remove K-th element
del_k(X, [X|T], 1, T).
del_k(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, del_k(X, T, K1, R).

% List length
length([], 0).
length([_|T], N) :- length(T, N1), N is N1 + 1.

% Even length
even(L) :- length(L, N), N mod 2 =:= 0.

% Concatenate two lists
concat([], L2, L2).
concat([H|T], L2, [H|R]) :- concat(T, L2, R).

% Palindrome
palindrome([]).
palindrome([_]).
palindrome([H|T]) :- append(Middle, [H], T), palindrome(Middle).
