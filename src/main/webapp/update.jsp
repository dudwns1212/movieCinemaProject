<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	background-image: url('images/baram.png');
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
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
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

	<jsp:include page="/header.jsp" />

	<div class="register-container">
		<div class="register-box">
			<h1>정보 수정</h1>
			<form action="update.do" method="post">
				<%
				userList.UserListVO currentUser = (userList.UserListVO) session.getAttribute("loginUser");
				%>
				<input type="hidden" name="userNo"
					value="<%=currentUser.getUserNo()%>"> <input type="text"
					name="userId" placeholder="아이디 : <%=currentUser.getUserId()%>"
					required> <input type="password" name="userPassword"
					placeholder="비밀번호는 보안입니다." required> <input type="text"
					name="userName" placeholder="이름 : <%=currentUser.getUserName()%>"
					required> <input type="tel" name="userMobile"
					placeholder="전화번호 : <%=currentUser.getUserMobile()%>" required>
				<input type="number" name="userAge"
					placeholder="나이 : <%=currentUser.getUserAge()%>" required>

				<button type="submit" method="post">확인</button>
				<a href="myPage.jsp">마이페이지로 돌아가기</a> <a
					href="delete.do?userId=<%=currentUser.getUserId()%>"
					onclick="return confirm('정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.')"> 
					회원 탈퇴 </a>
			</form>

			<c:if test="${not empty errorMsg || not empty msg}">
				<p style="color: red;">${errorMsg}</p>
				<p style="color: blue;">${msg}</p>
			</c:if>
		</div>
	</div>

</body>
</html>

