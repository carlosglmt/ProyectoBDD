--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 06/08/2021
--@Descripción: Trigger para tabla replicada TIPO_CUENTA

create or replace trigger t_dml_tipo_cuenta
    instead of insert or update or delete on tipo_cuenta
declare
    v_count number;
begin
    case
        when inserting then
        v_count := 0;
        -- réplica en cmtbd_s1
        insert into tipo_cuenta_r1 (tipo_cuenta_id,clave,descripcion,costo_mensual)
        values (:new.tipo_cuenta_id,:new.clave,:new.descripcion,:new.costo_mensual);
        v_count := v_count + sql%rowcount;
        -- réplica en cmtbd_s2
        insert into tipo_cuenta_r2 (tipo_cuenta_id,clave,descripcion,costo_mensual)
        values (:new.tipo_cuenta_id,:new.clave,:new.descripcion,:new.costo_mensual);        
        v_count := v_count + sql%rowcount;
        -- réplica en msebd_s1
        insert into tipo_cuenta_r3 (tipo_cuenta_id,clave,descripcion,costo_mensual)
        values (:new.tipo_cuenta_id,:new.clave,:new.descripcion,:new.costo_mensual);        
        v_count := v_count + sql%rowcount;
        -- réplica en msebd_s2
        insert into tipo_cuenta_r4 (tipo_cuenta_id,clave,descripcion,costo_mensual)
        values (:new.tipo_cuenta_id,:new.clave,:new.descripcion,:new.costo_mensual);        
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
            update tipo_cuenta_r1 set clave = :new.clave, descripcion = :new.descripcion,
                costo_mensual = :new.costo_mensual
            where tipo_cuenta_id = :new.tipo_cuenta_id;
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2
            update tipo_cuenta_r2 set clave = :new.clave, descripcion = :new.descripcion,
                costo_mensual = :new.costo_mensual
            where tipo_cuenta_id = :new.tipo_cuenta_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            update tipo_cuenta_r3 set clave = :new.clave, descripcion = :new.descripcion,
                costo_mensual = :new.costo_mensual
            where tipo_cuenta_id = :new.tipo_cuenta_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            update tipo_cuenta_r4 set clave = :new.clave, descripcion = :new.descripcion,
                costo_mensual = :new.costo_mensual
            where tipo_cuenta_id = :new.tipo_cuenta_id;

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
            delete from tipo_cuenta_r1 where tipo_cuenta_id = :old.tipo_cuenta_id;
            v_count := v_count + sql%rowcount;
            -- réplica en cmtbd_s2 
            delete from tipo_cuenta_r2 where tipo_cuenta_id = :old.tipo_cuenta_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s1
            delete from tipo_cuenta_r3 where tipo_cuenta_id = :old.tipo_cuenta_id;
            v_count := v_count + sql%rowcount;
            -- réplica en msebd_s2
            delete from tipo_cuenta_r4 where tipo_cuenta_id = :old.tipo_cuenta_id;
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