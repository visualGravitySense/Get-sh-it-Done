import React from 'react';

function Home() {
  return (
    <div>
      <section className="hero">
        <h1>Добро пожаловать в онлайн-школу!</h1>
        <p>Изучай новые навыки с лучшими преподавателями.</p>
      </section>
      <section className="courses">
        <h2>Популярные курсы</h2>
        {/* Здесь будет список популярных курсов */}
      </section>
      <section className="testimonials">
        <h2>Отзывы студентов</h2>
        {/* Здесь будут отзывы */}
      </section>
    </div>
  );
}

export default Home;
