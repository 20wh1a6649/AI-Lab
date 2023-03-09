likes(mary, joy).
likes(joy, mary).
likes(mary, meena).
friends(X, Y) :- likes(X, Y), likes(Y, X).
hates(A, B) :- not(likes(A, B)).

enemies(L, M) :- not(likes(L, M)), not(likes(M, L)).
