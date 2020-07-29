<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="UploadExleFileStudentDetail.aspx.cs" Inherits="WebApplication1.UploadExleFileStudentDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- PAGE LEVEL STYLES -->
  <%--  <link rel="stylesheet" href="assets/plugins/validationengine/css/validationEngine.jquery.css" />
  --%>  <link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />
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


                    <h1>Bulk Upload Student Detail</h1>

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
                        <header>
                            <div class="icons"><i class="icon-ok"></i></div>
                            <h5>Bulk Detail Upload *Excel File Format Must be same as describe download Demo file below</h5>
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
                                    <label class="control-label col-lg-4">Excel file</label>
                                    <div class="col-lg-8">
                                        <asp:FileUpload ID="FileUploadToServer" CssClass="fileupload-controls" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="FileUploadToServer"
                                            runat="server" ValidationGroup="vgFotgetpass" Display="None" ErrorMessage="Zip File Select"></asp:RequiredFieldValidator>


                                    </div>
                                </div>

                                <div class="form-actions" style="text-align: center">
                                    <asp:Button ID="btnUpload" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Upload " OnClick="btnUpload_Click" />
                                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="vgFotgetpass" ShowMessageBox="true" ShowSummary="false" runat="server" />
                                </div>
                                <div class="form-actions" style="text-align: right">
                                    <a href="demo.xls">Demo Excel File Download</a>


                                </div>
                                <div class="form-actions" style="text-align: left">
                                    <div class="icons"><i class="icon-ok"><b>Important Note</b></i></div>
                                   1) only excel 2003 files are accepted (if you have office 2007 or higher then use save as excel 97-2003 option )<br />
                                   2) Do not Change tital in demo excel file.<br />
                                   3) Leave blank the field which you don't want.<br />
                                   4) Do not add new fild created by own.<br />
                                   5) Date format must be DD/mm/YYYY  ex ('27/07/2001).
                                </div>
                            </div>
                        </div>                        
                        <div id="divupdatedrecord" style="display:none" runat="server">
                            <br />
                             Repeted Record kindly Verify : <b> <asp:Literal ID="ltrupdaterecorddetail" runat="server"></asp:Literal></b>
                            <br /><br /><br />
                        </div>


                        <div class="table-responsive" style="overflow-x: scroll">

                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" EmptyDataText="No record found!"
                                Height="25px">
                                <RowStyle Width="175px" />
                                <EmptyDataRowStyle BackColor="Silver" BorderColor="#999999" BorderStyle="Solid"
                                    BorderWidth="1px" ForeColor="#003300" />
                                <HeaderStyle BackColor="#6699FF" BorderColor="#333333" BorderStyle="Solid"
                                    BorderWidth="1px" VerticalAlign="Top" Width="200px" Wrap="True" />

                            </asp:GridView>


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
