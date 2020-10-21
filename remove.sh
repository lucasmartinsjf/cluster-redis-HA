#!/bin/bash
echo "Parando todos os conteiners"
docker stop $(docker ps -a -q)
echo "Removendo todos os conteiners"
docker rm $(docker ps -a -q)
echo "Removendo todas as imagens"
docker rmi $(docker images -q)
echo "Removendo todos os volumes"
docker system prune --volumes
echo "Concluindo remoção de tudo, Volumes, networks, imagens e conteiners e Limpando a base. "
docker system prune -a
echo "Operação concluida com sucesso"
