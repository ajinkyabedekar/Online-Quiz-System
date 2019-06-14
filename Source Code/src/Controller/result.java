package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DatabaseHelper;


@WebServlet("/result")
public class result extends HttpServlet {
	private static final long serialVersionUID = 1L;
String param,s,strDate;
private int n,id;
private DatabaseHelper db=null;
PreparedStatement p=null;
ResultSet res;
    public result() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i,right=0,wrong=0;
		float accuracy=0.0f;
		Cookie c=null;
		HttpSession session=request.getSession();
		String stmt="select s.correct from solutions s,questions q where "
				+ "q.q_no=s.q_no and q.category_id=(select category_id "
				+ "from category where category_name=?);"; 
		db=new DatabaseHelper();
		try {
			p=db.getConnection().prepareStatement("select category_id from category where category_name=?");
			p.setString(1,(String)session.getAttribute("cat"));
			res=p.executeQuery();
			res.next();
			id=res.getInt(1);
			p=db.getConnection().prepareStatement(stmt);
			p.setString(1,(String)session.getAttribute("cat"));
			res=p.executeQuery();
			n=(int)request.getSession().getAttribute("num");
			for(i=1;i<=n;i++)
			{
	 			res.next();
				s="q"+i;
				param=request.getParameter(s);
				if(res.getInt(1)==Integer.parseInt(param))
					right++;
				else 
					wrong++;
			}
			accuracy=(right/n)*100f;
			System.out.println(accuracy);
			//session.setAttribute("accuracy", accuracy);
			p=db.getConnection().prepareStatement("insert into scores values(?,?,?,?,?,?)");
			p.setString(1,(String)session.getAttribute("username"));
			p.setInt(2, right);
			p.setInt(3,id);
			p.setString(4,new SimpleDateFormat("hh:mm:ss").format(new Date()));
			p.setString(5,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			p.setFloat(6,accuracy);
			p.executeUpdate();
			db.closeConnection();
			c=new Cookie("score",right+"/"+n);
			c.setMaxAge(5);
			response.addCookie(c);
			response.sendRedirect("quizPage.jsp");
			
		} catch (SQLException e) {
			db.closeConnection();
			e.printStackTrace();
		}
		//doGet(request, response);
	}

}
