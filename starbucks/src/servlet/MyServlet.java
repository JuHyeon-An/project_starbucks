package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderDaoJE;
import bean.OrderVo;
import bean.ShoppingCartDao;
import bean.ShoppingCartVo;
import bean.Shopping_MemberDao;
import bean.Shopping_MemberVo;

@WebServlet("*.my")
public class MyServlet extends HttpServlet{
	String url = "/my/index.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp = req.getRequestURI(); 
		int pos = temp.lastIndexOf("/");	
		String tempUrl = temp.substring(pos);
		
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
		case "/singleOrder.my":
			singleOrder(req, resp);
			break;
		case "/delete.my":
			delete(req, resp);
			break;
		}
	}
	
	// 마이페이지 인덱스 
	public void my (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Shopping_MemberDao dao = new Shopping_MemberDao();
		String mId = req.getParameter("mId2");
		
		Shopping_MemberVo vo = dao.view(mId);
		req.setAttribute("vo", vo);
		
		OrderVo orderVo = new OrderVo();
		OrderDaoJE orderDao = new OrderDaoJE();
		
		List<OrderVo> list = orderDao.select(mId);
		
		req.setAttribute("list", list);
		 
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

		String mId = req.getParameter("mId2");
		ShoppingCartDao dao = new ShoppingCartDao();
		
		List<ShoppingCartVo> list = dao.select(mId);
		
		req.setAttribute("list", list);
		
		String path = url + "?my=./cart.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	public void cart (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mId = req.getParameter("mId");
		String fileName = req.getParameter("fileName");
		String itemCode = req.getParameter("item_code");
		int price = Integer.parseInt(req.getParameter("oriPrice"));
		int itemEa = Integer.parseInt(req.getParameter("itemEaVal"));
		
		int totPrice = price*itemEa;
		
		ShoppingCartVo vo = new ShoppingCartVo(mId, fileName, itemCode, price, itemEa, totPrice);
		ShoppingCartDao dao = new ShoppingCartDao();

		
		int result = dao.insert(vo, mId);
		
		
		req.setAttribute("result", result);
		
		
		
		String path = url + "/item_view.pl";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp); 
		
	}
	
	public void order (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int cartTotalPrice = Integer.parseInt(req.getParameter("cartTotPriceHd"));
		List<ShoppingCartVo> list = new ArrayList<ShoppingCartVo>();
		int i=0;
		String title="";
		String itemCode = "";
		int ea = 0;
		int totPrice = 0;
		int flag = 0;
		
		while(true) {
			
			if(req.getParameter("itemTitle_"+i)==null) {
				break;
			}
			
			
			flag = Integer.parseInt(req.getParameter("chkFlag_"+i));
			itemCode = req.getParameter("itemCode_"+i);
			title = req.getParameter("itemTitle_"+i);
			ea = Integer.parseInt(req.getParameter("itemEaVal_"+i));
			
			totPrice = Integer.parseInt(req.getParameter("totPriceVal_"+i));
			
			String mId = req.getParameter("mId");
			String mName = req.getParameter("mName");
			if(flag == 1) {
				ShoppingCartVo cartVo = new ShoppingCartVo(mName, itemCode, title, ea, totPrice, mId);
				list.add(cartVo);
			}
			
			
			i++;
		}
		req.setAttribute("cartTotalPrice", cartTotalPrice);
		req.setAttribute("list", list);
		
		OrderDaoJE dao = new OrderDaoJE();
		OrderVo vo = new OrderVo();
		vo = dao.view(req.getParameter("mId"));
		
		req.setAttribute("vo", vo);
		String path = url + "?my=./order.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	// 상품 상세페이지에서 주문처리 
	public void singleOrder (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String cartTotalPrice = req.getParameter("totPrice");
		
		String totPrice = req.getParameter("totPrice");
		String itemTitle = req.getParameter("itemTitle");
		int ea = Integer.parseInt(req.getParameter("itemEaVal"));
		String itemCode = req.getParameter("item_code");
		
		System.out.println("itemEa" + req.getParameter("itemEaVal"));
		System.out.println("totPrice" + req.getParameter("totPrice"));
		System.out.println("item_code" + req.getParameter("item_code"));
		OrderDaoJE dao = new OrderDaoJE();
		OrderVo vo = new OrderVo();
		vo = dao.view(req.getParameter("mId"));
		
		req.setAttribute("cartTotalPrice", cartTotalPrice);
		req.setAttribute("itemTitle", itemTitle);
		req.setAttribute("totPrice", totPrice);
		req.setAttribute("ea", ea);
		req.setAttribute("vo", vo);
		
		String path = url + "?my=./order.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
	// 주문내역 
	public void orderList (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mId = req.getParameter("mId2");
		OrderVo vo = new OrderVo();
		OrderDaoJE dao = new OrderDaoJE();
		
		List<OrderVo> list = dao.select(mId);
		
		req.setAttribute("list", list);
		
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
		req.setCharacterEncoding("UTF-8");
		
		String mId = req.getParameter("mId");
		String code = req.getParameter("itemCode");
		
		String phone = req.getParameter("memPhone");
		String email = req.getParameter("memEmail");
		String zone = req.getParameter("zonecode");
		String addr1 = req.getParameter("address");
		String addr2 = req.getParameter("address2");
		String getNm = req.getParameter("getName");
		String getPhone = req.getParameter("getPhone");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		
		List<OrderVo> list = new ArrayList<OrderVo>();
		int result = 0;
		
 		int i = 0;
		while(true) {
			 
			if(req.getParameter("itemCode_"+i)==null) {
				break;
			}
			code = req.getParameter("itemCode_"+i);
			String mName = req.getParameter("mName");
			System.out.println("mName : " + mName);
			int ea = Integer.parseInt(req.getParameter("itemEa_"+i));
			
			//int serial = Integer.parseInt(req.getParameter("serial_"+i));
			int price = Integer.parseInt(req.getParameter("price_"+i));

			String orderDt = sdf.format(new Date());
			int orderStatus = 2;	// 주문처리상태 : 승인대기 설전 
			
			OrderVo vo = new OrderVo(mId, code, mName, phone, email, ea, price, getNm, getPhone, orderDt, orderStatus, zone, addr1, addr2);
			list.add(vo);
			OrderDaoJE dao = new OrderDaoJE();
			result = dao.insert(list);
			
			/*if(result==1){	// 	주문 성공 시 장바구니 상품 삭제처리 
				ShoppingCartDao cartDao = new ShoppingCartDao();
				cartDao.delete(serial); 
			}*/
			i++;
		}
		 
		req.setAttribute("list", list);
		req.setAttribute("result", result);
		
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
	
	// 장바구니 삭제 	
	public void delete (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int result = 0;
		
		int serial = Integer.parseInt(req.getParameter("delSerial"));
		ShoppingCartDao dao = new ShoppingCartDao();
		result = dao.delete(serial);
		
		req.setAttribute("result", result);
		
		String path = url + "?my=./cart.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
		
	}
	
}
