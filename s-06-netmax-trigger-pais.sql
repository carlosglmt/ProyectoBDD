--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 06/08/2021
--@Descripción: Trigger para tabla replicada PAIS 

create or replace trigger t_dml_pais
    instead of insert or update or delete on pais
declare
    v_count number;
begin
    case
        when inserting then
        v_count := 0;
        -- réplica en cmtbd_s1
        insert into pais_r1 (pais_id,clave,nombre,continente)
        values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
        v_count := v_count + sql%rowcount;
        -- réplica en cmtbd_s2
        insert into pais_r2 (pais_id,clave,nombre,continente)
        values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
        v_count := v_count + sql%rowcount;
        -- réplica en msebd_s1
        insert into pais_r3 (pais_id,clave,nombre,continente)
        values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
        v_count := v_count + sql%rowcount;
        -- réplica en msebd_s2
        insert into pais_r4 (pais_id,clave,nombre,continente)
        values (:new.pais_id,:new.clave,:new.nombre,:new.continente);
        v_count := v_count + sql%rowcount;

        if v_count <> 4 then
            raise_application_error (
                -20040,
                'Número incorrecto de registros insertados en la tabla replicada: '
                || v_count
            );
        end if;

        when updating then
            v_count := 0;
            -- réplica en cmtbd_s1
            update pais_r1 set clave = :new.clave, nombre = :new.nombre,
                continente = :new.continente
            where pais_id = :new.pais_id;
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2
            update pais_r2 set clave = :new.clave, nombre = :new.nombre,
                continente = :new.continente
            where pais_id = :new.pais_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            update pais_r3 set clave = :new.clave, nombre = :new.nombre,
                continente = :new.continente
            where pais_id = :new.pais_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            update pais_r4 set clave = :new.clave, nombre = :new.nombre,
                continente = :new.continente
            where pais_id = :new.pais_id;

            if v_count <> 4 then
                raise_application_error (
                    -20040,
                    'Número incorrecto de registros actualizados en la tabla replicada: '
                    || v_count
                );
            end if;

        when deleting then
            v_count := 0;
            -- réplica en cmtbd_s1
            delete from pais_r1 where pais_id = :old.pais_id;
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2 
            delete from pais_r2 where pais_id = :old.pais_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            delete from pais_r3 where pais_id = :old.pais_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            delete from pais_r4 where pais_id = :old.pais_id;
            v_count := v_count + sql%rowcount;
            
            if v_count <> 4 then
            raise_application_error(-20040,
                'Número incorrecto de registros eliminados en tabla replicada: '
                || v_count);
            end if;
    end case;
end;
/
show errors