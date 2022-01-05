<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
    <title>Your Details | Beyond Health</title>
    <link rel="icon" href="img/nav-logo.png"/> <!--Tab icon-->
    <link rel="stylesheet" href="style-body.css"/> <!--CSS for body-->
    <link rel="stylesheet" href="style-nav.css"/>  <!--CSS for Navigation bar-->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/5ceb7747bb.js" crossorigin="anonymous"></script>

    <!--Link for google font-->
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Aclonica&display=swap" rel="stylesheet">-->

    
    <!--Link for Bootstarp CSS file do not edit it-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">



    <!--JavaScript file for the Bootstrap--><!--Don't Edit it-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    
    <!--condition check-->
    <script type="text/javascript" src="condition_checker.js"></script>
    

    
</head>
<body style="background: linear-gradient(to bottom right,#84a9ac9d,#dcedc1d3),url(img/user_details_img.jpg);"><!--style="background: linear-gradient(to bottom right,#84a9ac9d,#dcedc1d3);"-->
    
    <%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if(session.getAttribute("doctor_id")==null)
        {
           %>
                <jsp:forward page="docregistration.html">
                  <jsp:param name="" value=""/>
                </jsp:forward>
          <%
        }
    %>



    <!--Navigation bar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary my-nv">
        <a class="navbar-brand" href="#">
            <img src="img/nav-logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
            Beyond Health || Doctor 
        
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto" >
            <li class="nav-item " >
              <a class="nav-link" href="docregistration.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <form action="logout_doc.jsp" method="POST">
                    <button class="btn btn-sm nav-link" type="submit"><small>Logout</small></button>
                </form>
            </li>
          </ul>
          
        </div>
    </nav>


    <%
        String d_email=(String)session.getAttribute("doctor_id");
        String dadd=null;
        try{
            Connection c=null;
            PreparedStatement p=null;
            ResultSet r=null;
            String s="select * from doc_info where EMAIL=?";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            p=c.prepareStatement(s);
            p.setString(1,d_email);
            r=p.executeQuery();
            if(r.next())
            {
                dadd=r.getString("ADDRESS")+","+r.getString("DISTRICT")+","+r.getString("STATE");
                %>
                    <div class="container" style="margin-top:50px;">
                        <div class="card">
                            <div class="card-header">
                                Your Personal Details
                            </div>
                            <div class="card-body">
                                <h2 class="card-title" style="color:#73C6B6;"> <%out.print(r.getString("NAME"));%></h2>
                                        <table class="table table-borderless">
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                        <i class="fas fa-id-card fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;font-size:16px;">
                                                    <%out.print(r.getString("LICENSE_KEY"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                        <i class="fas fa-mobile fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    <%out.print(r.getString("MOBILE"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                       <i class="fas fa-envelope fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    <%out.print(r.getString("EMAIL"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                       <i class="fas fa-user-tag fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    <%out.print(r.getString("GENDER"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                       <i class="fas fa-location-arrow fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    
                                                    <%out.print(r.getString("ADDRESS")+","+r.getString("DISTRICT")+","+r.getString("STATE"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                       <i class="fas fa-user-md fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    <%out.print(r.getString("SPECIALIZATION"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                       <i class="fas fa-user-graduate fa-sm"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    <%out.print(r.getString("EB"));%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:5%;">
                                                    <span class="text-info" style="font-size:1.6em;">
                                                      <i class="fa fa-check-square fa-sm" aria-hidden="true"></i>
                                                    </span>
                                                </td>
                                                <td style="color:#0AA06F;">
                                                    <%out.print(r.getString("STATUS"));%>
                                                </td>
                                            </tr>
                                        </table>
                            </div>
                            <div class="card-footer">
                                <table class="table table-borderless table-sm" style="text-align:center;">
                                    <tr>
                                        <td>
                                            <button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#update_mobile">Update Mobile</button>
                                            <button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#update_address">Update Address</button>
                                            <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_account">Delete Account</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Modal for update mobile -->
                    <div class="modal fade" id="update_mobile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Update Mobile</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="doc_mobile_update.jsp" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Enter Mobile Number" name="up_mob" minlength="10" maxlength="10" required/>
                                            <input type="text" class="form-control" style="display:none;" value="<%=d_email%>" name="email"/><br>
                                            <button type="submit" class="btn btn-primary">Update</button>
                                            <button  class="btn btn-danger" data-dismiss="modal" aria-label="Close">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal for update Address -->
                    <div class="modal fade" id="update_address" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Update Address</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="doc_add_update.jsp" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" style="display:none;" value="<%=d_email%>" name="email"/>
                                            <input type="text" class="form-control" placeholder="Enter Address" name="up_add" required/>
                                        </div>
                                        <div class="form-group">
                                            <select class="custom-select" id="scity" name="d_dis">
                                                <option selected="selected">Select District</option>
                                                <option value="Alipurduar district">Alipurduar</option>
                                                <option value="Bankura district">Bankura</option>
                                                <option value="Birbhum district">Birbhum</option>
                                                <option value="Hooghly district">Hooghly</option>
                                                <option value="Paschim Medinipur district">Paschim Medinipur</option>
                                                <option value="Purba Medinipur district">Purba Medinipur</option>
                                                <option value="South 24 Parganas district">South 24 Parganas</option>
                                                <option value="North 24 Parganas district">North 24 Parganas</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <select class="custom-select" id="st" name="dst">
                                                <option selected="selected">Select State</option>
                                                <option value="West Bengal">West Bengal</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                        <button  class="btn btn-danger" data-dismiss="modal" aria-label="Close">Close</button>
                                    </form>
                                </div>
                            </div>
                         </div>
                    </div>

                    <!-- Modal for confrim deletation -->
                    <div class="modal fade" id="delete_account" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Confrim Delete Account</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p> Are You Sure to Delete Your Account?</p>
                            <form action="delete_doc.jsp" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" style="display:none;" value="<%=r.getString("LICENSE_KEY")%>" name="d_lic"/><br>
                                    <input type="text" class="form-control" style="display:none;" value="<%=r.getString("EMAIL")%>" name="d_mail"/><br>
                                    <button type="submit" class="btn btn-primary">Delete</button>
                                    <button  class="btn btn-danger" data-dismiss="modal" aria-label="Close">Close</button>
                                </div>
                            </form>
                        </div>
                        </div>
                    </div>
                    </div>
                <%
            }
            
        }
        catch(Exception x)
        {
            %>
                <jsp:forward page="error_message.jsp">
                    <jsp:param name="error_id" value="<%=x%>"/>
                </jsp:forward>

            <%
        }
        
    %>

   <div class="container" style="margin-top:120px;text-align:center;">
    <div class="card">
    <div class="card-header">
        <h2 class="card-title">Your Pending Appointment(s)</h2>
    </div>
    <div class="card-body">
    <table class="table table-bordered table-sm  table-striped table-responsive">
        <thead>
            <tr>
                <th scope="col">SL</th>
                <th scope="col">Patient`s Name</th>
                <th scope="col">Email</th>
                <th scope="col">Mobile</th>
                <th scope="col">App. Month</th>
                <th scope="col">App. Day</th>
                <th scope="col">App. Time</th>
                <th scope="col">STATUS</th>
            </tr>
        </thead>
    <%  
        
        try{
            Connection connect=null;
            PreparedStatement prest=null;
            ResultSet result=null;
            String sql="select * from app_info where DEMAIL=? ";
            int i=1;
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            prest=connect.prepareStatement(sql);
            prest.setString(1,d_email);
            result=prest.executeQuery();
            while(result.next())
              {
               
                %>
                        
                            <tbody>
                                <tr>
                                    <th scope="row"><%out.print(i);%></th>
                                    <td><%out.print(result.getString("PNAME"));%></td>
                                    <td><%out.print(result.getString("PEMAIL"));%></td>
                                    <td><%out.print(result.getString("PMOBILE"));%></td>
                                    <td><%out.print(result.getString("AMONTH"));%></td>
                                    <td><%out.print(result.getString("ADAY"));%></td>
                                    <td><%out.print(result.getString("ATIME"));%></td>
                                    <td><%out.print(result.getString("STATUS"));%></td>
                                    <td>
                                        <form action="confrim_appointment.jsp" method="POST">
                                            <input type="text" value="<%=result.getString("PNAME")%>" name="user_name" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("PEMAIL")%>" name="user_email" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("PMOBILE")%>" name="user_mob" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("AMONTH")%>" name="app_month" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("ADAY")%>" name="app_day" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("ATIME")%>" name="app_time" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("DNAME")%>" name="dc_nm" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("DEMAIL")%>" name="d_mail" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("DMOBILE")%>" name="dc_mob" style="display:none;"/>
                                            <input type="text" value="<%=dadd%>" name="dc_ad" style="display:none;"/>
                                            <input type="text" value="<%=result.getString("DSP")%>" name="dc_sp" style="display:none;"/>
                                            <button type="submit" class="btn btn-link">Confrim</button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="reject_appointment.jsp" method="POST">
                                            <input type="text" value="<%=result.getString("PEMAIL")%>" name="pm" style="display:none"/>
                                            <input type="text" value="<%=result.getString("DEMAIL")%>" name="dm" style="display:none"/>
                                            <input type="text" value="<%=result.getString("DNAME")%>" name="dn" style="display:none"/>
                                            <input type="text" value="<%=result.getString("DSP")%>" name="dsp" style="display:none"/>
                                            <button type="submit" class="btn btn-link text-danger">Reject</button>
                                        </form>
                                    </td>
                                    
                                </tr>
                            </tbody>
                        

                <%
                    i++;
                  
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
    
    
    </table>
    </div>
    </div>
  </div>  






  <!-- footer start -->
  <footer class="footer bg-primary" style="margin-top: 100px;">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="footer_widget" style="margin-top:50px;">
                        <div class="footer_logo">
                            <a href="#" style="text-decoration: none;color:#194d33;font-size:26px;">
                                <img src="img/nav-logo.png" alt="" style="height:100px;width:100px;">
                                Beyond Health
                            </a>
                        </div>
                        <p style="color:#196666;">
                                Firmament morning sixth subdue darkness 
                                creeping gathered divide.
                        </p>
                        <div class="socail_links">
                            <ul style="list-style: none;">
                                <li>
                                    <a href="#" style="text-decoration: none; color:cornsilk;">
                                      <i class="fab fa-facebook-square"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" style="text-decoration: none;color:cornsilk;;">
                                      <i class="fab fa-twitter-square"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" style="text-decoration: none; color:cornsilk;">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="col-xl-2 offset-xl-1 col-md-6 col-lg-3">
                    <div class="footer_widget" style="margin-top:50px;">
                        <h3 class="footer_title" style="color:#194d33">
                                Departments
                        </h3>
                        <ul style="list-style: none;">
                            <li><a href="#" style="text-decoration: none; color:#196666">Eye Care</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666">Skin Care</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666">Pathology</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666">Medicine</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666">Dental</a></li>
                        </ul>

                    </div>
                </div>
                <div class="col-xl-2 col-md-6 col-lg-2">
                    <div class="footer_widget" style="margin-top:50px;">
                        <h3 class="footer_title" style="color:#194d33">
                                Useful Links
                        </h3>
                        <ul style="list-style: none;">
                            <li><a href="#" style="text-decoration: none; color:#196666">About</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666">Blog</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666">About</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666"> Contact</a></li>
                            <li><a href="#" style="text-decoration: none; color:#196666"> Appointment</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="footer_widget" style="margin-top:50px;">
                        <h3 class="footer_title" style="color:#194d33">
                                Address
                        </h3>
                        <p style="color:#196666;">
                          EM-4, EM Block, Sector V<br> Bidhannagar, Kolkata<br> West Bengal 700091
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copy-right_text">
        <div class="container">
            <div class="footer_border"></div>
            <div class="row">
                <div class="col-xl-12">
                    <p class="copy_right text-center">
                        
                    </p>
                </div>
            </div>
        </div>
    </div>
  </footer>
  <!-- footer end  -->
</body>
</html>

