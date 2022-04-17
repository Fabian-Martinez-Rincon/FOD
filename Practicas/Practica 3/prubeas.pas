procedure bajaLogica(var x:archivox);
var
    datox:archivoxR;
begin {se sabe que existe Carlos Garcia}
	assign(x, 'x.data');
	reset(x);
	leer(x, datox);
	while (datox.nombre <> 'Carlos Garcia') do	leer(x, datox);
	datox.nombre := '***';	
	seek(x, filepos(x)-1);
	write(x, datox);
	close(x);
end.
