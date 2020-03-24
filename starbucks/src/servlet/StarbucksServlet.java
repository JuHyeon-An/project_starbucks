<<<<<<< HEAD
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
import bean.OrderDao;
import bean.OrderVo;

@WebServlet("*.star")
public class StarbucksServlet extends HttpServlet{
	String url="bbs/csCenter/notice/notice.jsp";	
	String urlsw="admin/order.jsp";
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
		case"/order.star":
			order(req, resp);
			break;
			
		
		}
	}
		

	private void order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr=req.getParameter("findStr");
		OrderDao dao=new OrderDao();
		List<OrderVo> list = dao.select(findStr);
		req.setAttribute("list", list);
		String path=url+"?str=./order.jsp&findStr="+findStr;
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
		
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
=======
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
	String urlAdmin = "index.jsp?cont=../admin";


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp=req.getRequestURI();
		int pos=temp.lastIndexOf("/");
		String tempURL=temp.substring(pos);

		switch (tempURL) {
		
		case "/notice.star":
			String str = req.getParameter("str");
			RequestDispatcher rd = req.getRequestDispatcher(url + "?str=" + str);
			rd.forward(req, resp);
			break;

		case "/add_product.star":
			insertProducts(req, resp);
			break;
			
		case "/select_product.star":
			selectProducts(req, resp);
			break;
		}
		
		
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
			
		case"/select_product.star":
			selectProducts(req, resp);
			break;
			
		case"/add_productR.star":
			insertProductsR(req, resp);
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
	
	
	// 주현 : admin - 상품 조회
	public void selectProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path= urlAdmin+"/products.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	// 주현 : admin - 상품 등록
	public void insertProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path= urlAdmin+"/add-product.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	// 주현 : admin - 상품 등록(result)
		public void insertProductsR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String path= urlAdmin+"/add_product_result.jsp";
			RequestDispatcher rd=req.getRequestDispatcher(path);
			rd.forward(req, resp);
		}
	
}
>>>>>>> branch 'master' of https://github.com/JuHyeon-An/project_starbucks.git
