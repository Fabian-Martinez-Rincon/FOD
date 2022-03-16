program cuatro; //Fabian Martinez Rincon
uses crt;
type
    cadena20 = string[20];
    persona = record
        apellido:cadena20;
        nombre:cadena20;
        edad:integer;
        dni:integer;
    end;
    archivo = file of persona;
//_______________________________________________________________
procedure LeerPersona(var p:persona);
begin
    Write('Apellido: '); ReadLn(p.apellido);
    if(p.apellido <> '"')then
    begin
        Write('Nombre: '); ReadLn(p.nombre);
        Write('Edad: '); ReadLn(p.edad);
        Write('Dni: '); ReadLn(p.dni);
    end;
end;
//_______________________________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    p:persona;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    LeerPersona(p);                
    while p.apellido <> '"' do          
    begin
        write( arch_logico, p ); 
        LeerPersona(p);
    end;
    close( arch_logico ); 
end;
//_______________________________________________________________
procedure MostarPersona(p:persona);
begin
    WriteLn('Apellido: ',p.apellido);
    WriteLn('Nombre: ',p.nombre);
    WriteLn('Dni: ',p.dni);
    WriteLn('Edad: ',p.edad);
end;
//_______________________________________________________________
procedure ListarDatosi(var arch_logico: archivo ;apellidoPre:cadena20);
var
    p:persona;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, p);
		if (p.apellido = apellidoPre) then 
            MostarPersona(p);
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure ListarDatosii(var arch_logico:archivo);
var
    p:persona;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, p);
		WriteLn('Apellido: ',p.apellido);
        WriteLn('Nombre: ',p.nombre);
        WriteLn('Dni: ',p.dni);
        WriteLn('Edad: ',p.edad);
        WriteLn('__________');
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure ListarDatosiii(var arch_logico:archivo);
var
    p:persona;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, p);
        if (p.edad > 18) then
		begin
            WriteLn('Apellido: ',p.apellido);
            WriteLn('Nombre: ',p.nombre);
            WriteLn('Dni: ',p.dni);
            WriteLn('Edad: ',p.edad);
            WriteLn('__________');
        end;
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure Agregar(var arch_logico:archivo);
var
    p:persona;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,p);
    LeerPersona(p);
    write(arch_logico, p);
	close(arch_logico);
end;
//_______________________________________________________________
procedure ModificarEdades(var arch_logico:archivo);
var
    p:persona;
    edad:integer;
    dni_persona:Integer;
    cont,cant:integer; 
    Encontro:Boolean;
begin
    cont:=0;
    WriteLn('Ingrese la cantidad de edades que quiere modificar: ');
    ReadLn(cant);
    reset(arch_logico);
    while cont<cant do
    begin
        WriteLn('Ingrese el dni de una persona para modificar su edad: ');
        ReadLn(dni_persona);
        Encontro:=false;
        while(not eof(arch_logico))and(not Encontro) do 
        begin
			read(arch_logico, p);
			if(dni_persona = p.dni) then Encontro:=true;
		end;
        if Encontro then
        begin
            writeln('Edad para Remplazar: '); readln(edad);
			seek(arch_logico, filepos(arch_logico)-1);
			p.edad:= edad;
			write(arch_logico, p);
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
	p: persona;
begin
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\Personas.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,p);
		with p do
			writeln(carga,' ',apellido,' ',nombre,' ', edad,' ', dni);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_______________________________________________________________
procedure ExportarErroneos(var arch_logico:archivo);
var
    carga: text;
	p: persona;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\erroneos.txt');
	reset(arch_logico);
	rewrite(carga);
    while(not eof(arch_logico)) do begin
		read(arch_logico,p);
        if (p.dni = 0) then
        begin
            with p do
			    writeln(carga,' ',apellido,' ',nombre,' ', edad,' ', dni);
		    end;
        end;
		
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_______________________________________________________________
procedure Menu();
var 
    categoria:integer;
    apellidoPre:cadena20;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    apellidoPre:= 'Cosa';
    arch_fisico:='Tres';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 9)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Personas con un apellido predeterminado');
		writeln('3 | Mostrar Todas la Personas');
		writeln('4 | Mostrar las personas mayores de 18');
        writeln('5 | Agregar una persona');
        writeln('6 | Modifica edad de Personas');
        writeln('7 | Exportar a .txt');
        writeln('8 | Exportar a erroneos a .txt');
        writeln('9 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico,apellidoPre);
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
//Los archivos no se pueden para por valor (Necesito una explicacion)
begin                     
    clrscr;
    // //A
    Menu();
end.