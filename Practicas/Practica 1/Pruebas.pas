Program Generar_Archivo;
type 
    archivo = file of integer;  

//____________________________________________________
Procedure Recorrido(var arc_logico: archivo );
var  
    nro: integer;                  
begin
    reset( arc_logico );           
    while not eof( arc_logico) do begin
        read( arc_logico, nro );    
        write( nro );              
    end;
    close( arc_logico );
end;
//____________________________________________________
Procedure actualizar (Var archi:archivo); 
var 
    E: Integer;
begin
    Reset( archi ); 
    while not eof( archi ) do 
    begin
        Read( archi, E); 
        E:=E * 2;    
        Seek( archi,  filepos(archi) -1 );
        Write( archi, E ); 
    end;
    close( archi );
end;

//____________________________________________________
var 
    arc_logico: archivo;        
    nro: integer;               
    arc_fisico: string[12];     
begin
    write( 'Ingrese el nombre del archivo:' );
    read( arc_fisico );         
    assign( arc_logico, arc_fisico );
    rewrite( arc_logico );     
    read( nro );                
    while nro <> 0 do 
    begin
        write( arc_logico, nro ); 
        read( nro );
    end;
    close( arc_logico );          
    Recorrido(arc_logico);
    actualizar(arc_logico);
    Recorrido(arc_logico);
end. 
