<%@page import="javax.servlet.http.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.utill.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*" %>
<html>
<head>
    <title>Admin | Beyond Health</title>
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
<body style="font-family: 'Aclonica', sans-serif; background: linear-gradient(to bottom right,white,#76CE9F );" >
    <%
         response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if(session.getAttribute("a_id")!="admin")
        {
            response.sendRedirect("home.html");
        }
    %>
    
    <!--Navigation bar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary my-nv">
        <a class="navbar-brand" href="#">
            <img src="img/nav-logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
            Beyond Health|Admin
        
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
          <ul class="navbar-nav ml-auto" >
            <li class="nav-item">
              <a class="nav-link" href="#">User</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="admin_page_doc.jsp">Doctor</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Welcome Admin
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <form action="logout_admin.jsp" method="POST">
                  <button type="submit" class="btn btn-sm btn-link">Logout</button>
                </form>
              </div>
            </li>
          </ul>
          
        </div>
    </nav>
    <div class="container-fluid" style="height:500px;background:linear-gradient(to bottom right,#84a9ac7c,#dcedc17c ),url(img/user_details_admin.jpg);background-repeat:no-repeat;background-size:cover;border-top:0.5px solid blue;">
        <div class="container" id="wctobynd">
          Welcome Admin<br>
        <small style="font-size:20px;">Check Your All User's Details</small>
      </div>
    </div>

    <!--div for user details-->
    <div class="container card card-body" id="user_details" style="margin-top:50px;">
    <table class="table table-borderless table-responsive">
    <thead class="bg-info">
        <th>NAME</th>
        <th>MOBILE</th>
        <th>EMAIL</th>
        <th>GENDER</th>
        <th>DOB</th>
        <th>ADDRESS</th>
        <th>CITY</th>
        <th>STATE</th>
    </thead>
    <%
         try{
            Connection con=null;
            Statement s=null;
            ResultSet rs=null;
            String qry="select * from user_info";
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_database?useTimezone=true&serverTimezone=UTC","root","");
            s=con.createStatement();
            rs=s.executeQuery(qry);
            while(rs.next())
            {
                
                %>
                    
                    <tr>
                        <td><% out.print(rs.getString("NAME"));%></td>
                        <td><% out.print(rs.getString("MOBILE"));%></td>
                        <td><% out.print(rs.getString("EMAIL"));%></td>
                        <td><% out.print(rs.getString("GENDER"));%></td>
                        <td><% out.print(rs.getString("DOB"));%></td>
                        <td><% out.print(rs.getString("ADDRESS"));%></td>
                        <td><% out.print(rs.getString("CITY"));%></td>
                        <td><% out.print(rs.getString("STATE"));%></td>
                        <td>
                          <form action="delete_user.jsp" method="POST">
                                <input type="text" class="form-control" value="<%=rs.getString("MOBILE")%>" name="u_m" style="display:none;" readonly>
                                <input type="text" class="form-control" value="<%=rs.getString("EMAIL")%>" name="u_e" style="display:none;" readonly>
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                  
                <%
            }
            
        }
        catch(SQLException e)
        {
            
        }
        
    %>
    </table>
    </div> 
    
</body>

</html>