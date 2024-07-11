<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Police</title>
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
            width: 15%;
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
            width: 15%;
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
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="first-list"><a href="adminmenu.jsp">Main_Menu</a></li>
                                <li><a href="policedetails.jsp" >View Records</a></li>
                                <li><a href="police.jsp" class="active">Add P_Station</a></li>
                                <li><a  href="index.jsp">Logout</a></li>
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
        <!-- //Police Details-->
        <script>
            function validation() {
                var name = document.record.name.value;
                var hp = document.record.hp.value;
                var mobile = document.record.mobile.value;
                var email = document.record.email.value;
                var address = document.record.address.value;
                var coordinates = document.record.coordinates.value;

                if (name == 0) {
                    alert("Enter Police Name");
                    document.record.name.focus();
                    return false;
                } else if (hp == 0) {
                    alert("Enter Head Person");
                    document.record.hp.focus();
                    return false;
                } else if (mobile == 0) {
                    alert("Enter Phone No.");
                    document.record.mobile.focus();
                    return false;
                } else if (email == 0) {
                    alert("Enter email");
                    document.record.email.focus();
                    return false;
                } else if (address == 0) {
                    alert("Enter Adddress");
                    document.record.address.focus();
                    return false;
                } else if (coordinates == 0) {
                    alert("Enter Co-ordinates Seperate with Comma(,)");
                    document.record.coordinates.focus();
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

                    <form action="police" name="record" style="background: lightblue;position: relative;" method="post" onsubmit="return validation();"> 
                        <center>
                            <table>
                                <tr>
                                    <td>Police Station Name </td>
                                    <td><input type="text" name="name" id="name"></td>
                                </tr>
                                <tr>
                                    <td>Head Person</td>
                                    <td><input type="text" name="hp" id="hp"></td>
                                </tr>
                                <tr>
                                    <td>Contact No </td>
                                    <td><input type name="mobile" id="mobile" pattern="[7-9]{1}[0-9]{9}" title="Phone number with 7-9 and remaing 9 digit with 0-9"></td>
                                </tr>
                                <tr>
                                    <td>Email Id </td>
                                    <td><input type="email" name="email" id="email"></td>
                                </tr>
                                <tr>
                                    <td>Police Station Address</td>
                                    <td><input type="text" name="address" id="address"></td>
                                </tr>
                                <tr>
                                    <td>Coordinates</td>
                                    <td><input type="text" name="coordinates" id="coordinates" placeholder="Seperate with ,"></td>
                                </tr>
                            </table>
                        </center>
                        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="submit" value="SUBMIT">  
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <input type="reset" value="RESET">
                    </form>
                </div>
            </div>   
        </fieldset> 
    </body>	
</html>