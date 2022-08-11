#!/bin/bash

declare -A users
users=([adm]="carlos maria joao" [ven]="debora sebastiana roberto" [sec]="josefina amanda rogerio")

for item in adm ven sec; do
  echo "-------------------------------- ${item} --------------------------------"
  gName=GRP_${item^^}
  groupadd ${gName} && echo "Adiciondo O grupo ${gName}"
  mkdir "/${item}" && echo "Criada a pasta /${item}"
  chown root:${gName} /${item} && echo  "A pasta /${item} foi modificada para root:${gName}"
  chmod 770 /${item} && echo "A permissão da pasta /${item} foi mudada para 770"
  for user in $(echo ${users[$(echo $item)]}); do
    useradd ${user} -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G ${gName} && echo "Criado o usuário $user"
  done
done

mkdir /public && echo "Criada a pasta /public"
chmod 777 /public && echo "A permissão da pasta /public foi mudada para 777"
