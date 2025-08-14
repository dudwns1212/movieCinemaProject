<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 - LX CINEMA</title>
<style>
body {
	margin: 0;
	background-color: #000; /* 검은 배경 */
	color: #eee; /* 연한 글씨 색 */
	font-family: 'Noto Sans KR', sans-serif;
}

/* 메인 컨테이너 */
.main-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 40px 20px;
}

/* 페이지 타이틀 */
.page-title {
    text-align: center;
    margin-bottom: 100px;
}

.page-title h1 {
    font-size: 2rem;
    font-weight: 700;
    margin: 0;
    background: linear-gradient(45deg, #4CAF50, #2196F3);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.page-title p {
    margin: 10px 0 0;
    color: #999;
    font-size: 1rem;
}

/* 현재 사용자 정보 표시 */
.current-user-info {
    background:  #4ECDC4;
    color: white;
    border-radius: 30px;
    padding: 20px;
    margin-bottom: 20px;
    text-align: center;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

.current-user-info h3 {
    margin: 0 0 5px;
    font-size: 1.2rem;
}

.current-user-info p {
    margin: 0;
    opacity: 0.9;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .main-container {
        padding: 20px 15px;
    }
}
</style>
</head>
<body>
    <!-- 헤더 include -->
    <%@ include file="header.jsp" %>

    <div class="main-container">
        <!-- 페이지 타이틀 -->
        <div class="page-title">
            <h1>마이페이지</h1>
            <p>회원정보 관리 및 예매 내역을 확인하세요</p>
        </div>

        <!-- 현재 로그인 사용자 정보 -->
        <%
        userList.UserListVO currentUser = (userList.UserListVO)session.getAttribute("loginUser");
        %>
        <div class="current-user-info">
            <h3>환영합니다, <%=currentUser.getUserName()%>님!</h3>
            <p>회원 ID: <%=currentUser.getUserId()%></p>
        </div>
    </div>
</body>
</html>