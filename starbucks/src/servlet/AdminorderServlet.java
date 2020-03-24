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
	String url = "index.jsp?cont=../admin";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp= req.getRequestURI();
		System.out.println(temp);
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
	
		switch(tempURL) {
		
		case "/order.order"://가져오는
			System.out.println("짜증나네");
			order(req , resp);
			break;
		
		
		
		}

	}
	private void order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      System.out.println(url);
	      
		  String findStr=req.getParameter("findStr");
	      System.out.println("야야");
	      OrderDao dao=new OrderDao();
	     
	      List<OrderVo> list = dao.select(findStr);
	      
	      req.setAttribute("list", list);
	      String path=url+"/order.jsp";
	      
	      System.out.println(path+"");
	      
	      RequestDispatcher rd = req.getRequestDispatcher(path);
	      rd.forward(req, resp);
	      
	      
	   }


}
