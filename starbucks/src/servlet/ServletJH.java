//주현 전용 서블릿!!!!!!!!
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

@WebServlet("*.stb")
public class ServletJH extends HttpServlet{
	String url="bbs/csCenter/notice/notice.jsp";
	String urlAdmin = "index.jsp?cont=../admin";


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp=req.getRequestURI();
		int pos=temp.lastIndexOf("/");
		String tempURL=temp.substring(pos);

		switch (tempURL) {
		
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
			
		case"/select_product.star":
			selectProducts(req, resp);
			break;
			
		case"/add_productR.star":
			insertProductsR(req, resp);
			break;
		}
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