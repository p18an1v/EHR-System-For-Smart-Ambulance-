
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AMBULANCE TRACKING</title>
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
            });
        </script> 
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <![endif]-->
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
                    <div class="search-grid">
                        <form action="#" method="post">
                            <input type="text" placeholder="Search" class="big-dog" name="Subscribe" required="">
                            <button class="btn1"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="w3-header-bottom">
                <div class="w3layouts-logo">
                    <h1>
                        <a href="index.html">GO AMBULANCE</a>
                    </h1>
                </div>
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
                <div class="agileinfo-social-grids">
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-vk"></i></a></li>
                    </ul>
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
                                            <b><h1 style="color:red;">AMBULANCE</h1></b>
                                            <p></p>
                                            <div class="w3ls-button">
                                                <a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="w3layouts-banner-info">

                                            <div class="w3ls-button">
                                                <a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
                                            </div>
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
                            <!--banner Slider starts Here-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //banner -->
        <!-- modal -->
        <div class="modal about-modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        <h4 class="modal-title">AMBULANCE</h4>
                    </div> 
                    <div class="modal-body">
                        <div class="agileits-w3layouts-info">
                            <img src="images/1.jpg" alt="" />
                            <p>Now a days traffic increases rapidly therefore ambulance will get stuck in emergency. Hence, need to solve the problem of traffic to get the medical facility to accident victim within short period of time.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
        <!-- welcome -->
        <div class="welcome">
            <div class="container">
                <div class="wthree-heading">
                    <h2>Welcome</h2>
                    <p>Well Equiped Ambulance For Emergency </p>
                </div>
                <div class="w3-welcome-grids">
                    <div class="col-md-3 w3-welcome-grid">
                        <div class="w3-welcome-grid-info">
                            <img src="images/3.jpg" alt="" />
                            <h4> Monitoring Patient Health </h4>
                            <p>An ambulance is a vehicle for transportation, from or between places of treatment,and in some instances will also provide out of hospital medical care to the patient.</p>
                        </div>
                    </div>
                    <div class="col-md-3 w3-welcome-grid">
                        <div class="w3-welcome-grid-info">
                            <img src="images/4.jpg" alt="" />
                            <h4>Tracking The Ambulance Which Is Carrying The Patient </h4>
                            <p>Ambulances, like other emergency vehicles, are required to operate in all weather conditions, including those during which civilian drivers often elect to stay off the road.</p>
                        </div>
                    </div>
                    <div class="col-md-3 w3-welcome-grid">
                        <div class="w3-welcome-grid-info">
                            <img src="images/8.jpg" alt="" />
                            <h4> Hospital(Doctor) and Police Using A GSM Technology</h4>
                            <p>Patient information directly send to the Hospital and Police.</p>
                        </div>
                    </div>
                    <div class="col-md-3 w3-welcome-grid">
                        <div class="w3-welcome-grid-info">
                            <img src="images/7.jpg" alt="" />
                            <h4>Go Fast Save Life</h4>
                            <p>It Saves Patient Time</p>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //welcome -->
        <!-- about-bottom -->
        <div class="about-bottom jarallax" id="about">
            <!-- container -->
            <div class="container">
                <div class="wthree-heading about-heading">
                    <h3>About Us</h3>
                    <p>_____________________</p>
                </div>
                <div class="about-bottom-grids">
                    <div class="col-md-6 about-bottom-left">
                        <h4>__________</h4>
                        <p>_____________</p>
                    </div>
                    <div class="col-md-6 about-bottom-left about-bottom-right">
                        <h4>____________</h4>
                        <p>________	</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="about-bottom-grids w3ls-about-bottom-grids">
                    <div class="col-md-6 about-bottom-left">
                        <h4>__________</h4>
                        <p>_________________</p>
                    </div>
                    <div class="col-md-6 about-bottom-left about-bottom-right">
                        <h4>__________________</h4>
                        <p>________________</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- //container -->
        </div>
        <!-- //team -->
        <!-- blog -->
        <div id="blog" class="blog">
            <div class="container">  
                <div class="wthree-heading">
                    <h3>Blog</h3>
                    <p>Now a days traffic increases rapidly therefore ambulance will get stuck in emergency. Hence, need to solve the problem of traffic to get the medical facility to accident victim within short period of time.</p>
                </div>
                <div class="blog-agileinfo">
                    <div class="col-md-6 blog-w3grid-img">
                        <a href="#myModal" data-toggle="modal" class="wthree-blogimg">  
                            <img src="images/4.jpg" class="img-responsive" alt=""/>
                        </a>  
                    </div>
                    <div class="col-md-6 blog-w3grid-text"> 
                        <h4><a href="#myModal" data-toggle="modal">Patient</a></h4>
                        <p>The Real Time Health Monitoring and Tracking system will help people for critical condition when the person is unconsciousness or any major accident time. The system will track, trace, monitor patients and facilitate taking care of their health; so efficient medical services could be provided at appropriate time.</p>
                    </div> 
                    <div class="clearfix"> </div>
                </div> 
                <div class="blog-agileinfo blog-agileinfo-mdl">
                    <div class="col-md-6 blog-w3grid-img blog-img-rght">
                        <a href="#myModal" data-toggle="modal" class="wthree-blogimg">  
                            <img src="images/p.jpg" class="img-responsive" alt=""/>
                        </a>  
                    </div>
                    <div class="col-md-6 blog-w3grid-text"> 
                        <h4><a href="#myModal" data-toggle="modal">Police</a></h4>
                        <p>Police get information related to the patient like patient name, I'd and location using this information police easily investigates patient. </p>
                    </div> 
                    <div class="clearfix"> </div>
                </div> 
                <div class="blog-agileinfo">
                    <div class="col-md-6 blog-w3grid-img">
                        <a href="#myModal" data-toggle="modal" class="wthree-blogimg">  
                            <img src="images/t.jpg" class="img-responsive" alt=""/>
                        </a>  
                    </div>
                    <div class="col-md-6 blog-w3grid-text"> 
                        <h4><a href="#myModal" data-toggle="modal">Thumb</a></h4>
                        <p>We can use fingerprint for getting person information like name, blood group, previous medical history etc. By using thumb impression we can get patients information easily. 
                            Some accident person body not identified in this situation by using thumb impression we can find out person information.</p>
                    </div> 
                    <div class="clearfix"> </div>
                </div> 
            </div>
        </div>
        <footer>
            <div class="copy-right-grids">
                <div class="container">
                    <div class="copy-left">
                        <p class="footer-gd">© 2018 GO AMBULANCE Reserved | Design by <a href="#" target="_blank">W3School</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </footer>
        <!-- //footer -->
        <script src="js/responsiveslides.min.js"></script>
        <script src="js/jarallax.js"></script>
        <script src="js/SmoothScroll.min.js"></script>
        <script type="text/javascript">
                                /* init Jarallax */
                                $('.jarallax').jarallax({
                                    speed: 0.5,
                                    imgWidth: 1366,
                                    imgHeight: 768
                                })
        </script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
                                $(document).ready(function () {
                                    /*
                                     var defaults = {
                                     containerID: 'toTop', // fading element id
                                     containerHoverID: 'toTopHover', // fading element hover id
                                     scrollSpeed: 1200,
                                     easingType: 'linear' 
                                     };
                                     */

                                    $().UItoTop({easingType: 'easeOutQuart'});

                                });
        </script>
        <!-- //here ends scrolling icon -->
    </body>	
</html>