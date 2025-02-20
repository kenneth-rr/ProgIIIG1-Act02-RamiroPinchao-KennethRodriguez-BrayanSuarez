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
