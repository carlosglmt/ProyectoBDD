--@Autor: Jorge A. Rodríguez C
--@Fecha creación: dd/mm/yyyy
--@Descripción: Script empleado para configurar el
--              Soporte de datos BLOB.

Prompt Creando objetos para leer datos BLOB

Prompt creando directorio
-- el usuario netmax debe tener el privilegio create any directory

--Objeto tipo Directory para representar al campo archivo_programa.archivo
create or replace directory proyecto_final_pdfs_dir as '/bdd/proyecto-final/pdfs';

--Objeto tipo Directory empleado para almacenar los trailers de un documental.
create or replace directory proyecto_final_trailers_dir as '/bdd/proyecto-final/trailers';

Prompt creando funcion para leer datos BLOB
create or replace function fx_carga_blob(
    p_directory_name in varchar2,
    p_src_file_name in varchar2 ) return blob is
    --variables
    v_src_blob bfile:=bfilename(upper(p_directory_name),p_src_file_name);
    v_dest_blob blob := empty_blob();
    v_src_offset number := 1;
    v_dest_offset number :=1;
    v_src_blob_size number;

    begin
        if dbms_lob.fileexists(v_src_blob) = 0 then
            raise_application_error(-20001, p_src_file_name
                ||' El archivo '
                ||p_src_file_name
                ||' no existe en '
                ||p_directory_name
            );
        end if;
        
        --abre el archivo
        if dbms_lob.isopen(v_src_blob) = 0 then
            dbms_lob.open(v_src_blob,dbms_lob.LOB_READONLY);
        end if;
        
        v_src_blob_size := dbms_lob.getlength(v_src_blob);

        --crea un objeto lob temporal
        dbms_lob.createtemporary(
            lob_loc => v_dest_blob, 
            cache => true, 
            dur => dbms_lob.call
        );

        --lee el archivo y escribe en el blob
        dbms_lob.loadblobfromfile(
            dest_lob => v_dest_blob,
            src_bfile => v_src_blob,
            amount => dbms_lob.getlength(v_src_blob),
            dest_offset => v_dest_offset,
            src_offset => v_src_offset
        );

        --cerrando blob
        dbms_lob.close(v_src_blob);
        if v_src_blob_size<> dbms_lob.getlength(v_dest_blob) then
            raise_application_error(-20104,
            'Numero de byes leidos VS escritos no coinciden: '
            ||v_src_blob_size||', actual: '|| dbms_lob.getlength(v_dest_blob));
        end if;
        return v_dest_blob;
end;
/
show errors