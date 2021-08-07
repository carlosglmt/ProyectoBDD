--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 06/08/2021
--@Descripción: Trigger PLAYLIST para cmtbd_s1

create or replace trigger t_dml_playlist
    instead of insert or update or delete on playlist
declare
    v_count number;
begin
    case
        when inserting then
            -- Verifica si hay correspondencia local para evitar acceso remoto
            select count(*) into v_count
            from usuario_f1
            where usuario_id = :new.usuario_id;

            -- Inserción local
            if v_count > 0 then
                insert into playlist_f1 (playlist_id,calificacion,indice,
                    num_reproducciones,programa_id,usuario_id)
                values (:new.playlist_id,:new.calificacion,:new.indice,
                    :new.num_reproducciones,:new.programa_id,:new.usuario_id);

            -- Inserción remota
            else
                -- Verifica si hay correspondencia con el sitio msebd_s1
                select count(*) into v_count
                from usuario_f2
                where usuario_id = :new.usuario_id;

                if v_count > 0 then
                    -- Inserta el registro en msebd_s1
                    insert into playlist_f2 (playlist_id,calificacion,indice,
                        num_reproducciones,programa_id,usuario_id)
                    values (:new.playlist_id,:new.calificacion,:new.indice,
                        :new.num_reproducciones,:new.programa_id,:new.usuario_id);
                
                else 
                    -- Verifica si hay correspondencia con el sitio cmtbd_s2
                    select count(*) into v_count
                    from usuario_f3
                    where usuario_id = :new.usuario_id;

                    if v_count > 0 then
                        -- Inserta el registro en cmtbd_s2
                        insert into playlist_f3 (playlist_id,calificacion,indice,
                            num_reproducciones,programa_id,usuario_id)
                        values (:new.playlist_id,:new.calificacion,:new.indice,
                            :new.num_reproducciones,:new.programa_id,:new.usuario_id);
                    else
                        -- Verifica si hay correspondencia con el sitio msebd_s2
                        select count(*) into v_count
                        from usuario_f5
                        where usuario_id = :new.usuario_id;

                        if v_count > 0 then
                            -- Inserta el registro en msebd_s2
                            insert into playlist_f4 (playlist_id,calificacion,indice,
                                num_reproducciones,programa_id,usuario_id)
                            values (:new.playlist_id,:new.calificacion,:new.indice,
                                :new.num_reproducciones,:new.programa_id,:new.usuario_id);
                        else
                            -- Se lanza un error al no haber correspondencia ni local ni remota
                            raise_application_error (
                                -20020,
                                "El registro no cumple con el esquema de fragmentación horizontal derivada"
                            ); 
                        end if;
                    end if;
                end if;
            end if;

        when updating then
            raise_application_error(
                -20030,
                "Las operaciones update aún no se han implementado"
            );

        when deleting then
            -- Verifica si hay correspondencia local para evitar el acceso remoto
            select count(*) into v_count
            from usuario_f1
            where usuario_id = :old.usuario_id;

            if v_count > 0 then
                -- Eliminación local
                delete from playlist_f1 where playlist_id = :old.playlist_id;

            else
                -- Verifica si hay correspondencia con el sitio msebd_s1
                select count(*) into v_count
                from usuario_f2
                where usuario_id = :old.usuario_id;

                if v_count > 0 then
                    --  Elimina el registro en msebd_s1
                    delete from playlist_f2 where playlist_id = :old.playlist_id;
                
                else 
                    -- Verifica si hay correspondencia con el sitio cmtbd_s2
                    select count(*) into v_count
                    from usuario_f3
                    where usuario_id = :old.usuario_id;

                    if v_count > 0 then
                        -- Elimina el registro en cmtbd_s2 
                        delete from playlist_f3 where playlist_id = :old.playlist_id;

                    else
                        -- Verifica si hay correspondencia con el sitio msebd_s2
                        select count(*) into v_count
                        from usuario_f5
                        where usuario_id = :new.usuario_id;

                        if v_count > 0 then
                            -- Elimina el registro en msebd_s2
                            delete from playlist_f4 where playlist_id = :old.playlist_id;

                        else
                            -- Se lanza un error al no haber correspondencia ni local ni remota
                            raise_application_error (
                                -20020,
                                "El registro no cumple con el esquema de fragmentación horizontal derivada"
                            ); 
                        end if;
                    end if;
                end if;
            end if;


    end case;
end;
/