<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
    <title>Appointment Successful | Beyond Health</title>
    <link rel="icon" href="img/nav-logo.png"/> <!--Tab icon-->
    <link rel="stylesheet" href="style-body.css"/> <!--CSS for body-->
    <link rel="stylesheet" href="style-nav.css"/>  <!--CSS for Navigation bar-->

    <!--Link for google font-->
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Aclonica&display=swap" rel="stylesheet">-->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/5ceb7747bb.js" crossorigin="anonymous"></script>
    
    <!--Link for Bootstarp CSS file do not edit it-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--Location Jquery File-->
     <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
    <!--JavaScript file for the Bootstrap--><!--Don't Edit it-->
   
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    
    
    <!--condition check-->
    <script type="text/javascript" src="condition_checker.js"></script>

    <!--Location Tracker-->
    <script type="text/javascript" src="location_tracker.js">
    </script>

    
</head>
<body  style="font-family: 'Aclonica', sans-serif; background:#d5f4e6;" ><!--style="background: linear-gradient(to bottom right,#84a9ac9d,#dcedc1d3);"-->
    
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

    <div class="container">
        <div class="alert alert-success" role="alert">
             Appointment is Confrimed. All the Details are send in Patient's Mail.
        </div>
    </div>

    
    

    <!-- footer start -->
    <footer class="footer bg-primary" style="margin-top:520px;" >
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