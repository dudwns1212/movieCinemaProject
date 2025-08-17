package scheduleList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ScheduleListDAO {
    
    public List<String> getScheduleDateList(int movieId, int cinemaId) {
        String sql = "SELECT DISTINCT show_date FROM schedules " +
                    "WHERE movie_id = ? AND cinema_id = ? " +
                    "ORDER BY show_date";

        List<String> dates = new ArrayList<>();
        
        System.out.println("DAO - 스케줄 날짜 조회: movieId=" + movieId + ", cinemaId=" + cinemaId);

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieId);
            ps.setInt(2, cinemaId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    dates.add(rs.getString("show_date"));
                    System.out.println("조회된 날짜: " + rs.getString("show_date"));
                }
            }
        } catch (Exception e) {
            System.err.println("스케줄 날짜 조회 오류: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("DAO - 총 " + dates.size() + "개 날짜 조회됨");
        return dates;
    }

    public List<String> getScheduleTimeList(int movieId, int cinemaId, String showDate) {
        String sql = "SELECT show_time FROM schedules " +
                    "WHERE movie_id = ? AND cinema_id = ? AND show_date = ? " +
                    "ORDER BY show_time";

        List<String> times = new ArrayList<>();
        
        System.out.println("DAO - 스케줄 시간 조회: movieId=" + movieId + ", cinemaId=" + cinemaId + ", showDate=" + showDate);

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieId);
            ps.setInt(2, cinemaId);
            ps.setString(3, showDate);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    times.add(rs.getString("show_time"));
                    System.out.println("조회된 시간: " + rs.getString("show_time"));
                }
            }
        } catch (Exception e) {
            System.err.println("스케줄 시간 조회 오류: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("DAO - 총 " + times.size() + "개 시간 조회됨");
        return times;
    }

    private static Connection getConnection() throws Exception {
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:comp/env");
        DataSource dataSource = (DataSource) envContext.lookup("jdbc/teamproject");
        Connection connection = dataSource.getConnection();
        return connection;
    }
}