package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.String;
import java.sql.*;
import java.io.*;

public final class bill_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

      out.println ("<html> <body bgcolor=pink>");
      String item=request.getParameter ("item");
      String count1=request.getParameter ("no");
      int count=Integer.parseInt(count1);
     Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection conn = 
     DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
      request.getAttribute("loginid");
     String sqlstmt="select id, pwd from login";
     ResultSet rs=sqlstmt.executeQuery(sqlstmt);
    /* int flag=0,amount,x;
     while(rs.next())
       {
            if(id.equals(rs.getString(1))&& pwd.equals(rs.getString(2)))
            {
                flag=1;
            }
        }
	
	
	if(flag==0)
            {
                out.println("SORRY INVALID ID TRY AGAIN ID <br><br>");
                out.println("<a href=order.html>Press HERE to RETRY </a>");
            }
	else
	{*/
                Statement stmt2=conn.createStatement();
                String s="select cost from food where item ='"+item+"'";
                ResultSet rs1=stmt2.executeQuery(s);
                int flag1=0;
                int amount,x;
             while(rs1.next())
            {
                flag1=1;
                
                x=Integer.parseInt(rs1.getString(1));
                amount=count*x;
                request.getAttribute("loginid");
                request.getAttribute("date");
                request.getAttribute("cno");
                out.println("AMOUNT   :"+amount+"<br><br><br><br>");
                out.println ("YOU ORDER HAS BEEN TAKEN<br>");
            }
            if(flag1==0)
            {
                out.println("SORRY INVALID BOOK TRY AGAIN  <br><br>");
                out.println("<a href=order.html> Press HERE to RETRY </a>");
            }

            out.println ("<div align=center> <font color=blue> ");
        out.println("<br> <br> <br> <br> <h1>  Your profile details are:</h1> <br> <br> <br> <h2>");
        out.println ("NAME      :"+rs.getString(1)+" <br>");
        out.println ("ADDRESS   :"+rs.getString(2)+" <br>");
        out.println ("FOOD   :"+rs.getString(6)+" <br>");
        out.println ("MEMBERSHIP   :"+rs.getString(7)+" <br>");
        out.println ("PHONE NO  :"+rs.getString(3)+"  </h2> <br>");
        out.println ("</div> </font> ");
        
            out.println ("</body></html>");
 
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
