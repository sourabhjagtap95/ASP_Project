<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign_in.aspx.cs" Inherits="sign_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="JavaScript/Validation_contact_us.js"></script>
    <style type="text/css">
        .well{
            box-shadow: 0 0 30px black;
            margin-top: 35px;
            margin-bottom:100px;
        }
        body {
            /*background-image: url(http://coolblackppt.com/wp-content/uploads/2013/08/Plain-wallpapers-and-plain-backgrounds-16-of-42.jpg);*/
            background-color: black;
            /*background-repeat: no-repeat;
                background-size: cover;*/
        }
</style>
     <link rel="stylesheet" type="text/css" href="styles/inside_glyphicon.css" />
</head>
<body>
        <!--#include file = "header_before_login.html"-->
    <form id="form1" runat="server">
        <div class="container">

            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <img src="Resources/mit_logo.png" class="img-responsive" />
            </div>
        </div>


        <div class="container">
	
    	<div class="col-md-4"></div>
     	<div class="col-md-4">
			<div class="well">
				<%--form action="login_verify.php" method="post">--%>
					<div class="form-group">
                        
					<label for="username"><h3>Username</h3></label><div class="inner-addon left-addon"><i class="glyphicon glyphicon-user"></i>
                    <%
					Response.Write("<input type='text' class='form-control' autofocus id='username' placeholder='Username' name='username' value='' required/>");
                    %></div>
					</div>
					<div class="form-group">
					<label for="password" ><h3>Password</h3></label><div class="inner-addon left-addon"><i class="glyphicon glyphicon-lock"></i>
                    <% 
					Response.Write("<input type='password' class='form-control' id='password' placeholder='Password' name='password' value='' required/>");
                    %></div>
					</div>
                    <div>
                    <label ><input type="checkbox" name="remember" id="checkbox">&nbsp;Remember Me</label><br /><br />
					<button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
                    </div>
				<%--</%--form>--%>
                <div class="text-center"><br>
                    <a href="forgot_password.php"><strong style="color: #002a80;">Forgot Password ?</strong></a>
                </div>
            </div>
         </div>
            <div class="col-md-4"></div>

        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </form>
        <!--#include file = "footer.html"-->
</body>
</html>
