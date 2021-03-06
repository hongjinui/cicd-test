#!/bin/bash

echo @@@@@@@@@@@@@@@@@@@@@@@@@@@ springbootweb shell start @@@@@@@@@@@@@@@@@@@@@@@@@@@

echo ==================chmod +x gradlew...=========================
# 실행 권한 허가
chmod +x ./gradlew

echo ==================gradlew clean and build...=========================
./gradlew clean build

#도커 이미지 빌드
echo ==================docker springbootweb image is building=========================
docker build -f dockerfiles/Dockerfile_spring -t springbootweb ./

# 도커 명령어를 로그 파일에 저장
docker ps -a | grep springbootweb > docker_ps_log

echo $(ls -ls | grep docker_ps_log)

# -s : 파일의 크기가 0보다 크면 참
if [ -s docker_ps_log ]
then

	# for var in {0..2} - 서버 과부하로 스프링 컨테이너 3개에서 2개만 실행
	for var in {0..1} 
	do	
		echo ==================springbootweb_$var container is running=========================
		# 스프링부트 컨테이너 10초에 1개씩 제거 후 재실행 - 무중단 배포하기 위해
		docker rm -f springbootweb_$var	
		echo ==================springbootweb_$var container is removed=========================

		docker run -itd -p 888$var:8080 --name springbootweb_$var --net cicd-test_mongo-networks springbootweb:latest
		echo ==================springbootweb_$var container is starting=========================

		sleep 10
	done
else
	echo ==================springbootweb container is not exist=========================

	docker run -itd -p 8880:8080 --name springbootweb_0 --net cicd-test_mongo-networks springbootweb:latest
	docker run -itd -p 8881:8080 --name springbootweb_1 --net cicd-test_mongo-networks springbootweb:latest
	# docker run -itd -p 8882:8080 --name springbootweb_2 --net cicd-test_mongo-networks springbootweb:latest

fi

# 로그 파일 삭제
rm -f docker_ps_log

echo @@@@@@@@@@@@@@@@@@@@@@@@@@@ springbootweb shell end... @@@@@@@@@@@@@@@@@@@@@@@@@@@
