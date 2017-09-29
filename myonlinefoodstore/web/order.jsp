<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
      out.println ("<html> <body bgcolor=AquaMarine>");
      String id=request.getParameter ("id");
      String pwd=request.getParameter ("pwd");
      String date1=request.getParameter ("date");
      String cno=request.getParameter ("cno");
     Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection conn = 
     DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
     Statement stmt=conn.createStatement ();
     String sqlstmt="select id, pwd from login123";
     ResultSet rs=stmt.executeQuery (sqlstmt);
     int flag=0;
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
        {
            out.println ("<div align=center> <font color=blue> ");
            out.println("<br> <br> <br> <br> <h1><table>  YOUR DETAILS ARE:</h1>  <h2>");
            out.println ("<tr><td><font color=blue><h2>LOGIN ID</font></td> <td><font color=blue><h2>:</font></td> <td><font color=blue><h2>"+id+" </font></td> <br>"); 
            out.println ("<tr><td><font color=blue><h2>DATE </font></td> <td><font color=blue><h2>:</font></td> <td><font color=blue><h2>"+date1+" </font></td> <br>");
            out.println ("<tr><td><font color=blue><h2>CREDIT CARD NUMBER </font></td> <td><font color=blue><h2>: </font></td> <td><font color=blue><h2>"+cno+" </font></td> </table><br><br>"); 
            out.println("Click NEXT if the above details are correct <br> <br>");
            out.println("<a href=select.html>NEXT</a>");
        }
            out.println ("</body></html>");
 %>
