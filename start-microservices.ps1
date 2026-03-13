Write-Host "======================================" -ForegroundColor Cyan
Write-Host "   ЗАПУСК ВСЕХ МИКРОСЕРВИСОВ" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

# Функция для запуска сервиса в новом окне
function Start-ServiceInNewWindow {
    param($name, $port, $path)
    Write-Host "▶ Запуск $name на порту $port..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $path; java -jar *.jar"
    Start-Sleep -Seconds 2
}

Write-Host ""
Write-Host "1. Запуск Config Server (порт 8888)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "Config Server" -port "8888" -path "C:\Users\user\IdeaProjects\e-commerce-platform\config-server\target"

Write-Host "2. Запуск Service Registry (порт 8761)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "Service Registry" -port "8761" -path "C:\Users\user\IdeaProjects\e-commerce-platform\service-registry\target"

Start-Sleep -Seconds 10

Write-Host "3. Запуск API Gateway (порт 8080)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "API Gateway" -port "8080" -path "C:\Users\user\IdeaProjects\e-commerce-platform\api-gateway\target"

Write-Host "4. Запуск User Service (порт 8081)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "User Service" -port "8081" -path "C:\Users\user\IdeaProjects\e-commerce-platform\user-service\target"

Write-Host "5. Запуск Product Service (порт 8082)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "Product Service" -port "8082" -path "C:\Users\user\IdeaProjects\e-commerce-platform\product-service\target"

Write-Host "6. Запуск Order Service (порт 8083)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "Order Service" -port "8083" -path "C:\Users\user\IdeaProjects\e-commerce-platform\order-service\target"

Write-Host "7. Запуск Notification Service (порт 8084)..." -ForegroundColor Green
Start-ServiceInNewWindow -name "Notification Service" -port "8084" -path "C:\Users\user\IdeaProjects\e-commerce-platform\notification-service\target"

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "✅ ВСЕ СЕРВИСЫ ЗАПУЩЕНЫ!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📊 Eureka Dashboard: http://localhost:8761" -ForegroundColor Cyan
Write-Host "🚪 API Gateway: http://localhost:8080" -ForegroundColor Cyan
Write-Host "🩺 Health проверки:" -ForegroundColor Yellow
Write-Host "   User Service: http://localhost:8081/health" -ForegroundColor White
Write-Host "   Product Service: http://localhost:8082/health" -ForegroundColor White
Write-Host "   Order Service: http://localhost:8083/health" -ForegroundColor White
Write-Host "   Notification Service: http://localhost:8084/health" -ForegroundColor White