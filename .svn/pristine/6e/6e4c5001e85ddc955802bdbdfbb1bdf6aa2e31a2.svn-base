package reserveList; // 또는 적절한 패키지

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import movieList.MovieListDAO;
import movieList.MovieListVO;

@WebServlet("/reserve.do")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String movieIdStr = req.getParameter("movieId");

        // movieIdStr가 null이거나 비어있지 않은지 확인
        if (movieIdStr != null && !movieIdStr.isEmpty()) {
            int movieId = Integer.parseInt(movieIdStr);
            
            MovieListDAO dao = new MovieListDAO();
            MovieListVO movie = dao.getMovieDetail(movieId);
            
            req.setAttribute("movie", movie);
            
            RequestDispatcher dispatcher = req.getRequestDispatcher("reserve.jsp");
            dispatcher.forward(req, resp);

        } else {
            // movieId가 없을 때의 예외 처리 (예: 에러 페이지로 보내기)
            System.out.println("movieId 파라미터가 누락되었습니다.");
            // res.sendRedirect("errorPage.jsp"); // 이런 식으로 처리 가능
        }
    }
}
	    