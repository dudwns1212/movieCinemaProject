package scheduleList;

public class ScheduleListVO {
    private int scheduleId;
    private int movieId;
    private int roomId;
    private int cinemaId;
    private String startTime;
    private String roomName;
    private String movieTitle;
    
    public ScheduleListVO() {
    }
    
    // Getter와 Setter 메서드들
    public int getScheduleId() {
        return scheduleId;
    }
    
    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }
    
    public int getMovieId() {
        return movieId;
    }
    
    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }
    
    public int getRoomId() {
        return roomId;
    }
    
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    
    public int getCinemaId() {
        return cinemaId;
    }
    
    public void setCinemaId(int cinemaId) {
        this.cinemaId = cinemaId;
    }
    
    public String getStartTime() {
        return startTime;
    }
    
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
    
    public String getRoomName() {
        return roomName;
    }
    
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    
    public String getMovieTitle() {
        return movieTitle;
    }
    
    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }
}