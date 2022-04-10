<h1 align="center">📂 Archivos</h1>

Indice
=================

<!--ts-->
* [Declarar Ejemplos](#Declarar_Ejemplos)
*  [Generar Archivo](#Generar_Archivo)
*  [Recorrido](#Recorrido)
*  [Modificación del Archivo](#Modificación_del_Archivo)
*  [Agregar Datos](#Agregar_Datos)
*  [Actualizar Un Maestro Con Un Detalle](#Actualizar_Un_Maestro_Con_Un_Detalle)
*  [Un Maestro Un detalle sobre la base del anterior](#Un_Maestro_Un_detalle_sobre_la_base_del_anterior)
*  [Un Maestro Un Detalle Solucion Correcta](#Un_Maestro_Un_Detalle_Solucion_Correcta)
*  [Un Maestro N Detalle](#Un_Maestro_N_Detalle)
*  [Corte De Control](#Corte_De_Control)
*  [Mege 3 Archivos](#Mege_3_Archivos)
*  [Merge 3 Archivos Con Repetición](#Merge_3_Archivos_Con_Repetición)
*  [Merge N Archivos Con Repetición](#Merge_N_Archivos_Con_Repetición)


Declarar_Ejemplos
=================
```Pas
type 
    numero = file of integer;    
Var 
    arch_num: numero;
begin
    assign (arch_num, 'pepe.dat');
End.

```

<table>
<tr>
<td> Crear </td> <td> Recorrer </td><td> Actualizar </td>
</tr>
<tr>
<td>
 
```Pas
procedure Crear(var logico:archivo);
var
    nro:integer;
begin
    assign( logico, 'Archivo.data' );
    rewrite( logico ); 
    read( nro ); 
    while nro <> 0 do begin
        write( logico, nro ); 
        read( nro );
    end;
    close( logico );  
end. 
```
</td>
<td>
 

```Pas
Procedure Recorrido(var logico: archivo);
var  
    nro: integer;  
begin
    reset( logico ); 
    while not eof( logico) do 
    begin
        read( logico, nro );
        write( nro );           
    end;
    close( arc_logico );
end;
```

</td>
 <td>
 

```Pas
Procedure actualizar (Var logico:archivo); 
var 
    nro: integer;
begin
    Reset(logico); 
    while not eof( logico ) do 
    begin
        Read( logico, nro); 
        nro:=nro * 2;    
        Seek( nro,  filepos(nro) -1 );
        Write( logico, nro ); 
    end;
    close(logico);
end;
```
 
</td>
</tr>
 
</table>


Agregar_Datos
=============
```Pas
Procedure agregar (Var Emp: Empleados); 
var 
    E: registro;
begin
    reset( Emp ); 
    seek( Emp, filesize(Emp)); 
    leer( E ); 
    while E.nombre <> ' ' do 
    begin
        write( Emp, E );     
        leer( E ); 
    end;
    close( Emp );
end;
```
Actualizar_Un_Maestro_Con_Un_Detalle
====================================
```Pas
program actualizar;
type 
    emp = record    
        nombre: string[30]; 
        direccion: string[30];               
        cht: integer;
    end;
    e_diario = record
        nombre: string[30];
        cht: integer;                           
    end;
    detalle = file of e_diario; 
    maestro = file of emp; 
var 
    regm: emp;   
    regd: e_diario;    
    mae1: maestro; 
    det1: detalle;
begin
    assign (mae1, 'maestro');
    assign (det1, 'detalle');
    reset (mae1);  
    reset (det1);
    while (not eof(det1)) do 
    begin
        read(mae1, regm);
        read(det1, regd);
        while (regm.nombre <> regd.nombre) do
          read (mae1,regm);
        regm.cht := regm.cht + regd.cht;
        seek (mae1, filepos(mae1)-1);
        write(mae1,regm);
    end;
end.
```

Un_Maestro_Un_detalle_sobre_la_base_del_anterior
================================================
```Pas
program actualizar;
const 
    valoralto='9999';
type 
    str4 = string[4];
    prod = record
        cod: str4;                   
        descripcion: string[30];     
        pu: real;                    
        cant: integer;               
    end;
    v_prod = record
        cod: str4;               
        cv: integer;   
    end;
    detalle = file of v_prod;     
    maestro = file of prod;       
var
    regm: prod;
    regd: v_prod;
    mae1: maestro;
    det1: detalle;
    total: integer;

begin
    assign (mae1, 'maestro');
    assign (det1, 'detalle');
    reset (mae1);  reset (det1);
    while (not eof(det1)) do 
    begin
        read(mae1, regm);
        read(det1,regd);
        while (regm.cod <> regd.cod) do
            read (mae1,regm);
		while (regm.cod = regd.cod) do
        begin
            regm.cant := regm.cant - regd.cv;        
            read (det1,reg);
        end;
        seek (mae1, filepos(mae1)-1);
        write(mae1,regm);
    end;
end.
```

Un_Maestro_Un_Detalle_Solucion_Correcta
=======================================
```Pas
procedure leer (var archivo:detalle;var dato:v_prod);
begin
    if (not eof(archivo))
        then read (archivo,dato)
    else 
        dato.cod := valoralto;
end;
//_______________________________________________________
begin
    assign (mae1, 'maestro');  
    assign (det1, 'detalle');
    reset (mae1);  reset (det1);
    leer(det1,regd);  
    while (regd.cod <> valoralto) do 
    begin
        read(mae1, regm);
        while (regm.cod <> regd.cod) do
            read (mae1,regm);
        while (regm.cod = regd.cod) do 
        begin
            regm.cant := regm.cant - regd.cv;        
	        leer(det1,regd);          
        end;
        seek (mae1, filepos(mae1)-1);
        write(mae1,regm);
    end;
End;

```

Un_Maestro_N_Detalle
====================
```Pas
procedure minimo (var r1,r2,r3: v_prod; var min:v_prod);
begin
    if (r1.cod<=r2.cod) and (r1.cod<=r3.cod) then 
    begin
        min := r1;  leer(det1,r1)
    end
    else if (r2.cod<=r3.cod) then 
    begin
        min := r2; leer(det2,r2)
    end
    else 
    begin
        min := r3;leer(det3,r3)
    end;
end;
//_______________________________________________________
procedure leer (var archivo: detalle; var dato:v_prod);
begin
    if (not eof(archivo))then 
        read (archivo,dato)
    else 
        dato.cod := valoralto;
end;
//_______________________________________________________

Var   
    regm: prod;  
    min, regd1, regd2,regd3: v_prod;
    mae1: maestro;   
    det1,det2,det3: detalle;
begin
    assign (mae1, 'maestro');   
    assign (det1, 'detalle1');   
    assign (det2, 'detalle2');  
    assign (det3, 'detalle3');
    reset (mae1);  
    reset (det1); 
    reset (det2); 
    reset (det3);
    leer(det1, regd1); 
    leer(det2, regd2); 
    leer(det3, regd3);
    minimo(regd1, regd2, regd3, min);
    while (min.cod <> valoralto) do  
    begin
        read(mae1,regm);
        while (regm.cod <> min.cod) do 
            read(mae1,regm);
        while (regm.cod = min.cod ) do 
        begin
            regm.cant:=regm.cant - min.cantvendida;
            minimo(regd1, regd2, regd3, min);
        end;
        seek (mae1, filepos(mae1)-1);
        write(mae1,regm);
    end;
end.

```
Corte_De_Control
================
```Pas
procedure leer (var archivo:instituto;  var dato:prov);
begin
    if (not eof( archivo ))then 
        read (archivo,dato)
    else 
        dato.provincia := valoralto;
end;
//_______________________________________________________
program Corte_de_Control;
const 
    valoralto='zzzz';
type 
    str10 = string[10];
    prov = record
        provincia, partido, ciudad: str10;            
        cant_varones, 
        cant_mujeres, 
        cant_desocupados : integer; 
    end;
    instituto = file of prov;
var 
    regm: prov;
    inst: instituto;
    t_varones, t_mujeres,t_desocupa, t_prov_var,t_prov_muj, t_prov_des: integer;
    ant_prov, ant_partido : str10;
begin
    assign (inst, 'censo' ); 
    reset (inst); 
    leer (inst, regm);

    writeln ('Provincia: ',regm.provincia);
    writeln ('Partido: ', regm.partido);
    writeln('Ciudad','Mas','Fem','Desocupa');

    t_varones := 0;     
    t_mujeres := 0;   
    t_desocupa := 0;
    t_prov_var := 0;    
    t_prov_muj := 0;  
    t_prov_des := 0;
    while ( regm.provincia <> valoralto)do 
    begin
        ant_prov := regm.provincia; 
        ant_partido := regm.partido;
        while (ant_prov=regm.provincia) and (ant_partido=regm.partido) do 
        begin
            write (regm.ciudad, regm.cant_varones,   
            regm.cant_mujeres,regm.cant_desocupados);
            t_varones := t_varones + regm.cant_varones;      
            t_mujeres := t_mujeres + regm.cant_mujeres;
            t_desocupa := t_desocupa + regm.cant_desocupados;
            leer (inst, regm);
        end;
        writeln ('Total Partido: ', t_varones, t_mujeres, t_desocupa);
        t_prov_var := t_prov_var + t_varones; 
        t_prov_muj := t_prov_muj +  t_mujeres;  
        t_prov_des := t_prov_des + t_desocupa;
        t_varones := 0; t_mujeres := 0; t_desocupa := 0;
        ant_partido := regm.partido;
        if (ant_prov <> regm.provincia) then   
        begin
            writeln ('TotalProv.’,t_prov_var, 
            t_prov_muj, t_prov_des);
            t_prov_var := 0; t_prov_muj := 0; 
            t_prov_des := 0;
            writeln('Prov.:‘,regm.provincia);
        end;
        writeln('Partido:', regm.partido);
    end;
end.
```

Mege_3_Archivos
===============
```Pas
program union_de_archivos;
const 
    valoralto = 'zzzz';
type 
    str30 = string[30];
    str10 = string[10];
    alumno = record
        nombre: str30;                
        dni: str10;                   
        direccion: str30;             
        carrera: str10;               
    end;
    detalle = file of alumno;       
    var min,regd1,regd2,regd3: alumno;
    det1,det2,det3,maestro : detalle;
//_______________________________________________________
procedure leer (var archivo:detalle; var dato:alumno);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.nombre := valoralto;
end;
//_______________________________________________________
begin
    assign (det1, 'det1'); assign (det2, 'det2'); assign (det3, 'det3');
    assign (maestro, 'maestro');
    rewrite (maestro);
    reset (det1);    
    reset (det2);    
    reset (det3);
    leer(det1, regd1); 
    leer(det2, regd2); 
    leer(det3, regd3);
    minimo(regd1, regd2, regd3, min);
    while (min.nombre <> valoralto) do
    begin
        write (maestro,min);
        minimo(regd1,regd2,regd3,min);
    end;
    close (maestro);
end.
```
Merge_3_Archivos_Con_Repetición
===============================
```Pas
program union_de_archivos_II;
const 
    valoralto = '9999';
type 
    str4 = string[4];
    str10 = string[10];
    vendedor = record
        cod: str4;               
        producto: str10;         
        montoVenta: real;        
    end;
    ventas = record
        cod: str4;                
        total: real;              
    end;
    detalle = file of vendedor; 
    maestro = file of ventas;   
var 
    min, regd1, regd2, regd3: vendedor;
    det1, det2, det3: detalle;
    mae1: maestro;
    regm: ventas;
    aux: str4;
begin
    assign (det1, 'det1'); 
    assign (det2, 'det2'); 
    assign (det3, 'det3');
    assign (mae1, 'maestro');
    reset (det1);
    reset (det2);
    reset (det3);
    rewrite (mae1);
    
    leer (det1, regd1);     
    leer (det2, regd2);     
    leer (det3, regd3);
    minimo (regd1, regd2, regd3,min);
    
    while (min.cod <> valoralto) do 
    begin
        regm.cod := min.cod;
        regm.total := 0;
        while (regm.cod = min.cod ) do begin
            regm.total := regm.total+ min.montoVenta;
            minimo (regd1, regd2, regd3, min);
        end;
        write(mae1, regm);
    end;
End.
```
Merge_N_Archivos_Con_Repetición
===============================
```Pas
program union_de_archivos_III;
const 
    valoralto = '9999';
type 
    vendedor = record
        cod: string[4];               
        producto: string[10];         
        montoVenta: real;        
    end;
    ventas = record
        cod: string[4];                
        total: real;              
    end;
    maestro = file of ventas;   
    arc_detalle=array[1..100] of file of vendedor;
    reg_detalle=array[1..100] of vendedor;
//_______________________________________________________
procedure leer (var archivo:detalle; var dato:vendedor);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.cod := valoralto;
end;
//_______________________________________________________
procedure minimo (var reg_det: reg_detalle; var min:vendedor; var deta:arc_detalle);
    var i: integer;
    begin
      { busco el mínimo elemento del 
        vector reg_det en el campo cod,
        supongamos que es el índice i }
      min = reg_det[i];
      leer( deta[i], reg_det[i];
    end; 
//_______________________________________________________
var 
    min: vendedor;
    deta: arc_detalle;
    reg_det: reg_detalle;
    mae1: maestro;
    regm: ventas;
    i,n: integer;
begin
    Read(n)
    for i:= 1 to n do 
    begin
        assign (deta[i], 'det'+i); 
        { ojo lo anterior es incompatible en tipos}    
        reset( deta[i] );
        leer( deta[i], reg_det[i] );
    end;
    assign (mae1, 'maestro'); rewrite (mae1);
    minimo (reg_det, min, deta);
    while (min.cod <> valoralto) do 
    begin
        regm.cod := min.cod;
        regm.total := 0;
        while (regm.cod = min.cod ) do 
        begin
            regm.total := regm.total+ 
            min.montoVenta;
            minimo (regd1, regd2, regd3, min);
        end;
        write(mae1, regm);
    end;    
end.
```