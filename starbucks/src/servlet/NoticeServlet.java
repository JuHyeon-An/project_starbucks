//주현 전용 서블릿!!!!!!!!
package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DaoUk;
import bean.NoticeDao;
import bean.NoticeVo;
import bean.OrderMemberDao;
import bean.Page;
import bean.Shopping_MemberVo;

@WebServlet("*.nn")
public class NoticeServlet extends HttpServlet {
	String url = "/bbs/list.jsp";
	String findStr = "";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);

		switch (tempURL) {

		case "/notice_insert.nn":
			notice_insert(req, resp);
			break;

		case "/notice_insertR.nn":
			notice_insertR(req, resp);
			break;
		case "/notice_update.nn":
			notice_update(req, resp);
			break;
			
		case "/notice_delete.nn":
			notice_delete(req, resp);
			break;
			
		}

	}

	public void notice_insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = url + "?main=./notice/notice_insert.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	public void notice_insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = "";
		NoticeVo vo = new NoticeVo();
		String memberId = req.getParameter("memberId");
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");

		vo.setMemberId(memberId);
		vo.setNoticeTitle(noticeTitle);
		vo.setNoticeContent(noticeContent);

		NoticeDao dao = new NoticeDao();
		// vo 넘기는 부분 // 오라클 시퀀스
		int r= dao.insert(vo);
		
		if(r>0) {
			msg="성공";
		}else {
			msg="실패";
		}
		
		req.setAttribute("msg", msg);
		String path = url + "?main=./notice/notice_insert.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}   

	public void notice_update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeVo vo = new NoticeVo();
		NoticeDao dao = new NoticeDao();
		String msg="";
//		vo.setMemberId(req.getParameter("memberId"));
		vo.setNoticeTitle(req.getParameter("noticeTitle"));
		vo.setNoticeContent(req.getParameter("noticeContent"));
//		vo.setMemberName(req.getParameter("memberName"));
		vo.setNoticePostNum(Integer.parseInt(req.getParameter("noticePostNum")));

		int r =dao.modify(vo);
		if(r>0) {
			msg="수정";
		}else {
			msg="실수";
		}
		
		
		req.setAttribute("msg", msg); //여기가 뷰의 값
		req.setAttribute("vo", vo);
		String path=url + "?main=./notice/notice_view.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	
		
	}
	
	public void notice_delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = "";
		NoticeVo vo = new NoticeVo();
		
		vo.setNoticePostNum(Integer.parseInt(req.getParameter("noticePostNum")));
		NoticeDao dao = new NoticeDao();
		// vo 넘기는 부분 // 오라클 시퀀스
		int r= dao.delete(vo.getNoticePostNum());
		
		if(r>0) {
			msg="성공";
		}else {
			msg="실패";
		}
		
		req.setAttribute("msg", msg);
		String path = url + "?main=./notice/notice_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}   


	
	
	
	
	
	
	
}
