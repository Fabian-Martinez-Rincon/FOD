program uno;
uses crt;
type 
	archivo= file of integer;
	cadena20 = string[20];
//_______________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    num:Integer;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    WriteLn('Ingrese un nro: ');
    readln(num);                
    while num <> 30000 do          
    begin
        write( arch_logico, num);
        WriteLn('Ingrese un nro: '); 
        readln(num);
    end;
    close( arch_logico ); 
end;
//_______________________________________________
var 
	arch_fisico:cadena20;
	arch_logico:archivo;
begin
    clrscr;
    CrearArchivo(arch_logico,arch_fisico);
end.