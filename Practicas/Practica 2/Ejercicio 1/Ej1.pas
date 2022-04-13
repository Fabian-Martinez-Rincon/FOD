program Ej1;
const
    valoralto = 9999;
type
    cadena20=string[20];
    empleado = record
        codigo:integer;
        nombre:cadena20;
        monto:real;
    end;
    archivo = file of empleado;
//_____________________________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	emp: empleado;
begin
	writeln('Nombre del archivo fisico: ');
	assign(arch_logico,arch_fisico);
	assign(carga, 'empleados.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		readln(carga, emp.codigo);
        readln(carga, emp.nombre);
        readln(carga, emp.monto);
		write(arch_logico, emp);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure Imprimir(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        WriteLn('Codigo:',emp.codigo);
        writeln('Nombre:', emp.nombre);
        writeln('Monto:', emp.monto:2:2);
        WriteLn('_________');
	end;
	close(arch_logico);
end;
//_____________________________________________________________
procedure leer (var detalle:archivo;var dato:empleado);
begin
    if (not eof(detalle))
        then read (detalle,dato)
    else 
        dato.codigo := valoralto;
end;
//_____________________________________________________________
var
    maestro,detalle:archivo;
    fisico:cadena20;
    regDetalle,regMaestro:empleado;
    total:Real;
    act:empleado;
begin
    fisico := 'detalle_uno'; 
    CrearArchivo(detalle,fisico);
    Imprimir(detalle);
    assign (maestro, 'maestro_uno');
    Rewrite (maestro);  reset (detalle);
    leer(detalle,regDetalle);  
    while (regDetalle.codigo <> 9999) do 
    begin
        total:=0;
        act:=regDetalle;  
        while (act.codigo = regDetalle.codigo) do 
        begin
            total:=total+regDetalle.monto;        
            leer(detalle,regDetalle);          
        end;
        regMaestro.codigo:=act.codigo;
        regMaestro.nombre:=act.nombre;
        regMaestro.monto:=total;
        seek (maestro, filepos(maestro));
        write(maestro,regMaestro);
    end;
    writeln();
    Imprimir(maestro);
end.