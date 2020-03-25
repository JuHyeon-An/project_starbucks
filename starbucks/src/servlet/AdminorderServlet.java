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
import bean.Page;

@WebServlet("*.order")
public class AdminorderServlet extends HttpServlet {
	String url = "/admin/list.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp= req.getRequestURI();
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
	      int nowPage=1;
	      OrderDao dao=new OrderDao();

	      System.out.println(req.getParameter("findStr"));
	      if(req.getParameter("nowPage")!=null) {
	    	  nowPage=Integer.parseInt(req.getParameter("nowPage"));
	      }
	      
		  if(req.getParameter("findStr")!=null) {
			  System.out.println("------------------------");
			  findStr=req.getParameter("findStr");
			  System.out.println(findStr+" 문자 값이  안아아오아아아아아왜애애애");
		  }
		  Page page =new Page();
		  page.setNowPage(nowPage);
		  page.setFindStr(findStr);
		  System.out.println(findStr+"서블렛검색어");
		  page.pageCompute();
		
	      List<OrderVo> list = dao.select(page);
	     
	      
	      req.setAttribute("list", list);
	      req.setAttribute("page", page);
	      System.out.println("여기가 찍히나요");
	    
	      
	      
	      
	      for(OrderVo vo:list) {//값을 확인
	    	System.out.println("여긴서블");
	    	System.out.println(vo.getOrderNumber());
	    	System.out.println(vo.getMemberId());
	  		System.out.println(vo.getItemCode());
	  		System.out.println(vo.getOrderNum());
	  		System.out.println(vo.getOrderPrice());
	  		System.out.println(vo.getOrderregDate());
	  		System.out.println(vo.getOrderStatus());
	    	  
	      }

	      String path=url+"?cont=./order.jsp"; //
	      System.out.println(path);
	      RequestDispatcher rd = req.getRequestDispatcher(path);
	      rd.forward(req, resp);
	      System.out.println("서블릿 마지막");
	      
	   }


}