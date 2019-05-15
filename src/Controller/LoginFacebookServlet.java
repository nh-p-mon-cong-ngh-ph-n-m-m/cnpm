package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Account;

@WebServlet({ "/Login" })
public class LoginFacebookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginFacebookServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
	
		if(action.equals("Face")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			Account account = new Account(id,name,"",email,"","","",0,0);
			session.setAttribute("account", account);
			 String type = "facebook";
			session.setAttribute("type", type);
		    RequestDispatcher dis = request.getRequestDispatcher("Result.jsp");
		    dis.forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("account");
		session.invalidate();
		response.sendRedirect("dangnhap.jsp");
	}

}
