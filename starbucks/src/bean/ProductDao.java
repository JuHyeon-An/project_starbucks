package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String upload = "c:/Users/Ellen/git/project_starbucks/starbucks/WebContent/fileFolder/";
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
			ps.setDouble(5, vo.getItem_price()*0.01); // 가격의 1%
			ps.setString(6, vo.getItem_theme()); // 테마
			ps.setString(7, vo.getItem_size()); // 사이즈
			ps.setInt(8, vo.getItem_price()); // 가격
			ps.setInt(9, vo.getItem_num()); // 수량 (재고)
			ps.setString(10, vo.getItem_mainimg()); // 메인 이미지 path
			ps.setString(11, vo.getItem_thumbnailimg()); // 썸네일 이미지 path
			ps.setString(12, vo.getItem_contentimg()); // contentimg path
			ps.setInt(13, 10); // 누적판매개수
			ps.setString(14, vo.getItem_regDate()); // 등록날짜
			
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
			conn = DBConn.getConn();
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
			conn = DBConn.getConn();
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
			}
			ps.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
		
	}
}
