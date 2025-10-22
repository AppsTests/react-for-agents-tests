#!/bin/bash

# Быстрый скрипт для подключения к существующему GitHub репозиторию

echo "🔗 Подключение к существующему GitHub репозиторию"
echo "=============================================="

# Проверяем, что мы в правильной директории
if [ ! -f "package.json" ]; then
    echo "❌ Ошибка: package.json не найден. Запустите скрипт из корневой директории проекта."
    exit 1
fi

echo "✅ Находимся в правильной директории проекта"

# Запрашиваем URL репозитория
echo ""
echo "📝 Введите URL вашего GitHub репозитория:"
echo "   Пример: https://github.com/username/repository-name.git"
echo "   или: git@github.com:username/repository-name.git"
echo ""

read -p "URL репозитория: " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ URL репозитория не может быть пустым."
    exit 1
fi

echo ""
echo "🔧 Настройка Git репозитория..."

# Удаляем текущий remote origin
echo "   Удаляем текущий remote origin..."
git remote remove origin 2>/dev/null || echo "   Remote origin не найден (это нормально)"

# Добавляем новый remote
echo "   Добавляем новый remote: $REPO_URL"
git remote add origin "$REPO_URL"

# Переименовываем ветку в main
echo "   Переименовываем ветку в main..."
git branch -M main

echo ""
echo "📤 Выгрузка кода на GitHub..."

# Выгружаем код
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Код успешно выгружен на GitHub!"
    echo "🔗 Репозиторий: $REPO_URL"
    echo ""
    echo "🎉 Готово! Ваш проект с GPT чатом теперь доступен на GitHub."
else
    echo ""
    echo "❌ Ошибка при выгрузке кода."
    echo "   Проверьте:"
    echo "   - Правильность URL репозитория"
    echo "   - Что репозиторий существует на GitHub"
    echo "   - Настройки аутентификации Git"
    echo "   - Права доступа к репозиторию"
fi

echo ""
echo "📚 Дополнительная информация:"
echo "   - README: GPT_CHAT_README.md"
echo "   - Инструкции по развертыванию: DEPLOYMENT_GUIDE.md"
echo "   - Краткое описание изменений: CHANGES_SUMMARY.md"
