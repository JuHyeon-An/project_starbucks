//주현 전용 서블릿!!!!!!!!
package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.NoticeDao;
import bean.NoticeVo;

@WebServlet("*.nn")
public class NoticeServlet extends HttpServlet{
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
		
	    String temp=req.getRequestURI();
		int pos=temp.lastIndexOf("/");
		String tempURL=temp.substring(pos);
		
		switch (tempURL) {

		case "/notice_insert.nn":
			notice_insert(req, resp);
			break;
			
		}

	}
	
	public void notice_insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = "";
		NoticeVo vo = new NoticeVo();
		NoticeDao dao = new NoticeDao();
		//vo 넘기는 부분  //  오라클 시퀀스
		
		
		dao.insert(vo);
		req.setAttribute("msg", msg);
		String path=url+"?main=./notice/notice_insert.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	}
