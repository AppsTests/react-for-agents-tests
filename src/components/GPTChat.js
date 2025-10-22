import React, { useEffect, useState } from 'react';
import './GPTChat.css';

const GPTChat = () => {
  const [isLoaded, setIsLoaded] = useState(false);
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    // Проверяем, загружен ли скрипт чата
    const checkScriptLoaded = () => {
      if (window.gptChatWidget) {
        setIsLoaded(true);
      } else {
        setTimeout(checkScriptLoaded, 100);
      }
    };

    // Запускаем проверку через небольшую задержку
    setTimeout(checkScriptLoaded, 500);
  }, []);

  const toggleChat = () => {
    setIsVisible(!isVisible);
    if (window.gptChatWidget) {
      if (isVisible) {
        window.gptChatWidget.hide();
      } else {
        window.gptChatWidget.show();
      }
    }
  };

  const openChat = () => {
    setIsVisible(true);
    if (window.gptChatWidget) {
      window.gptChatWidget.show();
    }
  };

  const closeChat = () => {
    setIsVisible(false);
    if (window.gptChatWidget) {
      window.gptChatWidget.hide();
    }
  };

  return (
    <div className="gpt-chat-container">
      {/* Кнопка для открытия чата */}
      <button 
        className={`gpt-chat-toggle ${isVisible ? 'active' : ''}`}
        onClick={toggleChat}
        disabled={!isLoaded}
        title={isLoaded ? 'Открыть чат GPT' : 'Загрузка чата...'}
      >
        <span className="chat-icon">💬</span>
        <span className="chat-text">GPT Чат</span>
      </button>

      {/* Индикатор состояния */}
      {!isLoaded && (
        <div className="chat-loading">
          <span>Загрузка чата...</span>
        </div>
      )}

      {/* Дополнительные кнопки управления */}
      {isLoaded && (
        <div className="chat-controls">
          <button 
            className="chat-control-btn open-btn"
            onClick={openChat}
            title="Открыть чат"
          >
            Открыть
          </button>
          <button 
            className="chat-control-btn close-btn"
            onClick={closeChat}
            title="Закрыть чат"
          >
            Закрыть
          </button>
        </div>
      )}
    </div>
  );
};

export default GPTChat;
