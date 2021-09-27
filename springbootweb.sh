#!/bin/bash

echo springbootweb shell start!

echo ==================chmod +x gradlew...=========================

chmod +x ./gradlew

echo ==================gradlew clean and build...=========================
./gradlew clean build

#도커 이미지 빌드
echo ==================docker springbootweb image is building=========================
docker build -f dockerfiles/Dockerfile_spring -t springbootweb ./

# 도커 명령어를 로그 파일에 저장
docker ps -a | grep springbootweb > docker_ps_log
# docker images -a | grep springbootweb > docker_images_log

echo $(ls -ls | grep docker_ps_log)


# -s : 파일의 크기가 0보다 크면 참
if [ -s docker_ps_log ]
then
	# echo ==================springbootweb container is running=========================
	# docker rm -f springbootweb
	# echo ==================springbootweb container is removed=========================
	
	for var in {0..1}
	do	
		echo ==================springbootweb_$var container is running=========================
		# 스프링부트 컨테이너 5초개 1개씩 제거 후 재실행 - 무중단 배포하기 위해
		docker rm -f springbootweb_$var
		echo ==================springbootweb_$var container is removed=========================

		docker run -itd -p 888$var:8080 --name springbootweb_$var -net mongo-networks springbootweb:latest
		echo ==================springbootweb_$var container is starting=========================

		sleep 10
	done
else
	echo ==================springbootweb container is not exist=========================

	docker run -itd -p 8880:8080 --name springbootweb_0 springbootweb:latest
	docker run -itd -p 8881:8080 --name springbootweb_1 springbootweb:latest
	# docker run -itd -p 8882:8080 --name springbootweb_2 springbootweb:latest

fi


# echo $(ls -ls | grep docker_images_log)

# if [ -s docker_images_log ]
# then
# 	echo ==================springbootweb image is existing=========================
# 	docker rmi springbootweb:latest
# 	echo ==================springbootweb image is removed=========================
# else
# 	echo ==================springbootweb image is not exist=========================
# fi


#도커 컨테이너 실행
# echo ==================docker springbootweb container is starting=========================
# docker run -itd -p 8888:8080 --name springbootweb springbootweb:latest

echo springbootweb shell end!!
