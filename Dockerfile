# Java 17 베이스 이미지 사용
FROM --platform=linux/amd64 openjdk:17-jdk-alpine as builder

# 작업 디렉토리 설정
WORKDIR /app

# Gradle 빌드 파일, 소스 코드, gradlew 및 관련 파일 복사
COPY build.gradle .
COPY gradlew .
COPY gradle gradle
COPY src /app/src

# gradlew 파일에 실행 권한 부여
RUN chmod +x ./gradlew

# 애플리케이션 빌드
RUN ./gradlew build -x test

# 빌드된 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "/app/build/libs/app-0.0.1-SNAPSHOT.jar"]
