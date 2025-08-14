package movieList; // 패키지 이름은 파일 구조에 맞게 movieList로 가정합니다.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// 데이터베이스의 'movies' 테이블과 직접 소통하는 클래스
public class MovieListDAO {

    public List<MovieListVO> getMovieList() {
        List<MovieListVO> movieList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            String dbURL = "jdbc:mysql://localhost:3306/teamproject?serverTimezone=UTC";
            String dbID = "root";
            String dbPassword = "yourpassword";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
            // movies 테이블의 모든 영화를 조회하는 SQL
            String sql = 
                "SELECT " +
                "  movie_id AS movieId, " +      // ← VO와 맞추는 별칭
                "  title    AS movieTitle, " +
                "  price    AS moviePrice, " +
                "  movieTime, " +
                "  genre " +
                "FROM movies " +
                "ORDER BY movie_id DESC";       
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                // MovieListVO 그릇을 준비하고, DB에서 가져온 데이터를 담습니다.
                MovieListVO movie = new MovieListVO();
                
                // DB의 컬럼명과 VO의 set 메소드를 일치시켜주는 것이 중요해요.
                movie.setMovieId(rs.getInt("movieId"));
                movie.setMovieTitle(rs.getString("movieTitle"));
                movie.setMoviePrice(rs.getInt("moviePrice"));
                movie.setMovieTime(rs.getInt("movieTime")); // DB 컬럼명이 movie_time 이라면 "movie_time"
                movie.setGenre(rs.getString("genre"));
                
                movieList.add(movie); // 데이터가 채워진 그릇을 리스트에 추가
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 정리
            try { 
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return movieList; // 영화 정보가 가득 담긴 리스트를 반환
    }
}