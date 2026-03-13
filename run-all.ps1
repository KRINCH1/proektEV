Write-Host "======================================" -ForegroundColor Cyan
Write-Host "   ЗАПУСК МИКРОСЕРВИСОВ" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

$basePath = "C:\Users\user\IdeaProjects\e-commerce-platform"

Write-Host "1. Service Registry (порт 8761)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\service-registry\target; java -jar service-registry-1.0.0.jar"

Start-Sleep -Seconds 5

Write-Host "2. User Service (порт 8081)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\user-service\target; java -jar user-service-1.0.0.jar"

Write-Host "3. Product Service (порт 8082)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\product-service\target; java -jar product-service-1.0.0.jar"

Write-Host "4. Order Service (порт 8083)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\order-service\target; java -jar order-service-1.0.0.jar"

Write-Host "5. Notification Service (порт 8084)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\notification-service\target; java -jar notification-service-1.0.0.jar"

Write-Host "6. API Gateway (порт 8080)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\api-gateway\target; java -jar api-gateway-1.0.0.jar"

Write-Host ""
Write-Host "✅ Все сервисы запущены!" -ForegroundColor Green
