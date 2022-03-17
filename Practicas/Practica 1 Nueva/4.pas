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
procedure Agregar(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,emp);
    LeerEmpleado(emp);
    write(arch_logico, emp);
	close(arch_logico);
end;
//_______________________________________________________________
procedure ModificarEdades(var arch_logico:archivo);
var
    emp:empleado;
    edad:integer;
    nroEmpleado:Integer;
    cont,cant:integer; 
    Encontro:Boolean;
begin
    cont:=0;
    WriteLn('Ingrese la cantidad de edades que quiere modificar: ');
    ReadLn(cant);
    reset(arch_logico);
    while cont<cant do
    begin
        WriteLn('Ingrese el nro de una empleado para modificar su edad: ');
        ReadLn(nroEmpleado);
        Encontro:=false;
        while(not eof(arch_logico))and(not Encontro) do 
        begin
			read(arch_logico, emp);
			if(nroEmpleado = emp.nro) then Encontro:=true;
		end;
        if Encontro then
        begin
            writeln('Edad para Remplazar: '); readln(edad);
			seek(arch_logico, filepos(arch_logico)-1);
			emp.edad:= edad;
			write(arch_logico, emp);
        end   
        else
            WriteLn('No existe el empleado');
        cont:=cont+1;
        
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure Exportar_Txt(var arch_logico:archivo);
var
	carga: text;
	emp: empleado;
begin
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\todos_empleados.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,emp);
		with emp do
			writeln(carga,' ',nro,' ',apellido,' ',nombre,' ', edad,' ', dni);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_______________________________________________________________
procedure ExportarErroneos(var arch_logico:archivo);
var
    carga: text;
	emp: empleado;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\faltaDNIEmpleados.txt');
	reset(arch_logico);
	rewrite(carga);
    while(not eof(arch_logico)) do begin
		read(arch_logico,emp);
        if (emp.dni = 0) then
        begin
            with emp do
			    writeln(carga,' ',nro,' ',apellido,' ',nombre,' ', edad,' ', dni);
		    end;
        end;
		
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
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
	while (categoria <> 9)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Empleados con un apellido predeterminado');
		writeln('3 | Mostrar todos la Empleados');
		writeln('4 | Mostrar las Empleados mayores de 70');
        writeln('5 | Agregar Empleados');
        writeln('6 | Modifica edad de Empleados');
        writeln('7 | Exportar a .txt');
        writeln('8 | Exportar a erroneos a .txt');
        writeln('9 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico);
			3: ListarDatosii(arch_logico);
			4: ListarDatosiii(arch_logico);
            5: Agregar(arch_logico);
            6: ModificarEdades(arch_logico);
            7: Exportar_Txt(arch_logico);
            8: ExportarErroneos(arch_logico);
            9: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
//_______________________________________________
begin
    clrscr;
    Menu();
end.