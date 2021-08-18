--@Autor: Carlos Gamaliel Morales Téllez
--@Autor: Mario Alberto Suárez Espinoza
--@Fecha creación: 06/08/2021
--@Descripción: Trigger PROGRAMA

create or replace trigger t_dml_programa
    instead of insert or update or delete on programa
begin
    case
        when inserting then
            -- Verificando si el nuevo registro pertenecerá al sitio cmtbd_s1
            if substr(:new.folio,1,2) >= 'AA' and substr(:new.folio,1,2) <= 'MZ' then
                insert into programa_f1 (programa_id,folio,nombre,descripcion,fecha_status,
                    tipo,status_programa_id) 
                values (:new.programa_id,:new.folio,:new.nombre,:new.descripcion,:new.fecha_status,
                    :new.tipo,:new.status_programa_id);

            -- Verificando si el nuevo registro pertenecerá al sitio msebd_s1
            elsif substr(:new.folio,1,2) >= 'NA' and substr(:new.folio,1,2) <= 'ZZ' then
                if :new.status_programa_id = 3 or :new.status_programa_id = 2 or :new.status_programa_id = 1 then
                    insert into programa_f2 (programa_id,folio,nombre,descripcion,fecha_status,
                        tipo,status_programa_id) 
                    values (:new.programa_id,:new.folio,:new.nombre,:new.descripcion,:new.fecha_status,
                        :new.tipo,:new.status_programa_id);

                -- Verificando si el nuevo registro pertenecerá al sitio msebd_s2
                elsif :new.status_programa_id = 4 or :new.status_programa_id = 5 then
                    insert into programa_f3 (programa_id,folio,nombre,descripcion,fecha_status,
                        tipo,status_programa_id) 
                    values (:new.programa_id,:new.folio,:new.nombre,:new.descripcion,:new.fecha_status,
                        :new.tipo,:new.status_programa_id);
                    
                end if;
            else
                raise_application_error (
                    -20010,
                    'El registro no cumple con el esquema de fragmentación'
                );
            end if;

        when updating then
            raise_application_error(
                -20030,
                'Las operaciones update aún no se han implementado'
            );

        when deleting then
            -- Verificando si el registro a eliminar está en el sitio cmtbd_s1
            if substr(:old.folio,1,2) >= 'AA' and substr(:old.folio,1,2) <= 'MZ' then
                delete from programa_f1 where programa_id = :old.programa_id;

            -- Verificando si el registro a eliminar está en el sitio msebd_s1
            elsif substr(:old.folio,1,2) >= 'NA' and substr(:old.folio,1,2) <= 'ZZ' then
                if :old.status_programa_id = 3 or :old.status_programa_id = 2 or :old.status_programa_id = 1 then
                    delete from programa_f2 where programa_id = :old.programa_id;

                -- Verificando si el registro a eliminar está en el sitio msebd_s2
                elsif :old.status_programa_id = 4 or :old.status_programa_id = 5 then
                    delete from programa_f3 where programa_id = :old.programa_id;
                end if;
            else
                raise_application_error (
                    -20010,
                    'El registro no cumple con el esquema de fragmentación'
                );
            end if;
    end case;
end;
/
show errors