program querer_pilsen;
const
	suc = 3;
	valor_alto = 9999;

type
	reg_det = record
		cod: integer;
		nombre: string;
		desc: string;
		cant_vend: integer;
		fecha_venta: integer;
	end;
	
	ar_detalle = file of reg_det;
	
	reg_mae = record
		cod: integer;
		nom: string;
		desc: string;
		tot_ventas: integer;
	end;
	
	ar_maestro = file of reg_mae;

	vec_det = array [1..suc] of ar_detalle;
	vec_min = array [1..suc] of reg_det;
	
procedure leer (var det:ar_detalle; var l:reg_det); //recibe un archivo de detalle y un registro
begin
	if (not eof(det)) then
		read(det, l)
	else
		l.cod:= valor_alto;
end;

procedure minimo(var vec_m: vec_min; var v_det: vec_det; var reg: reg_det);
var
	i, pos_min:integer;
begin
	reg.cod:= valor_alto;
	
	
	for i:=1 to suc do begin
		if(vec_m[i].cod < reg.cod)then begin
			reg.cod := vec_m[i].cod;
			pos_min := i;
		end;
	end;
	
	if(reg.cod <> valor_alto)then begin 
		leer(v_det[pos_min], vec_m[pos_min]);
	end;
	
end;
	
procedure merge(var v_det: vec_det; var ar_mae: ar_maestro);
var
	i,tot_ventas,act:integer;
	reg_min: reg_det;
	reg_m : reg_mae;
	v_min : vec_min;
begin
	reset(ar_mae);
	for i:= 1 to suc do begin
		reset(v_det[i]);
		leer(v_det[i], v_min[i]);
	end;
	
	
	minimo(v_min, v_det, reg_min);
	while(reg_min.cod <> valor_alto) do begin
		act := reg_min.cod;
		tot_ventas:= 0;
		while(reg_min.cod = act) do begin
			tot_ventas += reg_min.cant_vend;
			minimo(v_min, v_det, reg_min);
		end;
		//escribo el master prro
		with reg_m do begin
			cod := reg_min.cod;
			nom:= reg_min.nombre;
			desc:= reg_min.desc;
			tot_ventas:= tot_ventas;
		end;
		
		write(ar_mae, reg_m);
	end;
	close(ar_mae);
	for i:= 1 to suc do begin
		close(v_det[i]);
	end;
	
end;
	
var
	ar_mae: ar_maestro;

	i: integer;
	j, a_fisico: string;
	vec_detalle: vec_det;
	
begin
	writeln('ingrese dir fisica Maestro o compreme una  porter');
	readln(a_fisico);
	assign(ar_mae, a_fisico);
	rewrite(ar_mae);
	for i := 1 to suc do begin		//abro mierda logica
		str(i, j);
		assign(vec_detalle[i],'deta'+ j );
		reset(vec_detalle[i]);
	end;
	
	merge(vec_detalle, ar_mae);

	
end.
