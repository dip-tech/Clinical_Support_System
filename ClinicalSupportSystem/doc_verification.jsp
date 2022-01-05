<%@page import="javax.servlet.http.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%
    String d_id=request.getParameter("d_lice");
    try
    {
        Connection con=null;
        PreparedStatement p=null;
        int re=0;
        String q="update doc_info set STATUS=? where LICENSE_KEY=?";
        //String d_li,d_nm,d_mob,d_eml,d_gn,d_add,d_dist,d_st,d_sp,d_eb;
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
        p=con.prepareStatement(q);
        p.setString(1,"Verified");
        p.setString(2,d_id);
        re=p.executeUpdate();
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
                <jsp:forward page="error_message.jsp">
                    <jsp:param name="error_id" value="Error while Verifying Doctor."/>
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