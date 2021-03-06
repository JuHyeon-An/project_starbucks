package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class ProductDao {

	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	String upload = "C:/Users/Ellen/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/photos";

	String upload = "c:/Users/Ellen/git/project_starbucks/starbucks/WebContent/fileFolder/";
//	String upload = "C:/Users/Go/Documents/GitHub/project_starbucks/starbucks/WebContent/fileFolder/";
//	String upload = "c:/Users/JHTA/git/project_starbucks/starbucks/WebContent/fileFolder/";
	
	String sql="";
	
	
	
	
	public ProductDao() {
		conn = DBConn.getConn();
	}

	public String insert(ProductVo vo) {
		
		sql = "insert into itemboard values(?||to_char(sysdate,'rrmmdd')||'-'||seq_itemcode.nextval, seq_item_postnum.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getItem_group()); // 자동생성 item_code
			ps.setString(2, vo.getItem_group()); // selected box에서 가져옴
			ps.setString(3, vo.getItem_title()); // 아이템명
			ps.setString(4, vo.getItem_content()); // 설명
			ps.setDouble(5, vo.getItem_price()*0.01); // 가격의 1%
			ps.setString(6, vo.getItem_theme()); // 테마
			ps.setString(7, vo.getItem_size()); // 사이즈
			ps.setInt(8, vo.getItem_price()); // 가격
			ps.setInt(9, vo.getItem_num()); // 수량 (재고)
			ps.setString(10, vo.getItem_mainimg()); // 메인 이미지 path
			ps.setString(11, vo.getItem_thumbnailimg()); // 썸네일 이미지 path
			ps.setString(12, vo.getItem_contentimg()); // contentimg path
			ps.setInt(13, 0); // 누적판매개수
			ps.setString(14, vo.getItem_regDate()); // 등록날짜
			ps.setString(15, vo.getItem_status());
			
			if(ps.executeUpdate()>0) {
				conn.commit();
				ps.close();
				return "성공";
			}else {
				conn.rollback();
				ps.close();
				return "오류발생";
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "DB오류발생";
	}
	
	
	public int deleteItem(String item_code) {
		sql = "select item_mainimg, item_thumbnailimg, item_contentimg from itemboard where item_code=?";
		int r = 0;
		String file1 = null;
		String file2 = null;
		String file3 = null;
		List<String> fileList = new ArrayList<String>();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, item_code);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				file1 = rs.getString(1);
				file2 = rs.getString(2);
				file3 = rs.getString(3);
				
				fileList.add(file1);
				fileList.add(file2);
				fileList.add(file3);
			}
			
			sql = "delete from itemboard where item_code=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, item_code);
			
			r = ps.executeUpdate();
			if(r>0) {
				System.out.println("r의 값 : " + r);
				System.out.println("삭제성공");
				delFile(fileList);
				conn.commit();
			}else {
				conn.rollback();
			}
			
			ps.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return r;
	}
	
	
	public void delFile(List<String> fileList) {
		// 파일명을 넘겨받아서 파일 삭제하는 메소드
		System.out.println("delFile 메소드 실행");
		for(String photo : fileList) {
			File file = new File(upload + photo);
			if(file.exists()) {
				System.out.println("파일삭제 실행");
				file.delete();
			}
		}
		
	}
	
	public ProductVo view(String item_code) {
		sql = "select * from itemboard where item_code = ?";
		ProductVo vo = new ProductVo();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, item_code);
			
			ResultSet rs = ps.executeQuery();
			
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
				vo.setItem_status(rs.getString("ITEM_STATUS"));
			}
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
		
	}
	
	public int update(ProductVo vo) {
		
		int r = 0;
		sql = "update itemboard set item_title = ?, item_price=?, item_num=?, "
				+ "item_size=?, item_content=?, item_group=?, item_theme=?, item_regDate=?, "
				+ "item_mainimg=?, item_thumbnailimg = ?, item_contentimg = ?, "
				+ "item_savedmoney = ?, item_status = ? where item_code = ?";
		// 누적판매개수만 수정 못 함
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, vo.getItem_title()); // 자동생성 item_code
			ps.setInt(2, vo.getItem_price()); // selected box에서 가져옴
			ps.setInt(3, vo.getItem_num()); // 아이템명
			ps.setString(4, vo.getItem_size()); // 설명
			ps.setString(5, vo.getItem_content());
			ps.setString(6, vo.getItem_group());
			ps.setString(7, vo.getItem_theme());// 테마
			ps.setString(8, vo.getItem_regDate()); // 등록날짜
			ps.setString(9, vo.getItem_mainimg()); // 메인 이미지 path
			ps.setString(10, vo.getItem_thumbnailimg()); // 썸네일 이미지 path
			ps.setString(11, vo.getItem_contentimg()); // contentimg path
			ps.setDouble(12, vo.getItem_price()*0.01); // 가격의 1%
			ps.setString(13, vo.getItem_status());
			System.out.println(vo.getItem_status());
			ps.setString(14, vo.getItem_code());
			/*
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_title());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_price());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_num());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_size());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_content());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_theme());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_regDate());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_mainimg());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_thumbnailimg());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_contentimg());
			System.out.println("vo가 잘 들어가는지:"+vo.getItem_code());
			*/
			r = ps.executeUpdate();
			
			if(r>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
			
			ps.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return r;
	}
	
	public List<ProductVo> select(String productSearch, String category, String check){
		System.out.println("카테고리 : "+category);
		List<ProductVo> list = new ArrayList<ProductVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String addCheck = "";
		
		if(check.equals("true")) {
			addCheck = "and item_status='판매'";
		}
		
		try {
			
			if(category.equals("")) {
				sql = " select * from itemboard where (item_code like ? "
						+ "or item_title like ? )"+addCheck;
				
				System.out.println(sql);
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, "%"+productSearch+"%");
				ps.setString(2, "%"+productSearch+"%");
				
			}else {
				sql = " select * from itemboard where (item_code like ? or item_title like ?) "
						+ "and item_group = ? "+addCheck;

				ps = conn.prepareStatement(sql);
				
				ps.setString(1, "%"+productSearch+"%");
				ps.setString(2, "%"+productSearch+"%");
				ps.setString(3, category);

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
				vo.setItem_status(rs.getString("item_status"));
				list.add(vo);
			}
			
	         rs.close();
	         ps.close();
	         
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ㅠㅠ에러" );
		} finally {
			return list;
		}
	}
	
	public List<ProductSumVo> dashBoard() {
		
		List<ProductSumVo> list = new ArrayList<ProductSumVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
				sql = " select * from (select item_title, ORDER_SUMNUM from itemboard order by order_sumnum desc) where rownum <= 7";
				
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new ProductSumVo(rs.getString(1), rs.getInt(2)));
			}
			
	         rs.close();
	         ps.close();
	         
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return list;
		}
	}
	
	public List<Integer> totalSales() {
		List<Integer> sum = new ArrayList<Integer>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
				sql = "select sum(order_price), to_char(order_regdate, 'rrrr-mm') regdate"   
						+" from shopping_order where order_status = 3 and to_char(order_regdate, 'rrrr-mm') >='2019-10'"
						+" group by to_char(order_regdate, 'rrrr-mm')   "
						+" order by to_char(order_regdate, 'rrrr-mm')";
				
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
			
			while(rs.next()) {
				sum.add(rs.getInt(1));
			}
			
	         rs.close();
	         ps.close();
	         
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return sum;
		}
	}
	
	public List<ThemeVo> themeSum() {
		List<ThemeVo> sum = new ArrayList<ThemeVo>();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
				sql = "select item_theme, sum(order_sumnum) from itemboard group by item_theme";
				
				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();
			
			while(rs.next()) {
				sum.add(new ThemeVo(rs.getString(1), rs.getInt(2)));
			}
			
	         rs.close();
	         ps.close();
	         
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return sum;
		}
	}
	
	public List<OrderVo> selectOrder(){
		List<OrderVo> orderList = new ArrayList<OrderVo>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		sql = "select * from SHOPPING_ORDER where to_char(ORDER_REGDATE, 'rrrr-mm-dd') = to_char(sysdate, 'rrrr-mm-dd')";
		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			
			while(rs.next()) {
				OrderVo vo = new OrderVo();
				vo.setOrderNumber(rs.getString("ORDERNUMBER")); // 주문번호
				vo.setMemberId(rs.getString("MEMBER_ID")); // 아이디
				vo.setItemCode(rs.getString("ITEM_CODE")); // 아이템코드
				vo.setGetPhone(rs.getString("GET_PHONE")); // 연락처
//				vo.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				vo.setOrderNum(rs.getInt("ORDER_NUM")); // 수량
				vo.setOrderPrice(rs.getInt("ORDER_PRICE")); // 결제금액
				vo.setGetAddress(rs.getString("MEMBER_ADDR1")); //주소
				vo.setOrderregDate(rs.getString("ORDER_REGDATE")); //주문일자
				vo.setOrderStatus(rs.getInt("ORDER_STATUS")); // 주문상태
				orderList.add(vo);
			}
			
			rs.close();
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return orderList;
		}
	}
	
	public List<DailyReport> dailyReport(){

		List<DailyReport> list = new ArrayList<DailyReport>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			for(int i=1; i<=3; i++) {
				DailyReport dr = new DailyReport();

				// 주문완료건 카운트
				sql = "select count(*) from shopping_order where order_status = ?"
						+ " and to_char(order_regdate, 'rrrr-mm-dd') = to_char(sysdate, 'rrrr-mm-dd')";
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, i);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					dr.setOrderCnt(rs.getInt(1));
				}else {
					dr.setOrderCnt(0);
				}
				
				sql = "select sum(order_price) from shopping_order where order_status = ?"
						+ " and to_char(order_regdate, 'rrrr-mm-dd') = to_char(sysdate, 'rrrr-mm-dd')";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, i);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					dr.setOrderTotal(rs.getInt(1));
				}else {
					dr.setOrderTotal(0);
				}
				
				list.add(dr);
			}
			
			rs.close();
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			return list;
		}
		
	}
	
}
