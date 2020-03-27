package bean;

import java.util.List;

public class ReviewVo {
	int review_postnum;
	String member_id;
	String item_code;
	String review_title;
	String review_content;
	int review_like;
	Review_imgs review_img;
	
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
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public Review_imgs getReview_img() {
		return review_img;
	}
	public void setReview_img(Review_imgs review_img) {
		this.review_img = review_img;
	}
	
}
