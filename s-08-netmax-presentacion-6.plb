
Prompt ======================================
Prompt validando transparencia de eliminacion
Prompt ======================================

Prompt seleciconar la PDB para validar
connect netmax_bdd/netmax_bdd@&pdb

whenever sqlerror exit rollback;

set serveroutput on

create or replace procedure p_valida_eliminacion wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
125 144
j5Z+nWERI1QPdmnzrmrzFCNIZ5Iwg0xK1ydqfC9GEg2vu0t4MciO8yOZjpES6+d2+n3G6qgJ
tjYmpIlQXhy8wN7K0kt8gkd4fmSR1jtc5x/+zXLu65gIdrwVXdA4QZdmcjmxWtV0uPsVHCfD
1QRuODLGpxFw5TGCDT6bnlPRm6skU1qOmo0opZDmRMnQDG4+1Cp7PP6kIHXuCVfD8uXA7WuJ
vDvjHDhuSk71bSL/tsgC+rn+xjxPbC/GXlMZBs8ugbA8uw8930KKIdFSuiygtzzSPDTox6Qf
VNOSIbgIsx06gG1vztEmFGGWJAMb3P0=

/
show errors

Prompt validando registros eliminados ...

declare
	v_count number(10,0);
begin

		
	select count(*) into v_count from playlist_f1;
	p_valida_eliminacion(v_count,'playlist_f1');
	select count(*) into v_count from playlist_f2;
	p_valida_eliminacion(v_count,'playlist_f2');
	select count(*) into v_count from playlist_f3;
	p_valida_eliminacion(v_count,'playlist_f3');
	select count(*) into v_count from playlist;
	p_valida_eliminacion(v_count,'playlist');

	
	select count(*) into v_count from usuario_f1;
	p_valida_eliminacion(v_count,'usuario_f1');
	select count(*) into v_count from usuario_f2;
	p_valida_eliminacion(v_count,'usuario_f2');
	select count(*) into v_count from usuario_f3;
	p_valida_eliminacion(v_count,'usuario_f3');
	select count(*) into v_count from usuario_f4;
	p_valida_eliminacion(v_count,'usuario_f4');
	select count(*) into v_count from usuario_f5;
	p_valida_eliminacion(v_count,'usuario_f5');
		select count(*) into v_count from usuario;
	p_valida_eliminacion(v_count,'usuario');

    
	select count(*) into v_count from archivo_programa_f1;
	p_valida_eliminacion(v_count,'archivo_programa_f1');
	select count(*) into v_count from archivo_programa_f2;
	p_valida_eliminacion(v_count,'archivo_programa_f2');
	select count(*) into v_count from archivo_programa;
	p_valida_eliminacion(v_count,'archivo_programa');
	

	
	select count(*) into v_count from historico_status_programa_f1;
	p_valida_eliminacion(v_count,'historico_status_programa_f1');
	select count(*) into v_count from historico_status_programa;
	p_valida_eliminacion(v_count,'historico_status_programa');


	
	select count(*) into v_count from documental_f1;
	p_valida_eliminacion(v_count,'documental_f1');
	select count(*) into v_count from documental_f2;
	p_valida_eliminacion(v_count,'documental_f2');
	select count(*) into v_count from documental_f3;
	p_valida_eliminacion(v_count,'documental_f3');
	select count(*) into v_count from documental;
	p_valida_eliminacion(v_count,'documental');

		
	select count(*) into v_count from pelicula_f1;
	p_valida_eliminacion(v_count,'pelicula_f1');
	select count(*) into v_count from pelicula_f2;
	p_valida_eliminacion(v_count,'pelicula_f2');
	select count(*) into v_count from pelicula_f3;
	p_valida_eliminacion(v_count,'pelicula_f3');
	select count(*) into v_count from pelicula;
	p_valida_eliminacion(v_count,'pelicula');

	
	select count(*) into v_count from serie_f1;
	p_valida_eliminacion(v_count,'serie_f1');
	select count(*) into v_count from serie_f2;
	p_valida_eliminacion(v_count,'serie_f2');
	select count(*) into v_count from serie_f3;
	p_valida_eliminacion(v_count,'serie_f3');
	select count(*) into v_count from serie;
	p_valida_eliminacion(v_count,'serie');


	
	select count(*) into v_count from programa_f1;
	p_valida_eliminacion(v_count,'programa_f1');
	select count(*) into v_count from programa_f2;
	p_valida_eliminacion(v_count,'programa_f2');
	select count(*) into v_count from programa_f3;
	p_valida_eliminacion(v_count,'programa_f3');
	select count(*) into v_count from programa;
	p_valida_eliminacion(v_count,'programa');

	
	select count(*) into v_count from pais_r1;
	p_valida_eliminacion(v_count,'pais_r1');
	select count(*) into v_count from pais_r2;
	p_valida_eliminacion(v_count,'pais_r2');
	select count(*) into v_count from pais_r3;
	p_valida_eliminacion(v_count,'pais_r3');
	select count(*) into v_count from pais_r4;
	p_valida_eliminacion(v_count,'pais_r4');


	
	select count(*) into v_count from tipo_serie_r1;
	p_valida_eliminacion(v_count,'tipo_serie_r1');
	select count(*) into v_count from tipo_serie_r2;
	p_valida_eliminacion(v_count,'tipo_serie_r2');
	select count(*) into v_count from tipo_serie_r3;
	p_valida_eliminacion(v_count,'tipo_serie_r3');
	select count(*) into v_count from tipo_serie_r4;
	p_valida_eliminacion(v_count,'tipo_serie_r4');


	
	select count(*) into v_count from tipo_cuenta_r1;
	p_valida_eliminacion(v_count,'tipo_cuenta_r1');
	select count(*) into v_count from tipo_cuenta_r2;
	p_valida_eliminacion(v_count,'tipo_cuenta_r2');
	select count(*) into v_count from tipo_cuenta_r3;
	p_valida_eliminacion(v_count,'tipo_cuenta_r3');
	select count(*) into v_count from tipo_cuenta_r4;
	p_valida_eliminacion(v_count,'tipo_cuenta_r4');

end;
/

host sha256sum s-08-netmax-presentacion-4.plb

prompt Listo!
exit



