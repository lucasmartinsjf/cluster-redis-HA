#!/bin/bash
Secret_Redis=mudar@123

echo "########## NODE1 ###########"
docker exec redis-1 redis-cli -c -a $Secret_Redis -p 7001 CONFIG SET requirepass $Secret_Redis
docker exec redis-1 redis-cli -c -a $Secret_Redis -p 7001 CONFIG SET masterauth $Secret_Redis
echo "########## NODE2 ###########"
docker exec redis-2 redis-cli -c -a $Secret_Redis -p 7002 CONFIG SET requirepass $Secret_Redis
docker exec redis-2 redis-cli -c -a $Secret_Redis -p 7002 CONFIG SET masterauth $Secret_Redis
echo "########## NODE3 ###########"
docker exec redis-3 redis-cli -c -a $Secret_Redis -p 7003 CONFIG SET requirepass $Secret_Redis
docker exec redis-3 redis-cli -c -a $Secret_Redis -p 7003 CONFIG SET masterauth $Secret_Redis
echo "########## NODE4 ###########"
docker exec redis-4 redis-cli -c -a $Secret_Redis -p 7004 CONFIG SET requirepass $Secret_Redis
docker exec redis-4 redis-cli -c -a $Secret_Redis -p 7004 CONFIG SET masterauth $Secret_Redis
echo "########## NODE5 ###########"
docker exec redis-5 redis-cli -c -a $Secret_Redis -p 7005 CONFIG SET requirepass $Secret_Redis
docker exec redis-5 redis-cli -c -a $Secret_Redis -p 7005 CONFIG SET masterauth $Secret_Redis
echo "########## NODE6 ###########"
docker exec redis-6 redis-cli -c -a $Secret_Redis -p 7006 CONFIG SET requirepass $Secret_Redis
docker exec redis-6 redis-cli -c -a $Secret_Redis -p 7006 CONFIG SET masterauth $Secret_Redis