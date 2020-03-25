package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import bean.DBConn;

public class ProductDao {

	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String upload = "c:/Users/Ellen/git/web1/1907-web/WebContent/upload/";
//	String upload = "c:/Users/JHTA/git/web1/1907-web/WebContent/upload/";
	String sql="";
	
	public String insert(ProductVo vo) {
		
		sql = "insert into itemboard values(?||to_char(sysdate,'rrmmdd')||'-'||seq_itemcode.nextval, seq_item_postnum.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getItem_group()); // 자동생성 item_code
			ps.setString(2, vo.getItem_group()); // selected box에서 가져옴
			ps.setString(3, vo.getItem_title()); // 아이템명
			ps.setString(4, vo.getItem_content()); // 설명
			ps.setDouble(5, vo.getItem_price()*0.05); // 가격의 5%
			ps.setString(6, vo.getItem_theme()); // 테마
			ps.setString(7, vo.getItem_size()); // 사이즈
			ps.setInt(8, vo.getItem_price()); // 가격
			ps.setInt(9, vo.getItem_num()); // 수량 (재고)
			ps.setString(10, vo.getItem_mainimg()); // 메인 이미지 path
			ps.setString(11, vo.getItem_thumnailimg()); // 썸네일 이미지 path
			ps.setString(12, vo.getItem_contentimg()); // contentimg path
			ps.setInt(13, 10); // 누적판매개수
			ps.setString(14, vo.getItem_regDate()); // 등록날짜
			
			if(ps.executeUpdate()>0) {
				conn.commit();
				return "성공";
			}else {
				conn.rollback();
				return "오류발생";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "DB오류발생";
	}
}
