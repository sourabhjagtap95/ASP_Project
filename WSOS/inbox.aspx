<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inbox.aspx.cs" Inherits="inbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <%-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">--%>
        <link rel="stylesheet" href="Content/bootstrap.min.css" />
        <script src="Scripts/jquery-1.9.1.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background-color:rgb(236, 239, 241);">
    <form id="form1" runat="server">
     <!-- Header -->
            <div id="top-nav" class="navbar navbar-inverse navbar-static-top">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-toggle"></span>
                    </button>
                    <a class="navbar-brand" href="#">My Dashboard</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right">

                        <li class="dropdown">
                            <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#">
                                <strong><% Response.Write(Session["user"].ToString()); %></strong> <span class="caret"></span></a>
                            <ul id="g-account-menu" class="dropdown-menu" role="menu">
                                <li><a href="#">My Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="student_account_settings.aspx>">Account Settings</a></li>
                            </ul>
                        </li>
                        <li><p class="navbar-btn"><a id="A1" class="btn btn-danger" href="#" style="margin-right:10px;" runat="server" onServerClick="logout_button"><span class="glyphicon glyphicon-log-out"></span> Log out</a></p></li>
                            
                    </ul>
                </div>
            </div>
            <!-- /Header -->

            <!-- Main -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <!-- Left -->
                        <strong><span class="glyphicon glyphicon-dashboard"></span>  Dashboard</strong>
                        <hr/>
                        <ul class="nav nav-pills nav-stacked">
                            <li class="nav-header"></li>
                            <li ><a href="student_home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li><a href="student_account_settings.aspx"><span class="glyphicon glyphicon-wrench"></span> Account Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="student_profile.aspx" ><span class="glyphicon glyphicon-user"></span> My Profile</a></li>
                            <li class="active"><a href="inbox.aspx"><span class="glyphicon glyphicon-envelope"></span> Inbox<span class="badge pull-right"><%--<% Response.Write(Session["message_count"].ToString()); %>--%></span></a></li>
                        </ul>
                    </div>
                    <!-- /span-3 -->
                    <div class="col-md-9">
                        <!-- Right -->

                        <a href="#"><strong><span class="glyphicon glyphicon-envelope"></span> Inbox</strong></a>
                        <a title="Add Widget" data-toggle="modal" href="#addWidgetModal" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-plus-sign"></span> Add Widget</a>

                        <hr/>

                        <div class="row">
                            


                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><span class="glyphicon glyphicon-user"></span> <% Response.Write(Session["from_user"].ToString()); %> <span class="pull-right"><%Response.Write(Session["date_n_time"].ToString());%></span></a>
                                            </h4>
                                        </div>
                                        <div id="collapse1" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <% Response.Write(Session["msg"].ToString()); %>
                                            </div>
                                        </div>
                                 
                                    </div>
                                    </div>
                                <!--/panel-->





                                <i class="icon-bar-chart icon-3x"></i>
                                <i class="icon-plus icon-3x"></i>
                                <i class="icon-facebook icon-3x"></i>
                                <i class="icon-beaker icon-3x"></i>
                                <i class="icon-twitter icon-3x"></i>


                            </div>
                            <!--/col-span-6-->

                        </div>
                        <!--/row-->
                    </div>
                    <!--/col-span-9-->
                </div>
          
            <!-- /Main -->

           <!--#include file = "footer.html"-->

            <div class="modal" id="addWidgetModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">Add Widget</h4>
                        </div>
                        <div class="modal-body">
                            <p>Add a widget stuff here..</p>
                        </div>
                        <div class="modal-footer">
                            <a href="#" class="btn" data-dismiss="modal">Close</a>
                            <a href="#" class="btn btn-primary">Save changes</a>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dalog -->
            </div>
            <!-- /.modal -->
    </form>
</body>
</html>
