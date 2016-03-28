    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_home.aspx.cs" Inherits="student_home" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8"/>
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <%-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">--%>
        <link rel="stylesheet" href="Content/bootstrap.min.css" />
        <script src="Scripts/jquery-1.9.1.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>



        <style type="text/css">
            /*.navbar-static-top {
                margin-bottom: 20px;
            }*/

            footer {
                padding: 10px;
            }
        </style>
    </head>
    <body>
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
                        <li><p class="navbar-btn"><a class="btn btn-danger" href="#" style="margin-right:10px;" runat="server" onServerClick="logout_button"><span class="glyphicon glyphicon-log-out"></span> Log out</a></p></li>
                            
                    </ul>
                </div>
            </div>
            <!-- /Header -->

            <!-- Main -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <!-- Left -->
                        <strong> <span class="glyphicon glyphicon-dashboard"></span> Dashboard</strong>
                        <hr/>
                        <ul class="nav nav-pills nav-stacked">
                            <li class="nav-header"></li>
                            <li class="active"><a href="student_home.aspx"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li><a href="student_account_settings.aspx"><span class="glyphicon glyphicon-wrench"></span> Account Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="student_profile.aspx" ><span class="glyphicon glyphicon-user"></span> My Profile</a></li>
                            <li><a href="inbox.aspx"><span class="glyphicon glyphicon-envelope"></span> Inbox<span class="badge pull-right"><% Response.Write(Session["message_count"].ToString()); %></span></a></li>
                        </ul>
                    </div>
                    <!-- /span-3 -->
                    <div class="col-md-9">
                        <!-- Right -->

                        <a href="#"><strong><span class="glyphicon glyphicon-dashboard"></span> My Dashboard</strong></a>
                        <a title="Add Widget" data-toggle="modal" href="#addWidgetModal" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-plus-sign"></span> Add Widget</a>

                        <hr/>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="well">Inbox Messages <span class="badge pull-right"><% Response.Write(Session["message_count"].ToString()); %></span></div>

                                <div class="panel">
                                    <div class="panel-heading">
                                        <i class="icon icon-chevron-up chevron"></i>
                                        <%--<i class="icon icon-wrench pull-right"></i>Quick Start--%>
                                    </div>
                                   <%-- <div class="panel-content">

                                        <div class="btn-group btn-group-justified">
                                            <a href="#" class="btn btn-primary col-sm-3">
                                                <i class="glyphicon glyphicon-plus"></i>
                                                <p>Service</p>
                                            </a>
                                            <a href="#" class="btn btn-primary col-sm-3">
                                                <i class="glyphicon glyphicon-cloud"></i>
                                                <p>Cloud</p>
                                            </a>
                                            <a href="#" class="btn btn-primary col-sm-3">
                                                <i class="glyphicon glyphicon-cog"></i>
                                                <p>Tools</p>
                                            </a>
                                            <a href="#" class="btn btn-primary col-sm-3">
                                                <i class="glyphicon glyphicon-question-sign"></i>
                                                <p>Help</p>
                                            </a>
                                        </div>
                                    </div>--%>
                                    <!--/panel content-->
                                </div>
                                <!--/panel-->


<%--                                <div class="panel panel-default">
                                    <div class="panel-heading">Report</div>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Col 1</th>
                                                <th>Col 2</th>
                                                <th>Col 3</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>45</td>
                                                <td>2.45%</td>
                                                <td>Direct</td>
                                            </tr>
                                            <tr>
                                                <td>289</td>
                                                <td>56.2%</td>
                                                <td>Referral</td>
                                            </tr>
                                            <tr>
                                                <td>98</td>
                                                <td>25%</td>
                                                <td>Type</td>
                                            </tr>
                                            <tr>
                                                <td>..</td>
                                                <td>..</td>
                                                <td>..</td>
                                            </tr>
                                            <tr>
                                                <td>..</td>
                                                <td>..</td>
                                                <td>..</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>--%>
                                <!--/panel-->


                               <%-- <div class="panel panel-default">
                                    <div class="panel-heading">Charts</div>
                                    <div class="panel-body">
                                        <img src="http://www.wired.com/playbook/wp-content/uploads/2012/08/data-tracking-run-chart.jpg" class="img-responsive">
                                    </div>
                                </div>--%>
                                <!--/panel-->

                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Notifications</div>
                                    <div class="panel-body">
                                        
                      <br/>
                                        <br/>
                                        
                                    </div>
                                </div>

                                <div class="panel panel-default" style="margin-bottom:50px;">
                                    <div class="panel-heading">
                                        <div class="panel-title">
                                            <i class="glyphicon glyphicon-envelope chevron"></i>
                                            
                                            Send Message
                                        </div>
                                    </div>
                                    <div class="panel-body">

                                        <form class="form form-vertical">

                                            <div class="control-group">
                                                <label>To</label>
                                                <br /><br />
                                                <div class="controls">
                                                    <asp:DropDownList class="form-control" id="Users" runat="server" >
                                                        <asp:ListItem >Select Users</asp:ListItem>  
                                                       
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <br />
                                            <div class="control-group">
                                                <label>Message</label>
                                                <br /><br />
                                                <div class="controls">
                                                    <asp:TextBox runat="server" class="form-control" placeholder="Enter Your Message" ID="message" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            
                                            <div class="control-group">
                                                <label></label>
                                                <div class="controls">
                                                    <asp:Button runat="server" ID="send_msg" Text="Send" type="submit" class="btn btn-primary" OnClick="send_msg_Click" >
                                                    </asp:Button>
                                                </div>
                                            </div>

                                        </form>


                                    </div>
                                    <!--/panel content-->
                                </div>
                                <!--/panel-->

                               <%-- <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="panel-title">Engagement</div>
                                    </div>
                                    <div class="panel-body pull-center">

                                        <img src="http://placehold.it/90X90/CC2222/FFF" class="img-circle">

                                        <img src="http://placehold.it/90X90/11CC22/FFF" class="img-circle">

                                        <img src="http://placehold.it/90X90/EEEEEE/222" class="img-circle">
                                    </div>
                                </div>--%>
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





        <%--    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


            <script type='text/javascript' src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
--%>






     

            <script type='text/javascript'>

                $(document).ready(function () {



                });

            </script>

            <script>
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
                ga('create', 'UA-40413119-1', 'bootply.com');
                ga('send', 'pageview');
            </script>
        </form>
    </body>
    </html>
