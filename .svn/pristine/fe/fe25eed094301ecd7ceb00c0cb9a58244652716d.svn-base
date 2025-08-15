<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<style>
* { box-sizing: border-box; }
body {
  margin: 0;
  background: #000;              /* 배경: 블랙 */
  color: #f5f5f5;                /* 텍스트: 밝은 회색 */
  font-family: system-ui,-apple-system,Segoe UI,Roboto,"Noto Sans KR",sans-serif;
}
a { color: inherit; text-decoration: none; }

header {
  position: sticky; top: 0;
  background: #000;              /* 헤더도 블랙 */
  border-bottom: 1px solid #1e1e1e;
}

.wrap { max-width: 1200px; margin: 0 auto; padding: 14px 16px; }
h1 { font-size: 20px; margin: 10px 0; }

.grid {
  display: grid;
  grid-template-columns: 260px 1fr 320px;
  gap: 14px;
}

/* 패널 */
.panel {
  background: #0a0a0a;           /* 패널 카드: 아주 진한 회색 */
  border: 1px solid #1e1e1e;
  border-radius: 14px;
  overflow: hidden;
  min-height: 520px;
}
.panel h3 {
  margin: 0; padding: 12px;
  border-bottom: 1px solid #1e1e1e;
  font-size: 16px;
}
.panel .body {
  padding: 12px;
  max-height: 70vh;
  overflow: auto;
}

/* 버튼 */
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: 8px;
  padding: 9px 12px;
  border-radius: 10px;
  border: 1px solid #1e1e1e;
  background: #111;              /* 버튼 배경 */
  color: #fff;
  font-weight: 600;
  transition: border-color .2s, background .2s, transform .08s;
}
.btn:hover { border-color: #ef4444; background: #141414; } /* 레드 포인트 */
.btn:active { transform: translateY(1px); }
.btn.block { display: flex; width: 100%; }
.btn.ghost { background: #0b0b0b; }
.btn.pill { border-radius: 999px; }
.btn.small { padding: 7px 10px; font-size: 14px; }
.btn[disabled] { opacity: .6; cursor: not-allowed; }

/* 리스트/텍스트 */
.list { display: grid; gap: 8px; }
.tag { font-size: 12px; color: #a1a1aa; margin: 6px 0; }  /* muted 텍스트 */
.muted { color: #a1a1aa; }

/* 영화 카드 */
.movie {
  display: flex; gap: 10px; align-items: center; padding: 8px;
  border: 1px solid #1e1e1e; border-radius: 12px; margin-bottom: 10px;
}
.movie img { width: 48px; height: 64px; object-fit: cover; border-radius: 6px; background: #111; }
.movie .spacer { flex: 1; }

/* 시간 버튼 */
.time-list { display: flex; flex-wrap: wrap; gap: 8px; }
.time {
  padding: 8px 10px;
  border: 1px solid #1e1e1e; border-radius: 10px;
  background: #0f0f0f;
}
.time:hover { border-color: #ef4444; }

/* 구분선 */
hr.line { border: 0; border-top: 1px solid #1e1e1e; margin: 12px 0; }

/* 포커스 접근성 */
.btn:focus-visible, .time:focus-visible {
  outline: 2px solid #ef4444; outline-offset: 2px;
}

/* (선택) 강조 버튼이 필요할 때 .accent 추가해서 더 레드 느낌 */
.btn.accent { border-color: #ef4444; background: #1a0b0b; }
.btn.accent:hover { background: #220d0d; }
</style>
</head>
<body>
	<header>
		<div class="wrap"
			style="display: flex; align-items: center; gap: 12px;">
			<a href="home.do"><strong>LX Cinema</strong></a> <span class="muted"
				style="margin-left: auto;">좌석 선택</span>
		</div>
	</header>

	<main class="wrap">
		<h1>좌석 선택</h1>

		<div class="panel">
			<div class="legend">
				<span class="badge">가능</span> <span class="badge"
					style="background: #17324a; border-color: #27c3ff;">선택됨</span> <span
					class="badge"
					style="background: #2a1a1a; border-color: #4a1b1b; color: #caa;">예매완료</span>
			</div>
			<div class="screen">SCREEN</div>

			<!-- 좌석 12개 (A1~A6, B1~B6). 필요하면 더 늘려도 됨 -->
			<div id="seatGrid" class="grid">
				<div class="row-label">A열</div>
				<div class="seat" data-seat="A1">A1</div>
				<div class="seat" data-seat="A2">A2</div>
				<div class="seat" data-seat="A3">A3</div>

				<div class="row-label">B열</div>
				<div class="seat" data-seat="B1">B1</div>
				<div class="seat" data-seat="B2">B2</div>
				<div class="seat" data-seat="B3">B3</div>
				
				<div class="row-label">C열</div>
				<div class="seat" data-seat="B1">C1</div>
				<div class="seat" data-seat="B2">C2</div>
				<div class="seat" data-seat="B3">C3</div>
				
				<div class="row-label">D열</div>
				<div class="seat" data-seat="B1">D1</div>
				<div class="seat" data-seat="B2">D2</div>
				<div class="seat" data-seat="B3">D3</div>



			</div>

			<div style="margin-top: 14px; display: flex; gap: 8px;">
				<button id="btnComplete" class="btn" disabled>예매 완료</button>
				<a class="btn" href="home.do">홈으로</a>
			</div>
		</div>
	</main>

	<div id="toast" class="toast">예매가 완료되었습니다.</div>

	<script>
(function(){
  const seats = document.querySelectorAll('.seat');
  const btnComplete = document.getElementById('btnComplete');
  const toast = document.getElementById('toast');
  let selected = null;

  // 좌석 클릭
  seats.forEach(seat => {
    seat.addEventListener('click', () => {
      if (seat.classList.contains('booked')) return; 
      if (selected) selected.classList.remove('selected');
      seat.classList.add('selected');
      selected = seat;
      btnComplete.disabled = false;
    });
  });

  // 예매 완료 버튼 → 선택 좌석을 '예매완료' 상태로 고정
  btnComplete.addEventListener('click', () => {
    if (!selected) return;
    selected.classList.remove('selected');
    selected.classList.add('booked');
    selected.textContent = selected.dataset.seat + "✓";
    btnComplete.disabled = true;
    showToast(selected.dataset.seat + " 좌석 예매 완료!");
  });

  function showToast(msg){
    toast.textContent = msg;
    toast.classList.add('show');
    setTimeout(()=> toast.classList.remove('show'), 1600);
  }
})();
</script>
</body>
</html>