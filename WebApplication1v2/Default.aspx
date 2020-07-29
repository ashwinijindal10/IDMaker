<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>School Login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <!-- GLOBAL STYLES -->
    <!-- PAGE LEVEL STYLES -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/login.css" />
    <link rel="stylesheet" href="assets/plugins/magic/magic.css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <!-- PAGE CONTENT -->
        <div class="container">
            <div class="text-center">
                <img src="assets/img/logo1.png" id="logoimg" alt=" Logo" />
            </div>


            <div class="text-center""> 

                    <div runat="server" id="divsucrss" style="display: none" class="alert alert-success">
                        <asp:Literal ID="ltrSucess" runat="server"></asp:Literal>
                    </div>
                    <div runat="server" id="divUnsucrss" style="display: none" class="alert alert-danger">
                        <asp:Literal ID="ltrNotSucess" runat="server"></asp:Literal>
                    </div>

                </div>


            <div class="tab-content">
                <div id="login" class="tab-pane active">
                    <div class="form-signin">
                        <p class="text-muted text-center btn-block btn btn-primary btn-rect">
                            Enter your username and password
               
                        </p>
                        <asp:TextBox ID="txtUsername" placeholder="Username" class="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtpassword" TextMode="Password" placeholder="Password"  class="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="txtbtnLoginSubmit" class="btn text-muted text-center btn-danger" runat="server" Text="Sign in" OnClick="txtbtnLoginSubmit_Click" />
                    </div>
                </div>
                <div id="forgot" class="tab-pane">
                    <div class="form-signin">
                        <p class="text-muted text-center btn-block btn btn-primary btn-rect">Enter your valid e-mail</p>
                        <asp:TextBox ID="txtForgetEmail" placeholder="Your E-mail" class="form-control" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnForgetPassword" class="btn text-muted text-center btn-success" runat="server" Text="Recover Password" OnClick="btnForgetPassword_Click" />
                    </div>
                </div>
                <div id="signup" class="tab-pane">
                    <div class="form-signin">
                        <p class="text-muted text-center btn-block btn btn-primary btn-rect">Organigation Registraion</p>
                        <asp:TextBox ID="txtSchoolNameSignUP" placeholder="School Name" class="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtPhnoSignUP" placeholder="Phone No" class="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtUserNameSignUP" placeholder="Username" class="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtEmailSignUP" placeholder="Your E-mail" class="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtPwdSignUP" TextMode="Password" placeholder="password" class="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtRepwd" TextMode="Password" placeholder="Re type password" class="form-control" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnRegister" class="btn text-muted text-center btn-success" runat="server" Text="Register" OnClick="btnRegister_Click" />


                    </div>
                </div>
            </div>
            <div class="text-center">
                <ul class="list-inline">
                    <li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
                    <li><a class="text-muted" href="#forgot" data-toggle="tab">Forgot Password</a></li>
                    <li><a class="text-muted" href="#signup" data-toggle="tab">Signup</a></li>
                </ul>
            </div>


        </div>

        <!--END PAGE CONTENT -->

        <!-- PAGE LEVEL SCRIPTS -->
        <script src="assets/plugins/jquery-2.0.3.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
        <script src="assets/js/login.js"></script>
        <!--END PAGE LEVEL SCRIPTS -->
    </form>
</body>
</html>
