package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao_YD {

	Connection conn;
	
	public ProductDao_YD() {
		conn = DBConn.getConn();
	}
	
	
	
	
	public List<ProductVo> select(){
		List<ProductVo> list = new ArrayList<ProductVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {


			
			
			
		} catch (Exception e) {
			
		}
		
		
		return list;
	}
	
}
