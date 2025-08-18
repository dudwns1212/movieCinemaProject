# movieCinemaProject
두번째 프로젝트/ 영화예매사이트

# LX-CINEMA 영화관 홈페이지 & 예매 시스템 분석 문서

## 🎬 시스템 개요

**LX-CINEMA (공간 시네마)** 는 Java 기반의 웹 애플리케이션으로 구현된 영화관 홈페이지 및 예매 시스템입니다. 사용자가 영화를 조회하고, 좌석을 선택하여 예매할 수 있는 완전한 기능을 제공합니다.

---

## 🏗️ 시스템 아키텍처

### 1. 기술 스택
- **Frontend**: JSP, HTML5, CSS3, JavaScript (jQuery)
- **Backend**: Java Servlet, JSP
- **Database**: MySQL (JDBC 연결)
- **Server**: Apache Tomcat
- **패턴**: MVC (Model-View-Controller) 패턴

### 2. 디렉토리 구조
```
📁 프로젝트 루트
├── 📁 servlet/          # 서블릿 컨트롤러
├── 📁 JSP 페이지/       # 뷰 계층
├── 📁 DAO 클래스/       # 데이터 액세스 계층
├── 📁 VO 클래스/        # 데이터 객체
└── 📁 asset/           # 정적 리소스
```

---

## 🔧 주요 컴포넌트 분석

### 1. 서블릿 컨트롤러 (Controller Layer)

#### **UserServlet.java** - 사용자 관리 통합 컨트롤러
- **경로**: `*.do` (모든 .do 요청 처리)
- **주요 기능**:
  - 로그인/로그아웃 처리 (`login.do`, `logout.do`)
  - 회원가입 (`register.do`)
  - 회원정보 수정 (`update.do`, `checkPw.do`)
  - 마이페이지 (`myPage.do`)
  - 예매내역 조회 (`history.do`)
  - 회원탈퇴 (`delete.do`)

#### **MovieServlet.java** - 영화 관리 컨트롤러
- **경로**: 영화 관련 요청 처리
- **주요 기능**:
  - 영화 목록 조회 (`movieList.do`)
  - 영화 상세 정보 (`movieDetail.do`)
  - 장르별 영화 필터링 (`movieGenre.do`)
  - 영화 좋아요 기능 (`movieLike.do`)
  - 예매 페이지 이동 (`reserve.do`)

#### **CinemaServlet.java** - 영화관 정보 서블릿
- **경로**: `/CinemaServlet`
- **주요 기능**:
  - 지역별 영화관 조회
  - AJAX 응답으로 JSON 데이터 반환

#### **ScheduleServlet.java** - 상영 일정 서블릿
- **경로**: `/scheduleDate.do`, `/scheduleTime.do`
- **주요 기능**:
  - 영화-영화관별 상영 날짜 조회
  - 특정 날짜의 상영 시간 조회
  - AJAX로 실시간 스케줄 데이터 제공

### 2. 데이터 액세스 계층 (DAO)

#### **UserListDAO.java** - 사용자 데이터 처리
- **기능**:
  - 로그인 인증 (`login()`)
  - 회원가입 (`register()`)
  - 회원정보 수정 (`update()`)
  - 회원탈퇴 (`delete()`)
  - 비밀번호 확인 (`checkUser()`)

#### **MovieListDAO.java** - 영화 데이터 처리
- **기능**:
  - 전체 영화 목록 조회
  - 장르별 영화 필터링
  - 영화 상세 정보 조회
  - 좋아요 기능 (토글, 카운트)

#### **ScheduleListDAO.java** - 상영 일정 데이터 처리
- **기능**:
  - 영화-영화관별 상영 날짜 조회
  - 상영 시간 조회
  - 스케줄 ID와 시간 매핑

#### **CinemaListDAO.java** - 영화관 데이터 처리
- **기능**:
  - 지역별 영화관 목록 조회

#### **ReserveListDAO.java** - 예매 데이터 처리
- **기능**:
  - 사용자별 예매내역 조회
  - 예매 정보 관리

### 3. 뷰 계층 (JSP Pages)

#### **header.jsp** - 공통 헤더
- **기능**:
  - 사이트 로고 및 브랜딩
  - 로그인/로그아웃 상태 표시
  - 주요 메뉴 (예매, 영화, 이벤트)
  - 반응형 디자인

#### **movie.jsp** - 영화 목록 페이지
- **기능**:
  - 그리드 레이아웃으로 영화 카드 표시
  - 영화 포스터, 제목, 장르, 상영시간 정보
  - 좋아요 기능
  - 반응형 카드 레이아웃

#### **reserve.jsp** - 예매 페이지
- **기능**:
  - 영화, 영화관, 날짜, 시간 선택
  - 단계별 예매 프로세스
  - AJAX를 통한 동적 데이터 로딩
  - 실시간 좌석 선택

#### **login.jsp / register.jsp** - 인증 페이지
- **기능**:
  - 사용자 로그인/회원가입 폼
  - 입력 유효성 검사
  - 에러 메시지 표시
  - 배경 이미지 및 투명 오버레이

#### **myPage.jsp** - 마이페이지
- **기능**:
  - 회원정보 수정 인터페이스
  - 예매내역 확인 링크
  - 카드 형태의 UI 디자인

#### **history.jsp** - 예매내역 페이지
- **기능**:
  - 사용자 예매내역 목록 표시
  - 예매번호, 영화정보, 상영시간 표시
  - 예매 취소 기능

---

## 🌟 주요 기능 및 장점

### 1. 사용자 인증 시스템
**특징**:
- 세션 기반 로그인 관리
- 비밀번호 확인 후 정보 수정
- 안전한 로그아웃 처리

**장점**:
- 보안성 확보
- 사용자 경험 향상
- 세션 관리 최적화

### 2. 실시간 영화 예매 시스템
**특징**:
- AJAX 기반 비동기 통신
- 단계별 예매 프로세스
- 실시간 스케줄 조회

**장점**:
- 페이지 새로고침 없는 UX
- 빠른 응답 속도
- 직관적인 사용자 인터페이스

### 3. 반응형 웹 디자인
**특징**:
- CSS Grid와 Flexbox 활용
- 모바일 친화적 레이아웃
- 다크 테마 적용

**장점**:
- 다양한 기기에서 최적화된 경험
- 현대적이고 세련된 디자인
- 접근성 향상

### 4. 모듈화된 아키텍처
**특징**:
- MVC 패턴 적용
- 컴포넌트별 역할 분리
- 재사용 가능한 코드 구조

**장점**:
- 유지보수성 향상
- 확장성 확보
- 코드 가독성 증대

### 5. 데이터베이스 연동
**특징**:
- JDBC를 통한 MySQL 연결
- Connection Pool 활용
- 트랜잭션 관리

**장점**:
- 안정적인 데이터 처리
- 성능 최적화
- 데이터 무결성 보장

---

## 🔄 시스템 플로우

### 1. 사용자 예매 프로세스
```
1. 영화 선택 (movie.jsp)
   ↓
2. 예매 페이지 이동 (reserve.jsp)
   ↓
3. 영화관 선택 (AJAX 호출)
   ↓
4. 날짜 선택 (AJAX 호출)
   ↓
5. 시간 선택 (AJAX 호출)
   ↓
6. 좌석 선택 (seat.jsp)
   ↓
7. 결제 및 예매 완료
```

### 2. 데이터 흐름
```
사용자 요청 → Servlet → DAO → Database
                ↓
JSP ← Model ← Controller ← Database 응답
```

---

## 📊 기술적 우수성

### 1. **성능 최적화**
- Connection Pool을 통한 DB 연결 관리
- AJAX를 활용한 비동기 데이터 로딩
- CSS/JS 파일 최적화

### 2. **보안성**
- SQL Injection 방지 (PreparedStatement 사용)
- 세션 기반 인증 시스템
- 입력값 검증 및 필터링

### 3. **확장성**
- 모듈화된 컴포넌트 구조
- 재사용 가능한 DAO 패턴
- 유연한 MVC 아키텍처

### 4. **사용자 경험**
- 직관적인 UI/UX 디자인
- 반응형 레이아웃
- 실시간 피드백 제공

---

## 🎯 결론

LX-CINEMA 시스템은 현대적인 웹 개발 기술을 활용하여 구현된 완성도 높은 영화관 예매 시스템입니다. MVC 패턴을 기반으로 한 체계적인 아키텍처, AJAX를 활용한 사용자 경험 최적화, 그리고 반응형 디자인을 통한 접근성 향상 등이 주요 강점입니다.

특히 실시간 예매 시스템과 사용자 인증 관리, 데이터베이스 연동 등의 핵심 기능이 안정적으로 구현되어 있어, 실제 운영 환경에서도 충분히 활용 가능한 시스템입니다.

---

*문서 작성일: 2025년 8월*  
*시스템 버전: LX-CINEMA v1.0*

# LX-CINEMA 파일별 상세 분석 가이드

## 📁 프로젝트 구조 개요

```
LX-CINEMA/
├── 🎮 Controller (Servlet)     # 요청 처리 및 흐름 제어
├── 📊 Model (DAO + VO)         # 데이터 처리 및 비즈니스 로직
├── 🖼️ View (JSP)               # 사용자 인터페이스
└── 🎨 Assets                   # 정적 리소스
```

---

## 🎮 Controller Layer (Servlet)

### **1. UserServlet.java** - 사용자 관리 핵심 컨트롤러

```java
@WebServlet("*.do")  // 모든 .do 요청을 이 서블릿이 처리
public class UserServlet extends HttpServlet {
    UserListDAO udao = new UserListDAO();
    MovieListDAO mdao = new MovieListDAO();
    ReserveListDAO rdao = new ReserveListDAO();
    
    protected void service(HttpServletRequest req, HttpServletResponse resp) {
        String uri = req.getRequestURI();  // 요청 URI 분석
        
        if (uri.endsWith("login.do")) {
            // 로그인 처리 로직
        } else if (uri.endsWith("register.do")) {
            // 회원가입 처리 로직
        }
        // ... 기타 요청 처리
    }
}
```

**주요 기능**:
- **로그인/로그아웃**: `login.do`, `logout.do`
- **회원가입**: `register.do`
- **회원정보 수정**: `update.do`, `checkPw.do`
- **마이페이지**: `myPage.do`
- **예매내역**: `history.do`
- **회원탈퇴**: `delete.do`

**코드 특징**:
- Front Controller 패턴 사용
- URI 기반 요청 라우팅
- 세션 관리로 로그인 상태 유지

### **2. MovieServlet.java** - 영화 관리 컨트롤러

```java
if (uri.endsWith("/movieList.do")) {
    // 전체 영화 목록 조회
    List<MovieListVO> movieList = mdao.getMovieList();
    req.setAttribute("movieList", movieList);
    forwardPage = "/movie.jsp";
    
} else if (uri.endsWith("/movieGenre.do")) {
    // 장르별 영화 필터링
    String genre = req.getParameter("genre");
    List<MovieListVO> movieList = mdao.getGenreMovies(genre);
    req.setAttribute("movieList", movieList);
    forwardPage = "/movie.jsp";
}
```

**주요 기능**:
- 영화 목록 조회
- 장르별 필터링
- 영화 좋아요 기능
- 예매 페이지 연결

### **3. CinemaServlet.java** - 영화관 정보 서블릿

```java
@WebServlet("/CinemaServlet")
public class CinemaServlet extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse resp) {
        String location = req.getParameter("location");
        
        // DAO를 통해 지역별 영화관 조회
        List<CinemaListVO> cinemas = cdao.getCinemasByLocation(location);
        
        // JSON 형태로 응답 생성
        String result = "{";
        for (int i = 0; i < cinemas.size(); i++) {
            result += "\"" + cinema.getCinemaId() + "\":\"" + cinema.getName() + "\"";
        }
        result += "}";
        
        out.println(result);  // AJAX 응답
    }
}
```

**특징**: AJAX 요청 처리, JSON 응답 반환

### **4. ScheduleServlet.java** - 상영 일정 서블릿

```java
@WebServlet(urlPatterns = {"/scheduleDate.do", "/scheduleTime.do"})
public class ScheduleServlet extends HttpServlet {
    if (uri.endsWith("/scheduleDate.do")) {
        // 영화-영화관별 상영 날짜 조회
        List<String> dates = sdao.getScheduleDateList(movieId, cinemaId);
        
    } else if (uri.endsWith("/scheduleTime.do")) {
        // 특정 날짜의 상영 시간 조회
        List<String> times = sdao.getScheduleTimeList(movieId, cinemaId, date);
    }
}
```

**특징**: 실시간 스케줄 정보 제공, AJAX 통신

---

## 📊 Model Layer (DAO + VO)

### **VO 클래스 (Value Object) - 데이터 구조 정의**

#### **1. UserListVO.java** - 사용자 정보 객체
```java
public class UserListVO {
    private int userNo;          // 사용자 번호 (PK)
    private String userId;       // 로그인 ID
    private String userName;     // 사용자 이름
    private String userPassword; // 비밀번호
    private int userAge;         // 나이
    private String userMobile;   // 휴대폰 번호
    
    // Getter/Setter 메서드들...
}
```

#### **2. MovieListVO.java** - 영화 정보 객체
```java
public class MovieListVO {
    private int movieId;        // 영화 ID (PK)
    private String movieTitle;  // 영화 제목
    private int moviePrice;     // 가격
    private int movieTime;      // 상영시간
    private String genre;       // 장르
    private String poster;      // 포스터 이미지 경로
    private String synopsis;    // 줄거리
    private Integer likeCount;  // 좋아요 수
    
    // Getter/Setter 메서드들...
}
```

#### **3. ScheduleListVO.java** - 상영 일정 객체
```java
public class ScheduleListVO {
    private int scheduleId;     // 스케줄 ID (PK)
    private int movieId;        // 영화 ID (FK)
    private int cinemaId;       // 영화관 ID (FK)
    private Date showDate;      // 상영 날짜
    private Time showTime;      // 상영 시간
    
    // 조인 정보
    private String movieTitle;  // 영화 제목
    private String cinemaName;  // 영화관 이름
    private String poster;      // 포스터
}
```

### **DAO 클래스 (Data Access Object) - 데이터 처리 로직**

#### **1. UserListDAO.java** - 사용자 데이터 처리

```java
public class UserListDAO {
    // 로그인 처리
    public UserListVO login(String id, String pw) {
        String sql = "SELECT * FROM users WHERE id = ? AND password = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {
            
            psmt.setString(1, id);
            psmt.setString(2, pw);
            
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    UserListVO vo = new UserListVO();
                    vo.setUserNo(rs.getInt("user_id"));
                    vo.setUserId(rs.getString("id"));
                    // ... 기타 필드 설정
                    return vo;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // 회원가입 처리
    public boolean register(UserListVO user) {
        String sql = "INSERT INTO users (id, password, name, age, mobile) VALUES (?, ?, ?, ?, ?)";
        // ... 구현 로직
    }
}
```

**주요 메서드**:
- `login()`: 로그인 인증
- `register()`: 회원가입
- `update()`: 회원정보 수정
- `delete()`: 회원탈퇴
- `checkUser()`: 사용자 정보 조회

#### **2. MovieListDAO.java** - 영화 데이터 처리

```java
public class MovieListDAO {
    // 전체 영화 목록 조회
    public List<MovieListVO> getMovieList() {
        String sql = "SELECT m.movie_id AS movieId, " +
                    "m.title AS movieTitle, " +
                    "m.price AS moviePrice, " +
                    "m.movieTime, m.genre, m.poster, m.synopsis, " +
                    "COALESCE(ml.cnt,0) AS likeCount " +
                    "FROM movies m " +
                    "LEFT JOIN (SELECT movie_id, COUNT(*) AS cnt FROM movie_like GROUP BY movie_id) ml " +
                    "ON ml.movie_id = m.movie_id " +
                    "ORDER BY m.movie_id DESC";
        
        List<MovieListVO> movieList = new ArrayList<>();
        // ... 구현 로직
    }
    
    // 장르별 영화 조회
    public List<MovieListVO> getGenreMovies(String genre) {
        String sql = "SELECT * FROM movies WHERE genre = ?";
        // ... 구현 로직
    }
}
```

#### **3. ScheduleListDAO.java** - 상영 일정 데이터 처리

```java
public class ScheduleListDAO {
    // 상영 날짜 목록 조회
    public List<String> getScheduleDateList(int movieId, int cinemaId) {
        String sql = "SELECT DISTINCT show_date FROM schedules " +
                    "WHERE movie_id = ? AND cinema_id = ? " +
                    "ORDER BY show_date";
        // ... 구현 로직
    }
    
    // 상영 시간 목록 조회
    public List<String> getScheduleTimeList(int movieId, int cinemaId, String showDate) {
        String sql = "SELECT show_time FROM schedules " +
                    "WHERE movie_id = ? AND cinema_id = ? AND show_date = ? " +
                    "ORDER BY show_time";
        // ... 구현 로직
    }
}
```

---

## 🖼️ View Layer (JSP)

### **1. header.jsp** - 공통 헤더

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="header-container">
    <div class="header-inner">
        <!-- 로고 -->
        <div class="logo">
            <form action="home.do">
                <button type="submit">
                    <img src="asset/images/lxcinema.png">
                </button>
            </form>
        </div>
        
        <!-- 사용자 섹션 -->
        <div class="user-section">
            <% 
            UserListVO loginUser = (UserListVO)session.getAttribute("loginUser");
            if (loginUser != null) { 
            %>
                <span class="user-name"><%=loginUser.getUserName()%>님</span>
                <form action="myPage.do" style="display: inline;">
                    <button type="submit">마이페이지</button>
                </form>
                <form action="logout.do" style="display: inline;">
                    <button type="submit">로그아웃</button>
                </form>
            <% } else { %>
                <form action="login.jsp" method="post">
                    <button type="submit">로그인</button>
                </form>
                <form action="register.jsp" method="post">
                    <button type="submit">회원가입</button>
                </form>
            <% } %>
        </div>

        <!-- 메뉴 -->
        <div class="ticketing_menu">
            <form action="movieList.do" method="get">
                <button type="submit">예매</button>
            </form>
            <form action="movieDetail.do" method="get">
                <button type="submit">영화</button>
            </form>
            <form action="event.do" method="get">
                <button type="submit">이벤트</button>
            </form>
        </div>
    </div>
</div>
```

**특징**:
- 로그인 상태에 따른 동적 메뉴 표시
- 공통 네비게이션 제공
- 반응형 디자인

### **2. movie.jsp** - 영화 목록 페이지

```jsp
<main class="container">
    <!-- Bootstrap 캐러셀 -->
    <div id="movieCarousel" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="asset/images/love.png" class="d-block w-100">
            </div>
            <!-- 추가 슬라이드들... -->
        </div>
    </div>

    <!-- 장르 필터 -->
    <nav class="genre-filter">
        <a class="genre-chip <%= (selected==null ? "active" : "") %>" href="movieDetail.do">전체</a>
        <a class="genre-chip <%= "로맨스".equals(selected) ? "active" : "" %>" href="movieGenre.do?genre=로맨스">로맨스</a>
        <!-- 기타 장르들... -->
    </nav>

    <!-- 영화 카드 그리드 -->
    <div class="grid">
        <c:forEach var="movie" items="${movieList}" varStatus="status">
            <div class="movie-wrapper">
                <div class="card" data-movie-id="${movie.movieId}">
                    <!-- 순위 뱃지 -->
                    <div class="rank-badge">${status.index + 1}</div>
                    
                    <!-- 좋아요 정보 -->
                    <div class="like-count">${movie.likeCount}</div>
                    <div class="like-btn" onclick="toggleLike(${movie.movieId})">♥</div>
                    
                    <!-- 포스터 -->
                    <div class="poster">
                        <img src="${movie.poster}" alt="${movie.movieTitle}">
                        <div class="overlay"></div>
                    </div>
                    
                    <!-- 호버 시 나타나는 버튼들 -->
                    <div class="card-foot">
                        <a href="reserve.do?movieId=${movie.movieId}" class="btn brand">예매</a>
                        <a href="detail.do?movieId=${movie.movieId}" class="btn detail">상세정보</a>
                    </div>
                </div>
                
                <!-- 영화 정보 -->
                <div class="movie-info">
                    <div class="movie-title">${movie.movieTitle}</div>
                    <div class="movie-time">${movie.movieTime}분</div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>
```

**CSS 특징**:
```css
:root {
    --page-max: 1200px;     /* 최대 너비 */
    --page-pad-x: 20px;     /* 좌우 패딩 */
    --grid-gap: 45px;       /* 카드 간격 */
    --card-min: 200px;      /* 카드 최소폭 */
}

.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(var(--card-min), 1fr));
    gap: var(--grid-gap);
}

.card {
    aspect-ratio: 2 / 3;    /* 포스터 비율 */
    border-radius: 12px;
    transition: 0.3s;
}
```

### **3. reserve.jsp** - 예매 페이지

```jsp
<div class="wrap">
    <h1>빠른예매</h1>
    <div class="grid">
        <!-- 영화 선택 패널 -->
        <div class="panel">
            <h3>영화</h3>
            <div class="body" id="movieList">
                <!-- 영화 목록이 AJAX로 로드됨 -->
            </div>
        </div>

        <!-- 영화관 선택 패널 -->
        <div class="panel">
            <h3>영화관</h3>
            <div class="body">
                <div class="location-grid">
                    <button onclick="loadCinemas('서울')">서울</button>
                    <button onclick="loadCinemas('경기')">경기</button>
                    <!-- 기타 지역들... -->
                </div>
                <div id="cinemaList"></div>
            </div>
        </div>

        <!-- 예매 정보 요약 패널 -->
        <div class="panel">
            <h3>예매정보</h3>
            <div class="body">
                <div id="reservationSummary">
                    선택된 정보가 여기에 표시됩니다.
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// AJAX를 통한 실시간 데이터 로딩
function loadCinemas(location) {
    $.ajax({
        url: 'CinemaServlet',
        data: { location: location },
        success: function(data) {
            // JSON 응답을 파싱하여 영화관 목록 표시
        }
    });
}

function loadScheduleDates() {
    $.ajax({
        url: 'scheduleDate.do',
        data: { 
            movieId: selectedMovieId, 
            cinemaId: selectedCinemaId 
        },
        success: function(data) {
            // 상영 날짜 목록 표시
        }
    });
}
</script>
```

### **4. login.jsp / register.jsp** - 인증 페이지

```jsp
<div class="page-wrapper">  <!-- 배경 이미지 래퍼 -->
    <jsp:include page="/header.jsp" />
    
    <div class="login-container">
        <div class="login-box">
            <h1>로그인</h1>
            <form action="login.do" method="post">
                <input type="text" name="id" placeholder="아이디를 입력하세요" required>
                <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required>
                <button type="submit">로그인</button>
                
                <c:if test="${not empty errorMsg}">
                    <p class="error-msg">${errorMsg}</p>
                </c:if>
            </form>
            
            <a href="register.jsp">회원가입</a>
        </div>
    </div>
</div>
```

**CSS 특징**:
```css
.page-wrapper {
    background-image: url('asset/images/mypageback.jpg');
    background-size: cover;
    background-position: center top;
    position: relative;
    min-height: 100vh;
}

.page-wrapper::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    background-color: rgba(0, 0, 0, 0.7);  /* 어두운 오버레이 */
    z-index: 1;
}

.login-container {
    position: relative;
    z-index: 2;  /* 오버레이 위에 표시 */
}
```

### **5. myPage.jsp** - 마이페이지

```jsp
<div class="main-container">
    <div class="page-title">
        <h1>마이페이지</h1>
        <p>회원정보 관리 및 예매 내역을 확인하세요</p>
    </div>

    <!-- 현재 사용자 정보 -->
    <div class="current-user-info">
        <h3>환영합니다, <%=currentUser.getUserName()%>님!</h3>
        <p>회원 ID: <%=currentUser.getUserId()%></p>
    </div>

    <!-- 기능 카드들 -->
    <div class="card-container">
        <div class="edit-card">
            <h3>회원정보 수정</h3>
            <p>비밀번호를 확인하고 회원정보를 수정하세요</p>
            <form action="checkPw.do" method="post">
                <input type="password" name="pw" placeholder="비밀번호를 입력하세요">
                <button type="submit" class="card-button">정보 수정</button>
            </form>
        </div>
        
        <div class="check-card">
            <h3>예매 확인</h3>
            <p>여기서 예매한 내역를 확인하세요</p>
            <form action="history.do">
                <button type="submit" class="card-button">예매 내역</button>
            </form>
        </div>
    </div>
</div>
```

---

## 🎨 주요 기술적 특징

### **1. CSS 최적화 기법**

```css
/* CSS 변수 사용으로 일관성 유지 */
:root {
    --bg: #000000;
    --card: #ffffff;
    --accent: #ff6b35;
    --radius: 8px;
}

/* CSS Grid를 활용한 반응형 레이아웃 */
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 45px;
}

/* CSS 애니메이션과 트랜지션 */
.card {
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform: translateY(-5px);
}
```

### **2. JavaScript/jQuery 최적화**

```javascript
// AJAX를 통한 비동기 데이터 로딩
function loadScheduleData() {
    $.ajax({
        url: 'scheduleDate.do',
        type: 'GET',
        data: { movieId: selectedMovieId, cinemaId: selectedCinemaId },
        dataType: 'json',
        success: function(response) {
            updateDateSelection(response.dates);
        },
        error: function() {
            console.error('스케줄 로딩 실패');
        }
    });
}

// 이벤트 위임을 통한 효율적인 이벤트 처리
$(document).on('click', '.movie', function() {
    $('.movie').removeClass('active');
    $(this).addClass('active');
    updateSelectedMovie($(this).data('movie-id'));
});
```

### **3. 보안 및 성능 특징**

```java
// PreparedStatement를 통한 SQL Injection 방지
String sql = "SELECT * FROM users WHERE id = ? AND password = ?";
PreparedStatement psmt = conn.prepareStatement(sql);
psmt.setString(1, id);
psmt.setString(2, pw);

// Connection Pool 활용
private Connection getConnection() throws Exception {
    Context ctx = new InitialContext();
    DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
    return ds.getConnection();
}

// Try-with-resources로 자원 관리
try (Connection conn = getConnection();
     PreparedStatement ps = conn.prepareStatement(sql)) {
    // 구현 로직
} catch (Exception e) {
    e.printStackTrace();
}
```

---

## 📈 코드 품질 특징

### **1. 일관된 네이밍 컨벤션**
- VO 클래스: `UserListVO`, `MovieListVO`
- DAO 클래스: `UserListDAO`, `MovieListDAO`
- JSP 페이지: `movie.jsp`, `reserve.jsp`

### **2. 모듈화된 구조**
- 각 기능별로 독립적인 DAO 클래스
- 공통 헤더/푸터 분리
- CSS 변수를 통한 스타일 통일

### **3. 에러 처리**
- Try-catch 블록을 통한 예외 처리
- 사용자 친화적인 에러 메시지
- 로그 출력을 통한 디버깅 지원

이렇게 각 파일들이 MVC 패턴을 따라 체계적으로 구성되어 있어, 유지보수가 쉽고 확장 가능한 구조를 가지고 있습니다! 🚀
