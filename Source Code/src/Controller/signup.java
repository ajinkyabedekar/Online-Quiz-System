package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebInitParam;

import Model.Users;


@WebServlet(
		name = "signup", 
		urlPatterns = { "/signup" }, 
		initParams = { 
				@WebInitParam(name = "phone", value = "91")
		})
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Users user;
    String name,email,username,password;
    int phone;
    
    public signup() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("phone").equals(""))
			response.sendRedirect("Signup.jsp");
		name=request.getParameter("name");
		email=request.getParameter("email");
		username=request.getParameter("username");
		password=request.getParameter("password");
		phone=Integer.parseInt(request.getParameter("phone"));
		if(name.equals("") ||username.equals("") ||password.equals("") ||email.equals(""))
			response.sendRedirect("Signup.jsp");
		else
		{
			user=new Users(username,password);
			user.createUser(name, phone, email, username, password);
			try {
				user.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("login.jsp");

		}
		}

}
