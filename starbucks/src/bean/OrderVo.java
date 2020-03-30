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
	String orderregDate;//주문날짜
	int orderStatus;//주문처리상태
	
	String zone; //우편번호 
	String addr1; //주소 
	String addr2; //상세주소 
	int savedMoney; // 	적립금   
	
	
	
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
	public String getOrderregDate() {
		return orderregDate;
	}
	public void setOrderregDate(String orderregDate) {
		this.orderregDate = orderregDate;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getSavedMoney() {
		return savedMoney;
	}
	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}
	
	
}
