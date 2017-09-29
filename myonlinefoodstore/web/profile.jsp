<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
 <%
   out.println ("<html><body bgcolor=lightgreen>");
   String id=request.getParameter("id");
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn = 
   DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
   Statement stmt=conn.createStatement ();
   String sqlstmt="select * from login123 where id='"+id+"'";
   ResultSet rs=stmt.executeQuery (sqlstmt);
   int flag=0;
   while(rs.next())
    {
        out.println (" <form> <div align=center> <font color=blue> ");
        out.println("<br> <br> <br> <br> <h1> <table> <font color=blue> Your profile details are:</h1> <br> <br> <h2>");
        out.println ("<tr><td><font color=blue><h2> NAME  </font></td>     <td> <font color=blue> <h2> : </font> </td>  <td> <font color=blue> <h2>"+rs.getString(1)+" </font></td> </tr> ");
        out.println ("<tr> <td> <font color=blue><h2> ADDRESS </font> </td>  <td> <font color=blue> <h2>: </font> </td>  <td><font color=blue> <h2>"+rs.getString(2)+"  </font></td> </tr>");
        out.println ("<tr> <td><font color=blue><h2> FOOD </font> </td>      <td> <font color=blue> <h2>: </font> </td>  <td> <font color=blue><h2>"+rs.getString(6)+" </font> </td> </tr>");
        out.println ("<tr> <td><font color=blue><h2> MEMBERSHIP </font></td> <td> <font color=blue> <h2>: </font>  </td>  <td> <font color=blue><h2>"+rs.getString(7)+" </font></td> </tr>");
        out.println ("<tr> <td><font color=blue><h2> PHONE NO  </font></td>  <td> <font color=blue> <h2>: </font></td>  <td> <font color=blue><h2>"+rs.getString(3)+"</font> </td> </tr> </font> </table> </h2> <br>");
        out.println ("</div> </font></form>");
        flag=1;
    }
    if(flag==0)
    {
        out.println("SORRY INVALID ID TRY AGAIN ID <br> <br>");
        out.println("<a href=profile.html> Press HERE to RETRY </a>");
    }
	out.println ("</body></html>");
%>
