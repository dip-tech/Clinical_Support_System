<html>
<head>
    <title>Access Denied | Beyond Health</title>
    <link rel="icon" href="img/nav-logo.png"/> <!--Tab icon-->
    <link rel="stylesheet" href="style-body.css"/> <!--CSS for body-->
    <link rel="stylesheet" href="style-nav.css"/>  <!--CSS for Navigation bar-->

     <!--gender icon font-awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <!--Link for google font-->
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Gotu&display=swap" rel="stylesheet">
    <!--<link href="https://fonts.googleapis.com/css2?family=Aclonica&display=swap" rel="stylesheet">-->

    <!--Link for Bootstarp CSS file do not edit it-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!--JavaScript file for the Bootstrap--><!--Don't Edit it-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    
    <!--condition check-->
    <script type="text/javascript" src="condition_checker.js"></script>
    
</head>
<body style="font-family: 'Aclonica', sans-serif;" ><!--style="background: linear-gradient(to bottom right,#84a9ac9d,#dcedc1d3);"-->
    
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
            <li class="nav-item" >
              <a class="nav-link" href="home.html">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html">Contact&nbsp;Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">About</a>
            </li>
          </ul>
          
        </div>
    </nav>
    
    
    <div class="alert alert-danger" role="alert" style="text-align:center;">
         <%
            out.println(request.getParameter("error"));
         %>
    </div>

   
    
</body>

</html>