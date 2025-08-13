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

/* 헤더 영역 */
header {
	width: 100%;
	padding: 20px 0 10px; /* 위 20px, 아래 10px */
	position: relative; /* 로그인/회원가입 절대위치용 */
	text-align: center;
}
/* 메인 타이틀 스타일 */
h1 {
	margin: 0;
	font-size: 1.5rem;
	font-weight: 700;
	letter-spacing: 0.1em; /* 글자 간격 */
}
/* 서브 타이틀 스타일 */
h2 {
	margin: 0;
	font-size: 1rem;
	font-weight: 700;
	letter-spacing: 0.1em;
	padding-bottom: 10px;
}
/* 타이틀 아래 밑줄 */
.underline {
	width: 1200px;
	border-bottom: 2px solid #666;
	margin: 0 auto 20px;
}

/* 로그인/회원가입 또는 사용자 정보 영역 */
.user-section {
	position: absolute;
	right: 10px;
	top: 20px;
	font-size: 0.8rem;
	font-weight: 700;
	display: flex;
	gap: 10px;
	align-items: center;
}

.user-section button {
	padding: 10px 25px;
	font-size: 0.8rem;
	background: transparent;
	border: none;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.user-section button:hover {
	background-color: #444;
}

/* 사용자 이름 스타일 */
.user-name {
	color: #4CAF50;
	font-weight: bold;
	margin-right: 10px;
}

/* 네비게이션 메뉴 영역 (예매, 영화, 영화관) */
.ticketing_menu {
	display: flex; /* 가로 정렬 */
	gap: 15px; /* 메뉴 간격 */
	justify-content: center;
	max-width: 1200px;
	margin: 0 auto 40px; /* 상단 0, 하단 40px */
	position: relative;
}
/* 드롭다운 메뉴 구조 */
.dropdown {
	position: relative; /* 드롭다운 컨텐츠의 기준 위치 */
	display: inline-block;
	min-width: 100px;
}
/* 드롭다운 버튼 스타일 */
.dropbtn {
	padding: 10px 30px;
	font-size: 1rem;
	color: #fff;
	background: transparent;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
/* 버튼 hover & 포커스 시 배경색 변경 */
.dropbtn:hover, .dropbtn:focus {
	background-color: #333;
	outline: none;
}
/* 드롭다운 메뉴가 숨겨진 상태 */
.dropdown-content {
	display: none;
	position: absolute;
	font-size: 0.7rem;
	top: 100%; /* 버튼 바로 아래 */
	left: 50%;
	transform: translateX(-50%); /* 중앙 정렬 */
	background-color: #222;
	border-radius: 0 0 5px 5px;
	z-index: 100;
	flex-direction: row;
	gap: 15px;
	padding: 10px 15px;
	white-space: nowrap; /* 줄 바꿈 금지 */
}
/* 드롭다운 영역 마우스 오버 혹은 포커스 시 보임 */
.dropdown:hover .dropdown-content, .dropdown:focus-within .dropdown-content
	{
	display: flex;
}
/* 드롭다운 메뉴 링크 스타일 */
.dropdown-content a {
	padding: 5px 8px;
	color: #eee;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	text-align: center;
	flex-basis: 120px; /* 일정 너비 유지 */
}
/* 메뉴 링크 hover 및 포커스 효과 */
.dropdown-content a:hover, .dropdown-content a:focus {
	background-color: #333;
	outline: none;
}

/* 드롭다운 외 다른 버튼 스타일 */
.ticketing_menu button:not(.dropbtn) {
	background: transparent;
	border: none;
	padding: 10px 30px;
	font-size: 1rem;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.ticketing_menu button:not(.dropbtn):hover, .ticketing_menu button:not(.dropbtn):focus
	{
	background-color: #333;
	outline: none;
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

	<header>
		<!-- 로그인 상태에 따른 버튼 표시 (간단한 JSP 문법 사용) -->
		<div class="user-section">
			<% 
			// 세션에서 로그인 사용자 정보 가져오기
			userList.UserListVO loginUser = (userList.UserListVO)session.getAttribute("loginUser");
			
			if (loginUser != null) { 
				// 로그인된 상태
			%>
				<span class="user-name"><%=loginUser.getUserName()%>님</span>
				<form action="mypage.do" style="display: inline;">
					<button type="submit">마이페이지</button>
				</form>
				<form action="logout.do" style="display: inline;">
					<button type="submit">로그아웃</button>
				</form>
			<% 
			} else { 
				// 로그인되지 않은 상태
			%>
				<form action="login.jsp" style="display: inline;">
					<button type="submit">로그인</button>
				</form>
				<form action="register.jsp" style="display: inline;">
					<button type="submit">회원가입</button>
				</form>
			<% } %>
		</div>

		<!-- 타이틀 -->
		<h1>
			<a href="home.do" style="color: inherit; text-decoration: none;">
				<div>공간 시네마</div>
				<div>LX-CINEMA</div>
			</a>
		</h1>
		<div class="underline"></div>

		<div class="ticketing_menu">
			<!-- 드롭다운 예매 메뉴 -->
			<div class="dropdown">
				<button class="dropbtn" aria-haspopup="true" aria-expanded="false">예매</button>
				<div class="dropdown-content" role="menu" aria-label="예매 메뉴">
					<a href="movie.do" role="menuitem">현재 상영작</a> 
					<a href="#" role="menuitem">예매 내역</a> 
					<a href="#" role="menuitem">특별 이벤트</a>
				</div>
			</div>
			<!-- 기타 메뉴 버튼 -->
			<form action="movie.do" style="display: inline;">
				<button type="submit">영화</button>
			</form>
			<form action="cinema.do" style="display: inline;">
				<button type="submit">영화관</button>
			</form>
		</div>
	</header>

	<main>
		<!-- 캐러셀 메인 컨테이너 수정할 부분 여기가 슬라이드가 넘어가지 않음..-->
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