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
		System.out.println("get");
		doPost(req, resp);	
		}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
		System.out.println(req.getParameter("nowPage"));
		
		switch (tempURL) {

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
		case "/itemFind.pl":
			itemFind(req,resp);
			break;
			
	}
	
	}
	

	public void pListPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("plistPage");
		int nowPage = 1;
		String findStr = "";
		System.out.println(req.getParameter("nowPage")+"나우페이지 전달값");
		System.out.println(req.getAttribute("nowPage"));
		
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			System.out.println(nowPage);
		}
		if(req.getParameter("pd_findStr") != null) {
			findStr = req.getParameter("pd_findStr");
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
		System.out.println("카테고리");
		int nowPage = 1;
		String findStr = "";
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			
		}
		if(req.getParameter("pd_findStr") != null) {
			findStr = req.getParameter("pd_findStr");
		}
		
		Page_ProductList p = new Page_ProductList();
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		p.pageCompute();
		System.out.println("ㅇㅇㅇㅇ다오전");
		ProductDao_YD dao = new ProductDao_YD();
		
		List<ProductVo> list  = dao.select(p, findStr);
		System.out.println(list.size()+"리스트사이즈");
		List<ProductVo> listTheme  = dao.theme_view();
		System.out.println(listTheme.size()+"테마리스트사이즈");
		
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void item_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/product_view.jsp";
		String findStr = req.getParameter("pd_findStr");
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list = new ArrayList<ProductVo>();
		list = dao.item_view(findStr);
		
		
		req.setAttribute("list", list);	
		
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void sortList(int desc, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("sortPage");
		int nowPage = 1;
		String findStr = "";
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			
		}
		if(req.getParameter("pd_findStr") != null) {
			findStr = req.getParameter("pd_findStr");
		}
		
		Page_ProductList p = new Page_ProductList();
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		p.pageCompute();
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list  = dao.select(p, findStr, desc);//테마 정렬
		List<ProductVo> listTheme  = dao.theme_view();
		
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void itemFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int nowPage = 1;
		String findStr = "";
		System.out.println(req.getAttribute("nowPage"));
		
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			
		}
		if(req.getParameter("itmeFindStr") != null) {
			findStr = req.getParameter("itmeFindStr");
			System.out.println(findStr+"검색어");
		}
		
		Page_ProductList p = new Page_ProductList();
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		p.pageCompute();
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list  = dao.itemFind(p);
		
		List<ProductVo> listTheme  = dao.theme_view();
		
		
		req.setAttribute("list", list);
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("p", p);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	
}
