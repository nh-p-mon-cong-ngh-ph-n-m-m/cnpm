package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.GooglePojo;

 
@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginGoogleServlet() {
        super();
           }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			 
				HttpSession session = request.getSession();
			    String code = request.getParameter("code");
			    if (code == null || code.isEmpty()) {
			      RequestDispatcher dis = request.getRequestDispatcher("dangnhap.jsp");
			      dis.forward(request, response);
			    } else {
			      String accessToken = GoogleUtils.getToken(code);
			      GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
			      session.setAttribute("account", googlePojo);
			      String type = "google";
			      session.setAttribute("type", type);
			      RequestDispatcher dis = request.getRequestDispatcher("Result.jsp");
			      dis.forward(request, response);
			    }
			    
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("account");
		session.invalidate();
		response.sendRedirect("dangnhap.jsp");
	}

}
