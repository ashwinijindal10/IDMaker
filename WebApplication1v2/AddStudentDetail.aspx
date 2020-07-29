<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="AddStudentDetail.aspx.cs" Inherits="WebApplication1.AddStudentDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- PAGE LEVEL STYLES -->
    <link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />
    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker-bs3.css" />
    <link rel="stylesheet" href="assets/plugins/datepicker/css/datepicker.css" />
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


                    <h1>Add / Edit Student</h1>

                    <div runat="server" id="divsucrss" style="display: none" class="alert alert-success">
                        <asp:Literal ID="ltrSucess" runat="server"></asp:Literal>
                    </div>
                    <div runat="server" id="divUnsucrss" style="display: none" class="alert alert-danger">
                        <asp:Literal ID="ltrNotSucess" runat="server"></asp:Literal>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <div class="box" style="border: none;">
                        <header>
                            <div class="icons"><i class="icon-ok"></i></div>
                            <h5>Add New / Edit Student Detail </h5>
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

                                <div class="col-lg-6">

                                    <div id="dtxtScholarNo" runat="server" class="form-group">

                                        <label class="control-label col-lg-4">Scholar No*</label>
                                        <div class="col-lg-4">
                                            <asp:TextBox ID="txtScholarNo" placeholder="Scholar No" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtScholarNo"
                                                runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Scholar No"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-4">
                                            <asp:Button ID="Button1" CssClass="btn btn-primary btn-group-sm" runat="server" Text="Get Detail and Edit" OnClick="btnEdit_Click" />
                                        </div>
                                    </div>
                                    <div  class="form-group">

                                        <label class="control-label col-lg-4">Tital / Student Name*</label>
                                        <div class="col-lg-3">
                                            <asp:DropDownList ID="ddltital" CssClass="form-control col-lg-6" runat="server">
                                                <asp:ListItem Selected Text="" Value=""></asp:ListItem>
                                                <asp:ListItem  Text="Mr" Value="Mr"></asp:ListItem>
                                                <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                                                <asp:ListItem Text="Ms" Value="Ms"></asp:ListItem>
                                                <asp:ListItem Text="Miss" Value="Miss"></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>


                                        <div class="col-lg-5">
                                            <asp:TextBox ID="txtstdName" placeholder="Student Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtstdName"
                                                runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Student Name"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                    <div style="display:none" id="dtxtFName" runat="server" class="form-group">

                                        <label class="control-label col-lg-4">Father Name</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtFName" placeholder="Father Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="form-group"  style="display:none" id="dtxtMName" runat="server">
                                        <label class="control-label col-lg-4">Mother Name</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtMName" placeholder="Mother Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group"  style="display:none" id="dtxtBloodGroup" runat="server">

                                        <label class="control-label col-lg-4">Blood Group</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtBloodGroup" placeholder="Blood Group" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group"  style="display:none" id="dtxtPhno" runat="server">
                                        <label class="control-label col-lg-4">Phone Number</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtPhno" placeholder="Phone Number" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group" style="display:none" id="dtxtDOB" runat="server">

                                        <label class="control-label col-lg-4">Date of Barth*</label>

                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtDOB" placeholder="Date of Barth  DD/MM/YYYY"  CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group"  id="dddlClass" runat="server">
                                        <label class="control-label col-lg-4">Select Class*</label>

                                        <div class="col-lg-8">
                                            <asp:DropDownList ID="ddlClass" data-placeholder="Your Favorite Type of Bear" CssClass="form-control chzn-select" runat="server"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlClass"
                                                runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Select Class"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>

                                    <div class="form-group"  style="display:none" id="dtxtEmail" runat="server">

                                        <label class="control-label col-lg-4">Email Id</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtEmail" placeholder="Email Id" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group"  style="display:none" id="dtxtAddress" runat="server">
                                        <label class="control-label col-lg-4">Address</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtAddress" placeholder="Address" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>

                                    </div>


                                    <div class="form-group"  style="display:none" id="dtxtOther1" runat="server">
                                        <label class="control-label col-lg-4">Other1</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtOther1" placeholder="Other 1" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>

                                    </div>

                                    <div class="form-group"  style="display:none" id="dtxtOther2" runat="server">
                                        <label class="control-label col-lg-4">Other2</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtOther2" placeholder="Other 2" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <div class="form-group"  style="display:none" id="dtxtOther3" runat="server">
                                        <label class="control-label col-lg-4">Other2</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtOther3" placeholder="Other 3" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>

                                    </div>




                                </div>
                                <div class="col-lg-6 ">
                                    <div class="form-group"> 
                                            <label class="control-label col-lg-4">Student Photo</label>
                                            <div class="col-lg-8">
                                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <div class="fileupload-preview thumbnail" style="width: 165px; height: 180px;">
                                                        <asp:Image ID="imgStudentPhoto" Width="165" Height="180" Visible="false" runat="server" />
                                                    </div>
                                                    <div>
                                                        <span class="btn btn-file btn-primary"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><asp:FileUpload ID="uploadStudentPhoto" runat="server" />
                                                        </span>
                                                        <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>

                                                    </div>
                                                </div>
                                                <span>Image must be less then 50KB </span>
                                            </div>
                                        </div> 
                                </div> 
                                <div class="form-actions" style="text-align: center">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Save Record" OnClick="btnSubmit_Click" />
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
    <script src="assets/plugins/validationengine/js/languages/jquery.validationEngine-en.js"></script>
    <script src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
    <script src="assets/js/validationInit.js"></script>
    <script>
        $(function () { formValidation(); });
    </script>
    <!--END PAGE LEVEL SCRIPTS -->
</asp:Content>
