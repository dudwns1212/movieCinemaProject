<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* 헤더 컨테이너 */
body {
	background-color: black;
}
.header-container {
    width: 100%;
    background-color: black;
    font-family: 'Noto Sans KR', sans-serif;
}

/* 실제 검은색 배경이 들어가는 영역 */
.header-inner {
    max-width: 1200px;
    margin: 0 auto;
    background-color: #000; /* 1200px 안쪽만 검정 */
    color: #eee;
    padding: 20px 0 60px; /* 아래쪽 넓혀서 버튼 공간 확보 */
    position: relative;
    text-align: center;
    box-sizing: border-box;
}

.header-inner h1 {
    margin: 0;
    font-size: 1.5rem;
    font-weight: 700;
    letter-spacing: 0.1em;
}

/* 언더라인 */
.underline {
    width: 100%;
    border-bottom: 2px solid #666;
    margin: 20px auto 0; /* 로고와 언더라인 간격 */
}

/* 로그인/회원가입 또는 사용자 정보 영역 */
.user-section {
    position: absolute;
    right: 10px;
    top: 20px;
    font-size: 0.8rem;
    font-weight: 700;
    display: flex;
    gap: 10px;
    align-items: center;
}

.user-section button {
    background: transparent;
    border: 1px solid #666;
    color: #eee;
    padding: 5px 12px;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
    margin-top: 15px
}

.user-section button:hover {
    background-color: #333;
}

/* 사용자 이름 스타일 */
.user-name {
	color: orange;
    font-weight: bold;
    margin-right: 10px;
    margin-top: 14px;
}

/* 언더라인 아래 버튼 메뉴 */
.ticketing_menu {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px; /* 언더라인 아래 공간 */
}

.ticketing_menu button {
    background: transparent;
    border: 1px solid #666;
    color: #eee;
    padding: 8px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 700;
    transition: 0.3s;
}
.logo button {
	position: absolute;
    left: 6px;
    top: 16px;
    background-color: black;
    border: none;
    margin-top: 2px;
}
.logo img {
	
	width: 70px;
	height: 70px;
	border: none;
}

.ticketing_menu button:hover {
    background-color: #333;
}
</style>

<div class="header-container">
    <div class="header-inner">
    	<div class="logo">
	    		<form action="home.do">
	    			<button type="submit" ><img src="images/cinemaLogo.png"></button>
	    		</form>
	    </div>
	    
        <div class="user-section">
	        
            <% 
            // 세션에서 로그인 사용자 정보 가져오기
            userList.UserListVO loginUser = (userList.UserListVO)session.getAttribute("loginUser");
            
            if (loginUser != null) { 
                // 로그인된 상태
            %>
                <span class="user-name"><%=loginUser.getUserName()%>님</span>
                <form action="myPage.do" style="display: inline;">
                    <button type="submit">마이페이지</button>
                </form>
                <form action="logout.do" style="display: inline;">
                    <button type="submit">로그아웃</button>
                </form>
            <% 
            } else { 
                // 로그인되지 않은 상태
            %>
                <form action="login.jsp" method="post" style="display: inline;">
                    <button type="submit">로그인</button>
                </form>
                <form action="register.jsp" method="post" style="display: inline;">
                    <button type="submit">회원가입</button>
                </form>
            <% } %>
        </div>

        <!-- 로고 -->
        <h1>
            <a href="home.do" style="color: inherit; text-decoration: none;">
                <div>공간 시네마</div>
                <div>LX-CINEMA</div>
            </a>
        </h1>

        <!-- 언더라인 -->
        <div class="underline"></div>

        <!-- 언더라인 아래 버튼 메뉴 -->
        <div class="ticketing_menu">
            <form action="reserve.do" method="get" style="display: inline;">
                <button type="submit">예매</button>
            </form>
            <form action="movie.do" method="get" style="display: inline;">
                <button type="submit">영화</button>
            </form>
            <form action="event.do" method="get" style="display: inline;">
                <button type="submit">이벤트</button>
            </form>
        </div>
    </div>
</div>