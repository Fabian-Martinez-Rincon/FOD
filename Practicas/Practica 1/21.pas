program dos;
type 
	archivo = file of integer;
    cadena20 = string[20];
var 
	arch_logico: archivo;
	arch_fisico: cadena20;
    num, cant, multiplosDos: integer;
    contador:integer;
begin
	multiplosDos:=0;
    cant:=0; 
    writeln('Ingrese el nombre del archivo: ');     //a.data
    arch_fisico:='Pruebas';                         //direccion del archivo fisico
	assign(arch_logico, arch_fisico);
    reset(arch_logico); 
    writeln('Elementos del archivo: ');
    while(not eof(arch_logico)) do begin
		read(arch_logico, num);
		if ((num mod 2) = 0) then 
            multiplosDos:= multiplosDos + 1;       
        if (num > 100000) then
            cant:= cant+1;
		contador:= contador +  1;                           //sumador de cantidad de numeros
		writeln(contador,' ) ', num);                   //enlisto los registros
    end;
    close(arch_logico);
    writeln(multiplosDos,' es la cantidad de numeros que son multiplos de 2 .');
    writeln(cant,' Numeros mayores que 100000.');
end.