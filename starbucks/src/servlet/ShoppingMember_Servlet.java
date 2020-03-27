package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Shopping_MemberDao;

@WebServlet("*.sm")
@MultipartConfig
public class ShoppingMember_Servlet extends HttpServlet{
	String url = "/member";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("두겟!!");
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
		System.out.println(tempURL);
		switch (tempURL) {
		case "/idck.sm":
			idck(req, resp);
			break;
		case "/login.sm":
			login(req, resp);
			break;
		case "/loginR.sm":
			loginR(req, resp);
			break;
		case "/join.sm":
			join(req, resp);
			break;
		}
	}
	public void idck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여까지오나");
		String path = url+"/check_id.jsp";
		String mId = req.getParameter("mId");
		
		Shopping_MemberDao dao = new Shopping_MemberDao();
		int result = dao.idCheck(mId);
		String msg = "";
		if (result == 0) {
            msg = mId + "는 사용가능한 아이디 입니다.";
        } else {
            msg = mId + "는 사용할 수 없는 아이디 입니다.";
        }
        req.setAttribute("msg", msg);


		
		
		
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/login.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void loginR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/login_result.jsp";
		String mId = req.getParameter("mId");
		String pwd = req.getParameter("pwd");

		
		Shopping_MemberDao dao = new Shopping_MemberDao();
		
		String r = dao.login(mId, pwd)+"";
		
		req.setAttribute("result", r);

		
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void join(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/join.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
