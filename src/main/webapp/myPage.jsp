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
    background-color: #000;
    color: #eee;
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
    background: linear-gradient(45deg, #E74C3C, #FF6B9D);
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
    background: linear-gradient(45deg, #E74C3C, #FF6B9D);
    color: white;
    border-radius: 30px;
    padding: 20px;
    margin-bottom: 40px;
    text-align: center;
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
}

.current-user-info h3 {
    margin: 0;
    font-size: 1.2rem;
}

.current-user-info p {
    margin: 5px 0 0;
    opacity: 0.9;
}

/* 카드 컨테이너 - Flexbox 사용 */
.card-container {
    display: flex;
    justify-content: center;
    gap: 30px;
}

/* 카드 공통 스타일 */
.edit-card, .check-card {
    width: 300px;
    background-color: #1a1a1a;
    border-radius: 15px;
    padding: 30px;
    border: 1px solid #333;
}


/* 카드 내용 */
.edit-card h3, .check-card h3 {
    margin: 0 0 15px 0;
    font-size: 1.5rem;
    color: #fff;
}

.edit-card p, .check-card p {
    margin: 0 0 25px 0;
    color: #999;
    font-size: 0.93rem;
    line-height: 1.5;
}

/* 카드 버튼 */
.card-button {
    width: 100%;
    padding: 12px 20px;
    background: linear-gradient(45deg, #E74C3C, #FF6B9D);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
}

#edit {
	height: 20px;
	width: 88%;
	margin-bottom:5px;
	padding: 10px 15px;
	align-text: center;
	border-radius: 10px
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

    <%
    userList.UserListVO currentUser = (userList.UserListVO)session.getAttribute("loginUser");
    %>
    <div class="current-user-info">
        <h3>환영합니다, <%=currentUser.getUserName()%>님!</h3>
        <p>회원 ID: <%=currentUser.getUserId()%></p>
    </div>

    <div class="card-container">
        <!-- 회원정보 수정 카드 -->
        <div class="edit-card">
            <h3>회원정보 수정</h3>
            <p>비밀번호를 확인하고 회원정보를 수정하세요</p>
            <form action="checkPw.do" method="do">            	
            	<input type="password" name="pw" id="edit" placeholder="비밀번호를 입력하세요">
            	<input type="hidden" name="user_id">
                <button type="submit" class="card-button">정보 수정</button>
            </form>
        </div>

        <!-- 예매 확인 내역 카드 -->
        <div class="check-card">
            <h3>예매 확인</h3>
            <p>여기서 예매한 내역를 확인하세요</p>
            <form action="movie.do">
                <button type="submit" class="card-button">예매 내역</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>