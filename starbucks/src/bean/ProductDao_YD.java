package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao_YD {

	Connection conn ;
	
	public ProductDao_YD() {
		conn = DBConn.getConn();
	}
	
	public List<ProductVo> select(){
		List<ProductVo> list = new ArrayList<ProductVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			sql = " select * from itemboard ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {
			return list;
		}
	}
	
	

	
	public List<ProductVo> select(Page_ProductList p){
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;

		try {
			sql = " select count(item_code) cnt from itemboard  where item_status='판매' ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			p.setTotListSize(totList);
			p.pageCompute();
			
			sql = "select * from ("
					+ "select rownum rn , A.* from ("
					+ 	" select * "
					+ 	" from itemboard "
					+	" where item_status = '판매' "
					+   " order by item_group ) A "
					+ ") where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, p.getStartNo());
			ps.setInt(2, p.getEndNo());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
		} catch (Exception e) {
			System.out.println("오류뜸" );
			e.printStackTrace();
		} finally {
			return list;
		}
	}
	
//작업중인 다오
	public List<ProductVo> select(Page_ProductList p, String findStr, int sort){  //테마 및 카테고리로 보기
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;
		
		String find = "";
		if(sort == 1) { //상품명순으로 정렬
			find = "item_title";
		}else if(sort == 2) { // 상품명 역순으로 정렬
			find = "item_title desc";
		}else if(sort == 3) { // 상품명 역순으로 정렬
			find =  "item_price";
		}else if(sort == 4) { // 상품명 역순으로 정렬
			find = "item_price desc";
		}
		
		System.out.println(findStr+"검색어 다오");
		try {
			if(!findStr.equals("all")) {
				sql = " select count(item_code) cnt from itemboard where ( item_group = ? or item_theme = ? ) and item_status = '판매' ";
			System.out.println("열로옴/");
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, findStr);
			}else if(findStr.equals("all")) {
				sql = " select count(item_code) cnt from itemboard where item_status = '판매' ";
			
			ps = conn.prepareStatement(sql);
			}
			rs = ps.executeQuery();
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			p.setTotListSize(totList);
			p.pageCompute();
			
			sql = "select * from ("
					+ "select rownum rn , A.* from ("
					+ 	" select * "
					+ 	" from itemboard "
					+	" where item_status = '판매'  ";
			
			if(!findStr.equals("all")) {
				sql = sql + " and ( item_group = ? or item_theme = ? ) ";
				sql = sql +   " order by "+find+" ) A "
						+ ") where rn between ? and ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, findStr);
				ps.setString(2, findStr);
				ps.setInt(3, p.getStartNo());
				ps.setInt(4, p.getEndNo());
			}else if(findStr.equals("all")) {
				System.out.println("엘스이프");
				sql = sql +   " order by "+find+" ) A "
						+ ") where rn between ? and ? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, p.getStartNo());
				ps.setInt(2, p.getEndNo());
				
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
			System.out.println(list.size()+"다오안 리스트 사이즈");
	         rs.close();
	         ps.close();
		} catch (Exception e) {
			System.out.println("오류뜸" );
			e.printStackTrace();
		} finally {
			return list;
		}
	}
	public List<ProductVo> theme_view(){
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;

		try {
			sql = " select DISTINCT item_theme FROM itemboard where item_status = '판매'  order by ITEM_THEME ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			
			while(rs.next()) {
				ProductVo vo = new ProductVo();

				vo.setItem_theme(rs.getString("ITEM_THEME"));
		
				list.add(vo);
			}

			
		} catch (Exception e) {
			System.out.println("오류뜸" );
			e.printStackTrace();
		} finally {
			return list;
		}
	}

	public List<ProductVo> item_view(String findStr){
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		

		try {
			sql = " select * FROM itemboard where item_code = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			rs = ps.executeQuery();

			if(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
		
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
			
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {

			return list;
		}
	}
	public ProductVo reviewItemCode(String findStr){
		ProductVo vo = new ProductVo();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			sql = " select * FROM itemboard where item_code = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			rs = ps.executeQuery();
			
			if(rs.next()) {
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
			}
			
			rs.close();
			ps.close();
			
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {
			
			return vo;
		}
	}
	
	/*
	//정렬하여 상품 뿌려주기
	public List<ProductVo> select(Page_ProductList p, String findStr, int desc ){
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;

		try {
			sql = " select count(item_code) cnt from itemboard where (item_group like ? or item_theme like ?) and item_status='판매' ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+findStr+"%");
			ps.setString(2, "%"+findStr+"%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			p.setTotListSize(totList);
			p.pageCompute();
			
			String find = "";
			if(desc == 1) { //상품명순으로 정렬
				find = "item_title";
			}else if(desc == 2) { // 상품명 역순으로 정렬
				find = "item_title desc";
			}else if(desc == 3) { // 상품명 역순으로 정렬
				find =  "item_price";
			}else if(desc == 4) { // 상품명 역순으로 정렬
				find = "item_price desc";
			}else if(desc == 5) { // 상품명 역순으로 정렬
				find = "item_title";
			}
			
			
			sql = "select * from ("
					+ "select rownum rn , A.* from ("
					+ 	" select * "
					+ 	" from itemboard "
//					+ " where item_group = ? or item_theme = ? "
					+   " order by " + find + " ) A "
					+ ") where rn between ? and ? ";
//			sql = "select * from itemboard order by item_price desc ";
			ps = conn.prepareStatement(sql);
//			ps.setString(1, findStr);
//			ps.setString(2, findStr);
//			
		

			
			ps.setInt(1, p.getStartNo());
			ps.setInt(2, p.getEndNo());
	
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
			
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {
			return list;
		}
	}
	*/
	public List<ProductVo> mainSelect(int flag){
		List<ProductVo> list = new ArrayList<ProductVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			if(flag == 1) {
				sql = " select * from itemboard order by order_sumnum";
			}else if(flag==2) {
				sql = " select * from itemboard order by item_regdate";
			}
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
		} catch (Exception e) {
			System.out.println("오류뜸" );
			e.printStackTrace();
			
		} finally {
			return list;
		}
	}
	
	
	public List<ProductVo> itemFind(Page_ProductList p){
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;

		try {
			sql = " select count(item_code) cnt from itemboard  where item_status='판매' and (item_title like ? or item_theme like ? ) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+p.getFindStr()+"%");
			ps.setString(2, "%"+p.getFindStr()+"%");
			rs = ps.executeQuery();
			System.out.println(p.getFindStr()+"다오 검색어");
			if(rs.next()) {
				totList = rs.getInt("cnt");
			}
			p.setTotListSize(totList);
			p.pageCompute();
			
			sql = "select * from ("
					+ "select rownum rn , A.* from ("
					+ 	" select * "
					+ 	" from itemboard "
					+	" where item_status = '판매' "
					+ 	" and (item_title like ? or item_theme like ? )" 
					+   " order by item_group ) A "
					+ ") where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+p.getFindStr()+"%");
			ps.setString(2, "%"+p.getFindStr()+"%");
			ps.setInt(3, p.getStartNo());
			ps.setInt(4, p.getEndNo());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVo vo = new ProductVo();
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
				vo.setItem_thumbnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
		} catch (Exception e) {
			System.out.println("오류뜸" );
			e.printStackTrace();
		} finally {
			return list;
		}
	}
	

}
