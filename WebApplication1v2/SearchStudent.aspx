<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="SearchStudent.aspx.cs" Inherits="WebApplication1.SearchStudent" %>
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

      <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h2> Search Student detail  </h2>



                </div>
            </div>

            
            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        
                        <div id="collapse2" class="accordion-body collapse in body">
                            <div class="form-horizontal" id="inline-validate">

                                <div class="form-group">
                                       <div class="col-lg-6">
                                    <label class="control-label col-lg-4">  Scholar No</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtScholarNo" placeholder="Scholar No" CssClass="form-control col-lg-6"   runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                  <div class="col-lg-6">
                                    <label class="control-label col-lg-4">  Class</label>
                                    <div class="col-lg-8">
                                        <asp:DropDownList ID="ddlClass"  CssClass="form-control chzn-select" runat="server"></asp:DropDownList>                                      
                                    </div>
                                </div>
                                    </div>
                                <div class="form-group">
                                       <div class="col-lg-6">
                                    <label class="control-label col-lg-4">  Student Name</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txttudentName" placeholder="Search by Student Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>                                  
                                    </div>
                                </div>
                                  <div class="col-lg-6">
                                    <label class="control-label col-lg-4">  Father Name</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtFather" placeholder="Search by Father Name" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>                                  
                                    </div>
                                </div>
                                    </div>
                              
                                <div class="form-group">
                                       <div class="col-lg-6">
                                    <label class="control-label col-lg-4">  Phone Number</label>
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
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-lg" ValidationGroup="vgFotgetpass" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                   
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


                        <div class="table-responsive" style="overflow-x: scroll">

                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Scholar No</th>
                                        <th>Student Name</th>
                                         <th>Photo</th>
                                        <th>Icard</th>
                                         <th>Class</th>
                                        <th>Father Name</th>
                                        <th>Mother Name</th>
                                        <th>Phone Number</th>
                                        <th>Date of Birth</th>
                                          <th>Blood Group</th>
                                        <th>Email Id</th>
                                        <th>Address</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt1" runat="server">
                                        <ItemTemplate>
                                            <tr class="odd gradeX">
                                                <td>  <%#Eval("ScholarNo")%></td>
                                                <td> <%#Eval("StudentName")%></td>
                                                  <td><img class="img-responsive" height="20" width="40" src='<%#Eval("StudentPhoto")%>' /> </td>
                                                  <td><img class="img-responsive" height="80" width="100" src='StdICard/<%# Eval("SchoolUID").ToString() +"/School_" + Eval("ScholarNo").ToString() %>.jpg' /> </td>
                                                <td > <%#Eval("Class")%>  </td>
                                                <td> <%#Eval("FatherName")%></td>
                                                <td> <%#Eval("MotherName")%></td>
                                                <td> <%#Eval("PhoneNumber")%></td> 
                                                <td> <%#Eval("DateofBarth")%></td>
                                                <td> <%#Eval("BloodGroup")%></td>
                                                <td> <%#Eval("EmailId")%></td>
                                                <td> <%#Eval("Addres")%></td>
                                                <td class="center"><a class="btn-link" href='AddStudentDetail.aspx?Scro_Num=<%#Eval("ScholarNo")%>'>Edit</a></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>




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
            $('#dataTables-example').dataTable();
        });
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->
</asp:Content>
