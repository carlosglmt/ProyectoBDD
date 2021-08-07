--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 06/08/2021
--@Descripción: Trigger USUARIO

create or replace trigger t_dml_usuario
    instead of insert or update or delete on usuario
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
            -- Verificando si el nuevo registro pertenecerá al sitio cmtbd_s1
            if :new.vigente = 1 and :new.tipo_cuenta_id = 1 then
                insert into usuario_f1 (usuario_id,email,nombre,ap_paterno,ap_materno,
                    fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
                v_count := v_count + sql%rowcount;

            -- Verificando si el nuevo registro pertenecerá al sitio msebd_s1
            elsif :new.vigente = 1 and :new.tipo_cuenta_id = 2 then
                insert into usuario_f2 (usuario_id,email,nombre,ap_paterno,ap_materno,
                    fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
                v_count := v_count + sql%rowcount;

            -- Verificando si el nuevo registro pertenecerá al sitio cmtbd_s2
            elsif :new.vigente = 1 and :new.tipo_cuenta_id = 3 then
                insert into usuario_f3 (usuario_id,email,nombre,ap_paterno,ap_materno,
                    fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
                v_count := v_count + sql%rowcount;

            -- Verificando si el nuevo registro pertenecerá al sitio msebd_s2
            elsif :new.vigente = 0 then
                insert into usuario_f5 (usuario_id,email,nombre,ap_paterno,ap_materno,
                    fecha_ingreso,fecha_cuenta_fin,vigente,tipo_cuenta_id)
                values (:new.usuario_id,:new.email,:new.nombre,:new.ap_paterno,:new.ap_materno,
                    :new.fecha_ingreso,:new.fecha_cuenta_fin,:new.vigente,:new.tipo_cuenta_id);
                v_count := v_count + sql%rowcount;

            else
                raise_application_error (
                    -20010,
                    "El registro no cumple con el esquema de fragmentación"
                );
            end if;

            -- Insertando en el sitio msebd_s1
            insert into usuario_f4 (usuario_id,num_tarjeta,password)
            values(:new.usuario_id,:new.num_tarjeta,:new.password);

        when updating then
            raise_application_error(
                -20030,
                "Las operaciones update aún no se han implementado"
            );

        when deleting then
            -- Verificando si el registro a eliminar está en el sitio cmtbd_s1
            if :old.vigente = 1 and :old.tipo_cuenta_id = 1 then
                delete from usuario_f1 where usuario_id = :old.usuario_id;
            
            -- Verificando si el registro a eliminar está en el sitio msebd_s1
            elsif :old.vigente = 1 and :old.tipo_cuenta_id = 2 then
                delete from usuario_f2 where usuario_id = :old.usuario_id;
            
            -- Verificando si el registro a eliminar está en el sitio cmtbd_s2
            elsif :old.vigente = 1 and :old.tipo_cuenta_id = 3 then
                delete from usuario_f3 where usuario_id = :old.usuario_id;
            
            -- Verificando si el registro a eliminar está en el sitio msebd_s2
            elsif :old.vigente = 0 then
                delete from usuario_f5 where usuario_id = :old.usuario_id;
            
            else
                raise_application_error (
                    -20010,
                    "El registro no cumple con el esquema de fragmentación"
                );
            end if;

            -- Eliminando registro del sitio msebd_s1
            delete from usuario_f4 where usuario_id = :old.usuario_id; 
    end case;
end;
/