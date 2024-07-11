<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Patient-Records Show</title>
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
                        <p><i class="fa fa-volume-control-phone" aria-hidden="true"></i>102/103</i>
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
                                <li class="first-list"><a href="adminmenu.jsp">Main_Menu</a></li>
                                <li><a href="pdetails.jsp" class="active">Show Citizens </a></li>
                                <!-- <li><a href="Loginall.jsp">Login</a></li>-->
                                <li><a href="register1.jsp">Add Citizen</a></li>
                                <li <span class="first-list"><a  href="index.jsp">Logout</a></li></span>
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
          
    <style>
        table,td,tr,th{
            border: 1px solid black;
            border-collapse: collapse;
            border-style: solid;
        }
        table tr:nth-child(even) {
            background-color: #fff;
        }
        table tr:nth-child(odd) {
            background-color: #eee;
        }
        table{
            position: relative;
            left: 10px;
            width: 900px;
        }
        th{
            background-color: #ccffcc;
            text-align: center;
        }
        td{
            text-align: center;
        }
        tr{ 

            height: 50px;

        }
    </style>

    <%
        DBConnection db = new DBConnection();
        String sql = "select * from patient where type='Patient'";
        ResultSet rs = db.Select(sql);
        String uname = "", email = "", phone = "", address = "", pass = "", type = "";
        int id = 0;
    %>

    <!Table Format Show>           

    <fieldset>  
        <div id="blog" class="blog">
            <div class="container">  
                <form action="patient2" name="record" style="position: relative;" method="post"> 
                    <center>
                        <table>
                            <tr>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>EMAIL</th>
                                <th>PHONE</th>
                                <th>ADDRESS</th>
                                <th>PASSWORD</th>
                                <th>STATUS</td>

                            </tr>
                            <%    while (rs.next()) {
                                    id = rs.getInt(1);
                                    uname = rs.getString(2);
                                    email = rs.getString(3);
                                    phone = rs.getString(4);
                                    address = rs.getString(5);
                                    pass = rs.getString(6);
                                    type = rs.getString("status");

                            %>
                            <tr>
                                <td><%=id%></td>
                                <td><%=uname%></td>
                                <td><%=email%></td>
                                <td><%=phone%></td>
                                <td><%=address%></td>
                                <td><%=pass%></td>
                                <%
                                    if (type.equals("0")) {%>
                                <td> <a href="ActivateCitizen?<%=id%>">Activate</a> </td>  
                                <% } else {%>
                                <td>Activated</td> 
                                <%}%>
                            </tr>
                            <%}%>
                        </table>
                    </center>
                </form>
            </div>
        </div> 
    </fieldset> 
</body>
</head>
</html>