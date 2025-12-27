package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class DAO {
public static Connection getConnection() throws ClassNotFoundException, SQLException {
	
	Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/BC04Mini";
    String user = "root";
    String password = "root";
    Connection con= DriverManager.getConnection(url, user, password);
	return con;
}

public static int sendrequest(int fid,String fname,String uid) throws ClassNotFoundException, SQLException {

	Connection conn = DAO.getConnection();
	String sql = "insert into searchdata values(?,?,?,?)";

	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, fid);
	ps.setString(2, fname);
	ps.setString(3, uid);
	ps.setString(4, "pending");
	

	int rs=ps.executeUpdate();
	return rs;

}
public static ResultSet getpendingdata() throws ClassNotFoundException, SQLException {

	Connection conn = DAO.getConnection();
	String sql = "select * from searchdata where status ='pending'";

	PreparedStatement ps = conn.prepareStatement(sql);
	
	

	ResultSet rs=ps.executeQuery();
	return rs;

}
public static ResultSet getusers() throws ClassNotFoundException, SQLException {

	Connection conn = DAO.getConnection();
	String sql = "select * from users ";

	PreparedStatement ps = conn.prepareStatement(sql);
	
	

	ResultSet rs=ps.executeQuery();
	return rs;

}
public static ResultSet getKey(String uid) throws ClassNotFoundException, SQLException {

	Connection conn = DAO.getConnection();
	String sql = "select * from searchdata where uid= '"+uid+"'";

	PreparedStatement ps = conn.prepareStatement(sql);
	
	

	ResultSet rs=ps.executeQuery();
	return rs;

}

}
