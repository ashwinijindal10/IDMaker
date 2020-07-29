<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="WebApplication1.Help" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h1>Help</h1>

                   

                </div>
            </div>
         

            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <ul>
                            <li>First Register school in signup page  <a href="Default.aspx">signup</a></li>
                             <li>Login in signup page  <a href="Default.aspx">Login</a></li>
                            <li>Update profile Setting in School Profile  <a href="SchoolProfileSetting.aspx">School Profile </a></li>
                            <li>Update My I Card Fild in ICaed Fild Setting   <a href="IcardFildSetting.aspx">ICaed Fild Setting   </a> </li>
                            <li>Update login Password in Login Setting <a href="loginSetting.aspx">Login Setting</a></li>
                            <li>Add new Student in Add Student page <a href="AddStudentDetail.aspx">Add Student</a></li>
                            <li>Update Student Detail go to Edit/Delete Page and click on Edit button . other way is go to add Student page Write Scholar No and click  Get Detail and Edit Button and edit it and Save Record <a href="StudentDetailByPhotoDelete.aspx">Edit Student</a>  </li>
                            <li >Bulk Upload Student detail  You must use fild name as desribe in <a href="demo.xls"> demo xls</a> file . Excle File extension must be .xls only and file saved in excle 97-2003 .Fist line is Header do not Chang Add student detail on below header if you want to not use header then you don't fill any data in that header .  <a href="UploadExleFileStudentDetail.aspx">Upload Excle</a></li>
                           <li>Bulk Upload Image .you must use .zip format and comprase image that only in Jpg format and less then 50kb.Plese not compress  Folder compress only Image that name same as  Scholar No <a href="UploadStudentImage.aspx">Upload Imge</a></li>
                             </ul>


                        </div>
                    </div>
                </div>
            </div>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 

</asp:Content>
