package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.DatabaseHelper;


@WebServlet({ "/addCategory", "/addcat" })
public class addCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String cat,inst;
    int time;
	DatabaseHelper db;
	final private String INSERTQUES="insert into category (category_name,max_time,instruction) values(?,?,?);";
    public addCategory() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie=new Cookie("success","Category_added");
		cookie.setMaxAge(5);
		cat=request.getParameter("cat");
		time=Integer.parseInt(request.getParameter("time"));
		inst=request.getParameter("inst");
		db=new DatabaseHelper();
		try {
			PreparedStatement p=db.getConnection().prepareStatement(INSERTQUES);
			p.setString(1,cat);
			p.setInt(2,time);
			p.setString(3,inst);
			p.executeUpdate();
			db.closeConnection();
			response.addCookie(cookie);
			response.sendRedirect("/Quiz_System/admin/addCategory.jsp");
			
		} catch (SQLException e) {
			db.closeConnection();
			e.printStackTrace();
		}
	}

}
