//주현 전용 서블릿!!!!!!!!
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FileUpload;
import bean.ProductDao;
import bean.ProductDao_YD;
import bean.ProductVo;

@WebServlet("*.stb")
public class ServletJH extends HttpServlet{
	String urlAdmin = "index.jsp?cont=../admin";
	static int n = 0;

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
			
		case "/edit_product.stb":
			editProducts(req, resp);
			break;
			
		case "/edit_productR.stb":
			editProductsR(req, resp);
			break;
		}

	}
		
	
	// 주현 : admin - 상품 조회
	public void selectProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		ProductDao_YD dao = new ProductDao_YD();
		List<ProductVo> list = dao.select();
		System.out.println(list.get(0).getItem_code());
		System.out.println(list.get(1).getItem_code());
		req.setAttribute("list", list);
		
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
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		ProductDao dao = new ProductDao();
		
		FileUpload upload = new FileUpload(req, resp);
		
		if(upload.uploadFormCheck()) { // enctype = 'multipart/form-data'
			ProductVo vo = upload.uploading();
			// 사진을 포함해서 모든 폼태그가 담겨진 vo가 반환
			
			String msg = dao.insert(vo);
			// 폼태그 담은 vo를 실제로 DB에 넣어줌
			
			req.setAttribute("msg", msg);
			
		}else {
			System.out.println("error");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
		
		String path= urlAdmin+"/add_product_result.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	// 주현 : admin - 상품 등록
	public void editProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String item = req.getParameter("hidden_code");
		
		ProductDao dao = new ProductDao();
		ProductVo vo = dao.view(item);
		
		req.setAttribute("vo", vo);
		String path= urlAdmin+"/edit_product.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void editProductsR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		ProductDao dao = new ProductDao();
		FileUpload upload = new FileUpload(req, resp);
		
		int result = 0;
		
		if(upload.uploadFormCheck()) { // enctype = 'multipart/form-data'
			ProductVo vo = upload.uploading();
			// 사진을 포함해서 모든 폼태그가 담겨진 vo가 반환
			
			result = dao.update(vo);
			// 폼태그 담은 vo를 실제로 DB에 넣어줌
			
			PrintWriter out = resp.getWriter();
			out.print(result);
			
		}else {
			System.out.println("error");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
		/*
		String path= urlAdmin+"/edit_product.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
		*/
	}
	
}
