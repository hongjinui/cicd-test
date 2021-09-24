#!/bin/bash

echo springbootweb shell start!

echo ==================chmod +x gradlew...=========================

chmod +x ./gradlew

echo ==================gradlew clean and build...=========================
./gradlew clean build

# 도커 명령어를 로그 파일에 저장
docker ps -a | grep springbootweb > docker_ps_log
docker images -a | grep springbootweb > docker_images_log

echo $(ls -ls | grep docker_ps_log)


# -s : 파일의 크기가 0보다 크면 참
if [ -s docker_ps_log ]
then
	echo ==================springbootweb container is running=========================
	docker rm -f springbootweb
	echo ==================springbootweb container is removed=========================
else
	echo ==================springbootweb container is not exist=========================
fi


echo $(ls -ls | grep docker_images_log)

if [ -s docker_images_log ]
then
	echo ==================springbootweb image is existing=========================
	docker rmi springbootweb:latest
	echo ==================springbootweb image is removed=========================
else
	echo ==================springbootweb image is not exist=========================
fi

#도커 이미지 빌드
echo ==================docker springbootweb image is building=========================
docker build -f ./Dockerfile_spring -t springbootweb ./

#도커 컨테이너 실행
echo ==================docker springbootweb container is starting=========================
docker run -itd -p 8888:8080 --name springbootweb springbootweb:latest

echo springbootweb shell end!!
