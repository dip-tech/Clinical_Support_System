<%@page import="javax.servlet.http.*" %>
<%
    session.removeAttribute("a_id");
    session.invalidate();
    response.sendRedirect("home.html");

%>