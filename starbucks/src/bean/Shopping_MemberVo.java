package bean;

public class Shopping_MemberVo {

	String mId;
	String pwd;
	String mName;
	String phone;
	String address;
	String zip;
	String addr1;
	String addr2;
	String email;
	String rDate;
	int savedMoney;
	int admin;
	
	public Shopping_MemberVo () {
		
	}
	
	public Shopping_MemberVo (String mId, String pwd, String mName, String phone ,String address, String email) {
		
	}	
	
	public Shopping_MemberVo (String pwd, String mName, String phone , String email, String zip, String addr1, String addr2) {
		this.pwd = pwd;
		this.mName = mName;
		this.phone = phone;
		this.email = email;
		this.zip = zip;
		this.addr1 = addr1;
		this.addr2 = addr2;
		
	}	
	
	public Shopping_MemberVo (String mId, String pwd, String mName, String phone , String email, String zip, String addr1, String addr2) {
		this.mId = mId;
		this.pwd = pwd;
		this.mName = mName;
		this.phone = phone;
		this.email = email;
		this.zip = zip;
		this.addr1 = addr1;
		this.addr2 = addr2;
		
	}	
	
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public int getSavedMoney() {
		return savedMoney;
	}
	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
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
	
	
	
	
	
	
	
	
	
}
