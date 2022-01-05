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
        
        try{
            Connection c=null;
            PreparedStatement ps=null;
            int r=0;
            String sql="insert into app_info values(?,?,?,?,?,?,?,?,?,?,?,?)";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            ps=c.prepareStatement(sql);
            ps.setString(1,request.getParameter("login_user"));
            ps.setString(2,request.getParameter("user_name"));
            ps.setString(3,request.getParameter("user_email"));
            ps.setString(4,request.getParameter("user_mob"));
            ps.setString(5,request.getParameter("dc_nm"));
            ps.setString(6,request.getParameter("doc_em"));
            ps.setString(7,request.getParameter("dc_mob"));
            ps.setString(8,request.getParameter("dc_sp"));
            ps.setString(9,request.getParameter("app_time"));
            ps.setString(10,"Not Confrimed");
            ps.setString(11,request.getParameter("app_day"));
            ps.setString(12,request.getParameter("app_month"));
            r=ps.executeUpdate();
            if(r!=0)
              {
                  
                  %>
                        <jsp:forward page="success_msg.jsp">
                            <jsp:param name="" value=""/>
                        </jsp:forward>
                  <%
                  
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
                            <jsp:param name="error" value="<%=e%>"/>
                        </jsp:forward>
            <%
        }
  %>
  </div>
  </body>
  </html>



