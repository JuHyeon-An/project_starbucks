package bean;

public class Page {
	int totListSize; //검색된 결과의 전체 데이터의 개수
	int totPage;     //전체 페이지
	int listSize=10; //한 페이지에 데이터 개수
	int nowPage=1;   //현재페이지
	int startNo;     //페이지의 데이터 시작 숫자
	int endNo;       //페이지의 데이터 끝나는 숫자
	int blockSize=5; //페이지 블럭 개수
	int startPage;   //페이지 시작 숫자
	int endPage;	 //페이지 숫자
	String findStr="";
	
	public Page() {
		
	}
	public Page(int totListSize, int nowPage) {
		this.totListSize=totListSize;
		this.nowPage=nowPage;
		pageCompute();
	}
	public void pageCompute() {//페이지를 계산하는 로직(startNo, endNo 계산) 
		totPage=(int)Math.ceil(totListSize/(double)listSize); //총 페이지=올림(전체 데이터/한 페이지의 데이터 개수) 
		endNo=nowPage*listSize; //데이터 끝은 현재페이지넘버*페이지의 데이터개수
		startNo=endNo-listSize+1; //시작 데이터는 마지막데이터-페이지데이터수+1
		if(endNo>totListSize)endNo=totListSize; //계산된 페이지의 데이터끝나는 숫자가 전체데이터수보다 많으면 총데이터수로 고정.
		
		endPage=(int)Math.ceil(nowPage/(double)blockSize)*blockSize; //마지막 페이지=올림(현재페이지/블럭개수)*블럭개수
		startPage=endPage-blockSize+1; //시작 페이지= 마지막페이지-전체블럭+1
		if(endPage>totPage) endPage=totPage;
	}
	
	public int getTotListSize() {
		return totListSize;
	}
	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
}