<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="IcardFildSetting.aspx.cs" Inherits="WebApplication1.IcardFildSetting" %>
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


                    <h1>I Card Field Setting </h1>

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
 
                                
                                        <div class="box">
                                    <header>
                                        <div class="icons"><i class="icon-check"></i></div>                                      
                                     <h5>   Select Field Which school want to in ID Card</h5>
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
                                            <label for="ch1">Date Of Barth</label>
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
<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
<script src="assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>
<script src="assets/plugins/autosize/jquery.autosize.min.js"></script>
<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
       <script src="assets/js/formsInit.js"></script>
        <script>
            $(function () { formInit(); });
        </script>
        
     <!--END PAGE LEVEL SCRIPT-->
     <!--END PAGE LEVEL SCRIPTS -->
</asp:Content>
