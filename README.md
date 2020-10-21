# Cluster-redis-HA - Sem Sentinel
     # Componentes:
        - 6 containers com redis sendo 3 primarios e 3 secundários
        - 1 container com HAProxy

 # Requerimentos: 
    - Docker 
    - Docker Compose 
    - Redis-cli (Opcional)
 
 
 ## Para iniciar o processo siga os passos:
    - colocar script deploy.sh como executavel, ou seja chmod+x deploy.sh 
    - executar em seguida o arquivo ./deploy.sh ou sh deploy.sh 
    

# Objetivo
     - Conseguir Além de failover, obter dinamismo na requisição pois o HA irá trabalhar em alternancia entre os containers primarios
    -  Gerar escalabilidade entre os containers para trabalhar as requisições. 

# Ideias de Melhorias 
    - Usar o cluster em mais de um servidor , como cluster único
    - Poder utilizar técnicas blue e Green para possiveis manutenções sem interrupções


