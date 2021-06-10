<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Accounts | Basic Banking System</title>
    <link rel="stylesheet"
        href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
    <link rel="stylesheet" href="assets/css/customer.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="style/slider.css">
        <link rel="stylesheet" type="text/css" href="style/mystyle.css">
    
</head>
<style>
  body{
    background-color: bisque;
    background-image: url('./back12.jpg');
  }
</style>
<body>
<%

%>

     <!--Navbar Starts Here-->
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
          <button onclick="parent.location='index.html'"><span class="postnewcar">GO TO HOME PAGE</span></button>
        </ul>
      </div>
    </nav>
  </div>
  <br>
  <br>
  <br>
  <br>
  <!-- navbar ends here  -->
 
    
    <div class="my-info text-center">
        <button class="btn btn-primary btn-info btn-lg" onclick='parent.location="send.html"'>Send Money</button>
    </div>
<br>
<br>
<br>

    <!-- table  -->
    <div class="container">
    <div class="table-responsive">
            <table class="table table-hover table-bordered" style="background-color: rgb(229, 237, 241);">
                <thead>
                    <tr class="table-danger" style="font-size: 1.2rem;">
                        <th scope="col" style="font-size: large;">TRANSFERED FROM</th>
                        <th scope="col" style="font-size: large;">TRANSFERED TO</th>
                        <th scope="col" style="font-size: large;">AMOUNT TRANSFERED</th>
                    </tr>
                </thead>
    <%
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from transfers"); 
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
    <!-- Footer -->
  
    <script src="assets/js/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>

    <footer class="bg-light text-center text-lg-start">
        <!-- Grid container -->
        
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(214,230,255);">
          &#169; 2020 Copyright:
          <p class="love" style="color: black;">Made with  <i class="fa fa-heart pulse"></i>  by Krishna prasad</p>
        </div>
        <!-- Copyright -->
      </footer>
</body>

</html>
