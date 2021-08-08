
Prompt seleccionar la PDB para validar
connect netmax_bdd/netmax_bdd@&pdb
Prompt  Indicar la Tecnica para fragmentar playlist:
accept p_fragmento char prompt  '(P) empleando PROGRAMA, (U) empleando USUARIO: '

whenever sqlerror exit rollback;
set serveroutput on

Prompt Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';
set linesize 500

Prompt Creando procedimientos para validar 

create or replace procedure sp_verifica_tablas wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
212 1de
G4RyeXlA2Q15hgumcYaH41kXc8Mwg0xp2SfWZ47NPKm1uL/s4G3XYRR8/C5l9W73Qhr1KnXb
b68noea8nYwRklR0bsZux5bEyGaVR1pGTpztK7CS7SKJMwm5E5t0wzqCqZAuAu6rU/q2ie5m
GMFy+VavskP5R16FfD18z727wWe+b17bMfY+wHyeYz0UOE3d3mS69U45SK36swHmSRI3zEBa
xawRcETvIF/FAMw+3/FdkVGFESe0olU2GO8ZRcjIIZQr3lHwwrVR7G//kpQERnfKscSf5j3n
gvfsNMS0Fi9YSCnc5KAzwbjLTJrcDawE0m86DhIljWts6e7fG+yeSMzyqGoH6XbGrswOxU2D
hLGH3EMm9jh6vLYOzSL+sPx0LC7ElhP8evDm6Esg//Fxkzj1ONKMEqfMSjhLcdHqpgZsrPYx
d8abaZjlCyqUtT5OyBdnsQCbF8skmhAdL5lGaQ==

/
show errors



create or replace procedure sp_valida_inserciones wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
608 347
TC9+MHlYx5Dspz/636xO1XeMZBcwg43Dr0gTZy/NlAw6B7779/atrYPAbHQMNMVW9TeFAKjg
IHEU/XHd9wlDF5Ky7UP8LB7hmRvA4PP6p8m/F4vtePhvnHt7ZeEYypoHrrPfh4A4bl1WupXe
FcBDJ8q+qOm/tE4mhgKFx/M9dMYd07THogePQBs9uX6iz0n1PmUI07kq5ZYhI7ocm6BerMaY
PTLFcLyP2fgvth1i6ZjeDU7vZ9IXBem+iNDGJxBR2vsIrr7q1q0XYM7ztbIUfkH7wARBSJOP
li8mpgX5t4iFrQXCXPsK0siOlw2eUgkafDG1ngqkMEclpIUB99KbwNH1o3iiDBpbIuF+BYXd
q9Cr50fHNUtv+m4L7ws5u65h6Jd/8L7NAtyPmDckBrVQFTY+m37f+Dn//mvK1FhS5kMajrMw
FhPfLDFUK2v6yDfCLm4fk+wdDNyNwezlNQzT6T9noZTv2YSBQUAAjifi9jhMTi2E5qImhI1k
xHaKyVT+ifo4xsKOuAlYPgIq1tiVGYCT9b3tQ9o2ibuTbzvrzyViMBeHkOzSa3Ch5GFgdGM8
AuP7tNji4XDKGo1b6IRrLWYbuIKrkK36wHbE3LkjWk25IBptRUQC3tZOPvYQFXEyI67WgS20
xhuYFFPvk8658E57/lwHQ5TDbTUkeJc9PDaFCA1lAW56pLU/j5diKBwDEQML5PybhxvtpwVb
6JYWtdwm19Nd8zBsNqodqkq1cP2vaggqtRBwHk1uLsRzMR8JdANsjF3FeoTTSROECX8XBfF+
8wNGgRD9SQ3vvqsNddjblKW4kkMkr5D0+A==

/
show errors


create or replace procedure sp_valida_insercion_blob wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1f6 1a5
jBPHPbV1ta/WmvbNhkHctDapoNYwg/DIzPbWfI4C/oOste68MazVCTM8rePs4jjsWlkzqyUr
QI/gfyWw+c7peGtMLN9aj8BOkMeuSK+TrF76f7S3ex7oIidc/boyB0UqJ5qg+AJ4T5TFOPGe
jbaeuWlYxnVbfA3MZhSXSA82GIIhoBnzrp/jZO0601op1wvk8k1OFAWakhdTQR3gB1tI1PM+
Lebp9/c2vRVNFW6CvDBxBzjOjs4BRI2toOi79bGrpVvXisC+KrXekqY0kk15mg08JuKPf7ui
RHCQJgBckBn2ULLPK9S9uTROCEma1NH7djK7Szj2cKNX9sSimJuc/Vvu2NsdE9RCJnWOAo7V
v1xgFofOzI7tphKZ+ee1T4oLyPV00xdWQdTrjoU8XOK0es/7aYtAEQ==

/
show errors

create or replace procedure sp_valida_conteos wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1f5 1b1
B5PqBr8rKkrEU3MNTYBLwy03hj0wg3nM2UgVfC+KjfLkahnTGo7MI9VE+qGn4Cq094bSJ4hL
aRqOjBTN9NBktoeUlfE7gbmKMNQTnhw4bplGI2Q/9ZN+oKMFTAt+zf4sEiYYV7eFlPSR3NNw
OmWi891s0JMYrNvkrunxfKiloaKgyuB6puyBLITPsEcIs61oCbzXuUv6RGGlQcohhOklIWvz
94mCAua47iTwgIycwQ4C0nozcwHFmf0djTFvMl4xqxhVgyuNk3hvM0UlaScR0peQBSXi9b2H
sSNXboFB4hkvSxkT8iB+cyP7c+u/6U5cC5+VENKzj3AGm3WRtKeGuFg+QdkhnITEXOaIkhn1
e5D7tefRjvEKM07k/eXdE5aASELWA6bjRZM1eL63PQpK/zEIEG8dkJiFRLcHD0LFQL8=

/
show errors


create or replace procedure sp_valida_insercion_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
b12 3a0
/mdvp+Ot22ed+v7BaQBKhUbcM/wwg5Cn1yeGfI4CFxNnmjXaSY+Iftk6jEcVLj08yLRgYQOU
FVK6NwtEtY45iwLJANBQH/2T/1AhFEpxWsrjTlUSMsAU2t3501XGBDfArhkR1GGJSzRZbUYI
booW2YD7Qt3/hqtC9yjfy4cirbSrHXg0iBl0W/3C0guW4Yc0vIQwkatFf7yNHvcsrQpqIwPA
gjSE0OJJJu7KdIXUk77+y1LtL+5jHhIWdmJvRWGw2BQCJimHNKP6o7GgKyhiimsNJKCkgoRM
CrRBtxrcThjlWT/yVO29tBNpBW0BdnzzpqflikOJSyO2S3hrU5wmpQ7R9qN83EEqECU9OGXq
POZqaTzsAwJFPFe6VKHikeOtf3nzzaydjvWAE8tLC246R2kfrtcprVIHAoCVJLKaNS5WOIun
SYHi9PWfeRv2e81seBsQXTtzLJKuE1NTRLqH0d7U8XuYJ+UNqQDb1HFMaMu1DzuOHBLRaH5y
mo0GUCGUjaf7lI3N3QnlbzImqgEBlZmn422MUVxM8YZG7OoFTNvQ0dj/Uxhns2ZCASDkXhcK
jAMA+OF3ShLypP1saf77orRM0AbKL3IpjBeSMHQ/Jy05UUldN4TPBXR4T5m1blVdV4ydZe7M
gkFz9+TLJ2X44URiTnQqBHGGR4iKBnuu1Dd7LS87FUgf1tZtDilSIY+4pt1jme7b0zBLNqnr
u2MKjuWUUzA58E7k6nonduaybaR4otu9rI2Y9WY380Yt0ICa6doR/CUceYSCh6an2cTcyzOg
DsqMDiO1t11Wa3ATrMGsvIX4Kji7qk7JAa4PV2sylaoRwpeP/iCyhfLevTPeLQuUmpvTiXpb
NbqC3fnvnzxKywafqMsLW5i8G06pNBKPImiXXW2axJr5+w5OOmg=

/
show errors


create or replace procedure sp_valida_insercion_blob_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
183 154
3SX2E5Vb9nmPxg4387OBNxj15/Qwg41K2SdqfI6imA2otQ5MitMYmMuOkTo8b304kTFMh45J
FOEkrOuL+Apvv7qjdVVHONx5IdZRKmdI6jSYryykkimfoyMkrjAEix1K/65GeBNX/MgpK5NR
o1jWMSAGdvLi5vPTgLLncKfPrvHGibgBKjo1FQY9EaFNOJS7ITxgnEDyklw0XC/5bXHfFvX5
w6yUDvK6bB5XbJaTV23sq9rFMDX3Cjl0hqM4HONdrdmfHrNIHqf5BruCh5w6NFOzeevd+UxL
UNiNDlaUneWThL6mTiQNhmiqX7ApVbIKjk3gtaW94fcX5g==

/
show errors


create or replace procedure sp_valida_registro_invalido wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1f7 1e6
ds/TqXmMwURw9QG+m989kfVNKmwwgy7Ir9wVZy9A7adGv3W6BRrxrBx0NrcB2rSNYbphOwbe
A6/lLlmojgAEGZeApZVoYo4AWcn5qp8bmn7FV5UOL+fXKz/l/vyT+kw6oyr4VWArMh5+kgDZ
oUPCZwg2KKJQyOP3WyZff/qFAEEAH1Q8u4ESgjQL9BzhtlPmo13nVkp/cKLqsFy2TnfhNVRA
8Rre2xb6iK4Unq8Cx62bc/2aA7oqQNhG5UiXVfnB/SInfQRrC3a0yYjd7riLZUBjsv1mRC6T
u9kjTD4WE3+0TNBAFYiSSEmuEUjZQNUYJqglVcYvto9C42bWaHeDC8eFp/NDNyLRN28wfRIb
8Eop/HXiEMSQs+8rfG2C+m16Yps3y4gtNqQSe5AZ4Q8wqhc9/VcZRJYsY2GxIPwM3g1c2j0l
ujydDLJkAb0c6YLmH2BwiTgeWJp58BSm37GN0RsfnTBi1lw=

/
show errors

create or replace procedure sp_valida_reg_invalido_main wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
7fb 426
6XwGjq7Pif2tioaSo9jRSlMoH54wgz3DTCCDfI5V1VrkWwwQ51rejTbTnlxjAcgyWc9iPhDw
WXyP0bT3t6BDmruD3hYPJwrtWYb7wLvwKMF2LBL8riOHqosSFi4VSXbrRMtEkwKJJqwH/VmI
qzYNJzuSL/lls9Ye/j9TvFzEdGoRaE3iMmEFegV5kM2DF5j/3v4Tv3gEseWNJ+ktKRkniWOi
kePCX4yTfMdzrzY9TiHGrJvI0fWiZ+bY79R4xzX1Rrd8r4jzXx7nqcVpIJd7r96SR0RWo/ER
8K8Cjco+dEF9GEtfiXMWB54HDJemeJpGiG/QFGpF29kRFdkffVE33cZuGk1I1uGk3oPF+h+Z
wl16tgYeb2StnRjOPQtR3sAjgARC01Rv01nreq8/t+DfYh9vQ20CgHLrj8QpmCRtSgF1PGNS
EN57hSGYYbMq4jhwnGl8SJBKOEwDx3kFK7ALtGKY3ntKiuyyzWBII2NLg5Jy2N+19D2LD5N5
/WOxl/yLLT1eqsDBmO8fPbav6uEgS2US+guXmkeHyCHTIfQWF0Rt8jhw7O5WrjIU1yXMzAIS
Z7C97amuKZ4ROv9EiqvdZq68JhyZf+3znmFf4z2fFxiMwwWFEb8u9rBFZJEcTX438vXKAyQp
12AZzhmkHL3X4+S159bUcY/mcBvK3qKFBA7yrN4j36a5yRwglSPZUTJBZkuwyJYxVDNcukkT
FAVATnVyHrKkDbpbdM22QF4gV33XQMb9CNTFY19JPkTEjASw9b0aPWfCWVpZjHrUqED1gJGo
hD9ng8waN+qw775bZaxWPw1hSapUHMZbjpC2GDfBKDTvP5u0oldrkxxO0vC54uqKoHtZpqIo
kw2UChtQJ+Fi635qnIHy4adE66WvpMuSSH1q13Zo+Le4fCuQoUwZUEXfMlv7GMoAZFv9VWa6
t+o6gPY77Q0HSUzmBJ4dayhn7KYJHCy9GsuyRWnztY5nDLEzrD6oMzREcvqZRvIp8Wv4iXz9
V42hIyhQOlYOjPaVvJ0HPBlrPeUZU6pOQyhkVQws

/
show errors

create or replace procedure sp_valida_inserciones_pais wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
450 284
L9GWzVnidZr5/h0dEiSGgR4FwxYwg9eJ1ydofC/GEjLKu3x4IJfffsQSWlqkyHl57+AMYGHr
jMx5Kudx3i2gN4k0XCxrlm8x3BWnb4MMDK/h1weLtRM1wK+TrOvsC0uYi9zS5bbwJSvLO2Wj
g8lJiUQJHCykLER4LhUno/s7TgRObbMfhihGksi1/GbplEDh99PyigNUHMd2AlqauVyWPO7T
8XRVXxzTB9lGsxhpWXP35+aJwWtkCAieTr6ihAm7JCRPw6zTF1cmcPEPNCL75tU5cle6/8BU
WUJy9K6UYHKOkH75n6AX9E+P1C9RKagGbR7qGl5dL/U8ZD44jmmnc/v/kk8GNq8gNxlzD04x
5Exuj5G8upH4wLcZDxU55dVZsKb+KVM16ff3NlxBmK9ugrwwA4c7/yvZfLZ8hUxko38PI3ln
oEi7mlCxu5oOKmrKukm8Ws1dWsoqV+uIme0PK60Bij6J0+ixi+T07TOBSI0y1jcSS+h4cGx1
rtxVPq0Esl7vKCiuoAPzI2uQ02/DwQJ6bQLcSmNuUlEs/hO4fiHdP6aR2sRu1EIxS0XF/Px3
ZBtOTqNGzI5M4ZiH4SSK/E6H0J3ha9pOC67Hk//CVmD6DZoSAm3q0Ic3lJA=

/
show errors


create or replace procedure sp_valida_inserciones_tipo_cuenta wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
586 2fa
7GQOuETpWNtHEO+bCusNZZnaTpswgz3DzCcFZy/NZB2+auT60eXMCf2eJh323lVW9w3g6sAk
lWAraqwKKiV7UPHZ0nQA5tE8k/rR36Ek8qhpyHAqIBcZEtbJCa+Eq0Os5phiHHdgZFxrHmEn
8nn85WLYGexRaFwNXN1dOjE6MXBcRnquZVqbQ24Y1R8T665WNecsp1rFZXCh1KgLPpYVbhuI
iByQmW86OFkrd9BNdEQMhNS2JF1lhpXxG2VJCOdLd3DpBm6X7nf+i6LCyDC8HzMJuUE/oEXD
pv7wwtp5jcFbhsoEMic5Qqv3Xxzr1hqI9W581hANDHIH7/vL43yL466gyrh/QVcgTyBNVz5t
3C+Qn9jjDKvrL0JxEkAggBC2y82j57xGOL+7uAig8R1FDMY4Uu4VAAiCc8tmodKsbR2bW++m
y89IGuqcSeIv9IadbxI6I+C1kx74tVoeXQ0NuVv0Yj+1vCxkOOExsi57Zy8b3jUlIWCyiAlv
w+fRQLvR1o+EjxItrOiDSGjjHK44eWeNnwf2i/jrrhYu68NjXA9SGtVJYeWv7A3eONYgCjvf
zQSRRFXmwnUtCi2K7Uh5C3yYOe1APs/WPH50oJR12gos9T3KJViqz2gKuyR6RzEnPeCrZVFh
bzyNCt7wXP2/QTD/zqngD7RRIDUhD5eswZPsFwvPbXVs9X3XyQP2j8Qi4x9xPzE9SBLlI3nc
ADM9RNCGrb0gCF+6y77iGeTh0gAX8w==

/
show errors


create or replace procedure sp_valida_inserciones_tipo_serie wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
4c0 2bd
0nQaWyHVdiaiEOjm+/K2XRVrAQ8wgzvDr0rrfC9Dg40zLIunjgJc3hJno8IJ7FPYDd7Trdyt
o2t/hQnjCrRMvaCqlUmlC1+30fWT0WdjVKtyRxJOySHcr5t1FJTvcDMGvEhcXpk9iDG7ibka
8yvNDd0K8WfZ2W3Zbfor20KNUoXl1xhL9sG6978hai8/IdW9hmeCQR2w6dGl8vS12Y4hvQYh
g/HKqAFHEfPrehPh5kkFFjtaKZbJN8a9C61OUMgQZBIge3dYw+nTUsDmdGzufFACuDbX7abc
TYSWWBLnEKoMtD7TMmfnbTFnXwjxGhRg0bETtcB7n6W0HuxD/aUHNMbbSVn/JF1uMDH2waTZ
+eJQ6VFWOrfcph8w4us1aCZlWUAWLrUJ1+RHJ/mA2QaKtzrqbNlOrkNT5fVzxxIZGd3TzmL6
QKZtEaGiw44+8O9K2OAWfZ3scskguIHrqyO+ID3iIlVO3ITtA1vPDg+dqtaQuRK+A4EXMZMp
RpfL2EigN2/QzCvex0RjRu4+uqJ2e5FzGl/NKlHaabL8ApZw9QqvWlAs2EXqwsZQUDpqasxz
MAgvoOoNNXanonk5qylaO2EyHopDpWBJNluEsYbn8T3ojkKVbRgP7vM+1+O7AjgwHTpMpopC
nCwokPi7d0yMTzNX8QN6LurMzwff+XxLd4FtLBCkVyA=

/
show errors



Prompt => Personalizando el formato de fechas
alter session set nls_date_format='yyyy-mm-dd hh24:mi:ss';

set feedback off
Prompt ======================================
Prompt Validando nombres de tablas
Prompt ======================================
exec sp_verifica_tablas 

Prompt ======================================
Prompt Validando inserciones 
Prompt ======================================
exec sp_valida_insercion_main('&&p_fragmento')

Prompt ======================================
Prompt Validando Registros con datos BLOB
Prompt ======================================
exec sp_valida_insercion_blob_main

Prompt ======================================
Prompt Validando registros con datos ivalidos
Prompt ======================================
exec sp_valida_reg_invalido_main

Prompt ======================================
Prompt Validando Replicacion de tablas
Prompt ======================================
exec sp_valida_inserciones_pais
exec sp_valida_inserciones_tipo_serie
exec sp_valida_inserciones_tipo_cuenta

host sha256sum s-08-netmax-presentacion-4.plb

set feedback on

Prompt Listo!
exit
