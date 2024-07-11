<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <title>Admin Menu</title>
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
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
    <style>
        input[type=text], select {
            width: 50%;
            padding: 50px 50px;
            margin: 2px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            text-align:center;
        }

        input[type=submit] {
            width: 50%;
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
            width: 50%;
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
</head>

<body>
    <%

        JSONArray jsonArray = new JSONArray();
        HttpSession hs = request.getSession();
        jsonArray = (JSONArray) hs.getAttribute("array1");
        System.out.println(jsonArray);
    %>

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
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
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
    <div class="callbacks_container">
        <ul class="rslides callbacks callbacks1" id="slider4">
            <li>
                <div class="w3layouts-banner-info">

                    <p></p>
                </div>
            </li>
        </ul>
    </div>

    <div id="map"></div>
    
    <script>
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

    <br>
    <div style="align-self: center">
        <input type="button" value="Send Report" onclick="\report_accident" style="color: blue; align-content: center ">
    </div>
</body>
</html>