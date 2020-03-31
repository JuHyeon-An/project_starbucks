package bean;

public class ProductSumVo {

	String item_title;
	int order_sumnum;
	
	public ProductSumVo(String item_title, int order_sumnum) {
		this.item_title = item_title;
		this.order_sumnum = order_sumnum;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public int getOrder_sumnum() {
		return order_sumnum;
	}
	public void setOrder_sumnum(int order_sumnum) {
		this.order_sumnum = order_sumnum;
	}
	
	
}
