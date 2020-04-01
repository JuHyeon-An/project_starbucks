package servlet;


import java.util.Random;

import java.util.Properties;

import java.io.IOException;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import bean.EmailDao;
import bean.Shopping_MemberVo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.email")
public class EmailServlet extends HttpServlet {
	String url = "/member";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String temp = req.getRequestURI();
		int pos = temp.lastIndexOf("/");
		String tempURL = temp.substring(pos);
		
		switch (tempURL) {
		case "/idFind.email":
			idFind(req, resp);
			break;
		case "/pwFind.email":
			pwFind(req, resp);
			break;
		case "/idFindR.email":
			idFindR(req, resp);
			break;
		case "/pwFindR.email":
			pwFindR(req, resp);
			break;
		}

	}
	public void idFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/idFind.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	public void pwFind(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = url+"/pwFind.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	public void idFindR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mName = null;
		String email = null;
		
		System.out.println("아이디 찾기");
		System.out.println(req.getParameter("mName")+req.getParameter("email"));;
		if(req.getParameter("mName") != null && req.getParameter("mName") != "") {
			mName = req.getParameter("mName");
		}
		if(req.getParameter("email") != null && req.getParameter("email") != "") {
			email = req.getParameter("email");
		}
		System.out.println(mName + email +"아이디 이멜 확인");
		EmailDao dao = new EmailDao();
		Shopping_MemberVo vo = dao.idFind(mName, email);
		System.out.println("다오다음 이메일"+vo.getmId());
		if(vo.getmId() != null) {
			int flag = 1 ; // 아이디 찾는경우
			String msg = mName+"회원님의 아이디는 [ "+vo.getmId()+" ] 입니다.";
			int r = sendEmail(flag, email , msg, req, resp);
			
			if(r==1) {
				String path = url+"/idFind_result.jsp";
				RequestDispatcher rd=req.getRequestDispatcher(path);
				rd.forward(req, resp);
			}
			
		}
		
		
		
		
		
	}
	public void pwFindR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mId = null;
		String email = null;
		String mName = null;
		if(req.getParameter("mId") != null && req.getParameter("mId") != "") {
			mId = req.getParameter("mId");
		}
		if(req.getParameter("email") != null && req.getParameter("email") != "") {
			email = req.getParameter("email");
		}
		if(req.getParameter("mName") != null && req.getParameter("mName") != "") {
			mName = req.getParameter("mName");
		}
		EmailDao dao = new EmailDao();
		Shopping_MemberVo vo = dao.pwFind(mName, mId, email);
		
		if(vo.getmId() != null) {
			int flag = 2 ; // 비밀번호 찾는경우
			String msg = mId+"회원님의 비밀번호는 [ "+vo.getPwd()+" ] 입니다.";
			int r = sendEmail(flag, email , msg, req, resp);
			
			if(r==1) {
				String path = url+"/pwFind_result.jsp";
				RequestDispatcher rd=req.getRequestDispatcher(path);
				rd.forward(req, resp);
			}
			
		}
		
	}
	
	public int sendEmail(int flag, String email, String message, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			int r = 0;

			// mail server 설정
			String host = "smtp.naver.com";
			String user = "yuoper@naver.com"; // 자신의 네이버 계정
			String password = "!dudejr123";// 자신의 네이버 패스워드

			// 메일 받을 주소
			/* String to_email = m.getEmail(); */
			String to_email = email;

			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.debug", "true");

	
			StringBuffer temp = new StringBuffer();
			
			temp.append(message);


			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "스타벅스"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				if(flag==1) {
					msg.setSubject("안녕하세요 스타벅스 아이디 찾기 메일입니다.");

				}else if(flag ==2) {
					msg.setSubject("안녕하세요 스타벅스 비밀번호 찾기 메일입니다.");

				}
				
			
				// 메일 내용
				msg.setText( temp+ "");
   
				Transport.send(msg);
				r=1; //여기까지 흘러오면 반환값은 1
				System.out.println("이메일 전송");

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}finally {
				return r;
			}
			
//			HttpSession saveKey = req.getSession();
			
			
			
		}
		
		
	}


		
	

