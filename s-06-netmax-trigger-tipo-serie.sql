--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 06/08/2021
--@Descripción: Trigger para tabla replicada TIPO_SERIE

create or replace trigger t_dml_tipo_serie
    instead of insert or update or delete on tipo_serie
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
            -- réplica en cmtbd_s1
            insert into tipo_serie_r1 (tipo_serie_id,clave,descripcion)
            values (:new.tipo_serie_id,:new.clave,:new.descripcion);
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2
            insert into tipo_serie_r2 (tipo_serie_id,clave,descripcion)
            values (:new.tipo_serie_id,:new.clave,:new.descripcion);        
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            insert into tipo_serie_r3 (tipo_serie_id,clave,descripcion)
            values (:new.tipo_serie_id,:new.clave,:new.descripcion);        
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            insert into tipo_serie_r4 (tipo_serie_id,clave,descripcion)
            values (:new.tipo_serie_id,:new.clave,:new.descripcion);        
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
            update tipo_serie_r1 set clave = :new.clave, descripcion = :new.descripcion
            where tipo_serie_id = :new.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2
            update tipo_serie_r2 set clave = :new.clave, descripcion = :new.descripcion
            where tipo_serie_id = :new.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            update tipo_serie_r3 set clave = :new.clave, descripcion = :new.descripcion
            where tipo_serie_id = :new.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            update tipo_serie_r4 set clave = :new.clave, descripcion = :new.descripcion
            where tipo_serie_id = :new.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            
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
            delete from tipo_serie_r1 where tipo_serie_id = :old.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2 
            delete from tipo_serie_r2 where tipo_serie_id = :old.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            delete from tipo_serie_r3 where tipo_serie_id = :old.tipo_serie_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            delete from tipo_serie_r4 where tipo_serie_id = :old.tipo_serie_id;
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