<%-- 
    Document   : index
    Created on : Jun 1, 2016, 9:32:32 PM
    Author     : BLAMAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | E-Shopper</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/font-awesome.min.css" rel="stylesheet">
        <link href="../css/prettyPhoto.css" rel="stylesheet">
        <link href="../css/price-range.css" rel="stylesheet">
        <link href="../css/animate.css" rel="stylesheet">
        <link href="../css/main.css" rel="stylesheet">
        <link href="../css/responsive.css" rel="stylesheet"> 
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="../images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../images/logo/logo.png.png">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <section id="form"><!--form-->
            <div class="container">
                    <div class="row">
                            <div class="col-sm-4 col-sm-offset-1">
                                    <div class="login-form"><!--login form-->
                                        <h2>Login to your account</h2>
                                        <form action="canLogin" method="post">
                                            <input type="text" placeholder="Username" name="username"/>
                                            <input type="password" placeholder="Password" name="password"/>
                                                <span>
                                                        <input type="checkbox" class="checkbox"> 
                                                        Keep me signed in
                                                </span>
                                            <button type="submit" class="btn btn-default">Login</button>
                                        </form>
                                        <form action="caoTest" method="post">
                                           
                                            <button type="submit" class="btn btn-default">caoTest</button>
                                        </form>
                                    </div><!--/login form-->
                            </div>
                            <div class="col-sm-1">
                                    <h2 class="orm">OR</h2>
                            </div>
                            <div class="col-sm-4">
                                    <div class="signup-form"><!--sign up form-->
                                        <h2>New User Signup!</h2>
                                        <form action="canSignup" method="post">
                                            <input type="text" placeholder="Username"               name="username"/>
                                            <input type="password" placeholder="Password"           required="true"/>
                                            <input type="password" placeholder="Confirm Password"   name="password" required="true"/>
                                            <button type="submit" class="btn btn-default">Signup</button>
                                        </form>
                                    </div><!--/sign up form-->
                            </div>
                    </div>
            </div>
        </section><!--/form-->
        <jsp:include page="footer.jsp"/> //footer     
    </body>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.scrollUp.min.js"></script>
    <script src="../js/price-range.js"></script>
    <script src="../js/jquery.prettyPhoto.js"></script>
    <script src="../js/main.js"></script>
</html>
