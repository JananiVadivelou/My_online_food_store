<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
    out.println("<html> <body bgcolor=pink>");
    String name=request.getParameter("name");
    String addr=request.getParameter("addr");
    String no=request.getParameter("no");
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
    String food=request.getParameter("food");
    String mship=request.getParameter("mship");
   // long no=Integer.parseInt(phno);
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = 
    DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
    Statement stmt=conn.createStatement();
    String sqlstmt="select id from login";
    ResultSet rs=stmt.executeQuery(sqlstmt);
    int flag=0;
    while(rs.next())
    {
        if(id.equals(rs.getString(1)))
	{
           	 flag=1;
	}
	}
	if(flag==1)
	{
           	 out.println("SORRY LOGIN ID ALREADY EXISTS TRY AGAIN WITH NEW ID <br> <br>");
           	 out.println("<a href=reg.html> press REGISTER to RETRY </a>");
	}
	else
	{
            Statement stmt1=conn.createStatement ();
            stmt1.executeUpdate("insert into login123 values('"+name+"','"+addr+"','"+no+"','"+id+"','"+pwd+"','"+food+"','"+mship+"')");
        	    out.println("<br> <br><center> <font color=orange> <h1> YOU DETAILS ARE ENTERED </h1> <br>");
          	    out.println("<h2> <a href =login.html>press LOGIN to login page</a> </h2> </font> </center> ");
	}
     	out.println("</body></html>");
%>
