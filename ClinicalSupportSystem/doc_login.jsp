<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
     
    
</head>
<body>

 <%  
        String dm=request.getParameter("dmail");
        String dp=request.getParameter("dpass");
        try{
            Connection con=null;
            PreparedStatement ps=null;
            ResultSet rs=null;
            String query="select * from doc_login where EMAIL=? and PASSWORD=?";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            ps=con.prepareStatement(query);
            ps.setString(1,dm);
            ps.setString(2,dp);
            rs=ps.executeQuery();
            if(rs.next())
              {
                 session.setAttribute("doctor_id",dm);
                 response.sendRedirect("doctor_page.jsp");
              }
            else
              {
                  %>
                      <jsp:forward page="error_message.jsp">
                        <jsp:param name="error_id" value="Please Check Mail and Password<br>or<br>Register."/>
                      </jsp:forward>
                  <%
              }
            
        }
        catch(SQLException e)
        {
           %>
                <jsp:forward page="error_message.jsp">
                    <jsp:param name="error_id" value="<%=e%>"/>
                </jsp:forward>
            <%
        }
  %>
    <a href="docregistration.html">Home</a>
  </body>
  </html>