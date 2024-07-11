<%-- 
    Document   : home
    Created on : Jan 18, 2018, 9:25:47 PM
    Author     : PTPL-02
--%>



<%@page import="java.util.Arrays"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="css/morris.css" type="text/css"/>
        <!-- Graph CSS -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="js/jquery-2.1.4.min.js"></script>
        <!-- //jQuery -->
        <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <!-- lined-icons -->
        <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
        <!-- //lined-icons -->
        <%
            HttpSession httpSession = request.getSession(false);
            
            JSONArray jsonArray = new JSONArray();
            JSONObject json = new JSONObject();
            JSONObject json1;
            DBConnection db = new DBConnection();
            String sql = "Select * from tbl_location";
            ResultSet rs = db.Select(sql);
            while (rs.next()) {
                json1 = new JSONObject();
                double lat = Double.parseDouble(rs.getString("latitude"));
                double lon = Double.parseDouble(rs.getString("longitude"));
                String area = rs.getString("area");
                json1.put("name", area);
                json1.put("lat", lat);
                json1.put("lng", lon);
                int status = Integer.parseInt(rs.getString("status"));
                if (status==0) {
                    json1.put("color", "green");
                } else if (status==1) {
                    json1.put("color", "yellow");
                } else {
                    json1.put("color", "red");
                }
                jsonArray.put(json1);
            }
            System.out.println(jsonArray);
        %>
    </head> 
    <body>
        <div class="page-container">
            <!--/content-inner-->
            <div class="left-content">
                <div class="mother-grid-inner">
                    <!--header start here-->
                    <!--heder end here-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a> <i class="fa fa-angle-right"></i></li>
                    </ol>
                    <!--four-grids here-->
                    <div class="four-grids">
                        <div class="col-md-3 four-grid">
                            <div class="four-agileits">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-user" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3>Drivers</h3>
                                    <h4> 1000 </h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 four-grid">
                            <div class="four-agileinfo">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3>Bins</h3>
                                    <h4>15,520</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 four-grid">
                            <div class="four-w3ls">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3>vehicle</h3>
                                    <h4>700</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 four-grid">
                            <div class="four-wthree">
                                <div class="icon">
                                    <i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
                                </div>
                                <div class="four-text">
                                    <h3>Old Projects</h3>
                                    <h4>14,430</h4>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!--//four-grids here-->
                    <!--agileinfo-grap-->
                    <div class="agile-tables">
                        <header class="agileits-box-header clearfix">
                            <h3>Map</h3>
                        </header>
                        <div class="agibodyleits-box-body clearfix">
                            <div style="height: 500px;">
                            <div id="map"></div>
                            </div>
                        </div>

                    </div>

                    <!-- script-for sticky-nav -->
                    <script>
                        $(document).ready(function () {
                            var navoffeset = $(".header-main").offset().top;
                            $(window).scroll(function () {
                                var scrollpos = $(window).scrollTop();
                                if (scrollpos >= navoffeset) {
                                    $(".header-main").addClass("fixed");
                                } else {
                                    $(".header-main").removeClass("fixed");
                                }
                            });

                        });
                    </script>
                    <!-- /script-for sticky-nav -->
                    <!--inner block start here-->
                    <div class="inner-block">

                    </div>
                    <!--inner block end here-->
                    <!--copy rights start here-->
                    <div class="copyrights">
                        <p>Â© 2016 Pooled. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                    </div>	
                    <!--COPY rights end here-->
                </div>
            </div>
            <!--//content-inner-->
            <!--/sidebar-menu-->
            <div class="sidebar-menu">
                <header class="logo1">
                    <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
                </header>
                <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                <div class="menu">
                    <ul id="menu" >
                        <li><a href="home.jsp"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>

                        <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Bins</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addBin.jsp">Add Bins</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showBins.jsp">Show Bins</a></li>
                            </ul>
                        </li>
                        <li id="menu-academico" ><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span> Driver</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addDriver.jsp">Add Driver</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showDriver.jsp">Show Details</a></li>
                            </ul>
                        </li>
                        <li id="menu-academico" ><a href="#"><i class="fa fa-truck" aria-hidden="true"></i><span>Vehicle</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addVehicle.jsp">Add Vehicle</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showVehicle.jsp">Show Details</a></li>
                            </ul>
                        </li>
                        <li><a href="logout.jsp"><i class="fa fa-sign-out"></i> <span>Logout</span><div class="clearfix"></div></a></li>

                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>		
        </div>
        <script>
            var toggle = true;

            $(".sidebar-icon").click(function () {
                if (toggle)
                {
                    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                    $("#menu span").css({"position": "absolute"});
                } else
                {
                    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                    setTimeout(function () {
                        $("#menu span").css({"position": "relative"});
                    }, 400);
                }

                toggle = !toggle;
            });
        </script>
        <!--js -->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- /Bootstrap Core JavaScript -->	   
        <!-- morris JavaScript -->	
        <script src="js/raphael-min.js"></script>
        <script src="js/morris.js"></script>
        <script>
            // If you're adding a number of markers, you may want to drop them on the map
            // consecutively rather than all at once. This example shows how to use
            // window.setTimeout() to space your markers' animation.
            function initMap() {
                var latlng = new google.maps.LatLng(18.5592685, 73.9298358);
                var myOptions = {
                    zoom: 14,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    mapTypeControl: false
                };
                var map = new google.maps.Map(document.getElementById("map"), myOptions);
                var infowindow = new google.maps.InfoWindow(), marker, lat, lng;
                var json = <%=jsonArray%>;

                for (var o in json) {

                    lat = json[ o ].lat;
                    lng = json[ o ].lng;
                    name = json[ o ].name;
                    color = json[o].color;
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(lat, lng),
                        icon: {
                            path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
                            strokeColor: color,
                            scale: 5
                        },
                        name: name,
                        map: map
                    });
                    google.maps.event.addListener(marker, 'click', function (e) {
                        infowindow.setContent(this.name);
                        infowindow.open(map, this);
                    }.bind(marker));
                }
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1xMDhYV9Ar5_oX5tdPJm2QcYfGhicN34&callback=initMap">
        </script>
    </body>
</html>