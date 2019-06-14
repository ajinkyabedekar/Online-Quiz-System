package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Users {
	DatabaseHelper db;
	Connection con = null;
	ResultSet rs = null;
	boolean res = false;
	int r = 0;
	String username, password, name = "";

	public Users(String username, String password) {
		System.out.println("Users connection initialized ");
		db = new DatabaseHelper();
		this.username = username;
		this.password = password;
	}

	public String getUserType() {
		try {
			String stmt = "Select * from Users where username=? and password=?";
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, username);
			ps.setString(2, password);
			if (ps.executeQuery().next())
				return "users";
			else {
				stmt = "Select * from admin where username=? and password=?";
				con = db.getConnection();
				ps = con.prepareStatement(stmt);
				ps.setString(1, username);
				ps.setString(2, password);
				if (ps.executeQuery().next())
					return "admin";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.close();
				db.closeConnection();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}

	public ResultSet getUser(String type) {

		try {
			String stmt = "Select * from " + type + " where username=?";
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, username);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.close();
				db.closeConnection();
				System.out.println("Users connection closed " + con);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return rs;
	}

	public int createUser(String name, int phone, String email, String username, String password) {
		try {
			String stmt = "insert into users values(?,?,?,?,?,?)";
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(stmt);
			ps.setString(1, name);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setString(4, email);
			ps.setInt(5, phone);
			ps.setString(6, "default.png");
			r = ps.executeUpdate();
			System.out.println(r);
			return r;

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.close();
				db.closeConnection();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return r;
	}

	public void closeConnection() throws SQLException {
		con.close();
		db.closeConnection();
	}
}
