<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
     
    
</head>
<body>
<div class="alert alert-success" style="text-align:center;">
 <%  
        String m=request.getParameter("mail");
        String p=request.getParameter("pass");
        try{
            Connection con=null;
            Statement s=null;
            ResultSet rs=null;
            String query="select * from user_login where EMAIL='"+m+"' and PASSWORD='"+p+"'";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            s=con.createStatement();
            rs=s.executeQuery(query);
            if(rs.next())
              {
                  
                  session.setAttribute("user",m);
                  response.sendRedirect("mainpage.jsp");
                  
              }
            else
              {
                   %>
                        <jsp:forward page="accessdenie.jsp">
                            <jsp:param name="error" value="Please Check Email and Password"/>
                        </jsp:forward>
                  <%
              }
            
        }
        catch(SQLException e)
        {
             %>
                        <jsp:forward page="accessdenie.jsp">
                            <jsp:param name="error" value="SQL Database connection failed"/>
                        </jsp:forward>
            <%
        }
  %>
  </div>
  </body>
  </html>