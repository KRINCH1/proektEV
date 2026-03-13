Write-Host "======================================" -ForegroundColor Cyan
Write-Host "   ЗАПУСК МИКРОСЕРВИСОВ" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

$basePath = "C:\Users\user\IdeaProjects\e-commerce-platform"

Write-Host "1. Запуск Service Registry (порт 8761)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\service-registry\target; java -jar *.jar"

Write-Host "2. Запуск User Service (порт 8081)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\user-service\target; java -jar *.jar"

Write-Host "3. Запуск Product Service (порт 8082)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\product-service\target; java -jar *.jar"

Write-Host "4. Запуск Order Service (порт 8083)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\order-service\target; java -jar *.jar"

Write-Host "5. Запуск Notification Service (порт 8084)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\notification-service\target; java -jar *.jar"

Write-Host "6. Запуск API Gateway (порт 8080)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $basePath\api-gateway\target; java -jar *.jar"

Write-Host ""
Write-Host "======================================" -ForegroundColor Green
Write-Host "✅ ВСЕ СЕРВИСЫ ЗАПУЩЕНЫ!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Eureka Dashboard: http://localhost:8761" -ForegroundColor Cyan
Write-Host "🚪 API Gateway: http://localhost:8080" -ForegroundColor Cyan
Write-Host "   User Service: http://localhost:8081/health" -ForegroundColor White
Write-Host "   Product Service: http://localhost:8082/health" -ForegroundColor White
Write-Host "   Order Service: http://localhost:8083/health" -ForegroundColor White
Write-Host "   Notification Service: http://localhost:8084/health" -ForegroundColor White
