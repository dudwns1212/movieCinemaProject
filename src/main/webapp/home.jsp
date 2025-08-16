<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>영화관 홈페이지</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!-- Plyr CSS -->
<link rel="stylesheet" href="https://cdn.plyr.io/3.7.8/plyr.css" />
<style>
body {
	margin: 0;
	background-color: #000;
	color: #eee;
	font-family: 'Noto Sans KR', sans-serif;
}
main {
	max-width: 1200px;
	margin: 0 auto 60px;
}
.carousel-item {
	position: relative;
	width: 100%;
	padding-top: 41%;
	overflow: hidden;
}
.carousel-item img {
	position: absolute;
	top: 0;
	left: 50%;
	width: auto;
	height: 100%;
	transform: translateX(-50%);
	object-fit: cover;
	object-position: top center;
	cursor:pointer;
}
.carousel-caption {
	position: absolute;
	top: 0px;
	transform: translateX(40%);
	padding: 10px 20px;
	border-radius: 5px;
	z-index: 1;
}
.carousel-caption p, h3 {
	text-align: left;
	transform: translateX(20%);
	padding: 10px 30px;
}
#playerContainer {
	display:none;
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:rgba(0,0,0,0.85);
	z-index:9999;
	display:flex;
	justify-content:center;
	align-items:center;
	flex-direction:column;
}
#player iframe {
	width: 80%;
	height: 450px;
}
#closeBtn {
	margin-top:10px;
	padding:5px 10px;
	cursor:pointer;
	background:#fff;
	border:none;
	color:#000;
	border-radius:5px;
}
</style>
</head>
<body>
<jsp:include page="/header.jsp" />
<% 
String deleteMsg = (String) request.getAttribute("deleteMsg");
if (deleteMsg != null) {
%>
<script>
    alert('<%= deleteMsg %>');
</script>
<%
}
%>
<main>
	<div id="movieCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="2"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="asset/images/oldboy.png" alt="영화1" data-video=https://youtu.be/TzYlT5ynuAc?si=vexX5CERiEDudTT_>
				<div class="carousel-caption">
					<h3>올드보이</h3>
					<p>“누가, 왜 나를 가두었는가?”</p>
					<p>15년 동안 이유도 모른 채 감금당한 오대수는 풀려난 후,</p>
					<p>자신을 가둔 자를 찾아 복수와 진실의 퍼즐을 맞춰가기 시작한다.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<!-- 플레이어 영역 -->
	<div id="playerContainer">
		<div id="player"></div>
		<button id="closeBtn">닫기</button>
	</div>
</main>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.plyr.io/3.7.8/plyr.polyfilled.js"></script>
<script>
$(document).ready(function() {
	let player;

	$('.carousel-item img').click(function() {
		const url = $(this).data('video');
		$('#player').html(`<iframe src="${url}" frameborder="0" allowfullscreen></iframe>`);
		player = new Plyr($('#player iframe')[0]);
		$('#playerContainer').fadeIn();
	});

	$('#closeBtn').click(function() {
		$('#playerContainer').fadeOut();
		if(player) player.destroy();
		$('#player').html('');
	});
});
</script>
</body>
</html>
