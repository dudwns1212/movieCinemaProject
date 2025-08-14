<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>영화관 홈페이지</title>
<style>
/* 기본 바디 스타일 */
body {
	margin: 0;
	background-color: #000; /* 검은 배경 */
	color: #eee; /* 연한 글씨 색 */
	font-family: 'Noto Sans KR', sans-serif;
}

/* --- 캐러셀 영역 스타일 --- */
main {
	max-width: 1200px;
	margin: 0 auto 60px; /* 하단 마진 */
}

.carousel {
	position: relative;
	width: 100%;
	overflow: hidden; /* 넘치는 부분 숨김 */
	border-radius: 10px; /* 둥근 모서리 */
}

.carousel-track {
	display: flex; /* 슬라이드를 가로로 나열 */
	transition: transform 0.5s ease; /* 부드러운 이동 효과 */
}

.carousel-slide {
	min-width: 100%; /* 한 화면에 한 슬라이드 */
	position: relative;
	flex-shrink: 0; /* 슬라이드 압축 방지 */
}

.carousel-slide img {
	width: 100%; /* 슬라이드 이미지 전체 넓이 */
	display: block;
	border-radius: 10px;
	height: 500px; /* 고정 높이 */
	object-fit: cover; /* 이미지 비율 유지 */
}

/* 슬라이드 내 텍스트 박스 */
.carousel-caption {
	position: absolute;
	bottom: 30px;
	left: 30px;
	color: #fff;
	background: rgba(0, 0, 0, 0.6); /* 반투명 검정 배경 */
	padding: 10px 20px;
	border-radius: 5px;
	max-width: 70%;
}

/* 이전/다음 버튼 공통 스타일 */
.carousel-button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background: rgba(0, 0, 0, 0.6); /* 진한 검정, 약간 투명 */
	border: none;
	color: #fff; /* 흰색 글씨 */
	font-size: 2.2rem; /* 약간 크게 */
	padding: 8px 18px; /* 약간 더 넉넉하게 */
	cursor: pointer;
	border-radius: 8px; /* 둥글게 */
	user-select: none; /* 텍스트 선택 방지 */
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5); /* 은은한 그림자 */
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
	z-index: 10; /* 다른 요소보다 위에 */
}

.carousel-button:hover, .carousel-button:focus {
	background: rgba(255, 255, 255, 0.15); /* 하이라이트 */
	box-shadow: 0 4px 12px rgba(255, 255, 255, 0.3); /* 화사한 그림자 */
	outline: none;
}

/* 왼쪽 이전 버튼 위치 */
.carousel-button.prev {
	left: 10px;
}
/* 오른쪽 다음 버튼 위치 */
.carousel-button.next {
	right: 10px;
}

/* 캐러셀 인디케이터 (점) */
.carousel-indicators {
	position: absolute;
	bottom: 15px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	gap: 8px;
	z-index: 10;
}

.indicator {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.5);
	cursor: pointer;
	transition: background 0.3s ease;
}

.indicator.active {
	background: rgba(255, 255, 255, 0.9);
}
</style>
</head>
<body>

	<!-- 헤더 include -->
	<%@ include file="header.jsp" %>

	<main>
		<!-- 캐러셀 메인 컨테이너 -->
		<div class="carousel" aria-label="영화관 주요 홍보 캐러셀">
			<!-- 이전 슬라이드 버튼 -->
			<button class="carousel-button prev" aria-label="이전 슬라이드">&#10094;</button>

			<!-- 슬라이드 트랙: 슬라이드들이 가로로 나열됨 -->
			<div class="carousel-track">
				<!-- 개별 슬라이드 -->
				<div class="carousel-slide">
					<img src="https://picsum.photos/id/1015/1200/500" alt="영화 1 이미지">
					<div class="carousel-caption">
						<h3>올드보이</h3>
						<p>복수를 위해 15년을 기다린 남자의 이야기</p>
					</div>
				</div>
				<div class="carousel-slide">
					<img src="https://picsum.photos/id/1016/1200/500" alt="영화 2 이미지">
					<div class="carousel-caption">
						<h3>신세계</h3>
						<p>조직의 운명을 바꿀 마지막 선택</p>
					</div>
				</div>
				<div class="carousel-slide">
					<img src="https://picsum.photos/id/1018/1200/500" alt="영화 3 이미지">
					<div class="carousel-caption">
						<h3>위대한 쇼맨</h3>
						<p>모든 것을 바꾼 위대한 쇼의 시작</p>
					</div>
				</div>
				<div class="carousel-slide">
					<img src="https://picsum.photos/id/1019/1200/500" alt="영화 4 이미지">
					<div class="carousel-caption">
						<h3>부산행</h3>
						<p>절체절명의 상황, 살아남기 위한 여행</p>
					</div>
				</div>
			</div>

			<!-- 다음 슬라이드 버튼 -->
			<button class="carousel-button next" aria-label="다음 슬라이드">&#10095;</button>
			
			<!-- 인디케이터 -->
			<div class="carousel-indicators">
				<div class="indicator active" data-slide="0"></div>
				<div class="indicator" data-slide="1"></div>
				<div class="indicator" data-slide="2"></div>
				<div class="indicator" data-slide="3"></div>
			</div>
		</div>
	</main>

	<script>
	// 캐러셀 동작 관련 JS
	document.addEventListener('DOMContentLoaded', function() {
		// 슬라이드 트랙 컨테이너 선택
		const track = document.querySelector('.carousel-track');
		// 슬라이드들 배열로 저장
		const slides = Array.from(track.children);
		// 이전/다음 버튼 선택
		const prevBtn = document.querySelector('.carousel-button.prev');
		const nextBtn = document.querySelector('.carousel-button.next');
		// 인디케이터들 선택
		const indicators = Array.from(document.querySelectorAll('.indicator'));

		let currentIndex = 0; // 현재 슬라이드 인덱스
		let autoSlideInterval; // 자동 슬라이드 인터벌 저장

		// 슬라이드 위치 업데이트 함수
		function updateSlidePosition() {
			// 슬라이드 한 개 너비 계산
			const slideWidth = slides[0] ? slides[0].getBoundingClientRect().width : 0;
			if (slideWidth > 0) {
				// 트랙을 이동시켜 현재 슬라이드가 보이도록 조정
				track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
				
				// 인디케이터 업데이트
				indicators.forEach((indicator, index) => {
					indicator.classList.toggle('active', index === currentIndex);
				});
			}
		}

		// 다음 슬라이드로 이동
		function nextSlide() {
			currentIndex = (currentIndex === slides.length - 1) ? 0 : currentIndex + 1;
			updateSlidePosition();
		}

		// 이전 슬라이드로 이동
		function prevSlide() {
			currentIndex = (currentIndex === 0) ? slides.length - 1 : currentIndex - 1;
			updateSlidePosition();
		}

		// 자동 슬라이드 시작
		function startAutoSlide() {
			autoSlideInterval = setInterval(() => {
				nextSlide();
			}, 4000); // 4초마다 자동 전환
		}

		// 자동 슬라이드 정지
		function stopAutoSlide() {
			if (autoSlideInterval) {
				clearInterval(autoSlideInterval);
				autoSlideInterval = null;
			}
		}

		// 자동 슬라이드 재시작
		function restartAutoSlide() {
			stopAutoSlide();
			startAutoSlide();
		}

		// 이전 버튼 클릭 이벤트
		if (prevBtn) {
			prevBtn.addEventListener('click', () => {
				prevSlide();
				restartAutoSlide(); // 수동 조작 후 자동 슬라이드 재시작
			});
		}

		// 다음 버튼 클릭 이벤트
		if (nextBtn) {
			nextBtn.addEventListener('click', () => {
				nextSlide();
				restartAutoSlide(); // 수동 조작 후 자동 슬라이드 재시작
			});
		}

		// 인디케이터 클릭 이벤트
		indicators.forEach((indicator, index) => {
			indicator.addEventListener('click', () => {
				currentIndex = index;
				updateSlidePosition();
				restartAutoSlide(); // 수동 조작 후 자동 슬라이드 재시작
			});
		});

		// 캐러셀에 마우스 오버 시 자동 슬라이드 정지
		const carousel = document.querySelector('.carousel');
		if (carousel) {
			carousel.addEventListener('mouseenter', stopAutoSlide);
			carousel.addEventListener('mouseleave', startAutoSlide);
		}

		// 창 크기 변경 시 슬라이드 위치 재계산
		window.addEventListener('resize', updateSlidePosition);

		// 초기 설정
		updateSlidePosition();
		startAutoSlide();
	});
	</script>

</body>
</html>