theme(fauna).
theme(flora).
theme(sport).
theme(space).
different(fauna, flora, sport, space).
different(fauna, flora, space, sport).
different(fauna, sport, flora, space).
different(fauna, sport, space, flora).
different(fauna, space, flora, sport).
different(fauna, space, sport, flora).
left(X, Y, X, Y, _, _).
left(X, Y, _, X, Y, _).
left(X, Y, _, _, X, Y).
left(X, Y, Y, _, _, X).

right(X, Y, M1, M2, M3, M4) :-
    left(Y, X, M1, M2, M3, M4).

opposite(X, Y, X, _, Y, _).
opposite(X, Y, _, X, _, Y).
opposite(X, Y, Y, _, X, _).
opposite(X, Y, _, Y, _, X).

solve(M1, M2, M3, M4) :-
    theme(TNif),
    theme(TNaf),
    theme(TNuf),
    different(fauna, TNif, TNaf, TNuf),
    
    Wolf = person(wolf, fauna),
    Nif  = person(nif, TNif),
    Naf  = person(naf, TNaf),
    Nuf  = person(nuf, TNuf),

    left(Wolf, Naf, M1, M2, M3, M4),
    opposite(Nuf, Naf, M1, M2, M3, M4),

    WhoSpace = person(_, space),
    right(Nif, WhoSpace, M1, M2, M3, M4),

    (TNuf = flora; TNuf = space).
