<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="StudentDetailsTableView.aspx.cs" Inherits="WebApplication1.StudentDetailsTableView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- PAGE LEVEL STYLES -->
    <link href="assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
                    <h2> Student detail  </h2>
                </div>
            </div> 
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="box">
                <header>
                    <div class="icons"><i class="icon-building"></i></div>
                    <h5>Export To Student detail Excel</h5>
                    <div class="toolbar">                        
                        <asp:Button ID="btnExport" CssClass="btn btn-success btn-lg" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" />
                    </div>
                </header>
                                </div>
                        <div class="panel-body">
                            <div class="table-responsive" style="overflow-x: scroll">

                      
                                <asp:GridView ID="GridView1" AllowPaging="true"  PagerStyle-CssClass="pagination-lg" PageSize="50"   CssClass="dataTables-example table table-striped table-bordered table-hover" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>



                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IdCardPublicationConnectionString %>" SelectCommand="Sp_FildWiseStudentDetail" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="SchoolID" SessionField="SchoolId" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:AccessDataSource ID="AccessDataSource1" runat="server"></asp:AccessDataSource>
                                        <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                                        </asp:EntityDataSource>
                                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" EntityTypeName="">
                                        </asp:LinqDataSource>
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

    <!-- END GLOBAL SCRIPTS -->
    <!-- PAGE LEVEL SCRIPTS -->
    <script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('.dataTables-example').dataTable();
        });
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->

</asp:Content>
