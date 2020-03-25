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
		case "/listCategories.pl":
			pListCategories(req, resp);
			break;
		case "/item_view.pl":
			item_view(req, resp);
			break;
		case "/sort_title.pl":
			sortList(1, req, resp);
			break;
		case "/sort_title_desc.pl":
			sortList(2, req, resp);
			break;
		case "/sort_price.pl":
			sortList(3, req, resp);
			break;
		case "/sort_price_desc.pl":
			sortList(4, req, resp);
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
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list  = dao.select(p);
		List<ProductVo> listTheme  = dao.theme_view();
		
		
		req.setAttribute("list", list);
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void pListCategories(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list  = dao.select(p, findStr);
		List<ProductVo> listTheme  = dao.theme_view();
		
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void item_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/product_view.jsp";
		String findStr = req.getParameter("findStr");
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list = new ArrayList<ProductVo>();
		list = dao.item_view(findStr);
		
		
		req.setAttribute("list", list);	
		
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void sortList(int desc, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list  = dao.select(p, findStr, desc);
		List<ProductVo> listTheme  = dao.theme_view();
		
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	
}
