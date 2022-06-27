{Una empresa de productos de limpieza posee un archivo conteniendo información sobre 
los productos que tiene a la venta al público. De cada producto se registra: código 
de producto, precio, stock actual y stock mínimo. 
Diariamente se efectúan envíos a cada uno de las 2 sucursales que posee. Para esto, 
cada sucursal envía un archivo con los pedidos de los productos que necesita cada sucursal.
Cada pedido contiene código de producto, fecha y cantidad pedida. 
Se pide realizar el proceso de actualización del archivo maestro con los dos archivos detalle,
obteniendo un informe en pantalla de aquellos productos que quedaron debajo del stock mínimo 
y de aquellos pedidos que no pudieron satisfacerse totalmente, informando: la sucursal, 
el producto y la cantidad que no pudo ser enviada(diferencia entre lo que pidió y lo que se 
tiene en stock).
NOTA 1: Todos los archivos están ordenados por código de producto y el archivo maestro 
debe ser recorrido sólo una vez y en forma simultánea con los detalle. 
NOTA 2: En los archivos detalle puede no aparecer algún producto del maestro. 
Además, tenga en cuenta que puede aparecer el mismo producto en varios detalles.
Sin embargo, en un mismo detalle cada producto aparece a lo sumo una vez.}

program puto_archivo;
const
	alor_alto = 9999;
type
	producto = record	//producto se registra: código de producto, precio, stock actual y stock mínimo. 
		cod: integer;
		precio: real;
		st_act: integer;
		st_min: integer
	end;

	pedido = record;	//pedido contiene código de producto, fecha y cantidad pedida. 
		cod: integer;
		fecha: logint;
		cant: integer;
	end;
	
	arc_maestro= file of producto;
	arc_detalle= file of pedido;
	

{Se pide realizar el proceso de actualización del archivo maestro con los dos archivos detalle,
obteniendo un informe en pantalla de aquellos productos que quedaron debajo del stock mínimo 
y de aquellos pedidos que no pudieron satisfacerse totalmente, informando: la sucursal, 
el producto y la cantidad que no pudo ser enviada(diferencia entre lo que pidió y lo que se 
tiene en stock)}

//se toma como precondicion que los assign se hicieron en el principal

procedure leer(var ar_det: pedido; var reg: pedido);
begin
	if not eof(ar_det)then
		read(ar_det, reg);
	else
		reg.cod := valor_alto;
end;

procedure minimo(var ar_det1: arc_detalle; var ar_det2: arc_detalle; var det_min: pedido;var suc: integer;
				 var det1: pedido; var det2: pedido);
var
	max, suc: integer;
begin
	max:= valor_alto;
	if(det1.cod < max) then begin	//busco los .cod menores
		max:= ar_det1.cod;		//en cada if actualizo el max y la sucursal y avanzo en el detalle
		suc:= 1;
		leer(ar_det1, det1);
	end;
	if(det2.cod < max)then begin 
		max := sr_det2;
		suc:= 2
		leer(ar_det2, det2);
	end;
end;

//imprime rag_mae y evalua si st_act es negativo y saca la cuanta de lo que falto
procedure imprimo_producto(reg_mae: producto; nro_suc: integer)
var

begin
	with reg_mae do begin
		writeln("sucursal: ", nro_suc);
		writeln("codigo de producto: ", cod);
		if(st_act < 0)then //si el stock es negativo es xq falto para el pedido
			st_act *= -1;
			writeln("cantidad de elementos faltantes para el pedido: ", st_act);
		else
			writeln("por deabjo de sotck minimo, quedan: ", st_act);
	end;
end; 


procedure actualizar_maestro(var ar_mae:arc__maestro; var ar_det1: arc_detalle; var a_det2: arc_detalle);
var
	det_min, det1, det2: pedido;
	reg_mae: producto;
	cod_actual, tot_stk_min, no_enviada, nro_suc: integer;
begin
	tot_stk_min := 0;
	reset(ar_mae);       reset(ar_det1);	//abro detalle1 y depues lo leo
	leer(ar_det1, det1); reset(ar_det2);	//abro detalle2 y despues lo leo
	leer(ar_det2; det2); read(ar_mae, reg_mae);
	
	minimo(ar_det1, ar_det2, det_min, nro_suc, det1, det2);	//devuelve valor_alto si no hay elementos
	while(det_min.cod <> valor_alto)do begin
		cod_actual:= det_min.cod;
		while(cod.actual <> reg_mae.cod) do begin	// recorre el maestro hasta llegar al .cod buscado
			read(ar_mae, reg_mae);
		end;
		while(cod_actual <> det_min.cod) do begin 	//se busca en los detalles los .cod = cod_actual
			tot_stk_min += det_min.cant;
			minimo(ar_det1, ar_det2, det_min, det1, det2);	//suma todos los pedidos p/ despues restarlos con el maestro
		end;
		reg_mae.st_act -= tot_stk_min; //resto al maestro la sumatoria de los pedidos de cierto elemento
		
		// comparo e imprimo los elementos < al stk minimo
		//del registro minimo sale el ultimo pedido de una sucursal, la  sucursal que se 
		//informa es la que devuelve estemodulo xq solo hay una aparicion por elemento en el detalle
		if(reg_mae.st_act < reg_mae.stmin)then begin 
			imprimo_producto(reg_mae, nro_suc); 
			//imprime rag_mae y evalua si st_act es negativo y saca la cuanta de lo que falto
		end;
		seek(ar_mae, filepos(ar_mae) -1);
		write(ar_mae, reg_mae);
	end;
	close(ar_mae);
	close(ar_det1);
	close(ar_det2);
end;








