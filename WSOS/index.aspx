<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />--%>
    <%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />--%>
    <style type="text/css">
        body {
            background-image: url("Resources/college.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        h1 {
            text-align: right;
            font-size: 100px;
            color: #003366;
        }

        .text {
            text-align: right;
            font-size: 20px;
            color: #003366;
            padding-right: 40px;
        }

       
    </style>
</head>
<body>  
    <!--#include file = "header_before_login.html"-->
    
    <form id="form2" runat="server">

      
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h1 style="text-align: right; font-size: 75px; color: #003366;">WELCOME</h1>

                    <p class="text">
                        An Autonomous Institute Affiliated
                            <br />
                        To Savitribai Phule Pune University
                    </p>
                </div>
            </div>
        </div>
       
    </form>
    <!--#include file = "footer.html"-->
</body>
</html>
