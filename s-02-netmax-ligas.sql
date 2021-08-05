--@Autor: Carlos Gamaliel Morales Téllez
--@Fecha creación: 01/08/2021
--@Descripción: Creación de ligas en los 4 nodos.
clear screen
whenever sqlerror exit rollback;

-- Ligas en la pdb cmtbd_s1
Prompt Creando ligas en cmtbd_s1
connect netmax_bdd/netmax_bdd@cmtbd_s1
-- PDB local
create database link cmtbd_s2.fi.unam using 'CMTBD_S2';
-- PDB remotas
create database link msebd_s1.fi.unam using 'MSEBD_S1';
create database link msebd_s2.fi.unam using 'MSEBD_S2';

-- Ligas en la pdb cmtbd_s2
Prompt Creando ligas en cmtbd_s2
connect netmax_bdd/netmax_bdd@cmtbd_s2
-- PDB local
create database link cmtbd_s1.fi.unam using 'CMTBD_S1';
-- PDB remotas
create database link msebd_s1.fi.unam using 'MSEBD_S1';
create database link msebd_s2.fi.unam using 'MSEBD_S2';

-- Ligas en la pdb msebd_s1
Prompt Creando ligas en msebd_s1
connect netmax_bdd/netmax_bdd@msebd_s1
-- PDB local
create database link msebd_s2.fi.unam using 'MSEBD_S2';
-- PDB remotas
create database link cmtbd_s1.fi.unam using 'CMTBD_S1';
create database link cmtbd_s2.fi.unam using 'CMTBD_S2';

-- Ligas en la pdb msebd_s2
Prompt Creando ligas en msebd_s2
connect netmax_bdd/netmax_bdd@msebd_s2
-- PDB local
create database link msebd_s1.fi.unam using 'MSEBD_S1';
-- PDB remotas
create database link cmtbd_s1.fi.unam using 'CMTBD_S1';
create database link cmtbd_s2.fi.unam using 'CMTBD_S2';

Prompt Listo!