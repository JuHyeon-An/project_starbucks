package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Page_ProductList;
import bean.ProductDao_YD;
import bean.ProductVo;

@WebServlet("*.pl")
public class ProductListServlet extends HttpServlet{
	String url = "/product";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("두포스트");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
		
		switch (tempURL) {
		case "/list.pl":
			pList(req, resp);
			break;
		case "/listPage.pl":
			pListPage(req, resp);
			break;
	}
	
	}
	
	public void pList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/list.jsp";
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list = new ArrayList<ProductVo>();
		list = dao.select();
		
		
		req.setAttribute("list", list);
		
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void pListPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int nowPage = 1;
		String findStr = "";
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			
		}
		if(req.getParameter("findStr") != null) {
			findStr = req.getParameter("findStr");
		}
		
		Page_ProductList p = new Page_ProductList();
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		p.pageCompute();
		System.out.println(nowPage+"나우페이지");
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list  = dao.select(p);
		
		
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	
}
