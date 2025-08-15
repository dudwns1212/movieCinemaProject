package seatList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SeatListDAO {

	// 좌석목록
	public List<SeatListVO> findSeatsForSchedule(int scheduleId) throws Exception {
		String sql = "SELECT st.seat_id, st.room_id, st.row_name, st.col_number, "
				+ "       CASE WHEN r.reservation_id IS NULL THEN 0 ELSE 1 END AS booked "
				+ "FROM schedules sc "
				+ "JOIN seats st ON st.room_id = sc.room_id " 
				+ "LEFT JOIN reservations r "
				+ "  ON r.seat_id = st.seat_id AND r.schedule_id = sc.schedule_id " 
				+ "WHERE sc.schedule_id = ? "
				+ "ORDER BY st.row_name, st.col_number";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, scheduleId);

			try (ResultSet rs = ps.executeQuery()) {
				List<SeatListVO> list = new ArrayList<>();
				while (rs.next()) {
					SeatListVO vo = new SeatListVO();
					vo.setSeatId(rs.getInt("seat_id"));
					vo.setRoomId(rs.getInt("room_id"));
					vo.setRowName(rs.getString("row_name"));
					vo.setColNumber(rs.getInt("col_number"));
					vo.setBooked(rs.getInt("booked") == 1); // 0/1 → boolean 변환 1이면 예약완료 0이면 예약가능
					list.add(vo);
				}
				return list;
			}
		}
	}


	private static Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envContext.lookup("jdbc/teamproject"); 
		return dataSource.getConnection();
	}
}