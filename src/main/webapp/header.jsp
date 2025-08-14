<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* 헤더 컨테이너 */
.header-container {
    width: 100%;
    background-color: transparent; /* 전체는 투명 */
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

h1 {
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

/* 로그인/회원가입 버튼 */
.login, .signup {
    position: absolute;
    top: 20px;
}
.login { right: 100px; }
.signup { right: 10px; }

.login button, .signup button {
    background: transparent;
    border: 1px solid #666;
    color: #eee;
    padding: 5px 12px;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}
.login button:hover, .signup button:hover {
    background-color: #333;
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
.ticketing_menu button:hover {
    background-color: #333;
}
</style>

<div class="header-container">
    <div class="header-inner">
        <!-- 로그인 -->
        <form action="login.jsp" method="get">
            <div class="login"><button>로그인</button></div>
        </form>

        <!-- 회원가입 -->
        <form action="register.jsp" method="get">
            <div class="signup"><button>회원가입</button></div>
        </form>

        <!-- 로고 -->
        <h1>
            <a href="home.do" style="color:inherit;text-decoration:none;">
                <div>공간 시네마</div>
                <div>LX-CINEMA</div>
            </a>
        </h1>

        <!-- 언더라인 -->
        <div class="underline"></div>

        <!-- 언더라인 아래 버튼 메뉴 -->
        <div class="ticketing_menu">
            <form action="seat.do" method="get">
                <button type="submit">예매</button>
            </form>
            <form>
                <button type="button">영화</button>
            </form>
            <form>
                <button type="button">이벤트</button>
            </form>
        </div>
    </div>
</div>
