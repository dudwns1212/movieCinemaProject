<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${movie.title}- 상세보기</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #000; /* 전체 배경 검정 유지 */
	color: #fff;
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	padding: 40px 20px;
}

.detail-panel {
	background: rgba(255, 255, 255, 0.15); /* 반투명 유리판 */
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px); /* 사파리 호환 */
	border-radius: 16px;
	padding: 100px;
	max-width: 1000px;
	min-height: 700px;
	margin: 20px auto;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.6);
	color: #fff;
}

.movie-detail {
	display: flex;
	gap: 30px;
	flex-wrap: wrap;
}

.poster {
	flex: 1;
	min-width: 280px;
}

.poster img {
	width: 100%;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.6);
}

.info {
	flex: 2;
	min-width: 300px;
}

.info h2 {
	margin-bottom: 15px;
}

.story-container {
	margin-top: 20px;
}

.story-content {
	max-height: 220px; /* 줄거리 스크롤 */
	overflow-y: auto;
	padding: 15px;
	background: rgba(255, 255, 255, 0.08); /* 줄거리도 유리판 느낌 */
	border-radius: 10px;
	line-height: 1.6;
	color: #fff;
}

.btn.brand { /* 예매버튼 */
	padding: 10px 100px;
	border-radius: 8px;
	background: #ff2f6e;
	color: #fff;
	text-decoration: none;
	text-align: center;
	font-weight: 700;
	transition: opacity 0.3s ease;
}
.trailer {
	margin-top: 30px;
}

.trailer iframe {
	width: 100%;
	height: 250px;
	border-radius: 12px;
	border: none;
}

@media ( max-width : 768px) {
	.movie-detail {
		flex-direction: column;
		gap: 20px;
	}
	.poster, .info {
		min-width: 100%;
	}
}
</style>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<% String movie = request.getParameter("selectedMovie"); %>

	<div class="container">
		<div class="detail-panel">
			<div class="movie-detail">
				<!-- 포스터 영역 -->
				<div class="poster">
					<img src="${movie.poster}" alt="${movie.movieTitle} 포스터">
					
				</div>

				<!-- 영화 정보 영역 -->
				<div class="info">
					<h2>${movie.movieTitle}</h2>
					<p>
						<strong>가격:</strong> '14000(프론트테스트용)'${movie.moviePrice}
					</p>
					<p>
						<strong>장르:</strong> '느와르(프론트테스트용)'${movie.genre}
					</p>
					<p>
						<strong>⏱:</strong> '120분(프론트테스트용)'${movie.movieTime}
					</p>

					<!-- 줄거리 -->
					<div class="story-container">
						<h5>줄거리</h5>
						<div class="story-content">
							  ${movie.story}
							“누가, 왜 나를 가두었는가?”(프론트테스트용)<br>
							<br> 평범하게 살아가던 ‘오대수’는 이유도 모른 채 낯선 방 안에 갇혀 15년을 보낸다.<br>
							그 동안 세상은 변했고, 그는 잃어버린 시간과 기억 속에서 자신을 잔혹하게 가둔 사람을 찾아 복수를 결심한다.<br>
							자유를 되찾은 순간, 복수의 길은 단순하지 않음을 깨닫는다.<br>
							<br> 오대수가 마주하는 사람들, 사건, 그리고 자신을 둘러싼 비밀들은 상상을 초월하며<br>
							그의 분노와 절망은 점점 복수심으로 변해 간다.<br> 과거의 진실이 드러날수록, 그에게 남은 선택은 오직
							하나,<br> 끝을 향해 질주하는 복수의 길뿐이다.<br>
							<br> 15년 동안 잊혀진 시간, 숨겨진 진실, 그리고 복수의 끝.<br> 모든 것이 밝혀질 때,
							오대수는 과연 승리할 수 있을까, 아니면 스스로 파멸하게 될까?

						</div>
					</div>
						<a class="btn brand"
									href="/home.jsp">뒤로가기</a>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
