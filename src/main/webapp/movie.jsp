<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>영화관 홈페이지</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* 메인 컨테이너 폭 제한 */
.container {
	width: min(1200px, 92%);
	margin: 0 auto;
}
/* 섹션 기본 마진 */
section {
	margin: 40px 0 28px;
}
/* 섹션 헤더 스타일 */
.sec-head {
	display: flex;
	align-items: baseline;
	justify-content: space-between;
	margin-bottom: 14px;
}

.sec-title {
	font-size: 22px;
	font-weight: 800;
	color: #eee;
}
/* 전체 페이지 배경 및 폰트 */
body {
	background-color: #000;
	color: #eee;
	font-family: 'Noto Sans KR', sans-serif;
}
/* 영화 카드 그리드 레이아웃 */
.grid {
	display: grid;
	grid-template-columns: repeat(5, 1fr);
	gap: 18px;
}

@media ( max-width : 1100px) {
	.grid {
		grid-template-columns: repeat(4, 1fr);
	}
}

@media ( max-width : 900px) {
	.grid {
		grid-template-columns: repeat(3, 1fr);
	}
}

@media ( max-width : 640px) {
	.grid {
		grid-template-columns: repeat(2, 1fr);
	}
}
/* 카드 스타일 */
.card {
	background: #151822;
	border-radius: 12px;
	overflow: hidden;
	position: relative;
	color: #eee;
}

.poster {
	position: relative;
	aspect-ratio: 2/3;
	background: #0c0f15;
}

.poster img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}
/* 순위 뱃지 */
.rank-badge {
	position: absolute;
	left: 8px;
	top: 8px;
	background: gold;
	color: #111;
	border-radius: 8px;
	padding: 6px 10px;
	font-weight: 900;
	font-size: 14px;
}
/* 좋아요 버튼 */
.like-btn {
	position: absolute;
	right: 8px;
	top: 8px;
	background: rgba(0, 0, 0, .45);
	width: 36px;
	height: 36px;
	border-radius: 10px;
	display: grid;
	place-items: center;
	cursor: pointer;
	color: #fff;
}
/* 카드 본문 */
.card-body {
	padding: 12px;
}

.title {
	font-weight: 800;
	margin: 0 0 6px;
	font-size: 16px;
}

.meta {
	display: flex;
	gap: 8px;
	align-items: center;
	color: #a8b0c2;
	font-size: 13px;
}
/* 등급 칩 */
.chip {
	padding: 4px 8px;
	border-radius: 8px;
	font-size: 12px;
	background: #2a3144;
	color: #d5d9e3;
}

.chip.all {
	background: #1d2a22;
	color: #a8f0c8;
}
/* 카드 하단 */
.card-foot {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px;
}
/* 브랜드 버튼 */
.btn.brand {
	display: inline-block;
	padding: 8px 14px;
	border-radius: 8px;
	color: #fff;
	background: #ff2f6e;
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- 공통 헤더 include -->
	<jsp:include page="/header.jsp" />

	<main class="container">
		<!-- Bootstrap 캐러셀: 영화 슬라이드 -->
		<div id="movieCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<!-- 첫 번째 슬라이드 -->
				<div class="carousel-item active">
					<img
						src="https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?q=80&w=1600&auto=format&fit=crop"
						class="d-block w-100" alt="슬라이드1"
						style="max-height: 400px; object-fit: cover">
					<div class="carousel-caption d-none d-md-block">
						<h5>청춘은 누군가를 좋아하면서 시작된다</h5>
						<p>8월 27일 대개봉 · 전체관람가</p>
					</div>
				</div>
				<!-- 두 번째 슬라이드 -->
				<div class="carousel-item">
					<img
						src="https://images.unsplash.com/photo-1517602302552-471fe67acf66?q=80&w=1600&auto=format&fit=crop"
						class="d-block w-100" alt="슬라이드2"
						style="max-height: 400px; object-fit: cover">
				</div>
				<!-- 세 번째 슬라이드 -->
				<div class="carousel-item">
					<img src="/assets/banners/banner1.jpg" class="d-block w-100"
						alt="슬라이드3" style="max-height: 400px; object-fit: cover">
				</div>
			</div>
			<!-- 이전/다음 버튼 -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#movieCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#movieCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 현재 상영작 TOP 5 -->
		<section>
			<div class="sec-head">
				<div class="sec-title">
					인기 상영작 <span style="color: #ff2f6e">TOP 5</span>
				</div>
			</div>
			<!-- 영화 카드 목록 출력 영역 -->
			<div class="grid" id="movieGrid"></div>
		</section>
	</main>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // 영화 데이터 가져오기 (백엔드에서 /api/movies?limit=5 제공)
        // 아직 미완성
        fetch('<%= request.getContextPath() %>/api/movies?limit=5')
            .then(res => res.json())
            .then(json => {
                const movieGrid = document.getElementById('movieGrid');
                json.data.forEach((m, i) => {
                    // 카드 요소 생성
                    const card = document.createElement('article');
                    card.className = 'card';
                    card.innerHTML = `
                        <div class="poster">
                            <img src="https://picsum.photos/seed/now-${m.movie_no}/600/900" alt="${m.title}" />
                            <div class="rank-badge">${i + 1}</div>
                            <div class="like-btn" title="좋아요">♡</div>
                        </div>
                        <div class="card-body">
                            <h3 class="title">${m.title}</h3>
                            <div class="meta">
                                <span class="chip all">전체</span>
                                <span>⏱ ${m.movieTime}분</span>
                            </div>
                            <div class="card-foot">
                                <a class="btn brand" href="#">예매하기</a>
                            </div>
                        </div>
                    `;
                    // 그리드에 카드 추가
                    movieGrid.appendChild(card);
                });
            })
            .catch(err => console.error('영화 목록 로드 실패:', err));
    </script>
</body>
</html>
