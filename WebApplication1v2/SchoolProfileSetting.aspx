<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="SchoolProfileSetting.aspx.cs" Inherits="WebApplication1.SchoolProfileSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- PAGE LEVEL STYLES -->
     <link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet" href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
     
    <link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css" />
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


                    <h1>Profile Setting </h1>

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
                    <div class="box">
                       
                        <div id="collapse2" class="accordion-body collapse in body">
                            <div class="form-horizontal" id="inline-validate">

                                <div class="form-group">
                                    <div class="col-lg-6">
                                    <label class="control-label col-lg-4">User ID</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtUserID" placeholder="User ID" CssClass="form-control col-lg-6" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                        </div>
                                    <div class="col-lg-6">
                                         <label class="control-label col-lg-4">School Name</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtSchoolName" placeholder="School Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSchoolName"
                                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="School Name"></asp:RequiredFieldValidator>
                                    </div>

                                        </div>


                                </div>
                                <div class="form-group">
                                   
                                </div>
                                <div class="form-group">

                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Director Name</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtDirectorName" placeholder="Director Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                         
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Princepal Name</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtPrincepalName" placeholder="Princepal Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                    </div>
                                    
                                <div class="form-group">
                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Address </label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtAddress" placeholder="Address" TextMode="MultiLine" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                      
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Village</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtVillage" placeholder="Village" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Tehsil</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtTehsil" placeholder="Tehsil" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <label class="control-label col-lg-4">District</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtDistrict" placeholder="District" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                       
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">State</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtState" placeholder="State" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <label class="control-label col-lg-4">PIN</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtPIN" placeholder="PIN" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Mobile Number 1</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtphno1" placeholder="Mobile Numner 1" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                       
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Mobile Number 2</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtphno2" placeholder="Mobile Numner 2" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Phone  Number 1</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtlandlone1" placeholder="Phone Numner 1" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                  <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Phone  Number 2</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtlandlone2" placeholder="Phone Numner 2" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                      <div class="col-lg-6">
                                    <label class="control-label col-lg-4">School Establish</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtSchoolEstablish" placeholder="School Establish" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Email Id</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtEmail" placeholder="Email Id" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="reqForgetMailId" ControlToValidate="txtEmail"
                                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Email ID"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail"
                                            TabIndex="1" Display="Dynamic" ValidationGroup="vgFotgetpass" ErrorMessage="Enter valid Email Address"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">&nbsp;</asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                    <div class="col-lg-6">
                                    <label class="control-label col-lg-4">School WebSite</label>
                                    <div class="col-lg-8" >
                                        <asp:TextBox ID="txtSchoolWebSite" placeholder="School WebSite" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="col-lg-6">
                                        </div>
                                    </div>


                                <div class="form-group">
                                       <div class="col-lg-6">
                                    <label class="control-label col-lg-4">School Logo</label>
                                    <div class="col-lg-8">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-preview thumbnail" style="width: 200px; height: 150px;">
                                                <asp:Image ID="imglogo" Width="150" Height="120" Visible="false" runat="server" />
                                            </div>
                                            <div>
                                                <span class="btn btn-file btn-primary"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><asp:FileUpload ID="SchoolLogo" runat="server" />
                                                </span>
                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>

                                            </div>
                                        </div>
                                        <span >Image must be less then 100KB </span>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Authrige Signature</label>
                                    <div class="col-lg-8">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="fileupload-preview thumbnail" style="width: 130px; height: 70px;">
                                                <asp:Image ID="imgAuthSign" Width="150" Height="120" Visible="false" runat="server" />
                                            </div>
                                            <div>
                                                <span class="btn btn-file btn-primary"><span class="fileupload-new">Select image</span><span class="fileupload-exists">Change</span><asp:FileUpload ID="AuthSign" runat="server" />
                                                </span>
                                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>

                                            </div>
                                        </div>
                                         <span >Image must be less then 50KB </span>
                                    </div>
                                </div>
                                    </div>
                                
                                        <div class="box">
                                    <header>
                                        <div class="icons"><i class="icon-check"></i></div>                                      
                                     <h5>   Select Fild Which school want to in ID Card</h5>
                                        <div class="toolbar">
                                            
                                        </div>
                                    </header>
                                    <div class="body">
                                        
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="ScholarNo" Checked="true"   CssClass="success" runat="server"  Enabled="False"  />
                                            <label for="ch1">Scholar No</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="StudentName" Checked="true"   CssClass="success" runat="server"  Enabled="False"  />
                                            <label for="ch1">Student Name</label>
                                        </div>
                                        <div class="checkbox  1">
                                              <asp:CheckBox ID="FatherName"   CssClass="success" runat="server" />
                                            <label for="ch1">Father Name</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="MotherName"   CssClass="success" runat="server" />
                                            <label for="ch1">Mother Name</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="BloodGroup"   CssClass="success" runat="server" />
                                            <label for="ch1">Blood Group</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="PhoneNumber"   CssClass="success" runat="server" />
                                            <label for="ch1">Phone Number</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="DateofBarth"   CssClass="success" runat="server" />
                                            <label for="ch1">Date Of Birth</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="Class" Checked="true"   CssClass="success" runat="server"  Enabled="False" />
                                            <label for="ch1">Class</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="EmailId"    runat="server" />
                                            <label for="ch1">Email Id</label>
                                        </div>
                                         <div class="checkbox  ">
                                              <asp:CheckBox ID="Addres"   CssClass="success" runat="server" />
                                            <label for="ch1">Address</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="F2"   CssClass="success" runat="server" />
                                            <label for="ch1">OTHER1</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="F3"   CssClass="success" runat="server" />
                                            <label for="ch1">OTHER2</label>
                                        </div>
                                        <div class="checkbox  ">
                                              <asp:CheckBox ID="F4"   CssClass="success" runat="server" />
                                            <label for="ch1">OTHER3</label>
                                        </div>
                                         <div class="checkbox  ">
                                              <asp:CheckBox ID="StudentPhoto" Checked="true"   CssClass="success" runat="server"  Enabled="False"  />
                                            <label for="ch1">Student Photo</label>
                                        </div>
                                         <div class="checkbox  ">
                                              <asp:CheckBox ID="Status" Checked="true"   CssClass="success" runat="server" Enabled="false" />
                                            <label for="ch1">Status (Panding / On Printing / Printed)</label>
                                        </div>
                                        
                                    </div>
                                </div>
                                    


                                <div class="form-actions" style="text-align: center">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
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
         <!-- PAGE LEVEL SCRIPT-->
    <script src="assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
 <script src="assets/js/jquery-ui.min.js"></script>
 <script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
<script src="assets/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
<script src="assets/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
<script src="assets/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<script src="assets/plugins/validVal/js/jquery.validVal.min.js"></script>
<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="assets/plugins/daterangepicker/moment.min.js"></script>
<%--<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
<script src="assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>--%>
<script src="assets/plugins/autosize/jquery.autosize.min.js"></script>
<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
       <script src="assets/js/formsInit.js"></script>
        <script>
            $(function () { formInit(); });
        </script>
        
     <!--END PAGE LEVEL SCRIPT-->
     
    
    
    
    
    
    
    
    
    
     
 
    <!--END PAGE LEVEL SCRIPTS -->
</asp:Content>
