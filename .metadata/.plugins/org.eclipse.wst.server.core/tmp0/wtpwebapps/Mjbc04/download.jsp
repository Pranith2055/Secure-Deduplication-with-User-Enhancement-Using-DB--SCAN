<%@page import="com.controller.DAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="application/octet-stream" pageEncoding="ISO-8859-1"%>
<%
    String skey = request.getParameter("skey");
    if (skey != null && !skey.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DAO.getConnection();
            ps = con.prepareStatement("SELECT keyword, file FROM uploads WHERE skey = ?");
            ps.setString(1, skey);
            rs = ps.executeQuery();

            if (rs.next()) {
                String filename = rs.getString("keyword");
                Blob blob = rs.getBlob("file");
                int blobLength = (int) blob.length();
                byte[] fileBytes = blob.getBytes(1, blobLength);

                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                response.setContentLength(blobLength);

                OutputStream out1 = response.getOutputStream();
                out1.write(fileBytes);
                out1.flush();
                out1.close();
            } else {
                out.println("File not found or key invalid.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception ignored) {}
            if (ps != null) try { ps.close(); } catch (Exception ignored) {}
            if (con != null) try { con.close(); } catch (Exception ignored) {}
        }
    } else {
        out.println("Security key is missing.");
    }
%>
