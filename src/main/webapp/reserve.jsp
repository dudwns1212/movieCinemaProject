<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	--txt: #e9eef5;
	--muted: #9fb0c6;
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
	margin-bottom: 10px
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
					<div class="movie">
						<img src="images/oldboy.png" alt="올드보이">
						<div>
							<div>
								<strong>올드보이</strong>
							</div>
							<div class="muted">느와르 120분</div>
						</div>
						<div class="spacer"></div>
						<!-- seat.do로 이동 -->
						<a href="seat.do" class="btn pill small">예매하러가기</a>
					</div>

					<div class="movie">
						<img src="images/sing.png" alt="씽">
						<div>
							<div>
								<strong>씽</strong>
							</div>
							<div class="muted">애니메이션 150분</div>
						</div>
						<div class="spacer"></div>
						<a href="seat.do" class="btn pill small">예매하러가기</a>
					</div>

					<div class="movie">
						<img src="images/f1.png" alt="F1 더 무비">
						<div>
							<div>
								<strong>F1 더 무비</strong>
							</div>
							<div class="muted">액션 155분</div>
						</div>
						<div class="spacer"></div>
						<a href="seat.do" class="btn pill small">예매하러가기</a>
					</div>
				</div>
			</section>

			<!-- 오른쪽: 날짜 / 상영 시간 -->
			<section class="panel">
				<h3>날짜 / 상영 시간</h3>
				<div class="body">
					<!-- 날짜 버튼: 오른쪽 패널 안으로 옮김 -->
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
						<!-- 동적으로 시간 버튼 넣을 자리 (나중에 서버 연동 시 사용) -->
					</div>

					<!-- 간단: 지금은 좌석 페이지로 바로 이동하는 버튼만 제공 -->
					<hr class="line">
					<a href="seat.do" class="btn block">좌석 선택하러 가기</a>
				</div>
			</section>
		</div>
	</main>
</body>
</html>