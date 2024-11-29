<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("user_id");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String birthdate = request.getParameter("birthdate");
    String gender = request.getParameter("gender");
    String role = request.getParameter("role");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expensemanagementsystem", "root", "Root@123");

        if (userId == null || userId.isEmpty()) {
            // Insert new user
            String sql = "INSERT INTO users (username, email, password, birthdate, gender, role) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, birthdate);
            pstmt.setString(5, gender);
            pstmt.setString(6, role);
        } else {
            // Update existing user
            String sql = "UPDATE users SET username = ?, email = ?, password = ?, birthdate = ?, gender = ?, role = ? WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, birthdate);
            pstmt.setString(5, gender);
            pstmt.setString(6, role);
            pstmt.setInt(7, Integer.parseInt(userId));
        }

        pstmt.executeUpdate();
        response.sendRedirect("manageUsers.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
