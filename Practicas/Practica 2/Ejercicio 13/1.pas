procedure exportarTxt(var x: archivox);
var
	carga:text;
	datox: registrox;
begin
	assign(carga,'archivoDetDia.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,nroUsuario,' ',cantMailsEnviados);
	end;
	close(x); close(carga);
end;