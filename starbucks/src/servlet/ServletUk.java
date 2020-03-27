package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DaoUk;
import bean.NoticeVo;
import bean.Page;
import bean.ReviewUp;
import bean.ReviewVo;

@WebServlet("*.uk")
public class ServletUk extends HttpServlet{
	String url="/bbs/list.jsp";
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp=req.getRequestURI();
		int pos=temp.lastIndexOf("/");
		String tempURL=temp.substring(pos);
		
		switch(tempURL) {
		case"/notice_select.uk":
			notice_select(req, resp);
			break;
		case"/notice_view.uk":
			notice_view(req, resp);
			break;
		
		
		
		case"/review_select.uk":
			review_select(req,resp);
			break;
		case"/review_view.uk":
			review_view(req,resp);
			break;
		case"/review_insert.uk":
			review_insert(req,resp);
			break;
		case"/review_insertR.uk":
			review_insertR(req,resp);
			break;
		}
	}

	public void notice_select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr="";
		int nowPage=1;
		
		if(req.getParameter("findStr")!=null) {
			findStr=req.getParameter("findStr");
		}
		if(req.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(req.getParameter("nowPage"));
		}
		
		Page page=new Page(findStr, nowPage);
		DaoUk dao=new DaoUk();
		
		List<NoticeVo> list=dao.notice_select(page);
		
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		
		String path=url+"?main=./notice/notice_select.jsp&side=./notice/notice_side.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void notice_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path=url+"?main=./notice/notice_view.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	
	
	public void review_select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String findStr="";
		int nowPage=1;
		if(req.getParameter("findStr")!=null) {
			findStr=req.getParameter("findStr");
		}
		if(req.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(req.getParameter("nowPage"));
		}
		DaoUk dao=new DaoUk();
		List<ReviewVo> list=dao.review_select(findStr);
		
		req.setAttribute("list", list);
		String path=url+"?main=./review/review_select.jsp&side=./review/review_side.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void review_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		String path=url+"?main=./review/review_view.jsp&side=./review/review_side.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void review_insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path=url+"?main=./review/review_insert.jsp&side=./review/review_side.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void review_insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewUp up=new ReviewUp(req, resp);
		String msg=null;
		
		if(up.encCheck()) {
			ReviewVo vo=up.upload();
			DaoUk dao=new DaoUk();
			msg=dao.review_insert(vo);
		}
		
		req.setAttribute("msg", msg);
		String path=url+"?main=./review/review_insert.jsp&side=./review/review_side.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
}
