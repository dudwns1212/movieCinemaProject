<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #000; /* 검은색 배경 */
        color: #fff;
    }

    /* 헤더 임포트 아래 로그인 영역 */
    .login-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 80px); /* 헤더 높이 빼고 중앙 정렬 */
        
        /* 영화 포스터 배경 이미지 추가 */
        background-image: url('path/to/your/movie-poster.jpg'); 
        background-size: cover; /* 이미지가 div를 꽉 채우도록 설정 */
        background-position: center; /* 이미지를 중앙에 배치 */
        background-repeat: no-repeat; /* 이미지 반복 방지 */
        
        /* 로그인 박스가 잘 보이도록 투명한 검은색 오버레이 추가 */
        background-color: rgba(0, 0, 0, 0.7); 
        background-blend-mode: multiply; /* 배경 색상과 이미지 혼합 */
    }

    .login-box {
        background-color: #141414; /* 로그인 박스 배경 */
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.5);
        width: 350px;
        text-align: center;
        /* 배경 이미지 위로 올라오도록 z-index 설정 */
        position: relative;
        z-index: 10;
    }

    .login-box h1 {
        margin-bottom: 30px;
        font-size: 28px;
        font-weight: bold;
    }

    .login-box input {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        background-color: #333;
        color: #fff;
        font-size: 16px;
    }

    .login-box input::placeholder {
        color: #aaa;
    }

    .login-box button {
        width: 100%;
        padding: 12px;
        margin-top: 20px;
        background: linear-gradient(45deg, #E74C3C, #FF6B9D);
        border: none;
        border-radius: 5px;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        font-weight: bold;
    }

    .login-box button:hover {
        background: linear-gradient(45deg, #FF6B9D, #E74C3C);
    }

    .login-box a {
        display: block;
        margin-top: 15px;
        color: #aaa;
        text-decoration: none;
    }

    .login-box a:hover {
        color: #fff;
        text-decoration: underline;
    }

    .error-msg {
        color: #e87c03;
        margin-top: 15px;
    }
</style>
</head>
<body>

<%@ include file="header.jsp" %>  
<div class="login-container">
    <div class="login-box">
        <h1>로그인</h1>
        <form action="login.do" method="post">
            <input type="text" name="id" placeholder="아이디를 입력하세요" required>
            <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required>
            <button type="submit">로그인</button>
            <a href="register.jsp">회원가입</a>
        </form>
        <c:if test="${not empty errorMsg}">
            <p class="error-msg">${errorMsg}</p>
        </c:if>
    </div>
</div>

</body>
</html>