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

import bean.DaoUk;
import bean.Page_Item;
import bean.Page_ProductList;
import bean.ProductDao_YD;
import bean.ProductVo;
import bean.ReviewVo;

@WebServlet("*.pl")
public class ProductListServlet extends HttpServlet{
	String url = "/product";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);	
		}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
		
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
		System.out.println("카테고리 들어오나"+req.getParameter("pd_findStr"));
		String findStr = "all";
		int sort = 1;
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}
		if(req.getParameter("pd_findStr") != null) {
			findStr = req.getParameter("pd_findStr");
			System.out.println("카테고리" +findStr);
		}
		if(req.getParameter("pd_sort") != null && req.getParameter("pd_sort") != "") {
			sort = Integer.parseInt(req.getParameter("pd_sort"));
			System.out.println("소트" +sort);
		}
		
		Page_ProductList p = new Page_ProductList();
		p.setNowPage(nowPage);
		p.setFindStr(findStr);
		p.pageCompute();
		ProductDao_YD dao = new ProductDao_YD();
		
		List<ProductVo> list  = dao.select(p, findStr, sort);
		List<ProductVo> listTheme  = dao.theme_view();
		
		req.setAttribute("listTheme", listTheme);
		req.setAttribute("list", list);
		req.setAttribute("p", p);
		req.setAttribute("sort", sort);
		req.setAttribute("pd_findStr", findStr);
		
		String path = url+"/list.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void item_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String findStr = "";
		int nowPage=1;

		if(req.getParameter("nowPage")!=null && req.getParameter("nowPage")!= "" ) {
			nowPage=Integer.parseInt(req.getParameter("nowPage"));
		}
		if(req.getParameter("pd_findStr") != null && req.getParameter("pd_findStr") != "") {
			findStr = req.getParameter("pd_findStr");
		}
		
		Page_Item page=new Page_Item(findStr, nowPage);
		DaoUk daoR=new DaoUk();
		List<ReviewVo> listR = daoR.review_select(page);
		req.setAttribute("listR", listR);
		req.setAttribute("page", page);
		
		
		System.out.println(listR.size()+"리스트알 사이즈");
		
		String path = url+"/product_view.jsp";
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list = new ArrayList<ProductVo>();
		list = dao.item_view(findStr);
		
		
		req.setAttribute("list", list);	
		System.out.println(findStr+"검색어");
		System.out.println(list.size()+"리스트사이즈");
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
		
		

	}
	
	public void sortList(int desc, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		
		if(req.getParameter("nowPage") != null && req.getParameter("nowPage") != "") {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			
		}
		if(req.getParameter("itmeFindStr") != null) {
			findStr = req.getParameter("itmeFindStr");
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
