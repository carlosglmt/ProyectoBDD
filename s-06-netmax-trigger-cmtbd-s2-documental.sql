--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 06/08/2021
--@Descripción: Trigger DOCUMENTAL para cmtbd_s2

create or replace trigger t_dml_documental
    instead of insert or update or delete on documental
declare
    v_count number;
begin
    case
        when inserting then
            -- En este sitio no hay correspondencia local 
            -- Verifica si hay correspondencia en el sitio remoto cmtbd_s1
            select count(*) into v_count
            from programa_f1
            where programa_id = :new.programa_id;

            if v_count > 0 then
                -- Inserta binario, uso de la tabla temporal
                insert into ti_documental_1 (programa_id,tematica,duracion,
                    trailer,pais_id)
                values (:new.programa_id,:new.tematica,:new.duracion,
                    :new.trailer,:new.pais_id);
                -- Inserta el registro en el sitio msebd_s1
                insert into documental_f1
                    select * from ti_documental_1
                    where programa_id = :new.programa_id;
                -- Elimina el registro de la tabla temporal
                delete from ti_documental_1 
                    where programa_id = :new.programa_id;
             
            else
                -- Verivica si hay correspondencia con el sitio remoto msebd_s1
                select count(*) into v_count
                from programa_f2
                where programa_id = :new.programa_id;

                if v_count > 0 then
                    -- Inserta binario, uso de la tabla temporal
                    insert into ti_documental_2 (programa_id,tematica,duracion,
                        trailer,pais_id)
                    values (:new.programa_id,:new.tematica,:new.duracion,
                        :new.trailer,:new.pais_id);
                    -- Inserta el registro en el sitio msebd_s1
                    insert into documental_f2
                        select * from ti_documental_2
                        where programa_id = :new.programa_id;
                    -- Elimina el registro de la tabla temporal
                    delete from ti_documental_2 
                        where programa_id = :new.programa_id;
                    
                
                else 
                    -- Verifica si hay correspondencia con el sitio remoto msebd_s2
                    select count(*) into v_count
                    from programa_f3
                    where programa_id = :new.programa_id;

                    if v_count > 0 then
                        -- Inserta binario, uso de la tabla temporal
                        insert into ti_documental_3 (programa_id,tematica,duracion,
                            trailer,pais_id)
                        values (:new.programa_id,:new.tematica,:new.duracion,
                            :new.trailer,:new.pais_id);
                        -- Inserta el registro en el sitio msebd_s2
                        insert into documental_f3
                            select * from ti_documental_3
                            where programa_id = :new.programa_id;
                        -- Elimina el registro de la tabla temporal
                        delete from ti_documental_3 
                            where programa_id = :new.programa_id;


                    else
                        -- Se lanza un error al no haber correspondencia ni local ni remota
                        raise_application_error (
                            -20020,
                            'El registro no cumple con el esquema de fragmentación horizontal derivada'
                        );
                    
                    end if;
                end if;
            end if;


        when updating then
            raise_application_error (
                -20030,
                'Las operaciones update aún no se han implementado'
            );

        when deleting then
            -- En este sitio no hay correspondencia local 
            -- Verifica si hay correspondencia en el sitio remoto cmtbd_s1
            select count(*) into v_count
            from programa_f1
            where programa_id = :old.programa_id;

            if v_count > 0 then
                -- Eliminación remota <- cmtbd_s1
                delete from documental_f1 where programa_id = :old.programa_id;
            
            else
                -- Verifica si hay correspondencia remota en msebd_s1
                select count(*) into v_count
                from programa_f2
                where programa_id = :old.programa_id;

                if v_count > 0 then
                    -- Eliminación remota <- msebd_s1
                    delete from documental_f2 where programa_id = :old.programa_id;
                
                else
                    -- Verifica si hay correspondencia remota en msebd_s2
                    select count(*) into v_count
                    from programa_f3
                    where programa_id = :old.programa_id;

                    if v_count > 0 then
                        -- Eliminación remota <- msebd_s2
                        delete from documental_f3 where programa_id = :old.programa_id;

                    else
                        -- Se lanza un error al no haber correspondencia ni local ni remota
                        raise_application_error (
                                -20020,
                                'El registro no cumple con el esquema de fragmentación horizontal derivada'
                        );
                    end if;
                end if;
            end if;
    end case;
end;
/
show errors        