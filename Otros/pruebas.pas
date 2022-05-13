program pruebas;
type 
    numero = file of integer;    
Var 
    nombre_fisico:string;
    nombre_logico:numero;
begin
    nombre_fisico: 'archivo.data';
    assign (nombre_logico, nombre_fisico);
End.