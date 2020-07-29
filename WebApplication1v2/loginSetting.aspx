<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="loginSetting.aspx.cs" Inherits="WebApplication1.loginSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <!-- PAGE LEVEL STYLES -->
 <%--   <link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css" />--%>
    <link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />
    <!-- END PAGE LEVEL  STYLES -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!--PAGE CONTENT -->
    <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h1>Login Setting </h1>

                          <div runat="server" id="divsucrss" style="display:none" class="alert alert-success">                                
                           <asp:Literal ID="ltrSucess"   runat="server"></asp:Literal>
                            </div>
                     <div  runat="server" id="divUnsucrss" style="display:none"  class="alert alert-danger">
                                <asp:Literal ID="ltrNotSucess"   runat="server"></asp:Literal>
                            </div>

                </div>
            </div>
           

            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons"><i class="icon-ok"></i></div>
                            <h5>Login Setting </h5>
                            <div class="toolbar">
                                <ul class="nav">
                                    <li>
                                        <div class="btn-group">
                                            <a class="accordion-toggle btn btn-xs minimize-box" data-toggle="collapse"
                                                href="#collapse2">
                                                <i class="icon-chevron-up"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                        </header>
                        <div id="collapse2" class="accordion-body collapse in body">
                            <div class="form-horizontal" id="inline-validate">

                                <div class="form-group">
                                    <label class="control-label col-lg-4">User ID</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtUserID" placeholder="User ID" CssClass="form-control col-lg-6" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">School Name</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtSchoolName" placeholder="School Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSchoolName"
                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="School Name"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Password</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtPassword" placeholder="Director Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Password"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                              
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phone Number</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtphno1" placeholder="Mobile Numner 1" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtphno1"
                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Mobile Number"></asp:RequiredFieldValidator>
                                         </div>
                                </div>                              
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Email Id</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtEmail" placeholder="Email Id" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqForgetMailId" ControlToValidate="txtEmail"
                                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Email ID"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail"
                                            TabIndex="1" Display="Dynamic" ValidationGroup="vgFotgetpass" ErrorMessage="Enter valid Email Address"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">&nbsp;</asp:RegularExpressionValidator>
                                    </div>
                                </div>
                               

                             
                                <div class="form-actions" style="text-align: center">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="vgFotgetpass" ShowMessageBox="true" ShowSummary="false"   runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </div>
    <!--END PAGE CONTENT -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!-- PAGE LEVEL SCRIPTS -->
    <script src="assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
    <script src="assets/plugins/validationengine/js/jquery.validationEngine.js"></script>
    <script src="assets/plugins/validationengine/js/languages/jquery.validationEngine-en.js"></script>
    <script src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
    <script src="assets/js/validationInit.js"></script>
    <script>
        $(function () { formValidation(); });
        </script>
    <!--END PAGE LEVEL SCRIPTS -->

    </asp:Content>
