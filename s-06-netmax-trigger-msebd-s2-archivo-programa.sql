--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 06/08/2021
--@Descripción: Trigger ARCHIVO_PROGRAMA para msebd_s2

create or replace trigger t_dml_archivo_programa
    instead of insert or update or delete on archivo_programa
declare
    v_count number;
begin
    case
        when inserting then
            -- Verifica si hay correspondencia local para evitar el acceso remoto
            if :new.tamanio > 10 then
                -- Inserta el registro de forma local
                insert into archivo_programa_f1 (num_archivo,programa_id,
                    archivo,tamanio)
                values (:new.num_archivo,:new.programa_id,:new.archivo,
                    :new.tamanio);

            -- Verifica si hay correspondencia con el sitio msebd_s1
            elsif :new.tamanio <= 10 then
                -- Inserta binario, uso de la tabla temporal
                insert into ti_archivo_programa_2 (num_archivo,programa_id,
                    archivo,tamanio)
                values (:new.num_archivo,:new.programa_id,:new.archivo,
                    :new.tamanio);
                -- Inserta el registro en el sitio msebd_s1
                insert into archivo_programa_f2
                    select num_archivo,programa_id,archivo,tamanio
                    from ti_archivo_programa_2
                    where num_archivo = :new.num_archivo
                    and programa_id = :new.programa_id;
                -- Elimina el registro de la tabla temporal
                delete from ti_archivo_programa_2 
                    where num_archivo = :new.num_archivo
                    and programa_id = :new.programa_id;
                
            else 
                -- Se lanza un error al no haber correspondencia ni local ni remota
                raise_application_error (
                    -20020,
                    'El registro no cumple con el esquema de fragmentación horizontal primaria'
                );
            end if;

        when updating then
            raise_application_error (
                -20030,
                'Las operaciones update aún no se han implementado'
            );

        when deleting then
            -- Verifica si hay correspondencia local para evitar el acceso remoto
            if :old.tamanio > 10 then
                -- Elimina el registro local
                delete from archivo_programa_f1 
                    where num_archivo = :old.num_archivo
                    and programa_id = :old.programa_id;
            
            -- Verifica si hay correspondencia con el sitio msebd_s1
            elsif :old.tamanio <= 10 then
                -- Elimina el registro que se encuentra en el sitio msebd_s1
                delete from archivo_programa_f2
                    where num_archivo = :old.num_archivo
                    and programa_id = :old.programa_id;
            else
                -- Se lanza un error al no haber correspondencia ni local ni remota
                raise_application_error (
                    -20020,
                    'El registro no cumple con el esquema de fragmentación horizontal primaria'
                );
            end if;
    end case;
end;
/
show errors