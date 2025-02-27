conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).

conexion(edmonton, saskatoon, 12).

conexion(calgary, edmonton, 4).
conexion(calgary, regina, 14).

conexion(saskatoon, winnipeg, 20).
conexion(saskatoon, calgary, 9).

conexion(regina, saskatoon, 7).
conexion(regina, winnipeg, 4).


tieneAristas(X) :- conexion(X, _, _).
costoPasandoPorEntre(X, Y, Z):- 
    conexion(X, Y, A ), 
    conexion( Y, Z, B ),
    C is A + B,
    write(C),nl.
	

conexionEntre(X, Y, _ ) :- conexion( X, Y, _ ).

conexionEntre(X, Z, Visitados) :- 
    conexion( X, Y, _ ), 
    \+ member(Y, Visitados),
    conexionEntre( Y, Z, [X|Visitados] ).

costoEntre(X, Y, Costo) :- 
    costoEntre(X, Y, [X], 0, Costo).

costoEntre(X, Y, _, Acumulado, Costo) :- 
    conexion(X, Y, C),
    Costo is Acumulado + C,
    write(X), write(' -> '), write(Y), write(' | Costo total: '), write(Costo), nl.

costoEntre(X, Y, Visitados, Acumulado, Costo) :- 
    conexion(X, Z, C),
    \+ member(Z, Visitados),
    NuevoCosto is Acumulado + C,
    write(X), write(' -> '), write(Z), write(' | Costo acumulado: '), write(NuevoCosto), nl,
    costoEntre(Z, Y, [Z|Visitados], NuevoCosto, Costo).
