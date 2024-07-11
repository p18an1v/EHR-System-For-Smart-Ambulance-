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
            String uname = hs.getAttribute("name").toString();
            String email = hs.getAttribute("email").toString();
            String phone = hs.getAttribute("mobile").toString();
            String address = hs.getAttribute("address").toString();
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
                             <li> <a  href="patient.jsp">Create HR</a></li>                        
                            <li> <a  href="editpatient1.jsp">Update HR</a></li>
                            <li> <a  href="pprint.jsp">Print</a></li>
                            <li> <a  href="index.jsp">Logout</a></li>
                            
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
    <script>
        function validation() {
        var uname = document.record.uname.value;
        var email = document.record.email.value;
        var phone = document.record.phone.value;
        var address = document.record.address.value;
        var gender = document.record.gender.value;
        var bgp = document.record.bgp.value;
        var age = document.record.age.value;
        var height = document.record.height.value;
        var weight = document.record.weight.value;
        var bmi = document.record.bmi.value;
        var temp = document.record.temp.value;
        var pr = document.record.pr.value;
        var rr = document.record.rr.value;
        var bp = document.record.bp.value;
        if (name == 0) {
        alert("Enter Patient Name");
        document.record.uname.focus();
        return false;
        }
        if (mail == 0) {
        alert("Enter mailid");
        document.record.email.focus();
        return false;
        }
        if (mobile == 0) {
        alert("Enter your mobile no");
        document.record.phone.focus();
        return false;
        }
        if (isNaN(ph)) {
        alert("Invalid mobile no");
        document.record.phone.focus();
        return  false;
        }
        var y = document.record.phone.value;
        if (isNaN || y.indexOf(" " != - 1)
        {
        alert("Invalid Mobile No.");
        document.record.phone.focus();
        return false;
        }
        if (y.length > 10 || y.length < 10)
        {
        alert("Mobile No. should be 10 digit");
        document.record.phone.focus();
        return false;
        }
        if (!(y.charAt(0) == "9" || y.charAt(0) == "8" || y.charAt(0) == "7")
        {
        alert("Mobile No. should start with 9 ,8 or 7 ");
        document.record.phone.focus();
        return false
        }
        if (ph == 0) {
        alert("Enter address");
        document.record.address.focus();
        return false;
        }
        if (ph == 0) {
        alert("Enter gender");
        document.record.gender.focus();
        return false;
        }
        if (ph == 0) {
        alert("Enter Blood Group");
        document.record.bgp.focus();
        return false;
        }
        if (ph == 0){
        alert("Enter Age");
        document.record.age.focus();
        return false;
        }
        if (ph == 0) {
        alert("Enter your height");
        document.record.height.focus();
        return false;
        }
        if (ph == 0) {
        alert("Enter Your Weight");
        document.record.weight.focus();
        return false;
        }
        if (pr == 0) {
        alert("Enter Your Body Mass Index");
        document.record.bmi.focus();
        return false;
        }
        if (pr == 0) {
        alert("Enter Your Body Temperature");
        document.record.temp.focus();
        return false;
        }
        if (pr == 0) {
        alert("Enter Your Pulse Rate");
        document.record.pr.focus();
        return false;
        }
        if (pr == 0) {
        alert("Enter Respiratory Rate");
        document.record.rr.focus();
        return false;
        }
        if (pr == 0) {
        alert("Enter Blood Pressure");
        document.record.bp.focus();
        return false;
        }
        }
        return true;
    </script>
    <!-- Table -->
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
                String sql = "select * from patient where email='"+email+"'";
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
            <form  style="background: lightblue;position: relative;" method="get" onsubmit="return validation()"> 
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
                </center>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="PRINT" onclick="window.print()">
            </form>
            </fieldset> 
        </div>
    </div>                     
</body>	
</html>