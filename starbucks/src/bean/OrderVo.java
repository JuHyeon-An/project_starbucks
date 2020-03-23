package bean;

public class OrderVo {
	String orderNumber;//주문번호
	String memberId;//아이디
	String itemCode;//상품코드
	String memberName;//이름
	String memberPhone;//전화번호
	String memberEmail;//이메일
	int orderNum;//상품갯수
	int	orderPrice;//총가격
	String getName;//수령자이름
	String getPhone;//수령자번호
	String getAddress;//수령장소
	String order_regDate;//주문날짜
	int orderStatus;//주문처리상태
	
	
	
	
	
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getGetName() {
		return getName;
	}
	public void setGetName(String getName) {
		this.getName = getName;
	}
	public String getGetPhone() {
		return getPhone;
	}
	public void setGetPhone(String getPhone) {
		this.getPhone = getPhone;
	}
	public String getGetAddress() {
		return getAddress;
	}
	public void setGetAddress(String getAddress) {
		this.getAddress = getAddress;
	}
	public String getOrder_regDate() {
		return order_regDate;
	}
	public void setOrder_regDate(String order_regDate) {
		this.order_regDate = order_regDate;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	
}
