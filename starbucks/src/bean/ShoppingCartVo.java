package bean;

public class ShoppingCartVo {
	int serial;
	String mId;
	String fileName;
	String itemCode;
	int price;
	int itemEa;
	int totPrice;
	
	public ShoppingCartVo() {
		
	}  
	
	public ShoppingCartVo(String mId,String fileName, String itemCode, int price, int itemEa, int totPrice) {
		this.mId = mId;
		this.fileName = fileName;
		this.itemCode = itemCode;
		this.price = price;
		this.itemEa = itemEa;
		this.totPrice = price * itemEa;
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
	
	
	
}
