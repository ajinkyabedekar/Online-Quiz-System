package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DatabaseHelper;


@WebServlet({ "/addQuestion", "/aq" })
public class addQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String ques,opt1,opt2,opt3,opt4,cat;
    int correct,cat_id,q;
    private ResultSet rs=null;
    private PreparedStatement p=null;
	DatabaseHelper db;
	final private String INSERTQUES="insert into questions (question,category_id) values(?,?);";
    public addQuestion() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie=new Cookie("succeess","Question_added");
		cookie.setMaxAge(5);
		cat=request.getParameter("select");
		ques=request.getParameter("textarea");
		opt1=request.getParameter("opt1");
		opt2=request.getParameter("opt2");
		opt3=request.getParameter("opt3");
		opt4=request.getParameter("opt4");
		correct=Integer.parseInt(request.getParameter("correct"));
		db=new DatabaseHelper();
		try {
			
			p=db.getConnection().prepareStatement("select category_id from category where category_name=?");
			p.setString(1,cat);
			rs=p.executeQuery();
			rs.next();
			cat_id=rs.getInt(1);
			
			p=db.getConnection().prepareStatement(INSERTQUES);
			p.setString(1,ques);
			p.setInt(2,cat_id);
			p.executeUpdate();
			
			p=db.getConnection().prepareStatement("select q_no from questions where question=?");
			p.setString(1,ques);
			rs=p.executeQuery();
			rs.next();
			q=rs.getInt(1);
			
			p=db.getConnection().prepareStatement("insert into solutions (q_no,opt1,opt2,opt3,opt4,correct) values(?,?,?,?,?,?);");
			p.setInt(1,q);
			p.setString(2, opt1);
			p.setString(3, opt2);
			p.setString(4, opt3);
			p.setString(5, opt4);
			p.setInt(6, correct);
			p.executeUpdate();
			db.closeConnection();
			response.addCookie(cookie);
			response.sendRedirect("/Quiz_System/admin/addQ.jsp");
			
		} catch (SQLException e) {
			db.closeConnection();
			e.printStackTrace();
		}
	}

}
