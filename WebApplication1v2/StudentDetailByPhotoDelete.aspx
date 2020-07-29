<%@ Page Title="" Language="C#" MasterPageFile="~/School.Master" AutoEventWireup="true" CodeBehind="StudentDetailByPhotoDelete.aspx.cs" Inherits="WebApplication1.StudentDetailByPhotoDelete" %>

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
        .user_img {
            width: auto;
            max-height: 100px;
        }

        .alignright {
            margin-left: 33%;
        }
    </style>


    <style type="text/css">
        
        table
        {
            border: 1px solid #ccc;
            width: 550px;
            margin-bottom: -1px;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div id="content">

        <div class="inner">
            <div class="row">
                <div class="col-lg-12">


                    <h1>Student Detail With Photo (Edit and Delete Option Here) 
                        <asp:Button ID="btnExport" CssClass="btn btn-primary alignright btn-small left" runat="server" Text="Export To Excel" OnClick="ExportToExcel" />
                    </h1>


                    <div runat="server" id="divsucrss" style="display: none" class="alert alert-success">
                        <asp:Literal ID="ltrSucess" runat="server"></asp:Literal>
                    </div>
                    <div runat="server" id="divUnsucrss" style="display: none" class="alert alert-danger">
                        <asp:Literal ID="ltrNotSucess" runat="server"></asp:Literal>
                    </div>

                </div>
            </div>
            <div class="row">
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
                                            <asp:TextBox ID="TextBox1" placeholder="Scholar No" CssClass="form-control col-lg-6" runat="server"></asp:TextBox>
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
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>







            <div class="row">
                <div class="col-lg-12">
                    <div class="box">


                        <div class="table-responsive" style="overflow-x: scroll">



                        <asp:GridView ID="gvCustomers" runat="server" CssClass="table table-striped table-bordered table-hover"   AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Scholar No" ItemStyle-Width="30px" ItemStyle-CssClass="ScholarNo">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("ScholarNo") %>' runat="server" />
                      <asp:TextBox Text='<%# Eval("ScholarNo") %>' Width="60" runat="server" ReadOnly="true" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tital" ItemStyle-Width="50px" ItemStyle-CssClass="F1">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("F1") %>' runat="server"  />
                       <asp:TextBox Text='<%# Eval("F1") %>' runat="server" Width="100" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Student Name" ItemStyle-Width="100px" ItemStyle-CssClass="StudentName">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("StudentName") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("StudentName") %>' runat="server" Width="100" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Father Name" ItemStyle-Width="100px" ItemStyle-CssClass="FatherName">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("FatherName") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("FatherName") %>' runat="server" Width="100" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Barth" ItemStyle-Width="80px" ItemStyle-CssClass="DateofBarth">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("DateofBarth") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("DateofBarth") %>' runat="server" Width="80" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Class" ItemStyle-Width="50px" ItemStyle-CssClass="Class">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Class") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Class") %>' runat="server" Width="50" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="Phone Number" ItemStyle-Width="100px" ItemStyle-CssClass="PhoneNumber">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PhoneNumber") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("PhoneNumber") %>' runat="server" Width="90" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Address" ItemStyle-Width="150px" ItemStyle-CssClass="Addres">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Addres") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Addres") %>' runat="server" Width="120" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Text="Edit" runat="server" CssClass="Edit" />
                    <asp:LinkButton Text="Update" runat="server" CssClass="Update" Style="display: none" />
                    <asp:LinkButton Text="Cancel" runat="server" CssClass="Cancel" Style="display: none" />
                    <asp:LinkButton Text="Delete" runat="server" CssClass="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse;visibility:hidden">
        <tr>
            <td style="width: 50px">
                Scholar No:<br />
                <asp:TextBox ID="txtScholarNo" runat="server" Width="80" />
            </td>
            <td style="width: 50px">
                Tital:<br />                 
                 <asp:DropDownList ID="txtF1" Width="80"  runat="server">
                                                <asp:ListItem Selected Text="" Value=""></asp:ListItem>
                                                <asp:ListItem  Text="Mr" Value="Mr"></asp:ListItem>
                                                <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                                                <asp:ListItem Text="Ms" Value="Ms"></asp:ListItem>
                                                <asp:ListItem Text="Miss" Value="Miss"></asp:ListItem>
                                            </asp:DropDownList>
               
            </td>
            <td style="width: 100px">
                Std Name:<br />
                <asp:TextBox ID="txtStudentName" runat="server" Width="100" />
            </td>

            <td style="width: 100px">
                F Name:<br />
                <asp:TextBox ID="txtFatherName" runat="server" Width="100" />
            </td>
            <td style="width: 100px">
                DOB:<br />
                <asp:TextBox ID="txtDateofBarth" runat="server" Width="40" />
            </td>
            <td style="width: 100px">
                Class:<br />
                <asp:DropDownList ID="txtClass" Width="40"  runat="server"></asp:DropDownList>             
            </td>
             <td style="width: 100px">
                Ph No:<br />
                <asp:TextBox ID="txtPhoneNumber" runat="server" Width="80" />
            </td>
            <td style="width: 100px">
                Address:<br />
                <asp:TextBox ID="txtAddres" runat="server" Width="100" />
            </td>
           
             


            <td style="width: 100px">
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: "POST",
                url: "StudentDetailByPhotoDelete.aspx/GetCustomers",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess
            });
        });

        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var row = $("[id*=gvCustomers] tr:last-child").clone(true);
            $("[id*=gvCustomers] tr").not($("[id*=gvCustomers] tr:first-child")).remove();
            $.each(customers, function () {
                var customer = $(this);
                AppendRow(row, $(this).find("ScholarNo").text(), $(this).find("F1").text(), $(this).find("StudentName").text(), $(this).find("FatherName").text(), $(this).find("DateofBarth").text(), $(this).find("Class").text(), $(this).find("PhoneNumber").text(), $(this).find("Addres").text())
                row = $("[id*=gvCustomers] tr:last-child").clone(true);
            });
        }

        function AppendRow(row, scholarNo, f1, studentName, fatherName, dateofBarth, Class, phoneNumber, addres) {
            //Bind ScholarNo.
            $(".ScholarNo", row).find("span").html(scholarNo);
            $(".ScholarNo", row).find("input").val(scholarNo);

            //Bind Country.
            $(".F1", row).find("span").html(f1);
            $(".F1", row).find("select").val(f1);

            //Bind Name.
            $(".StudentName", row).find("span").html(studentName);
            $(".StudentName", row).find("input").val(studentName);

            //Bind Name.
            $(".StudentName", row).find("span").html(studentName);
            $(".StudentName", row).find("input").val(studentName);
            //Bind Name.
            $(".FatherName", row).find("span").html(fatherName);
            $(".FatherName", row).find("input").val(fatherName);
            //Bind Name.
            $(".DateofBarth", row).find("span").html(dateofBarth);
            $(".DateofBarth", row).find("input").val(dateofBarth);
            //Bind Name.
            $(".Class", row).find("span").html(Class);
            $(".Class", row).find("select").val(Class);
            //Bind Name.
            $(".PhoneNumber", row).find("span").html(phoneNumber);
            $(".PhoneNumber", row).find("input").val(phoneNumber);
            //Bind Name.
            $(".Addres", row).find("span").html(addres);
            $(".Addres", row).find("input").val(addres);


            
            $("[id*=gvCustomers]").append(row);
        }

        //Add event handler.
        $("body").on("click", "[id*=btnAdd]", function () {
            var txtScholarNo = $("[id*=txtScholarNo]");
            var txtF1 = $("[id*=txtF1]");
            var txtStudentName = $("[id*=txtStudentName]");
            var txtFatherName = $("[id*=txtFatherName]");
            var txtDateofBarth = $("[id*=txtDateofBarth]");
            var txtClass = $("[id*=txtClass]");
            var txtPhoneNumber = $("[id*=txtPhoneNumber]");
            var txtAddres = $("[id*=txtAddres]");

            
            $.ajax({
                type: "POST",
                url: "StudentDetailByPhotoDelete.aspx/InsertCustomer",
                data: '{ScholarNo: "' + txtScholarNo.val() + '", F1: "' + txtF1.val() + '", StudentName: "' + txtStudentName.val() + '", FatherName: "' + txtFatherName.val() + '", DateofBarth: "' + txtDateofBarth.val() + '", Class: "' + txtClass.val() + '", PhoneNumber: "' + txtPhoneNumber.val() + '" , Addres: "' + txtAddres.val() + ' }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var row = $("[id*=gvCustomers] tr:last-child").clone(true);
                    AppendRow(row, txtScholarNo.val(), txtF1.val(), txtStudentName.val(), txtFatherName.val(), txtDateofBarth.val(), txtClass.val(), txtPhoneNumber.val(), txtAddres.val());
                    txtScholarNo.val("");
                    txtF1.val("");
                    txtStudentName.val("");
                }
            });
            return false;
        });

        //Edit event handler.
        $("body").on("click", "[id*=gvCustomers] .Edit", function () {
            var row = $(this).closest("tr");
            $("td", row).each(function () {
                if ($(this).find("input").length > 0) {
                    $(this).find("input").show();
                    $(this).find("span").hide();
                }
            });
            row.find(".Update").show();
            row.find(".Cancel").show();
            row.find(".Delete").hide();
            $(this).hide();
            return false;
        });

        //Update event handler.
        $("body").on("click", "[id*=gvCustomers] .Update", function () {
            var row = $(this).closest("tr");
            $("td", row).each(function () {
                if ($(this).find("input").length > 0) {
                    var span = $(this).find("span");
                    var input = $(this).find("input");
                    span.html(input.val());
                    span.show();
                    input.hide();
                }
            });
            row.find(".Edit").show();
            row.find(".Delete").show();
            row.find(".Cancel").hide();
            $(this).hide();

            var ScholarNo = row.find(".ScholarNo").find("span").html();
            var F1 = row.find(".F1").find("span").html();
            var StudentName = row.find(".StudentName").find("span").html();            
            var FatherName = row.find(".FatherName").find("span").html();
            var DateofBarth = row.find(".DateofBarth").find("span").html();
            var Class = row.find(".Class").find("span").html();
            var PhoneNumber = row.find(".PhoneNumber").find("span").html();
            var Addres = row.find(".Addres").find("span").html();
            

            $.ajax({
                type: "POST",
                url: "StudentDetailByPhotoDelete.aspx/UpdateCustomer",
                data: '{ScholarNo: ' + ScholarNo + ', F1: "' + F1 + '", StudentName: "' + StudentName + '", FatherName: "' + FatherName + '", DateofBarth: "' + DateofBarth + '", Class: "' + Class + '", PhoneNumber: "' + PhoneNumber + '", Addres: "' + Addres + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });

            return false;
        });

        //Cancel event handler.
        $("body").on("click", "[id*=gvCustomers] .Cancel", function () {
            var row = $(this).closest("tr");
            $("td", row).each(function () {
                if ($(this).find("input").length > 0) {
                    var span = $(this).find("span");
                    var input = $(this).find("input");
                    input.val(span.html());
                    span.show();
                    input.hide();
                }
            });
            row.find(".Edit").show();
            row.find(".Delete").show();
            row.find(".Update").hide();
            $(this).hide();
            return false;
        });

        //Delete event handler.
        $("body").on("click", "[id*=gvCustomers] .Delete", function () {
            if (confirm("Do you want to delete this row?")) {
                var row = $(this).closest("tr");
                var ScholarNo = row.find("span").html();
                $.ajax({
                    type: "POST",
                    url: "StudentDetailByPhotoDelete.aspx/DeleteCustomer",
                    data: '{ScholarNo: ' + ScholarNo + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        row.remove();
                    }
                });
            }

            return false;
        });
    </script>




























                           
                                    
                                

                             




<%--<asp:GridView ID="GridView2" runat="server"
                                        AutoGenerateColumns="false"
                                        AllowPaging="true" ShowFooter="true" CssClass="table table-striped table-bordered table-hover"
                                        OnPageIndexChanging="OnPaging" OnRowEditing="EditCustomer"
                                        OnRowUpdating="UpdateCustomer" OnRowCancelingEdit="CancelEdit" OnRowDataBound="gv_RowDataBound"
                                        PageSize="10">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Scholar No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScholarNo" runat="server"
                                                        Text='<%# Eval("ScholarNo")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtScholarNo" CssClass="form-control"
                                                        MaxLength="100" Text='<%# Eval("ScholarNo")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tital">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblF1" runat="server"
                                                        Text='<%# Eval("F1")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddltital" CssClass="form-control" runat="server">
                                                        <asp:ListItem Selected Text="" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="Mr" Value="Mr"></asp:ListItem>
                                                        <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                                                        <asp:ListItem Text="Ms" Value="Ms"></asp:ListItem>
                                                        <asp:ListItem Text="Miss" Value="Miss"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Student Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStudentName" runat="server"
                                                        Text='<%# Eval("StudentName")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtStudentName" CssClass="form-control"
                                                        MaxLength="100" Text='<%# Eval("StudentName")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Father Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFatherName" runat="server"
                                                        Text='<%# Eval("FatherName")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtFatherName" CssClass="form-control"
                                                        MaxLength="100" Text='<%# Eval("FatherName")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Class">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClass" runat="server"
                                                        Text='<%# Eval("Class")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddlClass" data-placeholder="Your Favorite Type of Bear" CssClass="form-control chzn-select" runat="server"></asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Phone Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPhoneNumber" runat="server"
                                                        Text='<%# Eval("PhoneNumber")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtPhoneNumber" CssClass="form-control"
                                                        MaxLength="100" Text='<%# Eval("PhoneNumber")%>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkRemove" runat="server"
                                                        CommandArgument='<%# Eval("ScholarNo")%>'
                                                        OnClientClick="return confirm('Do you want to delete?')"
                                                        Text="Delete" OnClick="DeleteCustomer"></asp:LinkButton>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="AddNewCustomer" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="True" />
                                        </Columns>
                                        <AlternatingRowStyle BackColor="#C2D69B" />
                                    </asp:GridView>--%>

                            <%--<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Scholar No</th>
                                        <th>Tital</th>
                                        <th>Student Name</th>
                                        <th>Father Name</th>
                                        <th>Class</th>
                                        <th>Phone Number</th>
                                        <th>Photo</th>
                                        <th>ID Card</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt1" runat="server" OnItemCommand="rptShipAddressDetail_OnItemCommand">
                                        <ItemTemplate>
                                            <tr class="odd gradeX">
                                                <td><%#Eval("ScholarNo")%></td>
                                                <td><%#Eval("F1")%></td>
                                                <td><%#Eval("StudentName")%></td>
                                                <td><%#Eval("FatherName")%></td>
                                                <td><%#Eval("Class")%></td>
                                                <td><%#Eval("PhoneNumber")%></td>
                                                <td>
                                                    <img class="img-responsive user_img" src='<%#Eval("StudentPhoto")%>' />
                                                </td>
                                                 <td>
                                                    <a target="_blank" href='<%#"StdICard/"+Eval("SchoolUID")+"/"+Eval("ScholarNo")+".jpg" %>'> <img class="img-responsive user_img" src='<%#"StdICard/"+Eval("SchoolUID")+"/"+Eval("ScholarNo")+".jpg" %>' /></a>
                                                </td>
                                                <td class="center"><a class="btn-link" href='AddStudentDetail.aspx?Scro_Num=<%#Eval("ScholarNo")%>' >Edit</a></td>
                                                <td class="center">
                                                    <asp:CheckBox ID="chkDelete" runat="server" />
                                                    <asp:HiddenField ID="hiddenScholarNo" runat="server" Value ='<%#Eval("ScholarNo")%>' />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>--%>
                        </div>

                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" DataSourceMode="DataSet" runat="server" ConnectionString="<%$ ConnectionStrings:IdCardPublicationConnectionString %>" SelectCommand="Sp_FildWiseStudentDetail" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="SchoolID" SessionField="SchoolId" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <%--<div style="float: right; text-align: right; width: 300px">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="Button2" CssClass="form-control btn-danger" Width="130" OnClientClick="return ConfirmationBox()" OnClick="Button2_Click" runat="server" Text="Delete  All Record" />
                        </td>
                        <td>
                            <asp:Button ID="Button1" CssClass="form-control btn-primary" Width="140" OnClientClick="return ConfirmationBox()" OnClick="Button1_Click" runat="server" Text="Delete Seleted" />

                        </td>
                    </tr>
                </table>

            </div>--%>
        </div>

        <div runat="server" id="exportdiv" style="display: none">

            <asp:GridView ID="GridView1" AllowPaging="true" PagerStyle-CssClass="pagination-lg" PageSize="50" CssClass="dataTables-example table table-striped table-bordered table-hover" runat="server"></asp:GridView>
        </div>

        <!--END PAGE CONTENT -->
        <script type="text/javascript">
            //function popitup(url) {
            //    newwindow = window.open(url, 'name', 'height=500,width=550');
            //    if (window.focus) { newwindow.focus() }
            //    return false;
            //}


            function ConfirmationBox() {

                var result = confirm('Are you sure  want to delete ???');
                if (result) {

                    return true;
                }
                else {
                    return false;
                }
            }
        </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <!-- PAGE LEVEL SCRIPTS -->
    <script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>


    <script type="text/javascript" src="assets/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.blockUI.js"></script>
    <script type="text/javascript">
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({
                    message: '<table align = "center"><tr><td>' +
                     '<img src="loader.gif"/></td></tr></table>',
                    css: {},
                    overlayCSS: {
                        backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB'
                    }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        }
        $(document).ready(function () {

            BlockUI("dvGrid");
            $.blockUI.defaults.css = {};
        });
    </script> 



    <!-- END PAGE LEVEL SCRIPTS -->


</asp:Content>
