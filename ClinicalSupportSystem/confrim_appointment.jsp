<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page language="java"%> 
<%@page import="java.lang.*" %> 
<%@page import="java.util.Properties"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.AddressException"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page session = "true" %>
<%  
        
        try{
            Connection c=null;
            PreparedStatement ps=null;
            int r=0;
            String sql="update app_info set STATUS=? where PEMAIL=? and DEMAIL=?";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            ps=c.prepareStatement(sql);
            ps.setString(1,"Confirmed");
            ps.setString(2,request.getParameter("user_email"));
            ps.setString(3,request.getParameter("d_mail"));
            r=ps.executeUpdate();
            if(r!=0)
              {
                        
    
    
                                final String text1="Welcome "+request.getParameter("user_name")+",";
                                final String text2="\nYour  Appointment is approved by the Doctor . Check your Appointment Details Below.";
                                final String div1="\n------------------------Pataient Details-----------------------------------";
                                final String text3="\n\nPatient: "+request.getParameter("user_name")+"   "+"\nPhone: "+request.getParameter("user_mob");
                                final String text4="\nEmail: "+request.getParameter("user_email");
                                final String text5="\nAppointment Day & Time: "+request.getParameter("app_month")+","+request.getParameter("app_day")+" , "+request.getParameter("app_time");
                                final String div2="\n\n------------------------Doctor Details-----------------------------------";
                                final String text6="\n\nDoctor`s Name:-- "+request.getParameter("dc_nm");
                                final String text7="\nDepartment:--  "+request.getParameter("dc_sp");
                                final String text8="\nDoctor`s Phone:--- "+request.getParameter("dc_mob");
                                final String text9="\nDoctor`s Address:--  "+request.getParameter("dc_ad");

                                final String to=request.getParameter("user_email");
                                final String subject= "Appointment Confrimed";
                                final String messg=text1+text2+div1+text3+text4+text5+div2+text6+text7+text8+text9;
                                // Sender's email ID and password needs to be mentioned
                                final String from = //Enter Compay's Email Id;
                                final String pass = //Enter Compay's Email Password;
                            
                            
                                // Defining the gmail host
                                String host = "smtp.gmail.com";
                            
                                // Creating Properties object
                                Properties props = new Properties();
                            
                                // Defining properties
                                props.put("mail.smtp.host", host);
                                props.put("mail.transport.protocol", "smtp");
                                props.put("mail.smtp.auth", "true");
                                props.put("mail.smtp.starttls.enable", "true");
                                props.put("mail.user", from);
                                props.put("mail.password", pass);
                                props.put("mail.port", "465");
                            
                                // Authorized the Session object
                                Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                                    protected PasswordAuthentication getPasswordAuthentication() {
                                        return new PasswordAuthentication(from, pass);
                                    }
                                });
                            
                                try {
                                    // Create a default MimeMessage object.
                                    MimeMessage message = new MimeMessage(mailSession);
                                    // Set From: header field of the header.
                                    message.setFrom(new InternetAddress(from));
                                    // Set To: header field of the header.
                                    message.addRecipient(Message.RecipientType.TO,
                                            new InternetAddress(to));
                                    // Set Subject: header field
                                    message.setSubject(subject);
                                    // Now set the actual message
                                    message.setText(messg);
                                    // Send message
                                    Transport.send(message);
                                    
                                    %>
                                        <jsp:forward page="appointment_succesful.jsp">
                                            <jsp:param name="" value=""/>
                                        </jsp:forward>

                                    <%
                                } 
                                catch (MessagingException mex) 
                                {
                                    %>
                                        <jsp:forward page="error_message.jsp">
                                            <jsp:param name="error_id" value="<%=mex%>"/>
                                        </jsp:forward>
                                    <%
                                }
                            
                                            
            }
            else
              {
                   %>
                        <jsp:forward page="accessdenie.jsp">
                            <jsp:param name="error" value="Confrimation Failed"/>
                        </jsp:forward>
                  <%
              }
            
        }
        catch(SQLException e)
        {
             %>
                        <jsp:forward page="accessdenie.jsp">
                            <jsp:param name="error" value="<%=e%>"/>
                        </jsp:forward>
            <%
        }
  %>











