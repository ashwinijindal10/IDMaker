<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- PAGE LEVEL STYLES -->
    <link href="assets/css/layout2.css" rel="stylesheet" />
    <link href="assets/plugins/flot/examples/examples.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/plugins/timeline/timeline.css" />
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

        <div class="inner" style="min-height: 700px; width: 125% !important;">
            <div class="row">
                <div class="col-lg-12">
                    <h1>
                        <asp:Literal runat="server" ID="ltrDeshBord"></asp:Literal>
                    </h1>
                </div>
            </div>
            <hr />
            <!--BLOCK SECTION -->
            <div class="row">
                <div class="col-lg-12">
                    <div style="text-align: center;">

                        <a class="quick-btn" href="AddStudentDetail.aspx" style="margin-bottom:20px"  >
                            <i class="icon-plus icon-2x"></i>
                            <span>Add New</span>
                            <span class="label label-danger"></span>
                        </a>
                        <a class="quick-btn" href="IcardFildSetting.aspx">
                            <i class="icon-book icon-2x"></i>
                            <span>ICard Fild</span>
                            <span class="label label-danger"></span>
                        </a>
                        <a class="quick-btn" href="StudentDetailByPhotoDelete.aspx">
                            <i class="icon-signal icon-2x"></i>
                            <span>Detail</span>
                            <span class="label label-warning"></span>
                        </a>
                        <a class="quick-btn" href="SchoolProfileSetting.aspx">
                            <i class="icon-user icon-2x"></i>
                            <span>School Profile</span>
                            <span class="label btn-metis-2"></span>
                        </a>
                        <a class="quick-btn" href="UploadExleFileStudentDetail.aspx">
                            <i class="icon-upload icon-2x"></i>
                            <span>Bulk Upload</span>
                            <span class="label btn-metis-4"></span>
                        </a>
                        <a class="quick-btn" href="#">
                            <i class="icon-off icon-2x"></i>
                            <span>Logout</span>
                            <span class="label label-default"></span>
                        </a>



                    </div>

                </div>

            </div>
            <!--END BLOCK SECTION -->
            <hr />

            <div class="row">
                <div class="col-lg-7">

                    <div class="chat-panel panel panel-success">
                        <div class="panel-heading">
                            <i class="icon-comments"></i>
                            New Message From Admin
                            
                        </div>

                        <div class="panel-body">
                            <ul class="chat">
                                <asp:Repeater ID="rpt111" runat="server">
                                    <ItemTemplate>


                                        <li class="left clearfix">

                                            <div class="chat-body clearfix">
                                                <div class="header">
                                                    <strong class="primary-font ">Message From Admin </strong>
                                                    <small class="pull-right text-muted label label-danger">
                                                        <i class="icon-time"></i><%#Eval("updatetime") %>
                                                    </small>
                                                </div>
                                                <br />
                                                <p>
                                                    <%#Eval("Mesage") %>
                                                </p>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>



                    </div>


                </div>
                <div class="col-lg-5">

                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <i class="icon-bell"></i>Notifications Alerts Panel
                        </div>

                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class=" icon-comment"></i>ID Card Printing 
                                    <span class="pull-right text-muted small"><em>UnderProcess</em>
                                    </span>
                                </a>


                            </div>

                            <a href="#" class="btn btn-default btn-block btn-primary">View All Alerts</a>
                        </div>

                    </div>



                </div>
            </div>
            <!-- END COMMENT AND NOTIFICATION  SECTION -->









        </div>

    </div>
    <!--END PAGE CONTENT -->




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- PAGE LEVEL SCRIPTS -->
    <script src="assets/plugins/flot/jquery.flot.js"></script>
    <script src="assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="assets/plugins/flot/jquery.flot.time.js"></script>
    <script src="assets/plugins/flot/jquery.flot.stack.js"></script>
    <script src="assets/js/for_index.js"></script>

    <!-- END PAGE LEVEL SCRIPTS -->
</asp:Content>
