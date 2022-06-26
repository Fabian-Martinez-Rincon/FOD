
procedure actualizarMaestro(var m:maestro; var det:detalle);  //ACTUALIZAR UN MAESTRO CON UN DETALLE CON REPETICION
var
   regm:alumno; regd:detAlumno;  aux:integer; cursadasSin:integer; 
begin
   reset(det); reset(m);
   read(m,regm);
   leer(det,regd);
   while (regd.cod<>valoralto) do 
   begin                            
    aux:=regd.cod;                  
    cursadasSin:=0;   
    while (aux=regd.cod) do 
    begin     
        cursadasSin:=cursadasSin+1;
        leer(det,regd);      
    end;
    while(regm.cod<>aux) do     
        read(m,regm);
    regm.cursadas:=regm.cursadas+cursadasSin;          
    regm.materiasFinal:=regm.materiasFinal+cursadasCon;
    seek(m,filePos(m)-1);                          
    write(m,regm); 
    end;
    close(m); close(det);
end;


procedure actualizarMaestro(var m:maestro; var det:detalle);  //ACTUALIZAR UN MAESTRO CON UN DETALLE SIN REPETICION
var
   regm:alumno; regd:detAlumno;  aux:integer; cursadasSin:integer; cursadasCon:integer;
begin
   reset(det); reset(m);
   read(m,regm);
   leer(det,regd);
   while (regd.cod<>valoralto) do begin   //mientras no se termine mi detalle        
    if(regd.informacionFinal=0) then
        cursadasSin:=cursadasSin+1
    else                                               
        cursadasCon:=cursadasCon+1;
    leer(det,regd);       
    end;
    while(regm.cod<>aux) do     
                read(m,regm);
    regm.cursadas:=regm.cursadas+cursadasSin;          
    regm.materiasFinal:=regm.materiasFinal+cursadasCon;
    seek(m,filePos(m)-1);                         
    write(m,regm); 
    end;
   close(m); close(det);
end;

procedure actualizar(var m:maestro; var det1,det,2,det3:detalle); //ACTUALIZAR CON N DETALLES CON REPETICION(MERGE)
var
	regd1,regd2,regd3,min:tipoRegDet; regm:regMae;
begin
	reset (m); reset (det1); reset (det2); reset (det3);
 	leer(det1, regd1); leer(det2, regd2); leer(det3, regd3);
 	minimo(regd1, regd2, regd3, min);

 	while (min.cod <> valoralto) do begin
		read(m,regm);
		while (regm.cod <> min.cod) do read(mae1,regm);
		while (regm.cod = min.cod ) do begin		//MIENTRAS SEA DETALLE DEL MISMO ELEMENTO(SI ES SIN REPETICION SACAR ESTO IZIPIZI
			regm.cant:=regm.cant - min.cantvendida;	//ACTUALIZA REGM
			minimo(regd1, regd2, regd3, min);
		end;
		seek (m, filepos(m)-1);
		write(m,regm);
	end;
end;


procedure actualizar(var m:maestro; var aDet:arrayDetalle);		//ACTUALIZAR CON VECTOR DETALLES
var
   i:integer;  aRegD:arrayRegD;  min:pedido; sucursal:integer; regm:producto; 

begin
     for i:=1 to 4 do begin
         reset(aDet[i]);
         leer(aDet[i],aRegD[i]);   //abro y leo el primer registro de cada detalle
         end;
     reset(m);                    //abro maestro
     read(m,regm);
     minimo(aRegD,aDet,min,sucursal);     //saco el minimo entre los 4 registros leidos
     while(min.cod<>valoralto) do 
     begin  
        while(regm.cod<>min.cod) do
            read(m,regm);       
        regm.stockActual:=regm.stockActual-min.cant;
        seek(m,filePos(m)-1);
        write(m,regm);             
        minimo(aRegD,aDet,min,sucursal);
     end;
     close(m);
     for i:=1 to 4 do
         close(aDet[i]);
end;




procedure actualizar(var m:maestro; var aDet:arrayDetalle);		//ACTUALIZAR CON VECTOR DETALLES(y condiciones para su procesamiento -diferencia con stock-)
var
   i:integer; codActual:integer;  aRegD:arrayRegD;  min:pedido; sucursal:integer; cantSolicitada:integer; regm:producto;  dif:integer; posAct:integer;

begin
     for i:=1 to 4 do 
     begin
         reset(aDet[i]);
         leer(aDet[i],aRegD[i]);   //abro y leo el primer registro de cada detalle
         end;
     reset(m);                    //abro maestro
     read(m,regm);
     minimo(aRegD,aDet,min,sucursal);     //saco el minimo entre los 4 registros leidos
     readln();
     while(min.cod<>valoralto) do 
     begin  
        cantSolicitada:=0;
        codActual:=min.cod;
        cantSolicitada:=cantSolicitada + min.cant;
        posAct:=filePos(m);
        while(regm.cod<>codActual) do
            read(m,regm);       
        if eof(m) then  begin
            writeln('Producto no existe');  
            seek(m,posAct);
        end;
        dif:=cantSolicitada-regm.stockActual;
        if(dif>0) then begin
            regm.stockActual:=0;           //controlo la diferencia e informo segun la condicion
            writeln('No se pudo satisfacer el pedido de la sucursal ', sucursal, ', producto ',  codActual, '. Cantidad que no pudo ser enviada: ', dif);
        end
        else begin
            regm.stockActual:=regm.stockActual-cantSolicitada;
            if(regm.stockActual<regm.stockMinimo) then
                    writeln('El pedido del producto ' , regm.cod, 'se envio pero quedo debajo del stock minimo')
            else
                writeln('Pedido hecho satisfactoriamente');
            end;
        seek(m,filePos(m)-1);
        write(m,regm);             //actualizo maestro

        minimo(aRegD,aDet,min,sucursal);
     end;
     close(m);
     for i:=1 to 4 do
         close(aDet[i]);
end;