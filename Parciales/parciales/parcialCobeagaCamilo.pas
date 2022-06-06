program parcialCobeagaCamilo;
uses sysutils;
Const valoralto=9999;
Type

    tAlumno= Record

            legajo:longInt;

            apellidoYNombre: String;

            edad: integer;

            direccion:String;

            end;

tArchivo = File of tAlumno;

procedure leer(var arch:tArchivo; var alumno:tAlumno);
begin
     if not(eof(arch)) then
        read(arch,alumno)
     else
         alumno.legajo:=valoralto;
end;

Procedure agregarAlumno (var arch: tArchivo; alumno: tAlumno);
var
          reg:tAlumno;
Begin
   reset(arch);
   read(arch,reg);
   if(reg.legajo<0) then begin
                 seek(arch,(reg.legajo*(-1)));
                 read(arch,reg);
                 seek(arch,filePos(arch)-1);
                 write(arch,alumno);
                 seek(arch,0);
                 write(arch,reg);
                 end
    else  begin
                 seek(arch,fileSize(arch));
                 write(arch,alumno);
                 end;
    close(arch);
End;

Procedure eliminarAlumno (var arch: tArchivo; legajo: longInt);
var reg:tAlumno;
    aux:longInt;
begin
    reset(arch);
    leer(arch,reg);
    aux := reg.legajo;
    while((reg.legajo <> valoralto)and(legajo <> reg.legajo)) do leer(arch,reg);
    if(legajo = reg.legajo) then begin
        reg.legajo := aux;
        reg.apellidoYNombre[1] := '*';
        seek(arch,(filepos(arch)-1));
        write(arch,reg);
        reg.legajo := filepos(arch)*(-1);
        seek(arch,0);
        write(arch,reg);
        writeln('Alumno borrado con exito');
    end
    else writeln('No se encontro ese alumno');
    close(arch);
End;

Var
   arch:tArchivo;  alumno:tAlumno;  legajo:longInt;

Begin
     assign(arch,'archivoAlumnos');
    agregarAlumno(arch,alumno);
    eliminarAlumno,arch,legajo);
End.

