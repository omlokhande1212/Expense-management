<%@ page import="java.sql.*, java.io.*" %>
<% 
    String dbUrl = "jdbc:mysql://localhost:3306/expensemanagementsystem";
    String dbUser = "root";
    String dbPassword = "Root@123";

    String username = (String) session.getAttribute("username");
    String category = request.getParameter("category");
    String startDate = request.getParameter("start_date");
    String endDate = request.getParameter("end_date");

    if (username != null && category != null && startDate != null && endDate != null) {
        Connection con = null;
        PreparedStatement userPst = null;
        PreparedStatement expensePst = null;
        ResultSet userRs = null;
        ResultSet expenseRs = null;

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=expense_report.csv");

        try (PrintWriter writer = response.getWriter()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String userQuery = "SELECT user_id FROM users WHERE username = ?";
            userPst = con.prepareStatement(userQuery);
            userPst.setString(1, username);
            userRs = userPst.executeQuery();

            int userId = -1;
            if (userRs.next()) {
                userId = userRs.getInt("user_id");
            }

            if (userId != -1) {
                String expenseQuery = "SELECT * FROM expenses WHERE user_id = ? AND category = ? AND date BETWEEN ? AND ?";
                expensePst = con.prepareStatement(expenseQuery);
                expensePst.setInt(1, userId);
                expensePst.setString(2, category);
                expensePst.setString(3, startDate);
                expensePst.setString(4, endDate);

                expenseRs = expensePst.executeQuery();

                // Write CSV header
                writer.println("Expense ID,Category,Amount,Date,Description");

                while (expenseRs.next()) {
                    writer.println(
                        expenseRs.getInt("expense_id") + "," +
                        expenseRs.getString("category") + "," +
                        expenseRs.getDouble("amount") + "," +
                        expenseRs.getDate("date") + "," +
                        expenseRs.getString("description")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (userRs != null) userRs.close();
                if (expenseRs != null) expenseRs.close();
                if (userPst != null) userPst.close();
                if (expensePst != null) expensePst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
