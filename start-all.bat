@echo off
echo Starting Eureka Service Registry...
start "Eureka Server" cmd /c "cd /d C:\Users\user\IdeaProjects\e-commerce-platform\service-registry\target && java -jar service-registry-1.0.0.jar"

timeout /t 10 /nobreak

echo Starting User Service...
start "User Service" cmd /c "cd /d C:\Users\user\IdeaProjects\e-commerce-platform\user-service\target && java -jar user-service-1.0.0.jar"

echo All services started!
echo Eureka Dashboard: http://localhost:8761
echo User Service: http://localhost:8081/health