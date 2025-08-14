package movieList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// 데이터베이스의 'movies' 테이블과 직접 소통하는 클래스
public class MovieListDAO {

    public List<MovieListVO> getMovieList() {
        List<MovieListVO> movieList = new ArrayList<>();
        
        // movies 테이블의 모든 영화를 조회하는 SQL
        String sql = 
            "SELECT " +
            "  movie_id AS movieId, " +      // ← VO와 맞추는 별칭
            "  title    AS movieTitle, " +
            "  price    AS moviePrice, " +
            "  movieTime, " +
            "  genre, " +
            "  poster " +                     // poster 컬럼 추가
            "FROM movies " +
            "ORDER BY movie_id DESC";

        //try-with-resources 문법으로 try문이 끝나면 자동으로 닫음
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            // ResultSet은 try 안에서 별도 선언해서 처리
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // MovieListVO 그릇을 준비하고, DB에서 가져온 데이터를 담습니다.
                    MovieListVO movie = new MovieListVO();
                    
                    // DB의 컬럼명과 VO의 set 메소드를 일치시켜주는 것이 중요해요.
                    movie.setMovieId(rs.getInt("movieId"));
                    movie.setMovieTitle(rs.getString("movieTitle"));
                    movie.setMoviePrice(rs.getInt("moviePrice"));
                    movie.setMovieTime(rs.getInt("movieTime"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setPoster(rs.getString("poster"));  // poster 설정 추가
                    
                    movieList.add(movie); // 데이터가 채워진 그릇을 리스트에 추가
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 콘솔에 출력
        }
        return movieList; // 영화 정보가 가득 담긴 리스트를 반환
    }
    
    // reserve 페이지에서 영화검색
    public MovieListVO getMovieDetail(int movieId) {
        // movie_id를 기준으로 특정 영화 한 편만 조회하는 SQL
        String sql = "SELECT * FROM movies WHERE movie_id = ?";
        
        //try-with-resources 문법으로 try문이 끝나면 자동으로 닫음
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, movieId); // SQL의 첫 번째 ?에 파라미터로 받은 movieId 값을 설정
            
            // ResultSet은 try 안에서 별도 선언해서 처리
            try (ResultSet rs = pstmt.executeQuery()) {
                // 결과가 있다면 (영화가 존재한다면)
                if (rs.next()) {
                    MovieListVO movie = new MovieListVO(); // VO 객체 생성
                    
                    // 결과를 VO 객체에 담기
                    movie.setMovieId(rs.getInt("movie_id"));
                    movie.setMovieTitle(rs.getString("title"));
                    movie.setMoviePrice(rs.getInt("price"));
                    movie.setMovieTime(rs.getInt("movieTime"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setPoster(rs.getString("poster"));  // poster 설정 추가
                    // 만약 poster 정보도 VO에 추가했다면 아래 코드도 추가
                    // movie.setPoster(rs.getString("poster"));
                    
                    return movie; // 완성된 VO 객체 반환
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 콘솔에 출력
        }
        return null; // 일치하는 영화 없거나 에러 발생 시 null 반환
    }
    
    private static Connection getConnection() throws Exception {
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:comp/env");
        DataSource dataSource = (DataSource) envContext.lookup("jdbc/teamproject");
        Connection connection = dataSource.getConnection();
        return connection;
    }
}