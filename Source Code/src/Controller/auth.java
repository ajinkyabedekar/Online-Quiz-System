package Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Users;

@WebServlet("/auth")
public class auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Users user;
	private ResultSet rs;
	public String error,type;
	
	public auth() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		HttpSession session=request.getSession();
		Cookie c=new Cookie("alert",error);
		c.setMaxAge(1);
		String username, password;
		username = request.getParameter("email");
		password = request.getParameter("pass");
		if(username.equals(""))
		{
			error="Username_can't_be_empty!";
			c.setValue(error);
			response.addCookie(c);
			response.sendRedirect("login.jsp");
		}
		else if(password.equals(""))
		{
			error="Please_enter_your_password!";
			c.setValue(error);
			response.addCookie(c);
			response.sendRedirect("login.jsp");
		}
		else {
			user = new Users(username, password);
			type=user.getUserType();
			
		if (type!=null && type.equals("users")) {
			System.out.println("USER Auth success!");
			rs=user.getUser(type);
			System.out.println(type);
			try {
				rs.next();
				session.setAttribute("name", rs.getString(1));
				session.setAttribute("username", rs.getString(2));
				session.setAttribute("password", rs.getString(3));
				session.setAttribute("email", rs.getString(4));
				session.setAttribute("phone", rs.getString(5));
				session.setAttribute("image", rs.getString(6));
				session.setAttribute("type", type);
				user.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("Dashboard.jsp");
		}
		else if(type!=null && type.equals("admin"))
		{
			System.out.println("ADMIN Auth success!");
			rs=user.getUser(type);
			try {
				rs.next();
				session.setAttribute("id", rs.getString(1));
				session.setAttribute("name", rs.getString(2));
				session.setAttribute("username", rs.getString(3));
				session.setAttribute("type", type);

				user.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("admin/Dashboard.jsp");
		}
		else
		{
			error= "Invalid_User!_"+username;
			c.setValue(error);
			response.addCookie(c);
			response.sendRedirect("login.jsp");
		}
		}
			
	}

}
