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
    </head>
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
                                <li class="first-list"><a href="adminmenu.jsp">Main_Menu</a></li>
                                <li><a href="pdetails.jsp">Show Citizens </a></li>
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
                            <div class="callbacks_container">
                                <ul class="rslides callbacks callbacks1" id="slider4">
                                    <li>
                                        <div class="w3layouts-banner-info">
                                            <b><h1 style="color:red;">----
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
