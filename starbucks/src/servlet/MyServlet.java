package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ShoppingCartDao;
import bean.ShoppingCartVo;
import bean.Shopping_MemberDao;
import bean.Shopping_MemberVo;

@WebServlet("*.my")
public class MyServlet extends HttpServlet{
	String url = "./my/index.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getRequestURI(); //   /insert.mm
		int pos = temp.lastIndexOf("/");	
		String tempUrl = temp.substring(pos);
		//System.out.println(url + tempUrl);
		
		switch(tempUrl) {
		case "/my.my":
			my(req, resp);
			break;
		case "/account.my":
			account(req, resp);
			break;
		case "/cart.my":
			goCart(req, resp);
			break;
//		case "/order.my":
//			order(req, resp);
//			break;
		case "/orderList.my":
			orderList(req, resp);
			break;
		case "/out.my":
			out(req, resp);
			break;
		}
	
		
		
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getRequestURI(); //   /insert.mm
		int pos = temp.lastIndexOf("/");	
		String tempUrl = temp.substring(pos);
		//System.out.println(url + tempUrl);
		
		switch(tempUrl) {
		case "/cart.my":
			cart(req, resp);
			break;
		case "/orderResult.my":
			orderResult(req, resp);
			break;
		case "/accountResult.my":
			accountResult(req, resp);
			break;
		case "/outResult.my":
			outResult(req, resp);
			break;
		case "/order.my":
			order(req, resp);
			break;
		}
	}
	
	public void my (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String path = url + "?my=./my.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void account (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Shopping_MemberDao dao = new Shopping_MemberDao();
		String mId2 = req.getParameter("mId2");
		
		Shopping_MemberVo vo = dao.view(mId2);
		req.setAttribute("vo", vo);
		
		String path = url + "?my=./account.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void goCart (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = url + "?my=./cart.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void cart (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("111");
		String mId = req.getParameter("mId");
		String fileName = req.getParameter("fileName");
		String itemCode = req.getParameter("item_code");
		int price = Integer.parseInt(req.getParameter("oriPrice"));
		int itemEa = Integer.parseInt(req.getParameter("itemEa"));
		int totPrice = price*itemEa;
		
		
		
		
		ShoppingCartVo vo = new ShoppingCartVo(mId, fileName, itemCode, price, itemEa, totPrice);
		ShoppingCartDao dao = new ShoppingCartDao();
		
		System.out.println("vo.getItemCode : " + vo.getItemCode());
		
		int result = dao.insert(vo, mId);
		System.out.println("result : " + result);
		
		req.setAttribute("result", result);
		String path = "/starbucks/product/product_view.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void order (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = url + "?my=./order.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void orderList (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = url + "?my=./order_list.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void out (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = url + "?my=./out.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	public void orderResult (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = url + "?my=./order_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void accountResult (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String path = url + "?my=./account_result.jsp";
		
		String msg = "데이터가 정상적으로 수정되었습니다.";
		
		String mId = req.getParameter("userId");
		String mName = req.getParameter("userNm");
		String pwd = req.getParameter("userPwd");
		String phone = req.getParameter("userPhone");
		String email = req.getParameter("memberEmail");
		String zone = req.getParameter("zonecode");
		String addr1 = req.getParameter("address");
		String addr2 = req.getParameter("address2");
		
		
		Shopping_MemberVo vo = new Shopping_MemberVo(mId, pwd, mName, phone, email, zone, addr1, addr2);
		Shopping_MemberDao dao = new Shopping_MemberDao();
		msg = dao.modify(vo);
		
		req.setAttribute("msg", msg);
		
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void outResult (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String mId = req.getParameter("mId2");
		String pwd = req.getParameter("userPwd");
		
		Shopping_MemberDao dao = new Shopping_MemberDao();
		int deleteData = dao.deleteData(mId, pwd);
		
		req.setAttribute("deleteData", deleteData);
		
		String path = url + "?my=./out_result.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	
}
