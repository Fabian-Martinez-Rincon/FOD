program cargar;
const
    VA = 9999;
type
    cosa = record
        edad:Integer;
        codigo:integer;
    end;
    archivo = file of cosa;
procedure Crear(var m:archivo);
    var
        dato:cosa;
    begin
        rewrite(m); 
        read(dato.edad);
        read(dato.codigo); 
        while (dato.edad <> 0) do 
        begin
            write(m,dato); 
            read(dato.edad);
            read(dato.codigo); 
        end;
        close(m);  
    end;
procedure Leer(var a:archivo;var n:cosa);
    begin
        if (not eof(a)) then
            Read(a,n)
        else
            n.codigo:=VA;
    end;
procedure compactar(var a:archivo;n:integer);
var
    pos:integer;
    dato:cosa;
begin
    reset(a);
    Leer(a,dato);
    while (dato.codigo <> VA) do begin
        if (dato.codigo=n) then begin  
            pos:= (filePos(a)-1); // pos 0
            seek(a,fileSize(a)-1);  
            read(a,dato);           //me quedo con el elemento al final del archivo
            while (dato.codigo = n) do begin
                seek(a,fileSize(a)-1);
                truncate(a);
                seek(a,fileSize(a)-1);
                read(a,dato);
            end;
            seek(a,pos);
            write(a,dato);
            seek(a,fileSize(a)-1);
            truncate(a);
            seek(a,pos);
        end;
        Leer(a,dato);
    end;
    close(a);
end;

{procedure BuscarUltimo(var m:archivo;var ultimo:cosa; var posUlt:Integer);
    begin
        Seek(m,posUlt); //Nos vamos moviendo para atras
        Read(m,ultimo);
        while ultimo.codigo = 2 do //Busco el ultimo registro no borrado
        begin
            Seek(m,posUlt-1);   //Voy al anterior
            posUlt:=FilePos(m); //Guardo el anterior
            Read(m,ultimo);     //Continuo leyendo normal
        end;
    end;
    //_________________________________________
    procedure compactar(var m:archivo; n:integer);
    var
        datox,ultimo:cosa;
        pos,posUlt:integer;
    begin
        Reset(m);
        Leer(m,datox);
        //Me quedo con la ultima posicion en la que tengo un registro
        //ya que es mas facil manejar el corte del archivo
        posUlt:=FilePos(m)-1; 
        while (datox.codigo <> VA) and (FilePos(m) <= posUlt) do
        begin
            pos:=FilePos(m);
            if (datox.codigo = n) then
            begin
                BuscarUltimo(m,ultimo,posUlt);
                posUlt:=posUlt-1;               //Decremento mi posUlt ya que encontre el eliminado
                Seek(m,pos-1); Write(m,ultimo); //remplazo el dato
            end;
            Leer(m,datox);
        end;
        Seek(m,posUlt+1); //Voy a la ultima posicion que seria EOF ya que antes esta en la anteultima
        //Para trabajar con solo los registros
        //Trunca un fichero en la posición actual. Dicha posición actual se convierte en el fin de fichero (EOF).
        Truncate(m);
        Close(m);
    end;}

Procedure imprimir(var m:archivo);
    var  
        dato:cosa;  
    begin
        reset(m); 
        while not eof(m) do 
        begin
            read(m, dato );
            writeln('edad: ',dato.edad);
            writeln('codigo: ',dato.codigo);           
        end;
        close(m);
    end;
var
    a:archivo;
    nro:integer;
begin
    nro:=1;
    Assign(a,'archivo.data');
    //Crear(a);
    compactar(a,nro);
    Write();
    imprimir(a);
end.