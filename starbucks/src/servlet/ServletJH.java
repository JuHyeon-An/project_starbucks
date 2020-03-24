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
import bean.ProductDao;
import bean.ProductVo;

@WebServlet("*.stb")
public class ServletJH extends HttpServlet{
	String urlAdmin = "index.jsp?cont=../admin";


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp=req.getRequestURI();
		int pos=temp.lastIndexOf("/");
		String tempURL=temp.substring(pos);
		
		switch (tempURL) {

		case "/select_product.stb":
			selectProducts(req, resp);
			break;

		case "/add_productR.stb":
			insertProductsR(req, resp);
			break;

		case "/add_product.stb":
			insertProducts(req, resp);
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
		String path= urlAdmin+"/add_product.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	// 주현 : admin - 상품 등록(result)
	public void insertProductsR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductDao dao = new ProductDao();
		ProductVo vo = new ProductVo();
		
		//vo.setItem_code(item_code);
		vo.setItem_group(req.getParameter("item_group"));
		String msg = dao.insert(vo);
		
		String group = vo.getItem_group();
		req.setAttribute("msg", msg);
		req.setAttribute("group", group);
		
		String path= urlAdmin+"/add_product_result.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
}
