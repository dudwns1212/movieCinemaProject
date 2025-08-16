package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cinemaList.CinemaListDAO;
import cinemaList.CinemaListVO;
import movieList.MovieListDAO;
import movieList.MovieListVO;

// 모든 영화 관련 요청을 하나의 서블릿에서 처리
@WebServlet(urlPatterns = { "/movieList.do", "/movieDetail.do", "/reserve.do",})
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String uri = req.getRequestURI();
		String forwardPage = "/home.jsp"; // 기본 페이지
		
		System.out.println("요청된 URI: " + uri);
		
		MovieListDAO mdao = new MovieListDAO();
		CinemaListDAO cdao = new CinemaListDAO();
		
		// URI에 따라 다른 처리 수행
		if (uri.endsWith("/movieList.do")) {
			// 영화 목록 조회 (예매 페이지용)
			System.out.println("영화 목록 조회 요청");
			List<MovieListVO> movieList = mdao.getMovieList();
			List<CinemaListVO> cinemaList = cdao.getCinemaList();
			req.setAttribute("movieList", movieList);
			req.setAttribute("cinemaList", cinemaList);
			
			forwardPage = "/reserve.jsp";
			
		} else if (uri.endsWith("/movieDetail.do")) {
			// TOP 10 영화 목록 조회 (홈페이지용)
			System.out.println("TOP 10 영화 목록 조회 요청");

			List<MovieListVO> movieList = mdao.getTop10Movies();

			// 확인용 로그
			if (movieList != null && !movieList.isEmpty()) {
				System.out.println("서블릿: DB에서 TOP 10 영화 " + movieList.size() + "개의 정보를 가져왔습니다.");
				System.out.println("첫 번째 영화 제목: " + movieList.get(0).getMovieTitle());
				System.out.println("첫 번째 영화 포스터: " + movieList.get(0).getPoster());
			} else {
				System.out.println("서블릿: DB에서 영화 정보를 가져오지 못했거나, 목록이 비어있습니다.");
			}

			req.setAttribute("movieTop10List", movieList);
			forwardPage = "/movie.jsp";

		} else if (uri.endsWith("/reserve.do")) {
			// 예매 페이지 처리 (특정 영화 선택)
			System.out.println("예매 페이지 요청");

			String movieIdStr = req.getParameter("movieId");

			if (movieIdStr != null && !movieIdStr.isEmpty()) {
				// 특정 영화가 선택된 경우
				try {
					int movieId = Integer.parseInt(movieIdStr);
					MovieListVO movie = mdao.getMovieDetail(movieId);

					if (movie != null) {
						System.out.println("선택된 영화: " + movie.getMovieTitle());
						req.setAttribute("selectedMovie", movie);
					} else {
						System.out.println("해당 ID의 영화를 찾을 수 없습니다: " + movieId);
						forwardPage = "/home.jsp";
					}

				} catch (NumberFormatException e) {
					System.out.println("잘못된 movieId 형식: " + movieIdStr);
					forwardPage = "/home.jsp";
				}
			}
			forwardPage = "/detail.jsp";
		}

		// JSP로 포워드
		System.out.println("포워드할 페이지: " + forwardPage);
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPage);
		dispatcher.forward(req, resp);

	}
}
