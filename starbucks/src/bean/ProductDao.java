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
		
		sql = "insert into itemboard values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConn.getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getItem_code()); // 자동생성
			ps.setString(2, vo.getItem_group());
			ps.setString(3, vo.getItem_title());
			ps.setString(4, vo.getItem_content());
			ps.setInt(5, vo.getItem_savedmoney());
			ps.setString(6, vo.getItem_theme());
			ps.setString(7, vo.getItem_size());
			ps.setInt(8, vo.getItem_price());
			ps.setInt(9, vo.getItem_num());
			ps.setString(10, vo.getItem_mainimg());
			ps.setString(11, vo.getItem_thumnailimg());
			ps.setString(12, vo.getItem_contentimg());
			ps.setInt(13, vo.getOrder_sumnum());
			ps.setString(14, vo.getItem_regDate());
			ps.setInt(15, vo.getItem_postnum());
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "";
	}
}
