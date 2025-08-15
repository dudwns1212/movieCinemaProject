<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="movieList.MovieListVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>예매 (정적 목업)</title>
<style>
:root {
	--bg: #0b0f14;
	--card: #121821;
	--line: #1e2631;
	--txt: #FFFFFF;
	--muted: #FFFFFF;
	--accent: #27c3ff;
	--radius: 14px
}

* {
	box-sizing: border-box
}

body {
	margin: 0;
	background: black;
	color: var(--txt);
	font-family: system-ui, -apple-system, Segoe UI, Roboto, "Noto Sans KR",
		sans-serif
}

a {
	text-decoration: none;
	color: inherit
}

header {
	position: sticky;
	top: 0;
	background: #0b0f14cc;
	border-bottom: 1px solid var(--line);
	backdrop-filter: blur(6px)
}

.wrap {
	max-width: 1200px;
	margin: 0 auto;
	padding: 14px 16px
}

h1 {
	font-size: 20px;
	margin: 10px 0
}

.grid {
	display: grid;
	grid-template-columns: 260px 1fr 320px;
	gap: 14px
}

.panel {
	background: var(--card);
	border: 1px solid var(--line);
	border-radius: var(--radius);
	overflow: hidden;
	min-height: 520px
}

.panel h3 {
	margin: 0;
	padding: 12px;
	border-bottom: 1px solid var(--line);
	font-size: 16px
}

.panel .body {
	padding: 12px;
	max-height: 70vh;
	overflow: auto
}

.btn {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	padding: 9px 12px;
	border-radius: 10px;
	border: 1px solid #1b2431;
	background: #1a2230;
	color: #fff;
	font-weight: 600
}

.btn.block {
	display: flex;
	width: 100%
}

.btn.ghost {
	background: #111722
}

.btn.pill {
	border-radius: 999px
}

.btn.small {
	padding: 7px 10px;
	font-size: 14px
}

.btn[disabled] {
	opacity: .6;
	cursor: not-allowed
}

/* 목록 */
.list {
	display: grid;
	gap: 8px
}

.tag {
	font-size: 12px;
	color: var(--muted);
	margin: 6px 0
}

/* 영화 카드 */
.movie {
	display: flex;
	gap: 10px;
	align-items: center;
	padding: 8px;
	border: 1px solid #1b2431;
	border-radius: 12px;
	margin-bottom: 10px;
	transition: border-color 0.2s;
}

.movie:hover {
	border-color: var(--accent);
}

.movie img {
	width: 48px;
	height: 64px;
	object-fit: cover;
	border-radius: 6px;
	background: #0e131a
}

.movie .spacer {
	flex: 1
}

/* 시간 버튼 */
.time-list {
	display: flex;
	flex-wrap: wrap;
	gap: 8px
}

.time {
	padding: 8px 10px;
	border: 1px solid #1b2431;
	border-radius: 10px
}

.muted {
	color: var(--muted)
}

hr.line {
	border: 0;
	border-top: 1px solid var(--line);
	margin: 12px 0
}

.empty-state {
	text-align: center;
	padding: 40px 20px;
	color: var(--muted);
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>

	<main class="wrap">
		<h1>영화 예매</h1>

		<div class="grid">
			<!-- 왼쪽: 지역/영화관 -->
			<section class="panel">
				<h3>지역 / 영화관</h3>
				<div class="body">
					<div class="tag">지역</div>
					<div class="list">
						<button type="button" class="btn block">위쪽</button>
						<button type="button" class="btn block">가운데</button>
						<button type="button" class="btn block">아래쪽</button>
					</div>

					<hr class="line">

					<div class="tag">영화관</div>
					<div class="list">
						<button type="button" class="btn block ghost">서울도심영화관</button>
						<button type="button" class="btn block ghost">부산돼지국밥</button>
						<button type="button" class="btn block ghost">대구아프리카</button>
						<button type="button" class="btn block ghost">인천마계</button>
					</div>
				</div>
			</section>

			            <!-- 가운데: 영화 목록 -->
            <section class="panel">
                <h3>영화</h3>
                <div class="body">
                    <%
                        // 서블릿에서 전달받은 movieList를 가져옵니다
                        List<MovieListVO> movieList = (List<MovieListVO>) request.getAttribute("movieList");
                        
                        // 영화 목록이 있는지 확인
                        if (movieList != null && !movieList.isEmpty()) {
                            // 각 영화를 반복해서 출력
                            for (MovieListVO movie : movieList) {
                    %>
                                <div class="movie">
                                	<!-- el을 사용해서 데이터베이스에 있는 모든 영화 포스터가 반복문에 의해 나오도록 설정
                                	 	movieList 객체인 movie를 이용해서 get메서드 사용, null이 아니면 각 영화의 데이터베이스에 저장된
                                	 	포스터의 경로가 출력-->
                                    <img src="<%= movie.getPoster() != null ? movie.getPoster() : "asset/images/movie_default.png" %>" 
                                         alt="<%= movie.getMovieTitle() %>"
                                         onerror="this.src='${pageContext.request.contextPath}/asset/images/movie_default.png'">
                                    <div>
                                        <div>
                                            <strong><%= movie.getMovieTitle() %></strong>
                                        </div>
                                        <div class="muted"><%= movie.getGenre() %> • <%= movie.getMovieTime() %>분</div>
                                        <div class="muted">가격: <%= movie.getMoviePrice() %>원</div>
                                    </div>
                                    <div class="spacer"></div>
                                    <a href="seat.do?movieId=<%= movie.getMovieId() %>" class="btn pill small">예매하러가기</a>
                                </div>
                    <%
                            }
                        } else {
                    %>
                            <div class="empty-state">
                                <p>현재 상영 중인 영화가 없습니다.</p>
                            </div>
                    <%
                        }
                    %>
                </div>
            </section>

			<!-- 오른쪽: 날짜 / 상영 시간 -->
			<section class="panel">
				<h3>날짜 / 상영 시간</h3>
				<div class="body">
					<div class="date-list"
						style="display: flex; gap: 8px; margin-bottom: 8px;">
						<button type="button" class="btn small pill date-btn"
							data-date="2025-08-25">2025-08-25</button>
						<button type="button" class="btn small pill date-btn"
							data-date="2025-08-26">2025-08-26</button>
					</div>

					<div class="muted" id="selected-date" style="margin-bottom: 8px;">날짜를
						선택하세요</div>
					<div class="time-list" id="time-list">
						<!-- 영화 선택 후 상영 시간이 동적으로 표시될 예정 -->
					</div>

					<hr class="line">
					<button type="button" class="btn block" onclick="goToSeat()">좌석 선택하러 가기</button>
				</div>
			</section>
		</div>
	</main>

	<script>
	// 좌석 선택 페이지로 이동하는 함수
	function goToSeat() {
		// 선택된 영화가 있는지 확인하고 이동
		// 실제 구현에서는 선택된 영화 ID를 가져와서 전달
		alert('영화를 먼저 선택해주세요.');
	}
	
	// 날짜 버튼 클릭 이벤트
	document.addEventListener('DOMContentLoaded', function() {
		const dateButtons = document.querySelectorAll('.date-btn');
		const selectedDateElement = document.getElementById('selected-date');
		
		dateButtons.forEach(button => {
			button.addEventListener('click', function() {
				// 모든 버튼의 active 클래스 제거
				dateButtons.forEach(btn => btn.classList.remove('active'));
				// 클릭된 버튼에 active 클래스 추가
				this.classList.add('active');
				// 선택된 날짜 표시
				selectedDateElement.textContent = '선택된 날짜: ' + this.dataset.date;
			});
		});
	});
	</script>
</body>
</html>