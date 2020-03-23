package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.NoticeDao;
import bean.NoticeVo;

@WebServlet("*.star")
public class StarbucksServlet extends HttpServlet{
	String url="bbs/csCenter/notice/notice.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str=req.getParameter("str");
		RequestDispatcher rd=req.getRequestDispatcher(url+"?str="+str);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp=req.getRequestURI();
		int pos=temp.lastIndexOf("/");
		String tempURL=temp.substring(pos);
		
		switch(tempURL) {
		case"/notice_select.star":
			select(req, resp);
			break;
		case"/notice.star":
			notice(req, resp);
			break;
		}
	}
		

	public void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr=req.getParameter("findStr");
		NoticeDao dao=new NoticeDao();
		List<NoticeVo> list=dao.select(findStr);
		req.setAttribute("list", list);
		String path=url+"?str=./notice_select.jsp&findStr="+findStr;
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void notice(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
}
