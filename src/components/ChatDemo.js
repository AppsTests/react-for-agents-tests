import React, { useState } from 'react';
import './ChatDemo.css';

const ChatDemo = () => {
  const [isExpanded, setIsExpanded] = useState(false);

  const handleOpenChat = () => {
    // Попытка открыть чат через глобальный объект
    if (window.gptChatWidget) {
      window.gptChatWidget.show();
    } else {
      console.log('GPT Chat widget not loaded yet');
    }
  };

  const handleSendMessage = () => {
    // Попытка отправить сообщение в чат
    if (window.gptChatWidget && window.gptChatWidget.sendMessage) {
      window.gptChatWidget.sendMessage('Привет! Как дела?');
    } else {
      console.log('GPT Chat widget methods not available');
    }
  };

  return (
    <div className="chat-demo">
      <div className="demo-header">
        <h3>GPT Чат Демо</h3>
        <button 
          className="expand-btn"
          onClick={() => setIsExpanded(!isExpanded)}
        >
          {isExpanded ? 'Свернуть' : 'Развернуть'}
        </button>
      </div>
      
      {isExpanded && (
        <div className="demo-content">
          <p>Это демонстрация интеграции GPT чата в React приложение.</p>
          
          <div className="demo-controls">
            <button 
              className="demo-btn primary"
              onClick={handleOpenChat}
            >
              Открыть чат
            </button>
            
            <button 
              className="demo-btn secondary"
              onClick={handleSendMessage}
            >
              Отправить тестовое сообщение
            </button>
          </div>
          
          <div className="demo-info">
            <h4>Возможности:</h4>
            <ul>
              <li>✅ Асинхронная загрузка скрипта чата</li>
              <li>✅ Управление видимостью чата</li>
              <li>✅ Адаптивный дизайн</li>
              <li>✅ Индикатор состояния загрузки</li>
              <li>✅ Кнопки управления</li>
            </ul>
          </div>
          
          <div className="demo-status">
            <h4>Статус:</h4>
            <p>
              Чат виджет: {window.gptChatWidget ? '✅ Загружен' : '⏳ Загружается...'}
            </p>
          </div>
        </div>
      )}
    </div>
  );
};

export default ChatDemo;
