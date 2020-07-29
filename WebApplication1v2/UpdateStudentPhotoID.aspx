<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="UpdateStudentPhotoID.aspx.cs" Inherits="WebApplication1.UpdateStudentPhotoID" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h2>Update Student Photo ID  </h2>

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
                      <table class="table">
        <tr><td>Scholar No</td><td>New Photo ID</td></tr>
        <tr><td><asp:TextBox ID="TextBox1" CssClass="form-group" runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox2" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox3" CssClass="form-group" runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox4" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox5" CssClass="form-group" runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox6" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox7" CssClass="form-group" runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox8" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox9" CssClass="form-group" runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox10" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox11" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox12" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox13" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox14" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox15" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox16" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox17" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox18" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox19" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox20" CssClass="form-group"  runat="server"></asp:TextBox></td></tr
        <tr><td><asp:TextBox ID="TextBox21" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox22" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox23" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox24" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox25" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox26" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox27" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox28" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
        <tr><td><asp:TextBox ID="TextBox29" CssClass="form-group"  runat="server"></asp:TextBox></td><td><asp:TextBox ID="TextBox30" CssClass="form-group"  runat="server"></asp:TextBox></td></tr>
    </table>
                        </div>
    <asp:Button ID="Button1" CssClass="btn" runat="server" OnClick="Button1_Click" Text="Update PhotoID" />
                    </div>
                </div>
            </div>
         </div>>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
