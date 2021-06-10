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
    background-image: url('./back12.jpg');
  }
  table{
    background-color: coral;
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
          <button onclick="parent.location='show.jsp'"><span class="postnewcar">TRANSFER STATEMENT</span></button>
          <button onclick="parent.location='index.html'"><span class="postnewcar">GO TO HOME PAGE</span></button>
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
  <!-- navbar ends here  -->
 
    
    <div class="my-info text-center">
        <button class="btn btn-primary btn-info btn-lg" onclick='parent.location="show.jsp"'>TRANSFERS</button>

        <button class="btn btn-primary btn-info btn-lg" onclick='parent.location="transfer1.html"'>Transfer money</button>
    </div>

    <!-- Modal send money -->
    
    <!-- Modal transaction History-->
    <div class="modal fade" id="transactionHistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Transaction History</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ol id="transaction-history-body">

                    </ol>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- table  -->
    <div class="container">
    <div class="table-responsive" style="background-color: rgb(229, 237, 241);">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr class="table-danger" style="font-size: large;">
                        <th scope="col" style="font-size: large;">Sl. No.</th>
                        <th scope="col" style="font-size: large;">Name</th>
                        <th scope="col" style="font-size: large;">E-mail</th>
                        <th scope="col" style="font-size: large;">Bank Balance(in Rs)</th>
                    </tr>
                </thead>
    <%
	String to = (String)session.getAttribute("name");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/intern","root","root");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from customers"); 
		while(rs.next())
	{
 	%>
            
                <tbody>
 				<tr>
 						<td width="25%"><%=rs.getString(1) %></td>
 						<td width="25%"><%=rs.getString(2) %></td>
 						<td width="25%"><%=rs.getString(3) %></td>
 						<td width="25%"><%=rs.getString(4) %></td>
 						<td><button class="btn btn-primary btn-lg" onclick='parent.location="show.jsp"' style="background-color: rgb(95, 181, 252); color: cornsilk;">View Transfers</button>
            <td><button class="btn btn-primary btn-lg" onclick='parent.location="transfer1.html"' style="background-color: rgb(95, 181, 252); color: cornsilk;">Send</button>
              <form action="alltransfers.jsp" method="POST">
                <td>
                  <input hidden type="text" value=<%= rs.getString(2)%> name="cname" />
                  <input hidden type="text" value=<%= rs.getString(4)%> name="cbalance" />
                  <input type="submit" value="View">
                </td>
              </form>
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
          <p class="love" style="color: black;">Made with  <i class="fa fa-heart pulse"></i>  by Krishna Prasad</p>
        </div>
        <!-- Copyright -->
      </footer>
</body>

</html>
