<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%

    try{
    String id=request.getParameter("admin_id");
    String pass=request.getParameter("admin_pass");
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    String q="select * from admin where ADMIN_ID=? and PASS=?";
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
    ps=con.prepareStatement(q);
    ps.setString(1,id);
    ps.setString(2,pass);
    rs=ps.executeQuery();
    if(rs.next())
    {
       session.setAttribute("a_id","admin");
       response.sendRedirect("admin_page.jsp");
    }
    else
    {
                  %>
                        <jsp:forward page="error_message.jsp">
                            <jsp:param name="error_id" value="Please Check Email and Password"/>
                        </jsp:forward>
                  <%
    }
    }
    catch(Exception ex)
    {
        %>
            <jsp:forward page="error_message.jsp">
                <jsp:param name="error_id" value="Please Check Email and Password"/>
            </jsp:forward>
        <%

    }
%>