package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderDao;
import bean.OrderVo;

@WebServlet("*.order")
public class AdminorderServlet extends HttpServlet {
	String url = "/admin/list.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp= req.getRequestURI();
		System.out.println(temp);
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
	
		switch(tempURL) {
		
		case "/order.order"://가져오는
			order(req , resp);
			break;
		
			
		
		}

	}
	private void order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      String findStr="";
		  if(req.getParameter("findStr")!=null) {
			  findStr=req.getParameter("findStr");
		  }

	      String findStr = req.getParameter("findStr");
	      OrderDao dao=new OrderDao();
	      List<OrderVo> list = dao.select(findStr);
	      req.setAttribute("list", list);

	      String path=url+"?cont=./order.jsp";
	      
	      for(OrderVo vo:list) {
	    	  System.out.println("여긴서블");
	    	  System.out.println(vo.getOrderNumber());
	    	  System.out.println(vo.getMemberId());
	  		System.out.println(vo.getItemCode());
	  		System.out.println(vo.getOrderNum());
	  		System.out.println(vo.getOrderPrice());
	  		System.out.println(vo.getOrderregDate());
	  		System.out.println(vo.getOrderStatus());
	    	  
	      }
	      System.out.println(path+"");
	      String path=url+"?str=./order.jsp&findStr="+findStr;
	      System.out.println(path);
	      RequestDispatcher rd = req.getRequestDispatcher(path);
	      rd.forward(req, resp);
	      
	      
	   }


}
