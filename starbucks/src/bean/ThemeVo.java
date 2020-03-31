package bean;

public class ThemeVo {

	String item_theme;
	int salesSum;
	
	ThemeVo(String item_theme, int salesSum){
		this.item_theme = item_theme;
		this.salesSum = salesSum;
	}

	public String getItem_theme() {
		return item_theme;
	}

	public void setItem_theme(String item_theme) {
		this.item_theme = item_theme;
	}

	public int getSalesSum() {
		return salesSum;
	}

	public void setSalesSum(int salesSum) {
		this.salesSum = salesSum;
	}
	
	
}
