<%@page import="javax.servlet.http.*" %>
<%
    session.removeAttribute("doctor_id");
    session.invalidate();
    response.sendRedirect("docregistration.html");

%>