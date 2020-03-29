//주현 전용 서블릿!!!!!!!!
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.FileUpload;
import bean.ProductDao;
import bean.ProductDao_YD;
import bean.ProductVo;

@WebServlet("*.stb")
public class ServletJH extends HttpServlet{
	String urlAdmin = "index.jsp?cont=../admin";
	String findStr = "";

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
			
		case "/select_productR.stb":
			selectProductsR(req, resp);
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
			
		case "/delete_productR.stb":
			deleteProductsR(req, resp);
			break;
			
		case "/product_group.stb":
			editGroup(req, resp);
			break;
		}

	}
		
	
	// 주현 : admin - 상품 조회
	public void selectProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		if(req.getParameter("findStr")!=null) {
			findStr = req.getParameter("findStr");
		}
		
		ProductDao dao = new ProductDao();
		List<ProductVo> list = dao.select(findStr);
		req.setAttribute("list", list);
		
		String path= urlAdmin+"/products.jsp?findStr="+findStr;
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
		String msg = "";
		
		if(upload.uploadFormCheck()) { // enctype = 'multipart/form-data'
			ProductVo vo = upload.uploading();
			// 사진을 포함해서 모든 폼태그가 담겨진 vo가 반환
			
			int r = dao.update(vo);
			// 폼태그 담은 vo를 실제로 DB에 넣어줌
			if(r>0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
		}else {
			System.out.println("error");
			resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		req.setAttribute("msg", msg);
		
		String path= urlAdmin+"/edit_product_result.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void deleteProductsR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		ProductDao dao = new ProductDao();
		int result = dao.deleteItem(req.getParameter("item_code"));
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
	
	public void editGroup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String path= urlAdmin+"/product_category.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	// 주현 : admin - 상품 조회
	public void selectProductsR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		ProductDao dao = new ProductDao();
		String findStr = "";
		System.out.println(req.getParameter("findStr"));
		if(req.getParameter("findStr")!=null) {
			findStr = req.getParameter("findStr");
		}else {
			selectProducts(req, resp);
			return;
		}
		System.out.println("검색어 : "+findStr);
		List<ProductVo> list = new ArrayList<ProductVo>();
		list = dao.select(findStr);
		System.out.println(list.get(0).getItem_code());
		System.out.println(list.get(1).getItem_code());
		
		String json = "";
		Gson gson = new Gson();
			json = gson.toJson(list);
		System.out.println("json : "+json);
		
		/*
		String path= urlAdmin+"/products.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
		*/
		
		PrintWriter out = resp.getWriter();
		out.print(json);
	}
	
}
