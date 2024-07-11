<%@page import="connection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edit record</title>
    </head>
    <body>
        <%
            HttpSession hs = request.getSession(true);
            String uname = hs.getAttribute("name").toString();
            String email = hs.getAttribute("email").toString();
            String phone = hs.getAttribute("mobile").toString();
            String address = hs.getAttribute("address").toString();
        %>
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
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
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
    <div class="banner jarallax">
        <div class="header">
            <div class="header-left">
                <div class="agileinfo-phone">
                    <p><i class="fa fa-volume-control-phone" aria-hidden="true"></i>Phone No.</i>
                </div>
                <div class="agileinfo-phone agileinfo-map">
                    <p><i class="fa fa-map-marker" aria-hidden="true"></i>PUNE</p>
                </div>
                <div class="clearfix"> </div>
            </div>
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
                                    pager: true,
                                    nav: false,
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
            var mobile = document.record.mobile.value;
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

            if (uname == 0) {
                alert("Enter Patient Name");
                document.record.uname.focus();
                return false;
            } else if (phone == 0) {
                alert("Enter Mobile No");
                document.record.phone.focus();
                return false;
            } else if (address == 0) {
                alert("Enter Perment Address");
                document.record.address.focus();
                return false;
            } else if (gender == 0) {
                alert("Enter gender");
                document.record.gender.focus();
                return false;
            } else if (bgp == 0) {
                alert("Enter Blood Group Ex. A+");
                document.record.bgp.focus();
                return false;
            } else if (age == 0) {
                alert("Enter Age");
                document.record.age.focus();
                return false;
            } else if (height == 0) {
                alert("Enter Height Ex: 5.1");
                document.record.height.focus();
                return false;
            } else if (weight == 0) {
                alert("Enter Weight");
                document.record.weight.focus();
                return false;
            } else if (bmi == 0) {
                alert("Enter Body Mass Index");
                document.record.bmi.focus();
                return false;
            } else if (temp == 0) {
                alert("Enter Body Temperature Ex: 45 degree C");
                document.record.temp.focus();
                return false;
            } else if (pr == 0) {
                alert("Enter Your Pulse Rate Ex: 72");
                document.record.pr.focus();
                return false;
            } else if (rr == 0) {
                alert("Enter Respiratory Rate Ex: 72");
                document.record.rr.focus();
                return false;
            } else if (bp == 0) {
                alert("Enter Blood Pressure");
                document.record.bp.focus();
                return false;
            } else {
                return true;
            }
        }

    </script>
    <!-- Table -->
<style>
    table {
        width: 75%;
    }
    td{
        height: 10px;
        padding: 10px;
    }

</style>

<fieldset>  
    <div id="blog" class="blog">
        <div class="container">  
            <%!
                String email;
                String uname, phone, address, gender, bgp, age, height, weight, bmi, temp, pr, rr, bp;
            %>
            <%
                //email = request.getParameter("email");
                String sql = "select * from patient where email= '" + email + "'";
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
            <form action="editpatient2.jsp" style="background: lightblue;position: relative;" method="post" onsubmit="return validation()"> 
                <input type="hidden" name="email" value="<%=email%>">
                <center>
                    <h1>MODIFY HEALTH RECORD </h1>
                    <table>
                        <tr>
                            <td>Patient Name :</td>
                            <td><%=uname%></td>
                            <td><input type="hidden" name="uname" value="<%=uname%>" id="uname" ></td>
                        </tr>
                        <tr>
                            <td>Mail-ID : </td>
                            <td><%=email%></td>
                            <td><input type="hidden" name="email" value="<%=email%>" id="email" ></td>
                        </tr>
                        <tr>
                            <td>Contact No :</td>
                            <td><input type="text" name="phone" value="<%=phone%>" id="phone" pattern="[7-9]{1}[0-9]{9}" title="Phone number with 7-9 and remaing 9 digit with 0-9"></td>
                        </tr>
                        <tr>
                            <td>Permanent Address :</td>
                            <td> <input type="text" name="address" value="<%=address%>" id="address" > </td>
                        </tr>
                        <tr>
                            <td>Gender : </td>
                            <td> <input type="text" name="gender" value="<%=gender%>" id="gender" > </td>
                        </tr>
                        <tr>
                            <td>Blood Group:</td>
                            <td> <input type="text" name="bgp" value="<%=bgp%>" id="bgp" > </td>
                        </tr>
                        <tr>
                            <td>Age :</td>
                            <td> <input type="text" name="age" value="<%=age%>" id="age"> </td>
                        </tr>
                        <tr>
                            <td>Height(Inches) :</td>
                            <td> <input type="text" name="height" value="<%=height%>" id="height"> </td>
                        </tr>
                        <tr>
                            <td>Weight(Kg) :</td>
                            <td><input type="text" name="weight" value="<%=weight%>" id="weight"></td>
                        </tr>
                        <tr>
                            <td>Body Mass Index :</td>
                            <td><input type="text" name="bmi" value="<%=bmi%>" id="bmi" > </td>
                        </tr>
                        <tr>
                            <td>Body Temperature(degree C) :</td>
                            <td><input type="text" name="temp" value="<%=temp%>" id="temp"> </td>
                        </tr>
                        <tr>
                            <td>Pulse Rate(Per Minute) :</td>
                            <td> <input type="text" name="pr" value="<%=pr%>" id="pr"></td>
                        </tr>
                        <tr>
                            <td>Respiratory Rate(Breath Per Minute) :</td>
                            <td><input type="text" name="rr" value="<%=rr%>" id="rr"></td>
                        </tr>
                        <tr>
                            <td>Blood Pressure(Range) : </td>
                            <td> <input type="text" name="bp" value="<%=bp%>" id="bp"> </td>
                        </tr>
                    </table>
                </center>
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="SUBMIT">
            </form>
            </fieldset> 
        </div>
    </div>                     
</body>	
</html>