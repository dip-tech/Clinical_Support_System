<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
</head>
<body>
<%
    String dli=request.getParameter("dlien");
    String dnm=request.getParameter("dname");
    String dph=request.getParameter("dmob");
    String dem=request.getParameter("demail");
    String dgn=request.getParameter("dgn");
    String dadd=request.getParameter("dadd");
    String ddst=request.getParameter("ddis");
    String dst=request.getParameter("dst");
    String sp=request.getParameter("speciality");
    String ed=request.getParameter("edub");
    String dpswrd=request.getParameter("dpass");
    String aday=request.getParameter("appday");
    String atime=request.getParameter("stime")+"-"+request.getParameter("etime");
    try
    {
      
        Connection c=null;
        PreparedStatement s=null,s1=null,ps=null;
        ResultSet rs=null;
        int r=0,r1=0;
        String query="select * from doc_info where LICENSE_KEY=? and EMAIL=?";
        String q="insert into doc_info values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String qry="insert into doc_login values(?,?,?)";
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
        ps=c.prepareStatement(query);
        ps.setString(1,dli);
        ps.setString(2,dem);
        rs=ps.executeQuery();
        if(rs.next())
        {
            out.print("Already Registered.");
        }
        else 
        {
            s=c.prepareStatement(q);
            s1=c.prepareStatement(qry);
            s.setString(1,dli);
            s.setString(2,dnm);
            s.setString(3,dph);
            s.setString(4,dem);
            s.setString(5,dgn);
            s.setString(6,dadd);
            s.setString(7,ddst);
            s.setString(8,dst);
            s.setString(9,sp);
            s.setString(10,ed);
            s.setString(11,"Not Verified");
            s.setString(12,aday);
            s.setString(13,atime);
            
            s1.setString(1,dli);
            s1.setString(2,dem);
            s1.setString(3,dpswrd);
            r=s.executeUpdate();
            r1=s1.executeUpdate();
            if(r!=0 & r1!=0)
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
                        <jsp:param name="error_id" value="Registration Failed."/>
                    </jsp:forward>
                <%
            }
        }
    }
    catch(Exception ex)
    {
            %>
                <jsp:forward page="error_message.jsp">
                    <jsp:param name="error_id" value="<%=ex%>"/>
                </jsp:forward>
            <%
    }

%>
<a href="docregistration.html">Home</a>
</body>
</html>