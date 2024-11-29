/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.27
 * Generated at: 2024-11-24 06:01:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class setBudget_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <title>Set Monthly Budget - Expense Manager</title>\r\n");
      out.write("  <!-- Bootstrap CSS -->\r\n");
      out.write("  <link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("  <!-- FontAwesome Icons -->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\">\r\n");
      out.write("  <!-- SweetAlert2 for alerts -->\r\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>\r\n");
      out.write("  <!-- Custom CSS for consistent styling -->\r\n");
      out.write("  <style>\r\n");
      out.write("    /* General Styles */\r\n");
      out.write("    body {\r\n");
      out.write("      font-family: 'Arial', sans-serif;\r\n");
      out.write("      background-color: #f8f9fa;\r\n");
      out.write("      margin: 0;\r\n");
      out.write("      display: flex;\r\n");
      out.write("      flex-direction: column;\r\n");
      out.write("      min-height: 100vh;\r\n");
      out.write("    }\r\n");
      out.write(".navbar {\r\n");
      out.write("            background-color: #007BFF;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar .navbar-brand {\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar .navbar-nav {\r\n");
      out.write("            margin-left: auto;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .navbar .nav-link {\r\n");
      out.write("            color: white !important;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    /* Sidebar Styles */\r\n");
      out.write("    .sidebar {\r\n");
      out.write("      background-color: #343a40;\r\n");
      out.write("      color: white;\r\n");
      out.write("      min-height: 100vh;\r\n");
      out.write("      position: fixed;\r\n");
      out.write("      top: 0;\r\n");
      out.write("      left: 0;\r\n");
      out.write("      width: 250px;\r\n");
      out.write("      padding-top: 30px;\r\n");
      out.write("      transition: all 0.3s;\r\n");
      out.write("      z-index: 1000;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .sidebar a {\r\n");
      out.write("      color: #f8f9fa;\r\n");
      out.write("      padding: 15px;\r\n");
      out.write("      text-decoration: none;\r\n");
      out.write("      display: block;\r\n");
      out.write("      transition: all 0.3s;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .sidebar a:hover {\r\n");
      out.write("      background-color: #007BFF;\r\n");
      out.write("      color: white;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .sidebar-toggle {\r\n");
      out.write("      display: none;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    /* Main Content Wrapper */\r\n");
      out.write("    .content-wrapper {\r\n");
      out.write("      margin-left: 250px;\r\n");
      out.write("      padding: 30px;\r\n");
      out.write("      transition: all 0.3s;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    /* Responsive adjustments for sidebar */\r\n");
      out.write("    @media (max-width: 992px) {\r\n");
      out.write("      .sidebar {\r\n");
      out.write("        left: -250px;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .sidebar.open {\r\n");
      out.write("        left: 0;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .sidebar-toggle {\r\n");
      out.write("        display: inline-block;\r\n");
      out.write("        color: white;\r\n");
      out.write("        font-size: 24px;\r\n");
      out.write("        cursor: pointer;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .content-wrapper {\r\n");
      out.write("        margin-left: 0;\r\n");
      out.write("        padding: 20px;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .overlay {\r\n");
      out.write("        display: none;\r\n");
      out.write("        position: fixed;\r\n");
      out.write("        top: 0;\r\n");
      out.write("        left: 0;\r\n");
      out.write("        width: 100%;\r\n");
      out.write("        height: 100%;\r\n");
      out.write("        background: rgba(0, 0, 0, 0.5);\r\n");
      out.write("        z-index: 999;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .overlay.show {\r\n");
      out.write("        display: block;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    /* Main Content Section */\r\n");
      out.write("    .main-content {\r\n");
      out.write("      padding: 20px;\r\n");
      out.write("      background-color: #ffffff;\r\n");
      out.write("      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);\r\n");
      out.write("      border-radius: 8px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @media (max-width: 768px) {\r\n");
      out.write("      .main-content {\r\n");
      out.write("        padding: 15px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @media (max-width: 576px) {\r\n");
      out.write("      .main-content {\r\n");
      out.write("        padding: 10px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    /* Responsive Footer */\r\n");
      out.write("    .footer {\r\n");
      out.write("      background-color: #343a40;\r\n");
      out.write("      color: white;\r\n");
      out.write("      padding: 20px;\r\n");
      out.write("      text-align: center;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .social-icons a {\r\n");
      out.write("      color: white;\r\n");
      out.write("      font-size: 20px;\r\n");
      out.write("      margin: 0 10px;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    @media (max-width: 576px) {\r\n");
      out.write("      .footer {\r\n");
      out.write("        padding: 15px;\r\n");
      out.write("        font-size: 0.9rem;\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      .social-icons a {\r\n");
      out.write("        font-size: 16px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("  </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("  <!-- Header Section -->\r\n");
      out.write("  <nav class=\"navbar navbar-expand-lg navbar-dark\">\r\n");
      out.write("    <div class=\"container-fluid\">\r\n");
      out.write("      <a class=\"navbar-brand\" href=\"#\">Expense Manager</a>\r\n");
      out.write("      <span class=\"navbar-toggler sidebar-toggle\" onclick=\"toggleSidebar()\">\r\n");
      out.write("        <i class=\"fas fa-bars\"></i>\r\n");
      out.write("      </span>\r\n");
      out.write("      <div class=\"collapse navbar-collapse\">\r\n");
      out.write("        <ul class=\"navbar-nav ms-auto\">\r\n");
      out.write("          <li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">Welcome</a></li>\r\n");
      out.write("          <li class=\"nav-item\"><a class=\"nav-link\" href=\"aboutus.html\">About Us</a></li>\r\n");
      out.write("           <li class=\"nav-item\"><a class=\"nav-link\" href=\"contactus.html\">Contact Us</a></li>        \r\n");
      out.write("          <li class=\"nav-item\"><a class=\"nav-link\" href=\"userdashboard.html\">Home</a></li>\r\n");
      out.write("          <li class=\"nav-item\"><a class=\"nav-link\" href=\"profile.jsp\">Profile</a></li>\r\n");
      out.write("          <li class=\"nav-item\"><a class=\"nav-link\" href=\"logout.html\">Logout</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </nav>\r\n");
      out.write("\r\n");
      out.write("  <!-- Sidebar Section -->\r\n");
      out.write("  <div class=\"overlay\" onclick=\"toggleSidebar()\"></div>\r\n");
      out.write("  <aside class=\"sidebar\">\r\n");
      out.write("    <a href=\"setBudget.jsp\"><i class=\"fas fa-wallet\"></i> Set Budget</a>\r\n");
      out.write("    <a href=\"addExpense.jsp\"><i class=\"fas fa-plus-circle\"></i> Add Your Expense</a>\r\n");
      out.write("    <a href=\"ViewExpenses.jsp\"><i class=\"fas fa-calendar-alt\"></i> View All Expenses </a>\r\n");
      out.write("    <a href=\"report.jsp\"><i class=\"fas fa-tag\"></i> View Expenses by Category</a>\r\n");
      out.write("     <a href=\"finincialtips.html\"><i class=\"fas fa-lightbulb\"></i> Financial Tips</a>\r\n");
      out.write(" \r\n");
      out.write("  </aside>\r\n");
      out.write("\r\n");
      out.write("  <!-- Main Content -->\r\n");
      out.write("  <div class=\"content-wrapper\">\r\n");
      out.write("    <div class=\"main-content\">\r\n");
      out.write("      <div class=\"text-center mb-4\">\r\n");
      out.write("        <h2>Set Your Monthly Budget</h2>\r\n");
      out.write("        <p>Specify your budget for the month to manage your expenses.</p>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <!-- Display current budget if set -->\r\n");
      out.write("      ");

        Double monthlyBudget = (Double) session.getAttribute("monthlyBudget");
        if (monthlyBudget != null) {
            out.println("<b>Current Budget: $" + monthlyBudget + "</b>");
        } else {
            out.println("No budget set yet.");
        }
      
      out.write("\r\n");
      out.write("\r\n");
      out.write("      <!-- Monthly Budget Form -->\r\n");
      out.write("      <div class=\"card p-4 shadow-sm\">\r\n");
      out.write("        <form action=\"BudgetServlet\" method=\"POST\">\r\n");
      out.write("          <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"monthlyBudget\" class=\"form-label\">Monthly Budget</label>\r\n");
      out.write("            <input type=\"number\" class=\"form-control\" name=\"monthlyBudget\" placeholder=\"Enter your monthly budget\" required>\r\n");
      out.write("          </div>\r\n");
      out.write("          <button type=\"submit\" class=\"btn btn-primary w-100\">Set Monthly Budget</button>\r\n");
      out.write("        </form>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <!-- Display success or error message -->\r\n");
      out.write("      ");

        String message = (String) request.getAttribute("message");
        String alertType = (String) request.getAttribute("alertType");
        if (message != null && alertType != null) {
      
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("          Swal.fire({\r\n");
      out.write("            icon: '");
      out.print( alertType );
      out.write("',\r\n");
      out.write("            title: '");
      out.print( alertType.equals("success") ? "Success" : "Error" );
      out.write("',\r\n");
      out.write("            text: '");
      out.print( message );
      out.write("'\r\n");
      out.write("          });\r\n");
      out.write("        </script>\r\n");
      out.write("      ");
 } 
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("  <!-- Footer Section -->\r\n");
      out.write("  <footer class=\"footer mt-5\">\r\n");
      out.write("    <div class=\"container text-center\">\r\n");
      out.write("      <p>&copy; 2024 Expense Management System</p>\r\n");
      out.write("      <div class=\"social-icons\">\r\n");
      out.write("        <a href=\"https://facebook.com\" target=\"_blank\"><i class=\"fab fa-facebook\"></i></a>\r\n");
      out.write("        <a href=\"https://instagram.com\" target=\"_blank\"><i class=\"fab fa-instagram\"></i></a>\r\n");
      out.write("        <a href=\"https://linkedin.com\" target=\"_blank\"><i class=\"fab fa-linkedin\"></i></a>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </footer>\r\n");
      out.write("\r\n");
      out.write("  <!-- Bootstrap JS and dependencies -->\r\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>\r\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js\"></script>\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n");
      out.write("  <script>\r\n");
      out.write("    function toggleSidebar() {\r\n");
      out.write("      document.querySelector('.sidebar').classList.toggle('open');\r\n");
      out.write("      document.querySelector('.overlay').classList.toggle('show');\r\n");
      out.write("    }\r\n");
      out.write("  </script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}