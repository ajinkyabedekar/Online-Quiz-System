package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseHelper {
	Connection con=null;
	private final String CREATEADMIN="create table if not exists admin(" + 
			"admin_id INTEGER primary key," + 
			"name varchar(100)," + 
			"username varchar(50) not null," + 
			"password varchar(100) not null);";
	private final String CREATEUSER="create table if not exists users(" + 
			"name varchar(100)," + 
			"username varchar(50) primary key not null," + 
			"password varchar(100) not null," + 
			"email varchar(100) not  null," + 
			"phone BIGINT," + 
			"Image varchar(50));";
	private final String CREATECATEGORY="create table if not exists category(" + 
			"category_id INTEGER primary key not null AUTO_INCREMENT," + 
			"category_name varchar(100)," + 
			"max_time TIME not null," + 
			"instruction TEXT);" ;
	private final String CREATEINSTRUCTIONS="create table if not exists instructions(" + 
			"instruction_id INTEGER primary key AUTO_INCREMENT," + 
			"instruction_number INTEGER," + 
			"instruction TEXT not null," + 
			"category_id INTEGER references category(category_id));";
	private final String CREATEQUESTIONS="create table if not exists questions(" + 
			"q_no INTEGER primary key not null AUTO_INCREMENT," + 
			"question TEXT not null," + 
			"category_id INTEGER references category(category_id));";
	private final String CREATESOLUTIONS="create table if not exists solutions(" + 
			"sol_no INTEGER primary key not null AUTO_INCREMENT," + 
			"q_no INTEGER references questions(q_no)," + 
			"opt1 TEXT not null," + 
			"opt2 TEXT not null," + 
			"opt3 TEXT not null," + 
			"opt4 TEXT not null," + 
			"correct INTEGER not null)"; 
	private final String CREATESCORES="create table if not exists scores(" + 
			"username varchar(50) references users(username)," + 
			"score INTEGER not null," + 
			"category_id INTEGER references category(category_id)," + 
			"time_completed TIME," + 
			"sub_date DATE,"
			+ "accuracy float not null);"; 
	PreparedStatement init=null;
	
	public DatabaseHelper() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/quiz";
			String user = "root";
			String pass = "Bahu@123";
			Connection con = DriverManager.getConnection(url, user, pass);
			this.con = con;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public Connection getConnection() {
		return con;
	}

	public void closeConnection() {
		try {
			con.close();
			System.out.println("DatabaseHelper connection closed"+con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void prepare()
	{
		try {
			init=con.prepareStatement(CREATEADMIN);
			init.executeUpdate();
			init=con.prepareStatement(CREATEUSER);
			init.executeUpdate();
			init=con.prepareStatement(CREATECATEGORY);
			init.executeUpdate();
			init=con.prepareStatement(CREATEINSTRUCTIONS);
			init.executeUpdate();
			init=con.prepareStatement(CREATEQUESTIONS);
			init.executeUpdate();
			init=con.prepareStatement(CREATESOLUTIONS);
			init.executeUpdate();
			init=con.prepareStatement(CREATESCORES);
			init.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}