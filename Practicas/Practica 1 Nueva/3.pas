program tres;
uses crt;
type
    cadena20 = string[20];
    empleado = record
        nro:integer;
        apellido:cadena20;
        nombre:cadena20;
        edad:integer;
        dni:integer;
    end;
    archivo = file of Empleado;
//_______________________________________________
procedure LeerEmpleado(var emp:Empleado);
begin
    Write('Apellido: '); ReadLn(emp.apellido);
    if(emp.apellido <> 'fin')then
    begin
        Write('Nombre: '); ReadLn(emp.nombre);
        Write('Edad: '); ReadLn(emp.edad);
        Write('Dni: '); ReadLn(emp.dni);
        Write('Nro Empleado: '); ReadLn(emp.nro);
    end;
end;
//_______________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    emp:Empleado;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    LeerEmpleado(emp);                
    while emp.apellido <> 'fin' do          
    begin
        write( arch_logico, emp); 
        LeerEmpleado(emp); 
    end;
    close( arch_logico ); 
end;

//_______________________________________________
procedure MostarPersona(emp:empleado);
begin
    WriteLn('Nro Empleado: ',emp.nro);
    WriteLn('Apellido: ',emp.apellido);
    WriteLn('Nombre: ',emp.nombre);
    WriteLn('Dni: ',emp.dni);
    WriteLn('Edad: ',emp.edad);
end;
//_______________________________________________
procedure ListarDatosi(var arch_logico: archivo );
var
    emp:empleado;
    cadenaPred:cadena20;
begin
    WriteLn('Ingrese un nombre o apellido a buscar: ');
    ReadLn(cadenaPred);
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
		if ((emp.apellido = cadenaPred) or (emp.nombre = cadenaPred)) then 
            MostarPersona(emp);
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure ListarDatosii(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        WriteLn('Nro: ',emp.nro);
		WriteLn('Apellido: ',emp.apellido);
        WriteLn('Nombre: ',emp.nombre);
        WriteLn('Dni: ',emp.dni);
        WriteLn('Edad: ',emp.edad);
        WriteLn('__________');
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure ListarDatosiii(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        if (emp.edad > 70) then
		begin
            WriteLn('Nro: ', emp.nro);
            WriteLn('Apellido: ',emp.apellido);
            WriteLn('Nombre: ',emp.nombre);
            WriteLn('Dni: ',emp.dni);
            WriteLn('Edad: ',emp.edad);
            WriteLn('__________');
        end;
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure Menu();
var 
    categoria:integer;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    arch_fisico:='Tres';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 5)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Empleados con un apellido predeterminado');
		writeln('3 | Mostrar todos la Empleados');
		writeln('4 | Mostrar las Empleados mayores de 70');
        writeln('5 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico);
			3: ListarDatosii(arch_logico);
			4: ListarDatosiii(arch_logico);
            5: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
//_______________________________________________
begin
    clrscr;
    Menu();
end.