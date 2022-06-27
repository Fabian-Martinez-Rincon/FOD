program compactar;
procedure compactar (var arc_log:archivo);
var
    n:ave;
    pos:integer;
begin
	reset(arc_log);
	leerArc(arc_log,n);
	while (n.cod <> valorAlto) do begin
		if (n.nom = '@Eliminado') then begin
			pos:= (filePos(arc_log)-1);
			seek(arc_log,fileSize(arc_log)-1);
			read(arc_log,n);
			while (n.nom = '@Eliminado') do begin
				seek(arc_log,fileSize(arc_log)-1);
				truncate(arc_log);
				seek(arc_log,fileSize(arc_log)-1);
				read(arc_log,n);
			end;
			seek(arc_log,pos);
			write(arc_log,n);
			seek(arc_log,fileSize(arc_log)-1);
			truncate(arc_log);
			seek(arc_log,pos);
		end;
		leerArc(arc_log,n);
	end;
	close(arc_log);
end;
begin
  
end.