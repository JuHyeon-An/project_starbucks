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
			sql = " select * from itemboard ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ProductVo vo = new ProductVo();
				System.out.println(rs.getString("ITEM_MAINIMG")+"아이템코드");
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
			sql = " select count(item_code) cnt from itemboard ";
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
				vo.setItem_thumnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {
			return list;
		}
	}

	public List<ProductVo> select(Page_ProductList p, String findStr){  //테마 및 카테고리로 보기
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;

		try {
			sql = " select count(item_code) cnt from itemboard where item_group = ? or item_theme = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, findStr);
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
					+ " where item_group = ? or item_theme = ? "
					+   " order by item_group ) A "
					+ ") where rn between ? and ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, findStr);
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
				vo.setItem_thumnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("오류뜸" );
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
			sql = " select DISTINCT item_theme FROM itemboard order by ITEM_THEME ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			
			while(rs.next()) {
				ProductVo vo = new ProductVo();

				vo.setItem_theme(rs.getString("ITEM_THEME"));
		
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("오류뜸" );
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

			System.out.println(findStr+"검색어 넘어옴 뷰");
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
				vo.setItem_thumnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
		
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {
			return list;
		}
	}
	
	
	
	public List<ProductVo> select(Page_ProductList p, String findStr, int desc){
		List<ProductVo> list = new ArrayList<ProductVo>();
		
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int totList = 0;

		try {
			sql = " select count(item_code) cnt from itemboard where item_group like ? or item_theme like ? ";
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
				System.out.println("들어온다 이프");
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
				vo.setItem_thumnailimg(rs.getString("ITEM_THUMBNAILIMG"));
				vo.setItem_contentimg(rs.getString("ITEM_CONTENTIMG"));
				vo.setOrder_sumnum(rs.getInt("ORDER_SUMNUM"));
				vo.setItem_regDate(rs.getString("ITEM_REGDATE"));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("오류뜸" );
		} finally {
			return list;
		}
	}
	

}
