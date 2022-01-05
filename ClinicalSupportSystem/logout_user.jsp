<%@page import="javax.servlet.http.*" %>
<%
    session.removeAttribute("user");
    session.invalidate();
    response.sendRedirect("home.html");

%>