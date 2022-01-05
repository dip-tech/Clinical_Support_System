<%@page import="javax.servlet.http.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%
    String u_mb=request.getParameter("u_m");
    String u_em=request.getParameter("u_e");
    try
    {
        Connection con=null;
        PreparedStatement pr=null,ps=null,p=null;
        int rs=0,r=0,re=0;
        String q="delete from app_info where LOGIN_EMAIL=?";
        String query="delete from user_login where MOBILE=? and EMAIL=?";
        String qry="delete from user_info where MOBILE=? and EMAIL=?";
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
        pr=con.prepareStatement(query);
        pr.setString(1,u_mb);
        pr.setString(2,u_em);
        rs=pr.executeUpdate();

        ps=con.prepareStatement(qry);
        ps.setString(1,u_mb);
        ps.setString(2,u_em);
        r=ps.executeUpdate();

        p=con.prepareStatement(q);
        p.setString(1,u_em);
        re=p.executeUpdate();
        if(rs!=0 && r!=0)
        {
            session.removeAttribute("user");
            if(re!=0)
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
                    <jsp:forward page="warning_msg.jsp">
                        <jsp:param name="warning_id" value="Account Deleted.You have no Appointment."/>
                    </jsp:forward>
                <%
            }
        }
        else
        {
            %>
                <jsp:forward page="error_message.jsp">
                    <jsp:param name="error_id" value="Failed to Delete"/>
                </jsp:forward>
            <%
        }
    }
    catch(Exception er)
    {
        %>
            <jsp:forward page="error_message.jsp">
                <jsp:param name="error_id" value="<%=er%>"/>
            </jsp:forward>
        <%
    }
%>