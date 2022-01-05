<%@page import="java.util.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
    <title>Welcome | Beyond Health</title>
    <link rel="icon" href="img/nav-logo.png"/> <!--Tab icon-->
    <link rel="stylesheet" href="style-body.css"/> <!--CSS for body-->
    <link rel="stylesheet" href="style-nav.css"/>  <!--CSS for Navigation bar-->

    <!--Link for google font-->
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Aclonica&display=swap" rel="stylesheet">-->


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
<body onload="getLocation()" style="font-family: 'Aclonica', sans-serif; background:#d5f4e6;" ><!--style="background: linear-gradient(to bottom right,#84a9ac9d,#dcedc1d3);"-->
    
    <%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if(session.getAttribute("user")==null)
        {
           %>
                <jsp:forward page="home.html">
                  <jsp:param name="" value=""/>
                </jsp:forward>
          <%
        }
    %>



    <%
    
        String user_id=(String)session.getAttribute("user");
        String nm,mob,eml,loc;
        try{
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            String sql="select * from user_info where EMAIL='"+user_id+"'";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            st=con.createStatement();
            rs=st.executeQuery(sql);
            if(rs.next())
            {
                nm=rs.getString("NAME");
                mob=rs.getString("MOBILE");
                eml=rs.getString("EMAIL");
                loc=rs.getString("CITY");
            }
            else
            {
              %>
                  <jsp:forward page="accessdenie.jsp">
                     <jsp:param name="error" value="User Data Not Found"/>
                  </jsp:forward>
              <% 
            }
        }
        catch(Exception er)
        {
            %>
              <jsp:forward page="accessdenie.jsp">
                <jsp:param name="error" value="<%=er%>"/>
              </jsp:forward>
            <%            
        }
     
       %> 
   
    
  
    <!--Navigation bar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary my-nv">
        <a class="navbar-brand" href="#">
            <img src="img/nav-logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
            Beyond Health
        
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="height:20px;">
          <span class="navbar-toggler-icon" style="height:20px;margin-top:-5px;"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto" >
            <li class="nav-item " >
              <a class="nav-link" href="home.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html">Contact&nbsp;Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">About</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <% out.println(user_id); %>
                </a>
                <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
                   
                    <div class="dropdown-iten">
                      <div   class="rounded-circle text-center text-primary">
                          <svg class="bi bi-people-circle" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 008 15a6.987 6.987 0 005.468-2.63z"/>
                            <path fill-rule="evenodd" d="M8 9a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
                            <path fill-rule="evenodd" d="M8 1a7 7 0 100 14A7 7 0 008 1zM0 8a8 8 0 1116 0A8 8 0 010 8z" clip-rule="evenodd"/>
                          </svg>
                      </div>
                    </div>
                    <div class="dropdown-item text-center"><span class="text-primary"> <% out.println(nm); %> </span></div>
                    <div class="dropdown-divider"></div>
                    <div class="dropdown-item" href="#">
                        <table class="table table-borderless">
                          <thead></thead>
                          <tbody>
                            <tr>
                                <td>
                                    <span class="text-primary" >
                                      <svg class="bi bi-phone" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M11 1H5a1 1 0 00-1 1v12a1 1 0 001 1h6a1 1 0 001-1V2a1 1 0 00-1-1zM5 0a2 2 0 00-2 2v12a2 2 0 002 2h6a2 2 0 002-2V2a2 2 0 00-2-2H5z" clip-rule="evenodd"/>
                                        <path fill-rule="evenodd" d="M8 14a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                                      </svg>
                                    </span> 
                                </td>
                                <td>
                                    <small><% out.print(mob);%></small>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="text-primary" >
                                      <svg class="bi bi-envelope" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M14 3H2a1 1 0 00-1 1v8a1 1 0 001 1h12a1 1 0 001-1V4a1 1 0 00-1-1zM2 2a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V4a2 2 0 00-2-2H2z" clip-rule="evenodd"/>
                                        <path fill-rule="evenodd" d="M.071 4.243a.5.5 0 01.686-.172L8 8.417l7.243-4.346a.5.5 0 01.514.858L8 9.583.243 4.93a.5.5 0 01-.172-.686z" clip-rule="evenodd"/>
                                        <path d="M6.752 8.932l.432-.252-.504-.864-.432.252.504.864zm-6 3.5l6-3.5-.504-.864-6 3.5.504.864zm8.496-3.5l-.432-.252.504-.864.432.252-.504.864zm6 3.5l-6-3.5.504-.864 6 3.5-.504.864z"/>
                                      </svg>
                                    </span> 
                                </td>
                                <td>
                                    <small><% out.print(eml);%></small>
                                </td>
                               
                            </tr>
                            <tr>
                              <td>
                                <span class="text-primary">
                                    <svg class="bi bi-cursor" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M14.082 2.182a.5.5 0 01.103.557L8.528 15.467a.5.5 0 01-.917-.007L5.57 10.694.803 8.652a.5.5 0 01-.006-.916l12.728-5.657a.5.5 0 01.556.103zM2.25 8.184l3.897 1.67a.5.5 0 01.262.263l1.67 3.897L12.743 3.52 2.25 8.184z" clip-rule="evenodd"/>
                                    </svg>
                                </span>
                              </td>
                              <td>
                                  <small><% out.print(loc); %></small>
                              </td>
                            </tr>

                          </tbody>
                        </table>
                    </div>
                    
                    <div class="dropdown-divider"></div>
                    
                    <table class=" text-center table table-borderless table-sm">
                      <tbody>
                        <tr>
                          <td>
                            <form action="user_details.jsp" method="POST">
                              <button type="submit" class="btn btn-sm btn-link"><small>All Details</small></button>
                            </form>
                          </td>
                          <td>
                            <form action="logout_user.jsp" method="POST">
                               <button type="submit" class="btn btn-sm btn-link"><small>Log Out</small></button>
                            </form>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                </div>
            </li>
          </ul>
          
        </div>
    </nav>
    
    <!--"search bar" -->

    <div class="container-fluid search-bar-container">
      <div class="container" style="margin-top:20px;">
        <form  action="dc_data.jsp" method="POST">
          <div class="form-group" style="width:75%; margin-left:10%;">
            <div class="input-group">
              <input type="text" id="output"  class="form-control search-bar-input" placeholder="Search" name="d_loc" required>
              <select class="custom-select" id="sp" name="d_sp" style="margin-left:5px;" required>
                  <option selected="selected">Select Specialization</option>
                  <option value="Dentist">Dentist</option>
                  <option value="Immunologists">Immunologists</option>
                  <option value="Cardiologists">Cardiologists</option>
                  <option value="Dermatologists">Dermatologists</option>
                  <option value="Neurologists">Neurologists</option>
                  <option value="Oncologists">Oncologists</option>
                  <option value="Family Physician">Family Physician</option>
              </select>
              <div class="input-group-append">
                <button class="btn input-group-text text-primary" type="submit">
                  <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 011.415 0l3.85 3.85a1 1 0 01-1.414 1.415l-3.85-3.85a1 1 0 010-1.415z" clip-rule="evenodd"/>
                    <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 100-11 5.5 5.5 0 000 11zM13 6.5a6.5 6.5 0 11-13 0 6.5 6.5 0 0113 0z" clip-rule="evenodd"/>
                  </svg>
                </button>
              </div>
            </div>
            <small class="text-muted" style="margin-left:10px; font-size:12px;">Search Doctor by Location or Specialization.</small>
           
          </div>
        </form
      </div>
      <div class="container" id="wctobynd" style="text-align:center;">
        HEALTHCARE AT YOUR DESK!!
      </div>
    </div>

    <div class="container-fluid" style="border:0px solid black;margin-top:300px;">
      <div class="row">
        <div class="col-" style="margin-left:12%;">
          <img class="img-thamble rounded" style="height:170px;width:160px;" src="img/thamble-1.jpg"/>
        </div>
        <div class="col-">
          <div class="card">
            <div class="card-header bg-primary text-light">
              Find Doctor near for you
            </div>
            <div class="card-body">
              <p class="card-text">Select your Location to find Doctor near for you</p>
              <a href="#" class="btn btn-primary">Find Doctor Now</a>
            </div>
          </div>
        </div>
        <div class="col-" style="margin-left:20px;">
          <img class="img-thamble rounded" style="height:170px;width:160px;" src="img/thamble-2.jpg"/>
        </div>
        <div class="col-">
          <div class="card">
            <div class="card-header bg-primary text-light">
              Find Doctors by Specialization
            </div>
            <div class="card-body">
              <p class="card-text">Select Specialization to find Doctor near for you.</p>
              <a href="#" class="btn btn-primary">Find Doctor Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  

    <!--Carousel-->
  
    <div id="carouselExampleIndicators" class="carousel slide my-carousel" data-ride="carousel" >
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="img/carousel1.png" class="d-block w-100" alt="..." style="height:400px;">
        </div>
        <div class="carousel-item">
          <img src="img/carousel2.png" class="d-block w-100" alt="..." style="height:400px;">
        </div>
        <div class="carousel-item">
          <img src="img/carousel3.png" class="d-block w-100" alt="..." style="height:400px;">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    

   

    
    
    <!-- footer start -->
    <footer class="footer bg-primary" >
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