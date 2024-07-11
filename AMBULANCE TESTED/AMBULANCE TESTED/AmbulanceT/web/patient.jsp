<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Patient</title>
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
        <%
            HttpSession hs = request.getSession(true);
            String uname = hs.getAttribute("name").toString();
            String email = hs.getAttribute("email").toString();
            String phone = hs.getAttribute("mobile").toString();
            String address = hs.getAttribute("address").toString();
        %>
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
                    
                    
                    if (gender == 0) {
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
            } else if (temp == 0){
            alert("Enter Body Temperature Ex: 45 degree C");
                    document.record.temp.focus();
                    return false;
            } else if (pr == 0) {
            alert("Enter Your Pulse Rate Ex: 72");
                    document.record.pr.focus();
                    return false;
            }else if (rr == 0) {
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

                    <form action="patient2" name="record" style="background: lightblue;position: relative;" method="post" onsubmit="return validation()"> 
                        <center>
                            <table>
                                <tr>
                                    <td>Patient Name </td>
                                    <td><%=uname%></td>
                                    <td><input type="hidden" name="uname" id="uname" value="<%=uname%>"></td>
                                </tr>
                                <tr>
                                    <td>Mail-ID </td>
                                    <td><%=email%></td>
                                    <td><input type="hidden" name="email" id="email" value="<%=email%>"></td>
                                </tr>
                                <tr>
                                    <td>Contact No</td>
                                    <td><%=phone%></td>
                                    <td><input type="hidden" name="phone" id="phone" value="<%=phone%>"></td>
                                </tr>
                                 <tr>
                                    <td>Patient Address </td>
                                    <td><%=address%></td>
                                    <td><input type="hidden" name="address" id="address" value="<%=address%>"></td>
                                </tr>
                               
                                  <tr>
                                    <td>Gender : </td>
                                    <td><select  name="gender" id="gender" >
                                            <option value="">Select</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Blood Group:</td>
                                    <td><input type="text" name="bgp" id="bgp"></td>
                                </tr>
                                <tr>
                                    <td>Age :</td>
                                    <td><input type="text" name="age" id="age"></td>
                                </tr>
                                <tr>
                                    <td>Height(Inches) :</td>
                                    <td><input type="text" name="height" id="height"></td>
                                </tr>
                                <tr>
                                    <td>Weight(Kg) :</td>
                                    <td><input type="text" name="weight" id="weight"></td>
                                </tr>
                                <tr>
                                    <td>Body Mass Index :</td>
                                    <td><select id="bmi" name="bmi">
                                            <option value="">Select</option>
                                            <option value="under"> below 18.5(Underweight)</option>
                                            <option value="healthy">18.5 to 24.9(Healthy)</option>
                                            <option value="over">25 to 29.9(Overweight)</option>
                                            <option value="high">30 or higher(Obese)</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>Body Temperature(degree C) :</td>
                                    <td><input type="text" name="temp" id="temp"></td>
                                </tr>
                                <tr>
                                    <td>Pulse Rate(Per Minute) :</td>
                                    <td><input type="text" name="pr" id="pr"></td>
                                </tr>
                                <tr>
                                    <td>Respiratory Rate(Breath Per Minute) :</td>
                                    <td><input type="text" name="rr" id="rr"></td>
                                </tr>
                                <tr>
                                    <td>Blood Pressure(Range) : </td>
                                    <td><select id="bp" name="bp">
                                            <option value="">Select</option>
                                            <option value="vlow">0-60(Very Low)</option>
                                            <option value="low">60-90(Low)</option>
                                            <option value="ideal">90-120(Ideal)</option>
                                            <option value="phigh">120-140(Pre-High)</option>
                                            <option value="high">140-190(High)</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </center>
                        &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="SUBMIT">   
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="RESET">
                    </form>
                </div>
            </div>   
        </fieldset> 

    </body>	
</html>