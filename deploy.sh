#!/bin/bash

echo "########### Criando os arquivos de configuração dos nodes ################"

echo "########## NODE1 ###########"
cat > node1/cluster-config.conf <<EOF
port 7001
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
masterauth mudar@123
requirepass mudar@123
EOF


echo "########## NODE2 ###########"
cat > node2/cluster-config.conf <<EOF
port 7002
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
masterauth mudar@123
requirepass mudar@123
EOF

echo "########## NODE3 ###########"
cat > node3/cluster-config.conf <<EOF
port 7003
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
masterauth mudar@123
requirepass mudar@123
EOF

echo "########## NODE4 ###########"
cat > node4/cluster-config.conf <<EOF
port 7004
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
masterauth mudar@123
requirepass mudar@123
EOF

echo "########## NODE5 ###########"
cat > node5/cluster-config.conf <<EOF
port 7005
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
masterauth mudar@123
requirepass mudar@123
EOF

echo "########## NODE6 ###########"
cat > node6/cluster-config.conf <<EOF
port 7006
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
appendonly yes
masterauth mudar@123
requirepass mudar@123
EOF

echo " ############ Criando containers em cluster Primario e Secundário ############"
    docker-compose up -d

echo "########## Containers criados com sucesso ########"

echo "########## Listando IPs do Cluster ##########"
docker inspect -f '{{ (index .NetworkSettings.Networks "cluster-redis-ha_red_cluster").IPAddress }}' redis-1 redis-2 redis-3 redis-4 redis-5 redis-6 > ip.txt

Ip1=$(cat ip.txt | paste -s | awk '{print $1}')
Ip2=$(cat ip.txt | paste -s | awk '{print $2}')
Ip3=$(cat ip.txt | paste -s | awk '{print $3}')
Ip4=$(cat ip.txt | paste -s | awk '{print $4}')
Ip5=$(cat ip.txt | paste -s | awk '{print $5}')
Ip6=$(cat ip.txt | paste -s | awk '{print $6}')

echo "########## Iniciando o Cluster ########## "
echo 'yes' | docker run -i --rm --net cluster-redis-ha_red_cluster redis redis-cli -a mudar@123 --cluster create  $Ip1:7001 $Ip2:7002 $Ip3:7003 $Ip4:7004 $Ip5:7005 $Ip6:7006 --cluster-replicas 1 

echo "########## Exibindo CLuster ##########"
docker exec -it redis-1 redis-cli -a mudar@123 -p 7001 cluster nodes
echo "########## Operação executada com Sucesso ##########"