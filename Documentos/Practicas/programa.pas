program programa;
const M = 10;
function buscar(posRaiz, clave, posRaiz_Actual,pos_encontrada:Integer):boolean;
var
    pos:integer;
begin
    if (nodo = null) then
        buscar := false {clave no encontrada}
    else
        PosicionarYLeerNodo(A, nodo, posRaiz);
    if (claveEncontrada(A, nodo, clave, pos)) then begin
        posRaiz_Actual := posRaiz; {posRaiz actual)}
        pos_encontrada := pos;     {posición dentro del array}
    end
    else
        buscar(nodo.hijo[pos], clave, posRaiz_Actual, pos_encontrada)
end;
begin
end.