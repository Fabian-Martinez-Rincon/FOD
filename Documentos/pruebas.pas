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
        cant_varones, cant_mujeres, cant_desocupados : integer; 
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