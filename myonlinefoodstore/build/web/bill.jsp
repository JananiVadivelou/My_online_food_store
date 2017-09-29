<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
      out.println ("<html> <body bgcolor=palegreen>");
      String item=request.getParameter ("item");
      String count1=request.getParameter ("no");
      int count=Integer.parseInt(count1);
      String num=request.getParameter("phno");
     Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
     Statement stmt=conn.createStatement ();
     String sqlstmt="select name,addr from login123 where no='"+num+"'";
     ResultSet rs = stmt.executeQuery(sqlstmt);
      while(rs.next())
      {
        out.println("<br> <br> <center><h2> BILL FOR PURCHASE <br> <font color=red> Do NOT waste FOOD...!!</font </h2> </center>");
        out.println("<table border=2 cellpadding=1 cellspacing=5  align=center>");
        out.println ("<tr><td><font color=green><h2>NAME </font></td> <td><font color=green><h2>:</font></td> <td><font color=green><h2>"+rs.getString(1)+"</font></td> <br>");
        out.println ("<tr><td><font color=green><h2>ADDRESS</font></td> <td><font color=green><h2>:</font></td> <td><font color=green><h2>"+rs.getString(2)+"</font></td>");
        out.println ("</font> ");
        
    }
    
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
                out.println("<tr><td><font color=green><h2>FOOD</font></td> <td><font color=green><h2>:</font></td> <td><font color=green><h2>"+item+" </font></td><br>");
                 out.println("<tr><td><font color=green><h2>QUANTITY </font></td> <td><font color=green><h2>:</font></td><td><font color=green><h2>"+count1+"</font></td><br>");
                out.println("<tr><td><font color=green><h2>TOTAL AMOUNT</font></td> <td><font color=green><h2>:</font></td> <td><font color=green><h2>"+amount+"</font></td><br><br><br><br>");
                out.println ("</table><br>");
                out.println("<center><h3> <a href=login.html>Back to HOMEPAGE</a></h3></center> ");
            }
            if(flag1==0)
            {
                out.println("SORRY INVALID BOOK TRY AGAIN  <br><br>");
                out.println("<a href=order.html> Press HERE to RETRY </a>");
            }

            
        
            out.println ("</body></html>");
 %>
