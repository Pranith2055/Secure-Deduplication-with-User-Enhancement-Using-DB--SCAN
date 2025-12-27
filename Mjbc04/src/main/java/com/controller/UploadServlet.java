package com.controller;

import java.io.BufferedReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String keyword = request.getParameter("keyword");
	    InputStream fileContent = null;
	    Part filePart = request.getPart("file");
	    HttpSession session = request.getSession();
       String userid=(String)session.getAttribute("user");
	    String message;

	    try {
	        fileContent = filePart.getInputStream();
	        InputStream io = filePart.getInputStream(); // for storing BLOB later

	        // Read file content into a string
	        BufferedReader reader = new BufferedReader(new InputStreamReader(fileContent));
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            sb.append(line).append("\n");
	        }
	        String s = sb.toString(); // textdata

	        // Encrypt the file content
	        SecretKey key = Algorithm.generateKey();
	        IvParameterSpec iv = Algorithm.generateIv();
	        String encryptedText = Algorithm.encrypt(s, key, iv);
	        
	        String shaenc=SHA.sha256(encryptedText);
	        System.out.println(shaenc+""+"checkkkkk");

	        // Generate a random string key
	        String key1 = RandomString.generatekey();

	        // Connect to DB
	        Connection conn = DAO.getConnection();

	        // Check if keyword already exists
	        PreparedStatement checkKeywordStmt = conn.prepareStatement("SELECT COUNT(*) FROM uploads WHERE keyword = ?");
	        checkKeywordStmt.setString(1, keyword);
	        ResultSet rsKeyword = checkKeywordStmt.executeQuery();
	        rsKeyword.next();

	        // Check if the same textdata already exists
	        PreparedStatement checkTextStmt = conn.prepareStatement("SELECT COUNT(*) FROM uploads WHERE textdata = ?");
	        checkTextStmt.setString(1, s);
	        ResultSet rsText = checkTextStmt.executeQuery();
	        rsText.next();

	        if (rsText.getInt(1) > 0) {
	            message = "This file has already been uploaded!";
	        } else if (rsKeyword.getInt(1) > 0) {
	            message = "Keyword already exists!";
	        } else {
	            // Insert the file and data
	            PreparedStatement insertStmt = conn.prepareStatement(
	                "INSERT INTO uploads (keyword, file, textdata, crypto, skey, userid) VALUES (?, ?, ?, ?, ?, ?)"
	            );
	            insertStmt.setString(1, keyword);
	            insertStmt.setBlob(2, io);
	            insertStmt.setString(3, s);
	            insertStmt.setString(4, shaenc);
	            insertStmt.setString(5, key1);
	            insertStmt.setString(6, userid);
	            insertStmt.executeUpdate();
	            message = "File uploaded successfully!";
	        }

	        conn.close();
	    } catch (Exception e) {
	        message = "ERROR: " + e.getMessage();
	    }

	    // Forward result message to upload.jsp
	    request.setAttribute("message", message);
	    request.getRequestDispatcher("upload.jsp").forward(request, response);
	}

}
