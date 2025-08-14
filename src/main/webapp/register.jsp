<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- 회원가입 기능 프론트앤드 수정해야됨 -->
    <h2>회원가입</h2>

    <form action="register.do">
        <p>
            <label for="userId">아이디:</label><br>
            <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
        </p>
        <p>
            <label for="userPassword">비밀번호:</label><br>
            <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" required>
        </p>
        <p>
            <label for="userName">이름:</label><br>
            <input type="text" id="userName" name="userName" placeholder="이름을 입력하세요" required>
        </p>
        <p>
            <label for="userAge">나이:</label><br>
            <input type="number" id="userAge" name="userAge" min="1" max="150" placeholder="나이를 입력하세요" required>
        </p>
        <p>
            <label for="userMobile">휴대폰 번호:</label><br>
            <input type="tel" id="userMobile" name="userMobile" placeholder="예: 010-1234-5678" required pattern="[0-9\-]+">
        </p>

        <button type="submit">회원가입</button>
    </form>
    <c:if test="${not empty errorMsg || not empty msg}">
        <p style="color:red;">${errorMsg}</p>
        <p style="color:blue;">${msg}</p>
    </c:if>

    <p><a href="home.do">홈으로</a></p>
</body>
</html>
