![React Logo](https://st.timeweb.com/cloud-static/apps-logo/react.svg)

# React with GPT Chat Integration

Пример приложения [React](https://react.dev/) с интегрированным GPT чатом, которое можно развернуть в **Timeweb Cloud Apps** без настройки.

:tada: [Демо](https://timeweb-cloud-app-example-react-65cc.twc1.net)

:rocket: [Создать свой Apps](https://timeweb.cloud/my/apps/create)

:books: [Документация Timeweb Cloud Apps](https://timeweb.cloud/docs/apps)

## 🤖 GPT Chat Integration

Этот проект включает в себя интеграцию GPT чата Timeweb Cloud с современным React интерфейсом.

### Возможности:
- ✅ Асинхронная загрузка GPT чата
- ✅ Современный адаптивный дизайн
- ✅ Управление видимостью чата
- ✅ Демо интерфейс для тестирования
- ✅ Полная документация

### Документация:
- 📚 [GPT Chat README](GPT_CHAT_README.md) - Подробная документация
- 🚀 [Deployment Guide](DEPLOYMENT_GUIDE.md) - Инструкции по развертыванию

## <a name="dev"></a>Локальный запуск проекта

```bash
# установка зависимостей
npm install

# запуск в дев режиме с отслеживанием изменений
npm run start

# сборка для продакшн с минификацией
npm run build

# запуск с GPT чатом
./start-gpt-chat.sh
```

## 🚀 Быстрый старт

```bash
# Клонируйте репозиторий
git clone https://github.com/AppsTests/react-for-agents-tests.git

# Перейдите в директорию
cd react-for-agents-tests

# Установите зависимости
npm install

# Запустите приложение
npm start
```

## 📁 Структура проекта

```
src/
├── components/
│   ├── GPTChat.js          # Основной компонент чата
│   ├── GPTChat.css         # Стили чата
│   ├── ChatDemo.js         # Демо компонент
│   └── ChatDemo.css        # Стили демо
└── App.js                  # Главный компонент

public/
└── index.html              # HTML с встроенным GPT чатом
```
