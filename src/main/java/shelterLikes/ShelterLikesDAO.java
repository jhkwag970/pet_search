package shelterLikes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ShelterLikesDAO {


	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ShelterLikesDAO() throws ClassNotFoundException, SQLException {
		this.con = new ShelterLikesDBConn().getConnection();
		System.out.println("DB연결 됨");
		System.out.println();
	}
	
	public void readAll() {
		
		String sql= "SELECT * FROM shelter_likes";
		String result = null;
		
		try {
			//sql 실행
			Statement st = con.createStatement();

			//ResultSet
			//1. 결과값을 저장할 수 있다.
			//2. 저장된 값을 한 행 단위로 불러올 수 있다.
			//3. 한 행에서 값을 가져올때는 타입을 지정해 불러올 수 있다.
			this.rs = st.executeQuery(sql);

			while(this.rs.next()) {
			    String e_noticeNo = rs.getString("notice_no");
			    String e_memId = rs.getString("mem_id");
			    String e_likeState = rs.getString("like_state");
			    System.out.println(rs.getRow()+ "\t" + e_memId + "\t" + e_noticeNo + "\t" + e_likeState);
			} //getRow : 행번호 출력
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String readLikeState(String memId, String noticeNo) {
		
		String result = null;
		String sql= "SELECT like_state FROM shelter_likes WHERE mem_id = ? and notice_no = ?";
		
		try {
			this.pstmt = con.prepareStatement(sql);
			this.pstmt.setString(1, memId);
			this.pstmt.setString(2, noticeNo);
			this.rs = pstmt.executeQuery();
			if (this.rs.next()) {
				if(this.rs.getString("like_state").equals("yes")) {
					return result = "yes";
				}else {
					return result = "no";
				}
			}else {
				return "null";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public void updateLikeState(String memId, String noticeNo, String noticeEdt, String likeState) {
		
		String sql= "UPDATE shelter_likes SET like_state = ?,end_date = ? WHERE mem_id = ? and notice_no = ?";//"SELECT like_state FROM shelter_likes WHERE mem_id = ? and notice_no = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, likeState);
			pstmt.setString(2, noticeEdt);
			pstmt.setString(3, memId);
			pstmt.setString(4, noticeNo);
			int r = pstmt.executeUpdate();
			
			System.out.println("변경된 row : " + r);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertAll(String memId, String noticeNo, String noticeEdt) {
		
		String checkIndex = readLikeState(memId, noticeNo);
		
		String sql= "INSERT into shelter_likes(notice_no,mem_id,like_state,end_date) VALUES (?,?,'no',?)";
		
		try {
			if(checkIndex.equals("null")) {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, noticeNo);
				pstmt.setString(2, memId);
				pstmt.setString(3, noticeEdt);
				int r = pstmt.executeUpdate();
				
				System.out.println("삽입된 row : " + r);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void DBclose() throws SQLException {
		if(rs!=null) {
			System.out.println("ShelterLikeDAO rs 닫힘");
			this.rs.close();
		}
		if(pstmt !=null) {
			System.out.println("ShelterLikeDAO pstmt 닫힘");
			pstmt.close();
		}
		if(con !=null) {
			System.out.println("ShelterLikeDAO con 닫힘");
			con.close();
		}
		System.out.println();
		System.out.println();
	}
}
