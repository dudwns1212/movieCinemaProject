<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #000;
        color: #fff;
    }

    .register-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 80px);

        background-image: url('path/to/your/movie-poster.jpg'); 
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-color: rgba(0, 0, 0, 0.7);
        background-blend-mode: multiply;
    }

    .register-box {
        background-color: #141414;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.5);
        width: 400px;
        text-align: center;
        position: relative;
        z-index: 10;
    }

    .register-box h1 {
        margin-bottom: 30px;
        font-size: 28px;
        font-weight: bold;
    }

    .register-box input {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        background-color: #333;
        color: #fff;
        font-size: 16px;
    }

    .register-box input::placeholder {
        color: #aaa;
    }

    .register-box button {
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

    .register-box button:hover {
        background: linear-gradient(45deg, #FF6B9D, #E74C3C);
    }

    .register-box a {
        display: block;
        margin-top: 15px;
        color: #aaa;
        text-decoration: none;
    }

    .register-box a:hover {
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

<div class="register-container">
    <div class="register-box">
        <h1>회원가입</h1>
        <form action="register.do" method="post">
            <input type="hidden" name="action" value="register">

            <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            <input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호 확인" required>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
            <input type="tel" id="phone" name="phone" placeholder="전화번호를 입력하세요" required>

            <button type="submit">회원가입</button>
            <a href="login.jsp">로그인 페이지로 돌아가기</a>
        </form>
        
        <c:if test="${not empty errorMsg}">
            <p class="error-msg">${errorMsg}</p>
        </c:if>
    </div>
</div>

</body>
</html>

