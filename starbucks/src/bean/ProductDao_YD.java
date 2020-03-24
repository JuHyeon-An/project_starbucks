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
		ProductVo vo = new ProductVo();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = "select * from itemboard";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo.setItem_code(rs.getString("ITEM_CODE"));
				vo.setItem_postnum(rs.getInt("ITEM_POSTNUM"));
				vo.setItem_group(rs.getString("ITEM_GROUP"));
				vo.setItem_title(rs.getString("ITEM_TITLE"));
				vo.setItem_content(rs.getString("ITEM_CONTENT"));
				vo.setItem_savedmoney(rs.getInt("ITEM_SAVEDMONEY"));
				vo.setItem_theme(rs.getString("ITEM_THEME"));
				vo.setItem_size(rs.getString("ITEM_SIZE"));
				vo.setItem_price(rs.getInt("ITEM_PRICE"));
				vo.setItem_num(rs.getInt("ITEM_NUM"));
				vo.setItem_mainimg(rs.getString("ITEM_MAINIMG"));
				vo.setItem_thumnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
				
			}
			
			
			
			
		} catch (Exception e) {
			
		}
		
		
		return list;
	}
	
}
