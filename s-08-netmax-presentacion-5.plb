
Prompt Seleccionar la PDB para realizar la eliminación de datos

connect netmax_bdd/netmax_bdd@&pdb
set serveroutput on
Prompt Eliminando datos ...
declare
	v_formato varchar2(50) := 'yyy-mm-dd hh24:mi:ss';	

begin
	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de playlist');
	delete from playlist;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de usuario');
	delete from usuario;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de  serie');
	delete from serie;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de pelicula');
	delete from pelicula;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de documental');
	delete from documental;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de historico');
	delete from historico_status_programa;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de archivo_programa');
	delete from archivo_programa;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de programa');
	delete from programa;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de pais');
	delete from pais;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de tipo_serie');
	delete from tipo_serie;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Eliminando datos de tipo_cuenta');
	delete from tipo_cuenta;

	dbms_output.put_line(to_char(sysdate,v_formato) 
		|| ' Elimimacion concluida, haciendo commit');
	commit;

exception
	when others then
		dbms_output.put_line('Errores detectados al realizar la eliminacion');
		dbms_output.put_line('Se hará rollback');
		rollback;
    dbms_output.put_line(dbms_utility.format_error_backtrace);
		raise;
end;
/
Prompt Listo!
exit
