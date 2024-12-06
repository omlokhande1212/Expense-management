<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expensemanagementsystem", "root", "Root@123");

        String sql = "DELETE FROM users WHERE user_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(userId));
        pstmt.executeUpdate();
        response.sendRedirect("manageUsers.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
