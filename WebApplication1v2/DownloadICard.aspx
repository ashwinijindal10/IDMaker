<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="DownloadICard.aspx.cs" Inherits="WebApplication1.DownloadICard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- PAGE LEVEL STYLES -->
    <link href="assets/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- END PAGE LEVEL  STYLES -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        .dataTables-example {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h2>Select Student  Record  </h2>



                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <div class="box">

                        <div id="collapse2" class="accordion-body collapse in body">
                            <div class="form-horizontal" id="inline-validate">

                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">Scholar No</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtScholarNo" placeholder="Scholar No" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">Class</label>
                                        <div class="col-lg-8">
                                            <asp:DropDownList ID="ddlClass" CssClass="form-control chzn-select" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">Student Name</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txttudentName" placeholder="Search by Student Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">Father Name</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtFather" placeholder="Search by Father Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">Phone Number</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtphno1" placeholder="Search by Mobile Number" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">Email Id</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtEmail" placeholder="Search by Email Id" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <label class="control-label col-lg-4">By Address</label>
                                        <div class="col-lg-8">
                                            <asp:TextBox ID="txtAddress" placeholder="Search by Father Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                    </div>
                                </div>

                                 


                                <div class="form-actions" style="text-align: center">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="col-lg-6">
                                            <asp:Button ID="btnDownload" CssClass="btn btn-primary btn-lg" runat="server" Text="Download Icard" OnClick="btnDownload_Click" />
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Button ID="btnDownloadAll" CssClass="btn btn-primary btn-lg" runat="server" Text="Download All ICard" OnClick="btnDownloadAll_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <hr />


            <div class="row">
                <div class="col-lg-12">
                    <div class="box">

                        <div>
                            Select All : 
                            <input id="chkAll" onclick="javascript: SelectAllCheckboxes(this);"
                                runat="server" value="Select All" type="checkbox" />
                        </div>
                        <div class="table-responsive" style="overflow-x: scroll">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example" AutoGenerateColumns="false">

                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkCtrl" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ScholarNo" HeaderText="Scholar No" ItemStyle-Width="170" />
                                    <asp:TemplateField HeaderText="I Card">
                                        <ItemTemplate>
                                               <a href='StdICard/<%# Eval("SchoolUID").ToString() +"/School_" + Eval("ScholarNo").ToString() %>.jpg' target="_blank" >    <img class="img-responsive" height="80" width="100" src='StdICard/<%# Eval("SchoolUID").ToString() +"/School_" + Eval("ScholarNo").ToString() %>.jpg' /> </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" ItemStyle-Width="250" />
                                    <asp:BoundField DataField="Class" HeaderText="Class" ItemStyle-Width="50" />
                                    <asp:BoundField DataField="FatherName" HeaderText="Father Name" ItemStyle-Width="250" />
                                </Columns>
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
    <script type="text/javascript">
        function SelectAllCheckboxes(spanChk) {

            // Added as ASPX uses SPAN for checkbox
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ?
                spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;

            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" &&
                         elm[i].id != theBox.id) {
                    //elm[i].click();
                    if (elm[i].checked != xState)
                        elm[i].click();
                    //elm[i].checked=xState;
                }
        }
    </script>

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

