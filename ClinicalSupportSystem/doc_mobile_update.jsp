<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
     
    
</head>
<body>

 <%  
        String e=request.getParameter("email");
        String m=request.getParameter("up_mob");
        try{
            Connection DB=null;
            PreparedStatement p=null;
            String sql="update doc_info set MOBILE=? where EMAIL=?";
            int x=0;
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            DB=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            p=DB.prepareStatement(sql);
            p.setString(1,m);
            p.setString(2,e);
            x=p.executeUpdate();
            if(x!=0)
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
                    <jsp:forward page="error_message.jsp">
                        <jsp:param name="error_id" value="Update failed."/>
                    </jsp:forward>

                <%
            }
            
            
        }
        catch(SQLException error)
        {
             %>
                <jsp:forward page="error_message.jsp">
                    <jsp:param name="error_id" value="<%=error%>"/>
                </jsp:forward>

            <%
        }
  %>

  </body>
  </html>