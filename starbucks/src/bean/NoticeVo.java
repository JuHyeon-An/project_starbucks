package bean;

public class NoticeVo {
	int noticePostNum;
	String memberId;
	String noticeTitle; 
	String noticeContent;
	String noticeRegDate;
	int noticeView;
	String memberName;
	
	public NoticeVo() {
		
	}
	public NoticeVo(int noticePostNum, 
					String memberId, 
					String noticeTitle, 
					String noticeContent, 
					String noticeRegDate,
					int noticeView,
					String memberName) {
		this.noticePostNum=noticePostNum;
		this.memberId=memberId;
		this.noticeTitle=noticeTitle;
		this.noticeContent=noticeContent;
		this.noticeView=noticeView;
		this.memberName=memberName;
	}
	public int getNoticePostNum() {
		return noticePostNum;
	}
	public void setNoticePostNum(int noticePostNum) {
		this.noticePostNum = noticePostNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeRegDate() {
		return noticeRegDate;
	}
	public void setNoticeRegDate(String noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	public int getNoticeView() {
		return noticeView;
	}
	public void setNoticeView(int noticeView) {
		this.noticeView = noticeView;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
}
