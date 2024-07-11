<%@page import="connection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title> P </title>
    </head>
    <body>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Go Ambulance Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
          Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!--// css -->
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet"> 
    <!-- //font-awesome icons -->
    <!-- gallery -->
    <link href='css/simplelightbox.min.css' rel='stylesheet' type='text/css'>
    <!-- //gallery -->
    <!-- font -->
    <link href="//fonts.googleapis.com/css?family=Arvo:400,400i,700,700i" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <!-- //font -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 1000);
        });
        });</script> 
</head>
<style>
    input, select {
        width: 60%;
        padding: 1px 2px;
        margin: 0.5px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 0.5px;
        box-sizing: border-box;
        text-align:center;
    }

    input[type=submit] {
        width: 25%;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: blue;
    }
    input[type=reset] {
        width: 25%;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=reset]:hover {
        background-color: red;
    }
</style>
<body>
        <%
            HttpSession hs = request.getSession(true);
            String uname = hs.getAttribute("uname").toString();
            String location=hs.getAttribute("location").toString();
            String ambulance_id = hs.getAttribute("ambulance_id").toString();
            
        %>
    <div class="banner jarallax">
        <div class="header">
        </div>
        <div class="w3-header-bottom">
            <div class="w3layouts-logo"></div>
            <div class="top-nav">
                <nav class="navbar navbar-default">
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                                                 
                             <li class="first-list"><a class="active" href="index.jsp">Home</a></li>
                                <li><a href="#about" class="scroll">About</a></li>
                                <li><a href="Login.jsp">Login</a></li>
                                 <li><a href="c_register_1.jsp">Register</a></li>
                                 <li><a href="a_info.jsp">Accident_Info</a></li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>	
                </nav>		
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="banner-info">
            <div class="container">
                <div class="w3-banner-info">
                    <div class="slider">
                        <div class="clearfix"> </div>
                        <script>
                            // You can also use "$(window).load(function() {"
                            $(function () {
                            // Slideshow 4
                            $("#slider4").responsiveSlides({
                            auto: true,
                                    pager:true,
                                    nav:false,
                                    speed: 400,
                                    namespace: "callbacks",
                                    before: function () {
                                    $('.events').append("<li>before event fired.</li>");
                                    },
                                    after: function () {
                                    $('.events').append("<li>after event fired.</li>");
                                    }
                            });
                            });
                        </script>
                        <!--banner Slider starts Here-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //Patient Details-->
   
<style>
    table, td, tr {
        width: 65%; 
        border-style: solid;
    }
    td{
        height: 10px;
        padding: 10px;

    }

</style>

<h1>
    <center>   <a href="#">PATIENT FORM</a></center>
</h1>

<fieldset>  
    <div id="blog" class="blog">
        <div class="container">  
            <%!
                String email;
                String uname, phone, address, gender, bgp, age, height, weight, bmi, temp, pr, rr, bp;
            %>
            <%
               // email = request.getParameter("email");
                String sql = "select * from patient where uname='"+uname+"'";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ambulancet", "root", "root");
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    uname = rs.getString("uname");
                    email = rs.getString("email");
                    phone = rs.getString("phone");
                    address = rs.getString("address");
                    gender = rs.getString("gender");
                    bgp = rs.getString("bgp");
                    age = rs.getString("age");
                    height = rs.getString("height");
                    weight = rs.getString("weight");
                    bmi = rs.getString("bmi");
                    temp = rs.getString("temp");
                    pr = rs.getString("pr");
                    rr = rs.getString("rr");
                    bp = rs.getString("bp");

                }
            %>
            <form  style="background: lightblue;position: relative;" method="get" action="FindNearest"> 
                <input type="hidden" name="email" value="<%=email%>">
                <center>
                    <table>
                        <tr>
                            <td>Patient Name : </td>
                            <td><%=uname%></td>
                        </tr>
                        <tr>
                            <td>Mail-ID : </td>
                            <td><%=email%></td>
                        </tr>
                        <tr>
                            <td>Contact No :</td>
                            <td><%=phone%></td>
                        </tr>
                        <tr>
                            <td>Permanent Address :</td>
                            <td><%=address%></td>
                        </tr>
                        <tr>
                            <td>Gender : </td>
                            <td><%=gender%> </td>
                        </tr>
                        <tr>
                            <td>Blood Group:</td>
                            <td><%=bgp%> </td>
                        </tr>
                        <tr>
                            <td>Age :</td>
                            <td><%=age%></td>
                        </tr>
                        <tr>
                            <td>Height(Inches) :</td>
                            <td><%=height%></td>
                        </tr>
                        <tr>
                            <td>Weight(Kg) :</td>
                            <td><%=weight%></td>
                        </tr>
                        <tr>
                            <td>Body Mass Index :</td>
                            <td><%=bmi%></td>
                        </tr>
                        <tr>
                            <td>Body Temperature(degree C) :</td>
                            <td><%=temp%></td>
                        </tr>
                        <tr>
                            <td>Pulse Rate(Per Minute) :</td>
                            <td><%=pr%></td>
                        </tr>
                        <tr>
                            <td>Respiratory Rate(Breath Per Minute) :</td>
                            <td><%=rr%></td>
                        </tr>
                        <tr>
                            <td>Blood Pressure(Range) : </td>
                            <td><%=bp%></td>
                        </tr>
                        
                    </table>
                        <br>
                </center>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Find Hospitals & Police Stations" >
            </form>
            </fieldset> 
        </div>
    </div>                     
</body>	
</html>