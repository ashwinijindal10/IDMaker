<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="UploadStudentImage.aspx.cs" Inherits="WebApplication1.UploadStudentImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- PAGE LEVEL STYLES -->
   <%-- <link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css" />
   --%> <link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />
    <!-- END PAGE LEVEL  STYLES -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h1>Bulk Upload Student Photo's</h1>

                    <div runat="server" id="divsucrss" style="display: none" class="alert alert-success">
                        <asp:Literal ID="ltrSucess" runat="server"></asp:Literal>
                    </div>
                    <div runat="server" id="divUnsucrss" style="display: none" class="alert alert-danger">
                        <asp:Literal ID="ltrNotSucess" runat="server"></asp:Literal>
                    </div>

                </div>
            </div>
            
            <hr />
 

                



            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons"><i class="icon-ok"></i></div>
                            <h5>Bulk Photo Upload (Size must be lessthen 10 MB)</h5>
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
                                    <label class="control-label col-lg-4">Zip File</label>
                                    <div class="col-lg-8">
                                        <asp:FileUpload ID="FileUpload1" CssClass="fileupload-controls" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="FileUpload1"
                                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Zip File Select"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="FileUpload1"
                                            ErrorMessage="Only .Zip File Upload"
                                            ValidationExpression="(.*\.([Zz][Ii][Pp])$)"></asp:RegularExpressionValidator>

                                    </div>
                                </div>



                                <div class="form-actions" style="text-align: center">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Upload " OnClick="Upload" />
                                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="vgFotgetpass" ShowMessageBox="true" ShowSummary="false" runat="server" />
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
<%--    <script src="assets/plugins/validationengine/js/languages/jquery.validationEngine-en.js"></script>--%>
    <script src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
    <script src="assets/js/validationInit.js"></script>
    <script>
        $(function () { formValidation(); });
        </script>
    <!--END PAGE LEVEL SCRIPTS -->

</asp:Content>
