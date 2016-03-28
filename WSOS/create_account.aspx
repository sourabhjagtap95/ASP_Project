<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create_account.aspx.cs" Inherits="create_account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.min.css" />

    <style type="text/css">
       /*html {
            background-color: rgb(236, 239, 241);
        }*/

        .txt {
            text-align: center;
            font-size: 25px;
            font-family: Arial;
        }

        #optionbuttons {
            text-align: center;
        }

            #optionbuttons button {
                margin: 20px;
            }
    </style>
    <link rel="stylesheet" type="text/css" href="styles/inside_glyphicon.css" />
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="JavaScript/Validation_create_account.js"></script>

</head>
<body style="background-color:rgb(236, 239, 241);">
    <!--#include file = "header_before_login.html"-->

    <div class="container" style="margin-bottom: 100px;">
        <br />
        <br />
        <p class="txt"><strong>SIGN UP FORM FOR STUDENTS</strong></p>
        <br />
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="well">

                    <%--<form name="student_registration" action="student_record.php" method="post" onSubmit="return formValidation()">--%>
                    <form id="form1" name="student_registration" action="#" method="post" runat="server" onsubmit="return formValidation()">

                        <fieldset>
                            <legend>
                                <strong>PRN Number
                                </strong>
                            </legend>
                            <label>
                                <div class="inner-addon left-addon">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                    <asp:TextBox type="text" ID="txt_prn" runat="server" class="form-control" name="prn" placeholder="9-digit PRN number" required="true"></asp:TextBox>
                                </div>
                            </label>
                            <asp:Button ID="verify" runat="server" Text="Verify" CssClass="btn btn-danger" OnClick="verify_Click" />

                        </fieldset>
                        <asp:Panel runat="server" ID="area_hidden" Visible="False">
                            <fieldset>
                                <legend>
                                    <strong>Name</strong>
                                </legend>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-user"></i>
                                        <input type="text" name="firstname" id="text-fields" class="form-control" spellcheck="false" placeholder="First" onchange="return firstname_validation(firstname)" required />
                                    </div>
                                </label>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-user"></i>
                                        <input type="text" name="lastname" id="text1" class="form-control" spellcheck="false" placeholder="Last" onchange="return lastname_validation(lastname)" required />
                                    </div>
                                </label>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Username</strong>
                                </legend>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-user"></i>
                                        <input type="text" name="username" id="text2" class="form-control" spellcheck="false" placeholder="User Name" onchange="return username_validation(username)" required />
                                    </div>
                                </label>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Password</strong>
                                </legend>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-lock"></i>
                                        <input type="password" name="password" id="Password1" class="form-control" spellcheck="false" placeholder="Password" onchange="return password_validation(password)" required />
                                    </div>
                                </label>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-lock"></i>
                                        <input type="password" name="confirm_password" id="Password2" class="form-control" spellcheck="false" placeholder="Confirm Password" onchange="return check_pass(password,confirm_password)" required />
                                    </div>
                                </label>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Date Of Birth</strong>
                                </legend>
                                <label>
                                    <select id="Select1" class="form-control" name="date" required>

                                        <option disabled selected value="dateblank">Date</option>
                                        <% int j;
                                           for (j = 1; j < 32; j++)
                                           {
                                               Response.Write("<option name='" + j + "'>" + j + "</option>");
                                           }     
                                        %>
                                    </select>
                                </label>
                                <label>
                                    <select id="Select2" class="form-control" name="month" required>
                                        <option disabled selected value="monthblank">Month</option>
                                        <option name="JAN">January</option>
                                        <option name="FEB">February</option>
                                        <option name="MAR">March</option>
                                        <option name="APR">April</option>
                                        <option name="MAY">May</option>
                                        <option name="JUNE">June</option>
                                        <option name="JULY">July</option>
                                        <option name="AUG">August</option>
                                        <option name="SEP">September</option>
                                        <option name="OCT">October</option>
                                        <option name="NOV">November</option>
                                        <option name="DEC">December</option>
                                    </select>
                                </label>
                                <label>
                                    <select id="Select3" class="form-control" name="year" required>
                                        <option disabled selected value="yearblank">Year</option>
                                        <% int i;
                                           for (i = 1960; i < 2016; i++)
                                           {
                                               Response.Write("<option name='" + i + "'>" + i + "</option>");
                                           }  
                                        %>
                                    </select>
                                </label>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Gender</strong>
                                </legend>
                                <div class="radio">
                                    <label for="radio-id" class="radio-label">
                                        <input type="radio" name="gender" id="radio-id" class="radio" value="male" required><b>Male</b></label>
                                    <label for="radio-id2" class="radio-label">
                                        <input type="radio" name="gender" id="radio-id2" class="radio" value="female" required><b>Female</b></label>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Info
                                    </strong>
                                </legend>
                                <label>
                                    <select id="Select4" class="form-control" name="classyear" required>
                                        <option selected value="#" disabled="disabled">Select Year</option>
                                        <option value="F.E">First Year (F.E)</option>
                                        <option value="S.E">Second Year (S.E)</option>
                                        <option value="T.E">Third Year (T.E)</option>
                                        <option value="B.E">Fourth Year (B.E)</option>
                                    </select>
                                </label>
                                <label>
                                    <select name="division" class="form-control" id="Select5" required>
                                        <option disabled selected value="blank4">Divsion</option>
                                        <option name="A" value="A">Division A</option>
                                        <option name="B" value="B">Division B</option>
                                        <option name="C" value="C">Division C</option>
                                    </select>
                                </label>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                        <input id="text4" class="form-control" name="rollno" placeholder="Roll No." required="" type="text" />
                                    </div>
                                </label>
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Email-Id</strong>
                                </legend>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-envelope"></i>
                                        <input type="text" name="email" id="text5" class="form-control" spellcheck="false" placeholder="Email-id" onchange="return email_validation(email)" required>
                                    </div>
                                </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Mobile</strong>
                                </legend>
                                <label>
                                    <div class="inner-addon left-addon">
                                        <i class="glyphicon glyphicon-earphone"></i>
                                        <input type="text" name="mobile" id="text6" class="form-control" spellcheck="false" placeholder="Mobile Number" onchange="return check_mobile(mobile)" required>
                                    </div>
                                </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </fieldset>
                            <fieldset>
                                <legend>
                                    <strong>Address</strong>
                                </legend>
                                <label>
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon glyphicon-home"></i>
                                        <textarea placeholder="Address" name="address"></textarea>
                                    </div>
                                </label>
                            </fieldset>
                            <%-- <strong>Captcha</strong>
                
                <center><img id="captcha" name="captcha" src="captcha.php"/></center><br><br>
                <label>Enter the captcha here:</label>
                <input type="text" id="text7" style=" height:30px; width:200px;margin-right:10px;margin-left:10px;" spellcheck="false" name="captcha" required>
                <button type="button" class="btn btn-default" aria-label="Refresh">
                    <span class="glyphicon glyphicon-refresh" aria-hidden="true" onclick="reloadCaptcha();"></span>
                </button>--%>




                            <br />
                            <div class="button" id="optionbuttons">
                                <asp:Button runat="server" type="submit" name="submit" class="btn btn-success btn-lg" Text="SUBMIT" OnClick="Submit_Click" ID="submit"></asp:Button>
                                <%--<button type="submit" name="submit" class="btn btn-success btn-lg">SUBMIT </button>--%>
                                <button type="reset" class="btn btn-warning btn-lg">RESET</button>

                            </div>
                        </asp:Panel>
                    </form>
                </div>

            </div>
        </div>
    </div>



    <!--#include file = "footer.html"-->
</body>
</html>
