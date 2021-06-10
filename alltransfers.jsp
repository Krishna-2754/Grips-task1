<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Basic Banking System</title>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet"
    href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

  <!-- Fonts -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

  <!-- AOS  -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style/slider.css">
        <link rel="stylesheet" type="text/css" href="style/mystyle.css">

</head>
<style>
  body{
    background-image: url('./back12.jpg');
  }
  h1 {
  display: grid;
  grid-template-columns: minmax(50px, 1fr) auto minmax(50px, 1fr);
  align-items: center;
  text-align: center;
  gap: 40px;
}

h1::before, h1::after {
  content: '';
  border-top: 6px double;
}
</style>

<body onload="loader()">
   
  <!-- loader for splash screen -->
  <div class="allcontain">
    <!-- Navbar Up -->
    <nav class="topnavbar navbar-default topnav">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed toggle-costume" data-toggle="collapse" data-target="#upmenu" aria-expanded="false">
            <span class="sr-only"> Toggle navigaion</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand logo" href="#"><img src="logo1.png" alt="logo"></a>
        </div>	 
      </div>
      <div class="collapse navbar-collapse" id="upmenu">
        <ul class="nav navbar-nav" id="navbarontop">
          
          <button onclick="parent.location='transfer1.html'"><span class="postnewcar">TRANSFER MONEY</span></button>
          <button onclick="parent.location='customers.jsp'"><span class="postnewcar">CHECK CUSTOMER ACCOUNT BALANCE</span></button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <button onclick="parent.location='show.jsp'"><span class="postnewcar">TRANSFER STATEMENT</span></button>
        </ul>
      </div>
    </nav>
  </div>
<br>
<br>

<br>

<br>

<br>
<br>
<br>
<br>
<br>




  <!-- here content starts here -->
  
  <div class="container-fluid hero-content" id="hello">
    
    <div class="row align-items-center">
      <div class="col-md-6 col-sm-12 text-center" data-aos="fade-up">
        <center><h1><span id="sp" class="font-weight-bold">Welcome!!!  <%=request.getParameter("cname") %></span></h1></center>
        
      </div>
      <div class="col-md-6 col-sm-12 text-center" data-aos="fade-left">
        
      </div>
    
    </div>

    

    <br><br><br><br>
    <h1>"TRANSFERS RELATED TO YOU."</h1>
    <div class="container">
      <div class="table-responsive" style="background-color: aliceblue;">
              <table class="table table-hover table-bordered">
                  <thead>
                      <tr class="table-danger">
                          <th scope="col"><h4>TRANSFERED FROM</h4></th>
                          <th scope="col"><h4>TRANSFERED TO</h4></th>
                          <th scope="col"><h4>AMOUNT TRANSFERED</h4></th>
                      </tr>
                  </thead>
      <%
    try
    {
      Class.forName("oracle.jdbc.driver.OracleDriver");
		  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
      PreparedStatement st=con.prepareStatement("select * from transfers where TRANSFERED_FROM=? or TRANSFERED_TO=?");
      String ccname=request.getParameter("cname");
      st.setString(1,ccname);
      st.setString(2,ccname);

      //ResultSet rs=st.executeQuery("select * from transfers where sender=ccname or reciever=ccname");
      ResultSet rs=st.executeQuery();
      while(rs.next())
    {
     %>
              
                  <tbody>
           <tr>
               <td width="25%"><%=rs.getString(1) %></td>
               <td width="25%"><%=rs.getString(2) %></td>
               <td width="25%"><%=rs.getString(3) %></td>
           </tr>
                  </tbody>
             <%
             }
  
  }
  catch(Exception e)
  {
  e.printStackTrace();
  }
   %>
             
              </table>
          </div>
      </div>
      <div class="row align-items-center">
        <div class="col-md-6 col-sm-12 text-center" data-aos="fade-up">
          <h1><span id="sp" class="font-weight-bold">Your Account Balance:  <%=request.getParameter("cbalance") %> Rs</span></h1>
          <p class="lead muted" style="color: blue;">TRANSFER MONEY <span id="sp" class="font-weight-bold">IN SECONDS</span></p>
  
          <br>
          <br>
          <button type="button" class="btn btn-primary btn-lg" onclick="location.href = './customers.jsp';">View Customers
           </button><br><br>
           
          <button type="button" class="btn btn-primary btn-lg" onclick="location.href = './send.html';">Transfer
            Money</button>
        </div>
        <div class="col-md-6 col-sm-12 text-center" data-aos="fade-left">
          
        </div>
      
      </div>
      <br><br><br><br><br><br>
  </div>
  


  <!-- here content ends here -->

  <!--===== ABOUT =====-->
  <section class="about section " id="about">
                      
                                         
    </div>
</section>
  <!-- Footer -->
  <footer class="bg-light text-center text-lg-start" style="margin-top: 300px;" margin-top="20px">
    <!-- Grid container -->
    
    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgb(247, 248, 248)" >
      © 2021 Copyright:
      <p class="love">Made with  <i class="fa fa-heart pulse"></i>  by krishna prasad</p>
    </div>
    <!-- Copyright -->
  </footer>



  <!-- spalsh screen js -->
  <script>
    var preloader = document.getElementById("loading");
    function loader() {
      preloader.style.display = 'none';
    }
  </script>

  <script src="assets/js/script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
  <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>

  <!-- aos data  -->
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init({
      duration: 700,
    });
  </script>

</body>
<style>
  #hello {
  background-image: url('img10.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

</html>