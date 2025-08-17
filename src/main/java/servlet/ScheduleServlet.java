package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import scheduleList.ScheduleListDAO;
import scheduleList.ScheduleListVO;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		// 파라미터 받기
		String movieIdStr = req.getParameter("movieId");
		String cinemaIdStr = req.getParameter("cinemaId");
		String result = "";
		try {
			if (movieIdStr == null || movieIdStr.equals("") || cinemaIdStr == null || cinemaIdStr.equals("")) {
				// 필수 파라미터가 없을 때
				result = "{\"dates\":[]}";
			} else {

				int movieId = Integer.parseInt(movieIdStr);
				int cinemaId = Integer.parseInt(cinemaIdStr);

				// DAO 사용해서 데이터베이스에서 날짜 조회
				ScheduleListDAO dao = new ScheduleListDAO();
				List<String> dates = dao.getScheduleDateList(movieId, cinemaId);

				if (dates == null || dates.isEmpty()) {
					result = "{\"dates\":[]}";
				} else {
					result = "{\"dates\":[";
					for (int i = 0; i < dates.size(); i++) {
						result += "\"" + dates.get(i) + "\"";
						// 마지막 항목이 아니면 쉼표 추가
						if (i < dates.size() - 1) {
							result += ",";
						}
					}
					result += "]}";
				}
			}
		} catch (NumberFormatException e) {
			System.out.println("잘못된 파라미터 형식: movieId=" + movieIdStr + ", cinemaId=" + cinemaIdStr);
			result = "{\"dates\":[]}";
		}
		
		System.out.println("서블릿 응답: " + result);  // 디버깅용
        out.println(result);  // 이 줄 추가! - 클라이언트에게 응답 전송
        out.close();
        return;
	}

}
