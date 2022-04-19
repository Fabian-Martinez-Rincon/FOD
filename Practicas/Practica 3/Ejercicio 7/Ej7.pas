{7. Se cuenta con un archivo que almacena información sobre especies de aves en
vía de extinción, para ello se almacena: código, nombre de la especie, familia de ave,
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice
un programa que elimine especies de aves, para ello se recibe por teclado las especies a
eliminar. Deberá realizar todas las declaraciones necesarias, implementar todos los
procedimientos que requiera y una alternativa para borrar los registros. Para ello deberá
implementar dos procedimientos, uno que marque los registros a borrar y posteriormente
otro procedimiento que compacte el archivo, quitando los registros marcados. Para
quitar los registros se deberá copiar el último registro del archivo en la posición del registro
a borrar y luego eliminar del archivo el último registro de forma tal de evitar registros
duplicados.
Nota: Las bajas deben finalizar al recibir el código 500000}
program Ej7;
const
    valorAlto = 9999;
type    
    cadena20 = string[20];
    aves = record
        codigo:integer;
        nombre:cadena20;
        familia:cadena20;
        descripcion:cadena20;
        zona:cadena20;
    end;
    maestro = file of aves;
//_________________________________________

//_________________________________________
var
    m:maestro;
begin
    BajaLogica(m);
  
end.