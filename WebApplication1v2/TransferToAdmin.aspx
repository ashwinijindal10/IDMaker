<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="TransferToAdmin.aspx.cs" Inherits="WebApplication1.TransferToAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">
                    <h2> Update Status  </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        
                        <div id="collapse2" class="accordion-body collapse in body">
                            <div class="form-horizontal" id="inline-validate">

                                <div class="form-group">
                                       <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Select </label>
                                    <div class="col-lg-8">
                                       <asp:DropDownList ID="ddlClass"    CssClass="form-control chzn-select" runat="server"   ></asp:DropDownList>  
                                      
                                    </div>
                                </div>
                                   <div class="col-lg-6">
                                      <asp:Button ID="SendByClass" CssClass="btn btn-primary btn"   runat="server" Text="Send to Print" OnClick="SendByClass_Click"  />
                                </div>
                                    </div> 
                                <hr />
                                 <div class="form-group">
                                       <div class="col-lg-6">
                                    <label class="control-label col-lg-4">Scholar No</label>
                                    <div class="col-lg-8">
                                       <asp:TextBox ID="txtsch01" placeholder="Scholar No" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>                                           
                                    </div>
                                </div>
                                   <div class="col-lg-6">
                                      <asp:Button ID="SendBySchoolr" CssClass="btn btn-primary btn"   runat="server" Text="Send to Print" OnClick="SendBySchoolr_Click"  />
                                </div>
                                    </div>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#GridView1').dataTable();
        });
    </script>
</asp:Content>
