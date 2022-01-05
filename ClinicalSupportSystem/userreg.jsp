<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
</head>
<body>
<%
    String nm=request.getParameter("fname");
    String ph=request.getParameter("phno");
    String em=request.getParameter("emailid");
    String gn=request.getParameter("gen");
    String dob=request.getParameter("dob");
    String add=request.getParameter("add");
    String city=request.getParameter("city");
    String st=request.getParameter("state");
    String pswrd=request.getParameter("pass");
    try
    {
      
        Connection c=null;
        Statement s=null;
        int r=0;
        String q="insert into user_info values('"+nm+"','"+ph+"','"+em+"','"+gn+"','"+dob+"','"+add+"','"+city+"','"+st+"')";
        String qry="insert into user_login values('"+ph+"','"+em+"','"+pswrd+"')";
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
        s=c.createStatement();
        r=s.executeUpdate(q);
        r=s.executeUpdate(qry);
        if(r!=0)
        {
            %>
                        <jsp:forward page="regsuccesfull.html">
                            <jsp:param name="" value=""/>
                        </jsp:forward>
            <%
        }
        else
        {
                 %>
                        <jsp:forward page="accessdenie.jsp">
                            <jsp:param name="error" value="Registration Failed"/>
                        </jsp:forward>
                <%
        }
    }
    catch(Exception ex)
    {
                  %>
                        <jsp:forward page="accessdenie.jsp">
                            <jsp:param name="error" value="<%=ex%>"/>
                        </jsp:forward>
                  <%
    }

%>
</body>
</html>