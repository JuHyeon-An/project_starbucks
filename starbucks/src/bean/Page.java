package bean;

public class Page {
	String findStr=""; //검색어                               ->매개변수로 받아옴
	int totListSize;   //검색된 데이터의 총 개수       ->매개변수로 받아옴
	int nowPage;       //현재페이지                         ->매개변수로 받아옴
	int listSize=5;    //한 페이지에 목록 개수        ->디폴트값
	int blockSize=5;   //페이지 블럭 개수               ->디폴트값
	int totPage;       //전체 페이지                        ->산출됨
	int startNo;       //페이지의 목록번호 시작 숫자  ->산출됨
	int endNo;         //페이지의 목록번호 나는 숫자  ->산출됨
	int startPage;     //페이지 시작 숫자                  ->산출됨
	int endPage;	   //페이지 마지막 숫자               ->산출됨
	String item_code;     //아이템코드                          ->매개변수로 받아옴
	String sort;          //정렬                         ->매개변수로 받아옴
	public Page() {
		
	}
	public Page(String findStr, int nowPage) {
		this.findStr=findStr;
		this.nowPage=nowPage;
	}
	public Page(String findStr, int nowPage, String item_code, String sort) {
		this.findStr=findStr;
		this.nowPage=nowPage;
		this.item_code=item_code;
		this.sort=sort;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public void pageCompute() {//페이지를 계산하는 로직(startNo, endNo 계산) 
		totPage=(int)Math.ceil(totListSize/(double)listSize); //총 페이지=올림(전체 데이터/한 페이지의 데이터 개수) 
		endNo=nowPage*listSize; //페이지 목록번호 마지막 숫자= 현재페이지숫자*페이지의 목록개수
		startNo=endNo-listSize+1; //페이지의 목록번호 첫 숫자=페이지의 마지막 목록번호숫자-페이지의 목록개수+1
		if(endNo>totListSize)endNo=totListSize; //계산된 페이지의 마지막 목록번호 숫자가 전체데이터수보다 많으면 총데이터수로 고정.
		
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
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	
}
