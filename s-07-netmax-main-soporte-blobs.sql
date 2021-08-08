--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha de creación: 07/08/2021
--@Descripción: Script principal empleado para configurar el soporte
--              de datos BLOB en los 4 nodos

Prompt configurando directorios y otorgando registros

-- cmtbd_s1
Prompt configurando soporte BLOB para cmtbd_s1
connect netmax_bdd/netmax_bdd@cmtbd_s1
@s-07-netmax-configuracion-soporte-blobs.sql

-- cmtbd_s2
Prompt configurando soporte BLOB para cmtbd_s2
connect netmax_bdd/netmax_bdd@cmtbd_s2
@s-07-netmax-configuracion-soporte-blobs.sql

-- msebd_s1
Prompt configurando soporte BLOB para msebd_s1
connect netmax_bdd/netmax_bdd@msebd_s1
@s-07-netmax-configuracion-soporte-blobs.sql

-- msebd_s2
Prompt configurando soporte BLOB para msebd_s2
connect netmax_bdd/netmax_bdd@msebd_s2
@s-07-netmax-configuracion-soporte-blobs.sql

Prompt Listo!
exit