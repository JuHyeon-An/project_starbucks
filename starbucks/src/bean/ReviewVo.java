package bean;

import java.util.List;
import java.util.Map;

public class ReviewVo {
	int review_postnum;      /*dao에서 seq*/
	String member_id;        /*ReviewUp에서 받아옴*/
	String item_code;        /*ReviewUp에서 받아옴*/
	String review_title;     /*ReviewUp에서 받아옴*/
	String review_content;   /*ReviewUp에서 받아옴*/
	String review_regdate;   /*dao에서sysdate*/
	int review_like;         /*ReviewUp에서 받아옴*/
	int reivew_view;         /*dao에서 0*/
	Review_imgs review_imgs; /*ReviewUp에서 받아옴*/
	
	List<String> list;       /*이미지 바뀐 이름*/
	/*int totList;  */           /*전체 페이지*/
	
	public int getReview_postnum() {
		return review_postnum;
	}
	public void setReview_postnum(int review_postnum) {
		this.review_postnum = review_postnum;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public int getReivew_view() {
		return reivew_view;
	}
	public void setReivew_view(int reivew_view) {
		this.reivew_view = reivew_view;
	}
	public Review_imgs getReview_imgs() {
		return review_imgs;
	}
	public void setReview_imgs(Review_imgs review_imgs) {
		this.review_imgs = review_imgs;
	}
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
/*	public int getTotList() {
		return totList;
	}
	public void setTotList(int totList) {
		this.totList = totList;
	}*/
}
