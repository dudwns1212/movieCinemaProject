package movieList; // 같은 movieList 패키지에 서블릿을 만든다고 가정합니다.

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// '/movieList.do' 라는 요청을 이 서블릿이 처리하도록 설정합니다.
@WebServlet("/movieList.do")
public class MovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. DAO 객체를 생성해서 일을 시킬 준비를 합니다.
        MovieListDAO dao = new MovieListDAO();
        
        // 2. DAO에게 영화 목록을 가져와달라고 요청합니다.
        List<MovieListVO> movieList = dao.getMovieList();
        
        // 3. DAO로부터 받은 결과(movieList)를 'request'라는 상자에 담습니다.
        //    "movieList"라는 이름표를 붙여서 담아두면, JSP에서 이 이름표로 데이터를 꺼내 쓸 수 있어요.
        request.setAttribute("movieList", movieList);
        
        // 4. 결과를 보여줄 movie.jsp 페이지로 요청과 응답 객체를 전달(forward)합니다.
        RequestDispatcher dispatcher = request.getRequestDispatcher("movie.jsp");
        dispatcher.forward(request, response);
    }
}