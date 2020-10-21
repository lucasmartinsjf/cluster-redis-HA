import os

comando = "docker inspect -f '{{ (index .NetworkSettings.Networks "'"red_cluster"'").IPAddress }}' redis-1 redis-2 redis-3 redis-4 redis-5 redis-6"

texto = os.popen(comando).read()

lista_ips = texto.split()

primeira_parte_comando = "docker run -i --rm --net red_cluster redis redis-cli --cluster create "
ultima_parte_comando = "--cluster-replicas 1"

parte_meio_comando = ""


for i in range(0, len(lista_ips)):
    if i < 10:
        parte_meio_comando += lista_ips[i] + ":700" +str(i+1) + " "
    else:
        parte_meio_comando += lista_ips[i] + ":70" +str(i+1) + " "
        
comando_docker = primeira_parte_comando + parte_meio_comando + ultima_parte_comando

os.system(comando_docker)