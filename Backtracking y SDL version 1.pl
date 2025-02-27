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

conexionEntre(X, Y, _) :- conexion(X, Y, _).

conexionEntre(X, Z, Visitados) :- 
    conexion(X, Y, _), 
    \+ member(Y, Visitados),   
    conexionEntre(Y, Z, [X|Visitados]).

costoEntre(X, Y) :- 
    costoEntreAux(X, Y, [X],  0, Costo), 
    write('Costo total: '), write(Costo), nl.


costoEntreAux(X, Y, _ , CostoAcumulado, CostoFinal) :- 
    conexion(X, Y, C),
    CostoFinal is CostoAcumulado + C.

costoEntreAux(X, Y, Visitados, CostoAcumulado, CostoFinal) :- 
    conexion(X, Z, C),
    \+ member(Z, [X|Visitados]),  
    NuevoCosto is CostoAcumulado + C,
    costoEntreAux(Z, Y, [Z | Visitados ] , NuevoCosto, CostoFinal).
