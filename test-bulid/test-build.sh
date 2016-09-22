#!/bin/sh
cd ${WORKSPACE}/src
docker build -t 192.168.5.34:80/python-redis-demo:${BUILD_NUMBER} .
docker push 192.168.5.34:80/python-redis-demo:${BUILD_NUMBER}
cd ${WORKSPACE}/test-build
sed -i 's/\$\$BUILD_NUMBER\$\$/'${BUILD_NUMBER}'/g' docker-compose.yml
sed -i 's/\$\$PORT_NUMBER\$\$/'`expr 5000 + ${BUILD_NUMBER}`'/g' docker-compose.yml
chmod777 ./rancher-compose
./rancher-compose --access-key 7798EBA1969968CA8C3E  --secret-key Nhb2cFM7USih8Ssu7TosyH9izzWQ686diki17wDm -p python-redis-demo-build${BUILD_NUMBER} up -d
