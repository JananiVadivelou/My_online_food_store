<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
   out.println("<html> <body bgcolor=lightpink>");
   String name =request.getParameter("name");
   String pwd =request.getParameter("pwd");
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn = 
   DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
   Statement stmt=conn.createStatement();
   String sqlstmt="select id,pwd from login123 where id='"+name+"'and pwd='"+pwd+"'";
   String f="select food from login123 where id='"+name+"'and pwd='"+pwd+"'";
   String ver="select version from login123 where id='"+name+"'and pwd='"+pwd+"'";

   ResultSet rs=stmt.executeQuery(sqlstmt);
   int flag=0;
   while(rs.next())
   {
        flag=1;
   }
   if(flag==0)
    {   
        out.println("<div align=center>");
        out.println("<br> <br> <br> SORRY INVALID ID PLEASE RECHECK AND TRY AGAIN <br><br>");
        out.println("<a href=login.html> Press LOGIN to RETRY </a>");
        out.println("</div>");
    }
    else
    {
	out.println("<br> <br> <br> <div align=center> <font color=blue> <h1> Welcome user '"+name+"'...!!! <br> Click any of the link below... </h1> </font> <br> <br>");
	out.println("<h3> <ul>");
	out.println("<font color=blue> <h2> <a href=profile.html>  USER PROFILE </a> </h2> </font>  <br>");
        if(f=="NON-VEG")
	out.println("<font color=blue> <h2> <a href=catalog.html>  FOOD CATALOG </a> </h2> </font>  <br>");
        else if(f=="VEG")
        out.println("<font color=blue> <h2> <a href=veg.html>  FOOD CATALOG </a> </h2> </font>  <br>");
        else
        out.println("<font color=blue> <h2> <a href=both.html>  FOOD CATALOG </a> </h2> </font>  <br>");
	out.println("<font color=blue> <h2> <a href=order.html>  ORDER CONFIRMATION </a> </h2> </font> ");
	out.println("</ul>");
    	out.println("</div> <body> </html>");
   }
%>
