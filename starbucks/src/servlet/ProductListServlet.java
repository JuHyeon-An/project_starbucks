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

import bean.ProductDao_YD;
import bean.ProductVo;
import bean.Shopping_MemberDao;

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
	}
	
	}
	
	public void pList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("plist 들어옴");
		String path = url+"/list.jsp";
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list = new ArrayList<ProductVo>();
		list = dao.select();
		
		System.out.println("dao실행"+list.size());
		
		req.setAttribute("list", list);
		
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
}
