package bean;

public class ShoppingCartVo {
	int serial;
	String mId;
	String fileName;
	String itemCode;
	int price;
	int itemEa;
	int totPrice;
	String itemTitle;
	String mName;
	
	public ShoppingCartVo() {
		
	}  
	
	public ShoppingCartVo(String itemCode, String itemTitle, int itemEa, int totPrice, String mId) {
		this.itemCode = itemCode;
		this.itemTitle = itemTitle;
		this.itemEa = itemEa;
		this.totPrice = totPrice;
		this.mId = mId;
		
	}   
	
	
	public ShoppingCartVo(String mName, String itemCode, String itemTitle, int itemEa, int totPrice, String mId, int serial) {
		this.mName = mName;
		this.itemCode = itemCode;
		this.itemTitle = itemTitle;
		this.itemEa = itemEa;
		this.totPrice = totPrice;
		this.mId = mId;
		this.serial = serial;
	}   
	
	public ShoppingCartVo(String mId,String fileName, String itemCode, int price, int itemEa, int totPrice) {
		this.mId = mId;
		this.fileName = fileName;
		this.itemCode = itemCode;
		this.price = price;
		this.itemEa = itemEa;
		this.totPrice = price * itemEa;
	}
	
	public ShoppingCartVo(String mId,String fileName, String itemCode, int price, int itemEa, int totPrice, String itemTitle) {
		this.mId = mId;
		this.fileName = fileName;
		this.itemCode = itemCode;
		this.price = price;
		this.itemEa = itemEa;
		this.totPrice = price * itemEa;
		this.itemTitle = itemTitle;
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getItemEa() {
		return itemEa;
	}

	public void setItemEa(int itemEa) {
		this.itemEa = itemEa;
	}

	public int getTotPrice() {
		return totPrice;
	}

	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}

	public String getItemTitle() {
		return itemTitle;
	}

	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}
	
	
	
}
