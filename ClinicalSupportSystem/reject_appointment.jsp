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
                            Connection connect=null;
                            PreparedStatement prest=null;
                            int re=0;
                            String sql="delete from app_info where PEMAIL=? and DEMAIL=? ";
                            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                            connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
                            prest=connect.prepareStatement(sql);
                            prest.setString(1,request.getParameter("pm"));
                            prest.setString(2,request.getParameter("dm"));
                            re=prest.executeUpdate();
                            if(re!=0)
                            {
                            
                                final String text1="Your Appointment is Cancel by Doctor or You. Your cancelation details is:\n";
                                final String text2="Doctor: "+request.getParameter("dn")+"\n"+"Specialization: "+request.getParameter("dsp") ;
                                final String to=request.getParameter("pm");
                                final String subject= "Appointment Canceled";
                                final String messg=text1+text2;
                                // Sender's email ID and password needs to be mentioned
                                final String from = "krishanudandapat9@gmail.com";
                                final String pass = "krishanu@12";
                            
                            
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
                                        <jsp:forward page="success_msg.jsp">
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
                                        <jsp:param name="error" value="Cancle Process Failed"/>
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