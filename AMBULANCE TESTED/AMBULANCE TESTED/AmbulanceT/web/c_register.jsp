<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Registration</title>
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
    <style>
        input, select {
            width: 50%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
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
        <!-- banner -->
        <div class="banner jarallax">
            <div class="header">
                <div class="header-left">
                    <div class="agileinfo-phone">
                        <p><i class="fa fa-volume-control-phone" aria-hidden="true"></i> 102/103</i>
                    </div>
                    <div class="agileinfo-phone agileinfo-map">
                        <p><i class="fa fa-map-marker" aria-hidden="true"></i>PUNE</p>
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
                                <li class="first-list"><a href="index.jsp">Home</a></li>
                                <li><a href="Login.jsp">Login</a></li>
                                <li><a href="c_register.jsp" class="active">Register</a></li>
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
                            <div class="callbacks_container">
                                <ul class="rslides callbacks callbacks1" id="slider4">
                                    <li>
                                        <div class="w3layouts-banner-info">
                                            <b><h1 style="color:red;">AMBULANCE</h1></b>
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
                             <script type="text/javascript">
                                // Popup window code
                                function db(ele)
                                {
                                    var k = ele;
                                    alert(k)
                                <%

                                %>
                                    alert("hi");
                                <%//} %>
                                }
                                var co = 0;
                                function newPopup(url) {
                                    co = 1;
                                    popupWindow = window.open(
                                            url, 'popUpWindow', 'height=500,width=500,left=300,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
                                }
                            </script>
                            <!--banner Slider starts Here-->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- //REGISTRATION FORM -->
        <!-- blog -->
        <div id="blog" class="blog">
            <div class="container">  
                <center>
                      <a href="#" data-toggle="modal" data-target="#fpassword"style="color: red;" > Open Device</a> <br>
                    <form action="Registration" method="post">
                        <h1>REGISTRATION FORM</h1>
                        <select name="type">
                            <option value="Select">Select</option>
                            <option value="Patient">Patient</option>
                        </select>
                        <input type="text" name="Name" placeholder="ENTER THE USERNAME" required="required">
                        <input type="text" name="Email" placeholder="ENTER THE USER EMAIL ID" required="required">
                        <input type="text" name="Mobile" placeholder="ENTER THE USER PHONE NO." required="required">
                        <input type="text" name="Add" placeholder="ENTER THE USER ADDRESS" required="required"><br>
                         <%--<input type="file" name="imgpath" accept="image/gif, image/jpeg, image/png" required="required">--%>
                        <input type="password" name="Passwd" placeholder="ENTER PASSWORD" required="required"><br>
                        <%--<input type="text" name="Confmpass" placeholder="ENTER THE USER CONFIRM-PASSWORD" required="required"> --%><br>
                        &nbsp; &nbsp;<input type="submit" value="REGISTER">&nbsp;&nbsp;<input type="reset" value="RESET">
                    </form>
                </center>
            </div>
        </div>
                          <%
                                
                                String d = request.getRequestURL().toString();
                                 
                            %>
                        
                          <div class="modal fade" id="fpassword" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="signin-form profile">
                            <h3 class="agileinfo_sign">Open Device</h3>	
                            <div class="login-form">
                                <form action="FingerScan1?<%=d%>" name="fpass" method="post" class="mod2">
                                
                                    <input type="submit" value="Open Device">
                                    <input type="reset" value="Cancle">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        
                        
    </body>	
</html>