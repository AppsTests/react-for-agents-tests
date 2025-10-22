#!/bin/bash

# Скрипт для запуска и тестирования GPT чата в React приложении

echo "🚀 Запуск React приложения с GPT чатом..."
echo "=================================="

# Проверяем наличие Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js не найден. Установите Node.js для продолжения."
    exit 1
fi

# Проверяем наличие npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm не найден. Установите npm для продолжения."
    exit 1
fi

# Переходим в директорию проекта
cd /home/administrator/WebstormProjects/app-example-react

echo "📁 Директория проекта: $(pwd)"

# Проверяем наличие package.json
if [ ! -f "package.json" ]; then
    echo "❌ package.json не найден в текущей директории."
    exit 1
fi

echo "✅ package.json найден"

# Устанавливаем зависимости (если нужно)
if [ ! -d "node_modules" ]; then
    echo "📦 Установка зависимостей..."
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ Ошибка при установке зависимостей."
        exit 1
    fi
    echo "✅ Зависимости установлены"
else
    echo "✅ Зависимости уже установлены"
fi

# Проверяем наличие компонентов чата
if [ ! -f "src/components/GPTChat.js" ]; then
    echo "❌ Компонент GPTChat.js не найден."
    exit 1
fi

if [ ! -f "src/components/ChatDemo.js" ]; then
    echo "❌ Компонент ChatDemo.js не найден."
    exit 1
fi

echo "✅ Компоненты чата найдены"

# Проверяем наличие скрипта в HTML
if ! grep -q "timeweb.cloud/api/v1/cloud-ai/agents" public/index.html; then
    echo "❌ Скрипт GPT чата не найден в public/index.html."
    exit 1
fi

echo "✅ Скрипт GPT чата найден в HTML"

# Запускаем приложение
echo "🌐 Запуск приложения..."
echo "=================================="
echo "Приложение будет доступно по адресу: http://localhost:3000"
echo "Для остановки нажмите Ctrl+C"
echo "=================================="

npm start
