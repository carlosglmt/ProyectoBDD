--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 06/08/2021
--@Descripción: Trigger PELICULA para msebd_s1

create or replace trigger t_dml_pelicula
    instead of insert or update or delete on pelicula
declare
    v_count number;
begin
    case
        when inserting then
            -- Verifica si hay correspondencia local para evitar acceso remoto
            select count(*) into v_count
            from programa_f2
            where programa_id = :new.programa_id;

            -- Inserción local
            if v_count > 0 then
                insert into pelicula_f2 (programa_id,duracion,sinopsis,
                    clasificacion,pelicula_antecedente_id)
                values (:new.programa_id,:new.duracion,:new.sinopsis,
                    :new.clasificacion,:new.pelicula_antecedente_id);
            
            -- Inserción remota
            else
                -- Verifica si hay correspondencia con el sitio remoto cmtbd_s1
                select count(*) into v_count
                from programa_f1
                where programa_id = :new.programa_id;

                if v_count > 0 then
                    -- Inserta el registro dentro del sitio cmtbd_s1
                    insert into pelicula_f1 (programa_id,duracion,sinopsis,
                        clasificacion,pelicula_antecedente_id)
                    values (:new.programa_id,:new.duracion,:new.sinopsis,
                        :new.clasificacion,:new.pelicula_antecedente_id);
                
                else 
                    -- Verifica si hay correspondencia con el sitio remoto msebd_s2
                    select count(*) into v_count
                    from programa_f3
                    where programa_id = :new.programa_id;

                    if v_count > 0 then
                        -- Inserta el registro dentro del sitio msebd_s2
                        insert into pelicula_f3 (programa_id,duracion,sinopsis,
                            clasificacion,pelicula_antecedente_id)
                        values (:new.programa_id,:new.duracion,:new.sinopsis,
                            :new.clasificacion,:new.pelicula_antecedente_id);
                    
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
            -- Verifica si hay correspondencia local para evitar el acceso remoto
            select count(*) into v_count
            from programa_f2
            where programa_id = :old.programa_id;

            if v_count > 0 then
                -- Eliminación local
                delete from pelicula_f2 where programa_id = :old.programa_id;
            
            else
                -- Verifica si hay correspondencia remota en cmtbd_s1
                select count(*) into v_count
                from programa_f1
                where programa_id = :old.programa_id;

                if v_count > 0 then
                    -- Eliminación remota <- msebd_s1
                    delete from pelicula_f1 where programa_id = :old.programa_id;
                
                else
                    -- Verifica si hay correspondencia remota en msebd_s2
                    select count(*) into v_count
                    from programa_f3
                    where programa_id = :old.programa_id;

                    if v_count > 0 then
                        -- Eliminación remota <- msebd_s2
                        delete from pelicula_f3 where programa_id = :old.programa_id;

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