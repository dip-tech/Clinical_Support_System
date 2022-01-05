<%@page import="javax.servlet.http.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%
    String lic_key=request.getParameter("d_lic");
    try
    {
        Connection con=null;
        PreparedStatement pr=null,ps=null,p=null;
        int rs=0,r=0,re=0;
        String query="delete from doc_login where LICENSE_KEY=?";
        String qry="delete from doc_info where LICENSE_KEY=?";
        String q="delete from app_info where DEMAIL=?";
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
        pr=con.prepareStatement(query);
        ps=con.prepareStatement(qry);
        p=con.prepareStatement(q);
        pr.setString(1,lic_key);
        ps.setString(1,lic_key);
        p.setString(1,request.getParameter("d_mail"));
        rs=pr.executeUpdate();
        r=ps.executeUpdate();
        re=p.executeUpdate();
        if(rs!=0 && r!=0 ) 
        {
            session.removeAttribute("doctor_id");
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
                        <jsp:param name="warning_id" value="Doctor Details Deleted<br>Doctor has no Appointment."/>
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