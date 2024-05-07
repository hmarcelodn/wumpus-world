% HECHOS
wumpus(3, 1).
oro(3, 2).
hoyo(1, 3).
hoyo(3, 3).
hoyo(4, 4).
agente(1, 1).

% REGLAS
hay_hedor(X, Y) :- 
    NX1 is X-1,
    NX2 is X+1,
    NY1 is Y-1,
    NY2 is Y+1,
    (
        wumpus(NX1, Y); 
        wumpus(NX2, Y);
        wumpus(X, NY1); 
        wumpus(X, NY2)
    ).

hay_brisa(X, Y) :-
    NX1 is X - 1,
    NX2 is X + 1,
    NY1 is Y - 1,
    NY2 is Y + 1,
    (
        hoyo(NX1, Y); 
        hoyo(NX2, Y);
        hoyo(X, NY1); 
        hoyo(X, NY2)
    ).

hay_iluminacion(X, Y) :-
    NX1 is X - 1,
    NX2 is X + 1,
    NY1 is Y - 1,
    NY2 is Y+1,
    (
        oro(NX1, Y); 
        oro(NX2, Y);
        oro(X, NY1); 
        oro(X, NY2)
    ).

es_seguro(X, Y) :- 
    \+ hay_hedor(X, Y),
    \+ hay_brisa(X, Y),
    \+ wumpus(X, Y),
    \+ hoyo(X, Y).

mover_derecha(X, Y, NX, Y) :- NX is X + 1.
mover_izquierda(X, Y, NX, Y) :- NX is X - 1.
mover_arriba(X, Y, X, NY) :- NY is Y + 1.
mover_abajo(X, Y, X, NY) :- NY is Y - 1.
