<!DOCTYPE html>
<html lang="en">
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
    <body>
        <!-- banner -->
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
                                <li <span class="first-list"><a  href="index.jsp">HOME</a></li></span>
                                <li <span class="first-list"><a  href="patientrecord.jsp">Patient</a></li></span>
                                <li <span class="first-list"><a  href="doctorrecord.jsp">Doctor </a></li></span>
                                <li <span class="first-list"><a  href="policerecord.jsp">Police</a></li></span>
                                <li <span class="first-list"><a  href="adminmenu_1.jsp">Map_View</a></li></span>
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
                            <div class="callbacks_container">
                                <ul class="rslides callbacks callbacks1" id="slider4">
                                    <li>
                                        <div class="w3layouts-banner-info">
                                            <b><h1 style="color:red;">Admin Portal
                                                </h1></b>
                                            <p></p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
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
                            </form>
                            </table>
                            </center>
                            </fieldset>                        
                            </body>	
                            </html>