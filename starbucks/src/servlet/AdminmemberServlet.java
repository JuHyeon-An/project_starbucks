package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.OrderMemberDao;
import bean.Page;
import bean.Shopping_MemberVo;

@WebServlet("*.adminmember")
public class AdminmemberServlet extends HttpServlet {
	String url = "index.jsp?cont=../admin/";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
	    resp.setContentType("text/html; charset=utf-8");
		String temp= req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);

		switch(tempURL) {
		
		case "/admin.adminmember"://가져오는
			select(req , resp);
			break;			
			
		case "/member_view.adminmember":
			member_view(req, resp);
			break;

		case "/modify.adminmember":
			member_update(req, resp);
			break;
	
			
		}

	}
	
	private void select(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     System.out.println("서블릿 시작점");
		
		  String findStr="";
	      int nowPage=1;
	      OrderMemberDao dao= new OrderMemberDao();

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
		
	      List<Shopping_MemberVo> list = dao.select(page);
	     
	      
	      req.setAttribute("list", list);
	      req.setAttribute("page", page);
	      System.out.println(list + "listsssss");
	      System.out.println(page+ "asdasdpagepage");
	      System.out.println("여기가 찍히나요");
	    
	      
	      


	      String path=url+"admin_member.jsp"; //
	      System.out.println(path);
	      RequestDispatcher rd = req.getRequestDispatcher(path);
	      rd.forward(req, resp);
	     
	      
	   }
	public void member_view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		OrderMemberDao dao = new OrderMemberDao();//디비연결 및 vo호출하기위해
		//String mId = req.getParameter("mId"); //필요이유: 스크립트단에 view에 function(mid)에 넣어서 실행해 셀렉폼태그의 hidden mid에 내가 선택한것이 들어가서
												//view.mm을 불러들였고 결국req에 들어있다.req폼태그 가져왔음..
		//MemberVo vo = dao.view(mId); //view가가진 mid호출 
		Shopping_MemberVo vo = new Shopping_MemberVo();
		
		vo = dao.view(req.getParameter("mId"));//
		
		System.out.println("우아아아아"+vo.getmId());
		
		req.setAttribute("vo", vo);
		
		
	
		
		
		
		String path=url+"accounts.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	
	

	public void member_update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Shopping_MemberVo vo = new Shopping_MemberVo();
		OrderMemberDao dao = new OrderMemberDao();
		
		vo.setmId(req.getParameter("mId"));
		vo.setrDate(req.getParameter("rDate"));
		//아이디랑 가입날짜 빼고 모두수정가능
		
		vo.setmName(req.getParameter("mName"));
		vo.setSavedMoney(Integer.parseInt(req.getParameter("savedMoney")));
		vo.setEmail(req.getParameter("email"));
		vo.setPhone(req.getParameter("phone"));
		vo.setZip(req.getParameter("zip"));
		vo.setAddr1(req.getParameter("addr1"));
		vo.setAddr2(req.getParameter("addr2"));
		
	  
		String msg = dao.modify(vo);
		req.setAttribute("msg", msg); //여기가 뷰의 값
		req.setAttribute("vo", vo);
		String path=url+"accounts.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	
		
	}
}
