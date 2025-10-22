#!/bin/bash

# Скрипт для настройки нового GitHub репозитория

echo "🚀 Настройка нового GitHub репозитория для app-example-react-gpt-chat"
echo "=================================================================="

# Проверяем, что мы в правильной директории
if [ ! -f "package.json" ]; then
    echo "❌ Ошибка: package.json не найден. Запустите скрипт из корневой директории проекта."
    exit 1
fi

echo "✅ Находимся в правильной директории проекта"

# Проверяем статус Git
if ! git status &> /dev/null; then
    echo "❌ Ошибка: Git репозиторий не инициализирован."
    exit 1
fi

echo "✅ Git репозиторий найден"

# Запрашиваем информацию у пользователя
echo ""
echo "📝 Введите данные для создания нового репозитория:"
echo ""

read -p "GitHub username: " GITHUB_USERNAME
read -p "Название репозитория (по умолчанию: app-example-react-gpt-chat): " REPO_NAME
read -p "Описание репозитория (по умолчанию: React app with GPT chat): " REPO_DESCRIPTION

# Устанавливаем значения по умолчанию
REPO_NAME=${REPO_NAME:-app-example-react-gpt-chat}
REPO_DESCRIPTION=${REPO_DESCRIPTION:-"React app with GPT chat"}

echo ""
echo "📋 Параметры репозитория:"
echo "   Username: $GITHUB_USERNAME"
echo "   Repository: $REPO_NAME"
echo "   Description: $REPO_DESCRIPTION"
echo ""

read -p "Продолжить? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "❌ Операция отменена."
    exit 1
fi

echo ""
echo "🔧 Настройка Git репозитория..."

# Удаляем текущий remote origin
echo "   Удаляем текущий remote origin..."
git remote remove origin 2>/dev/null || echo "   Remote origin не найден (это нормально)"

# Добавляем новый remote
echo "   Добавляем новый remote..."
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Переименовываем ветку в main
echo "   Переименовываем ветку в main..."
git branch -M main

echo ""
echo "🌐 Создание репозитория на GitHub..."
echo ""

# Создаем репозиторий через GitHub CLI (если установлен)
if command -v gh &> /dev/null; then
    echo "   Используем GitHub CLI для создания репозитория..."
    gh repo create "$REPO_NAME" --public --description "$REPO_DESCRIPTION" --source=. --remote=origin --push
    if [ $? -eq 0 ]; then
        echo "✅ Репозиторий успешно создан и код выгружен!"
        echo "🔗 Ссылка: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
        exit 0
    else
        echo "❌ Ошибка при создании репозитория через GitHub CLI"
        echo "   Попробуйте создать репозиторий вручную на GitHub.com"
    fi
else
    echo "   GitHub CLI не установлен. Создайте репозиторий вручную:"
    echo "   1. Откройте https://github.com/new"
    echo "   2. Название: $REPO_NAME"
    echo "   3. Описание: $REPO_DESCRIPTION"
    echo "   4. НЕ добавляйте README, .gitignore или лицензию"
    echo "   5. Нажмите 'Create repository'"
    echo ""
    read -p "   Нажмите Enter после создания репозитория..."
fi

echo ""
echo "📤 Выгрузка кода на GitHub..."

# Выгружаем код
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Код успешно выгружен на GitHub!"
    echo "🔗 Ссылка на репозиторий: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "🎉 Готово! Ваш проект с GPT чатом теперь доступен на GitHub."
else
    echo ""
    echo "❌ Ошибка при выгрузке кода."
    echo "   Проверьте:"
    echo "   - Правильность username и названия репозитория"
    echo "   - Что репозиторий создан на GitHub"
    echo "   - Настройки аутентификации Git"
fi

echo ""
echo "📚 Дополнительная информация:"
echo "   - README: GPT_CHAT_README.md"
echo "   - Инструкции по развертыванию: DEPLOYMENT_GUIDE.md"
echo "   - Краткое описание изменений: CHANGES_SUMMARY.md"
