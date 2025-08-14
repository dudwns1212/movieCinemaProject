<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>영화 예매 - 메인</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
  <script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>
  <style>
    :root {
      --bg: #0f1014;
      --panel: #151822;
      --text: #e9ecf1;
      --muted: #a8b0c2;
      --brand: #ff2f6e;
      --chip: #2a3144;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: 'Noto Sans KR', sans-serif;
      background: linear-gradient(180deg, #0d0f13 0%, #0f1014 100%);
      color: var(--text);
    }
    .container { width: min(1240px, 92%); margin: 0 auto; }
    .hero { position: relative; margin-top: 16px; border-radius: 20px; overflow: hidden; }
    .slides { position: relative; aspect-ratio: 16/6; }
    .slide { position: absolute; inset: 0; opacity: 0; transition: opacity .5s ease; background-size: cover; background-position: center; }
    .slide.active { opacity: 1; }
    .hero-content { position: absolute; inset: 0; display: grid; place-items: center; pointer-events: none; }
    .hero-title { font-size: clamp(28px, 4.3vw, 52px); font-weight: 900; }
    .hero-sub { color: var(--muted); margin-bottom: 18px; }
    .hero-ctrl { position: absolute; inset: 0; display: flex; align-items: center; justify-content: space-between; padding: 0 10px; }
    .ctrl { width: 40px; height: 40px; border-radius: 50%; display: grid; place-items: center; cursor: pointer; background: rgba(0,0,0,.35); }
    section { margin: 40px 0 28px; }
    .sec-head { display: flex; align-items: baseline; justify-content: space-between; margin-bottom: 14px; }
    .sec-title { font-size: 22px; font-weight: 800; }
    .grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 18px; }
    .card { background: var(--panel); border-radius: 16px; overflow: hidden; position: relative; }
    .poster { position: relative; aspect-ratio: 2/3; background: #0c0f15; }
    .poster img { width: 100%; height: 100%; object-fit: cover; }
    .rank-badge { position: absolute; left: 8px; top: 8px; background: gold; color: #111; border-radius: 10px; padding: 6px 10px; font-weight: 900; font-size: 14px; }
    .like-btn { position: absolute; right: 8px; top: 8px; background: rgba(0,0,0,.45); width: 36px; height: 36px; border-radius: 10px; display: grid; place-items: center; cursor: pointer; }
    .card-body { padding: 12px; }
    .title { font-weight: 800; margin: 0 0 6px; font-size: 16px; }
    .meta { display: flex; gap: 8px; align-items: center; color: var(--muted); font-size: 13px; }
    .chip { padding: 4px 8px; border-radius: 8px; font-size: 12px; background: var(--chip); }
    .chip.all { background: #1d2a22; color: #a8f0c8; }
    .card-foot { display: flex; align-items: center; justify-content: space-between; margin-top: 10px; }
  </style>
</head>
<body>
  <main id="app" class="container" v-cloak>
    <section class="hero">
      <div class="slides">
        <div v-for="(s, idx) in slides" :key="idx" class="slide" :class="{active: currentSlide === idx}" :style="{ backgroundImage: `url(${s.img})` }"></div>
      </div>
      <div class="hero-content">
        <div>
          <h1 class="hero-title">청춘은 누군가를 좋아하면서 시작된다</h1>
          <p class="hero-sub">8월 27일 대개봉 · 전체관람가</p>
        </div>
      </div>
      <div class="hero-ctrl">
        <div class="ctrl" @click="prevSlide">◀</div>
        <div class="ctrl" @click="nextSlide">▶</div>
      </div>
    </section>
    <section>
      <div class="sec-head">
        <div>
          <div class="sec-title">현재 상영작 <span style="color:var(--brand)">TOP 5</span></div>
        </div>
      </div>
      <div class="grid">
        <article class="card" v-for="(m, i) in nowMovies" :key="m.id">
          <div class="poster">
            <img :src="m.poster" :alt="m.title" />
            <div class="rank-badge">{{ i+1 }}</div>
            <div class="like-btn" @click="toggleLike(m)">{{ m.liked ? '♥' : '♡' }}</div>
          </div>
          <div class="card-body">
            <h3 class="title">{{ m.title }}</h3>
            <div class="meta">
              <span class="chip all">전체</span>
              <span>⏱ {{ m.runtime }}분</span>
            </div>
            <div class="card-foot">
              <a class="btn brand" href="#">예매하기</a>
              <span style="color:var(--muted)">예매율 {{ m.reserveRate }}%</span>
            </div>
          </div>
        </article>
      </div>
    </section>
  </main>
  <script>
    const { createApp } = Vue;
    createApp({
      data() {
        return {
          slides: [
            { img: 'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?q=80&w=1600&auto=format&fit=crop' },
            { img: 'https://images.unsplash.com/photo-1517602302552-471fe67acf66?q=80&w=1600&auto=format&fit=crop' },
            { img: 'https://images.unsplash.com/photo-1518131678677-a08d711d3209?q=80&w=1600&auto=format&fit=crop' },
          ],
          currentSlide: 0,
          slideTimer: null,
          nowMovies: []
        }
      },
      mounted() {
        this.slideTimer = setInterval(this.nextSlide, 4000);
        this.fetchNowMovies();
      },
      beforeUnmount() {
        clearInterval(this.slideTimer);
      },
      methods: {
        nextSlide() { this.currentSlide = (this.currentSlide + 1) % this.slides.length; },
        prevSlide() { this.currentSlide = (this.currentSlide - 1 + this.slides.length) % this.slides.length; },
        toggleLike(movie) { movie.liked = !movie.liked },
        async fetchNowMovies() {
          const res = await fetch('/api/movies?limit=5');
          const json = await res.json();
          this.nowMovies = json.data.map((m, i) => ({
            id: m.movie_no,
            title: m.title,
            runtime: m.movieTime,
            reserveRate: (15 + i * 2.1).toFixed(1),
            liked: false,
            poster: `https://picsum.photos/seed/now-${m.movie_no}/600/900`
          }));
        }
      }
    }).mount('#app');
  </script>
</body>
</html>
