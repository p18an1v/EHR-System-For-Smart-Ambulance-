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
            //String uname = hs.getAttribute("uname").toString();
           // String location=hs.getAttribute("location").toString();
           // String ambulance_id = hs.getAttribute("ambulance_id").toString();
            
        %>
  
      
         <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
       <script type="text/javascript">
       var map = null;
    var infowindow = new google.maps.InfoWindow();
    var bounds = new google.maps.LatLngBounds();
       var markers = [

        <?php 
                // loop through the rows of data
                if( have_rows('tour_site', $ID) ):

                 $info_places = array();
                  $info_all_places = array();                 
                    while( have_rows('tour_site', $ID) ) : the_row();
                     //display a sub field value
                        $name = get_sub_field('name');
                        $long = get_sub_field('long');
                        $lat = get_sub_field('lat');
                        $info_places = array("name" => $name, "long"=>$long, "lat"=>$lat);
                        $info_all_places = array($info_places);
                        foreach ($info_all_places as $info) {
                        ?>
                        { 
                             "title": <?php echo "'" . $info['name']  . "'"; ?>,
                             "lat": <?php echo "'" . $info['lat'] . "'"; ?>,
                             "lng": <?php echo "'" . $info['long'] . "'"; ?>,
                        }, 
                        <?php 
                        }
                endwhile;
                else :   
                endif;
            ?>


            {
               "title": 'XXX',
               "lat": 'XXX',
               "lng": 'XXX', 
             }
   ];
   </script>

<!-- <script src="//www.gmodules.com/ig/ifr?url=http://hosting.gmodules.com/ig/gadgets/file/114281111391296844949/driving-directions.xml&amp;up_fromLocation=xxx&amp;up_myLocations=<?php echo $destination; ?>&amp;up_defaultDirectionsType=&amp;up_autoExpand=&amp;synd=open&amp;w=320&amp;h=55&amp;title=Directions+by+Google+Maps&amp;lang=en&amp;country=US&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"></script> -->  
<script type="text/javascript">

function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(
            parseFloat(markers[0].lat),
            parseFloat(markers[0].lng)),
        zoom:15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var path = new google.maps.MVCArray();
    var service = new google.maps.DirectionsService();

    var infoWindow = new google.maps.InfoWindow();
    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var poly = new google.maps.Polyline({
        map: map,
        strokeColor: '#F3443C'
    });
    var lat_lng = new Array();

    var marker = new google.maps.Marker({
                    position:map.getCenter(),
                   map:map,
        title:markers[0].title
                 });
    bounds.extend(marker.getPosition());
    google.maps.event.addListener(marker, "click", function(evt) {
        infowindow.setContent(this.get('title'));
        infowindow.open(map,marker);
    });
    for (var i = 0; i < markers.length; i++) {
        if ((i + 1) < markers.length) {
            var src = new google.maps.LatLng(parseFloat(markers[i].lat), 
                                             parseFloat(markers[i].lng));
            var smarker = new google.maps.Marker({position:des, 
                                      map:map,
                                      title:markers[i].title
                                     });

google.maps.event.addListener(smarker, "click", function(evt) {  
    infowindow.setContent(this.get('title'));
    infowindow.open(map,this);
});       
            var des = new google.maps.LatLng(parseFloat(markers[i+1].lat), 
                                             parseFloat(markers[i+1].lng));
var dmarker = new google.maps.Marker({position:des, 
                                      map:map,
                                      title:markers[i+1].title
                                     });
bounds.extend(dmarker.getPosition());
google.maps.event.addListener(dmarker, "click", function(evt) {  
    infowindow.setContent(this.get('title'));
    infowindow.open(map,this);
});            
            service.route({
                origin: src,
                destination: des,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            }, function (result, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
                        path.push(result.routes[0].overview_path[i]);
                    }
                    poly.setPath(path);
                    map.fitBounds(bounds);
                }
            });
        }
    }
} 
google.maps.event.addDomListener(window,'load',initialize);
   </script>

        <div id="dvMap" style="width: 600px; height: 450px">   </div>
   
</body>	
</html>