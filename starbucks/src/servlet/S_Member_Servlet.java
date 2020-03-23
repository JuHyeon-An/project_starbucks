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

@WebServlet("*.sm")
public class S_Member_Servlet extends HttpServlet{
	String url="/starbucks/index.jsp";



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempUrl = temp.substring(pos);
		
		switch (tempUrl) {
		case "/login.sm":
			login(req, resp);
			break;
			
		case "/join.sm":
			login(req, resp);
			break;

		case "/joinR.sm":
			insertR(req, resp);
			break;


		}
		
	}
		
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/login.jsp";
		
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void join(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url + "/join.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void insertR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
	
}
