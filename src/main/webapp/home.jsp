<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>영화관 홈페이지</title>

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
.carousel-item img {
    height: 500px;
    object-fit: cover;
}
.carousel-caption {
    background: rgba(0,0,0,0.6);
    padding: 10px 20px;
    border-radius: 5px;
}
</style>
</head>
<body>

<jsp:include page="/header.jsp" />

<main>
    <!-- Bootstrap 캐러셀 -->
    <div id="movieCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">

        <!-- 인디케이터 -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="2"></button>
        </div>

        <!-- 슬라이드 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://picsum.photos/id/1015/1200/500" class="d-block w-100" alt="영화1">
                <div class="carousel-caption">
                    <h3>올드보이</h3>
                    <p>복수를 위해 15년을 기다린 남자의 이야기</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://picsum.photos/id/1016/1200/500" class="d-block w-100" alt="영화2">
                <div class="carousel-caption">
                    <h3>신세계</h3>
                    <p>조직의 운명을 바꿀 마지막 선택</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://picsum.photos/id/1018/1200/500" class="d-block w-100" alt="영화3">
                <div class="carousel-caption">
                    <h3>위대한 쇼맨</h3>
                    <p>모든 것을 바꾼 위대한 쇼의 시작</p>
                </div>
            </div>
        </div>

        <!-- 컨트롤 버튼 -->
        <button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>

    </div>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
