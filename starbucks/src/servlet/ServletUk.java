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

import bean.NoticeDao;
import bean.NoticeVo;
import bean.Page;

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
			select(req, resp);
			break;
		case"/notice_view.uk":
			view(req, resp);
			break;
		}
	}

	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr="";
		int nowPage=1;
		
		if(req.getParameter("findStr")!=null) {
			findStr=req.getParameter("findStr");
		}
		if(req.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(req.getParameter("nowPage"));
		}
		
		Page page=new Page(findStr, nowPage);
		NoticeDao dao=new NoticeDao();
		
		List<NoticeVo> list=dao.select(page);
		
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		
		String path=url+"?star=./notice/notice_select.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String path=url+"?star=./notice/notice_view.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
}
