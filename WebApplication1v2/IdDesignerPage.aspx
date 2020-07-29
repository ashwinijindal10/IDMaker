<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IdDesignerPage.aspx.cs" Inherits="WebApplication1.IdDesignerPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ID Card Design</title>
    <link href="Content/css/Jquery.ui.css" rel="stylesheet" />
    <link href="Content/css/main.css" rel="stylesheet" />
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-theme.min.css" rel="stylesheet" />
     <link rel="stylesheet" href="Content/css/angular-block-ui.min.css"/>

    <script src="Content/js/jquery-1.12.2.min.js"></script>
    <script src="Content/js/jquery-ui.min.js"></script>
    <script src="Content/js/bootstrap.min.js"></script>
    <script src="Content/js/angular.js"></script>
    <script src="Content/js/html2canvas.js"></script>
    <script src="Content/js/imageupload.js"></script>
    <script src="Content/js/ngStorage.js"></script>
    <script src="Content/js/underscore-min.js"></script>
    <script src="Content/js/angular-block-ui.min.js"></script>

    <script src="Content/js/main.js"></script>
    <script src="Content/js/services.js"></script>
    <script src="Content/js/directives.js"></script>
</head>

<body ng-app="app">
    <form id="form1" runat="server">
        <asp:HiddenField ID="contentImgPath" runat="server" ClientIDMode="Static" />
        <div class="container">
            <div class="main row" ng-controller="MainController">
                <div class="col-md-12" ng-if="!printMode">
                    <div class="row" ng-init="init()">
                        <div class="col-md-8">
                            <!-- list of fields-->
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title">List of fields</h3>
                                </div>
                                <div class="panel-body main">
                                    <table class="table-fields">
                                        <thead>
                                            <td>Field name</td>
                                            <td>Field title</td>
                                            <td>Font size </td>
                                            <td>Font color</td>
                                            <td>Font style</td>
                                            <td>Font type</td>
                                        </thead>
                                        <tr ng-repeat="item in cardFields">
                                            <td>
                                                <div class="dr-item" draggable-data="item" draggable="$root.tooldragSetting">{{item.label}}</div>
                                            </td>
                                            <td>
                                                <input type="text" ng-model="item.title" /></td>
                                            <td>
                                                <input type="number" style="width: 80px" ng-model="item.font.size" />
                                            </td>
                                            <td>
                                                <input type="color" ng-model="item.font.color" /></td>
                                            <td>
                                                <select ng-options=" st.text for st in fontStyles track by st.value " ng-model="item.font.style"></select>
                                            </td>
                                            <td>
                                                <select style="width: 150px" ng-options="st.text for st in fontTypes track by st.value " ng-model="item.font.type"></select>
                                            </td>
                                        </tr>
                                    </table>

                                    <!-- settings --->
                                    <div class="form-horizontal" role="form">
                                        <div>
                                            <field type="radio" label="Card Orientation" width-ratio="3:5" bind="card.orientation"
                                                options="[ { name:'ornRadio' ,value : 'h' ,label: 'Horizontal'} ,{ name:'ornRadio' ,value : 'v' ,label: 'Vertical' }]"></field>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5" width-ratio="7:5">
                                                <field label="card-width({{px2cm(card.width)|number:2}}cm)" type="number" bind="card.width" placeholder="width"></field>
                                                <field label="Header-height" type="number" bind="card.header.height" settings="{min:0,max:100}" placeholder="%"></field>

                                            </div>
                                            <div class="col-md-5" width-ratio="7:5">
                                                <field label="card-height({{px2cm(card.height)|number:2}}cm)" type="number" bind="card.height" placeholder="height"></field>
                                                <field label="Border-radius" type="number" bind="card.border_radius" placeholder=""></field>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5" width-ratio="7:5">
                                                <field label="Photo-Border-radius" type="number" settings="{min:0,max:100}" bind="card.photo.borderRadius" placeholder=""></field>

                                            </div>
                                            <div class="col-md-5" width-ratio="7:5">

                                                <field type="checkbox" label="Hide Std. Photo" bind="card.hideStdPhoto"
                                                    options="[ { name:'chk' ,value : 'show' }]"></field>

                                             </div>
                                        </div>
                                        <div class="row">
                                           
                                            <div class="col-md-9"  width-ratio="4:3"> <field label="Back Image" type="uploader" bind="card.bgImage"></field></div>
                                             <div class="col-md-3"> <a  href="#"   ng-click="card.bgImage=null" >Remove Back Img</a></div>
                                           <div class="col-md-9" width-ratio="4:3">
                                            <field label="Header Image" type="uploader" bind="card.header.img"></field></div>
                                             <div class="col-md-3"> <a href="#"  ng-click="card.header.img=null" >Remove Header Img</a></div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="row " style="margin: 10px;">
                                <div class="col-md-10">
                                    <field style="margin-top: 5px;" label="Template" width-ratio="4:8" type="select" bind="$root.selectedTemplate" options="{ class:'ddlTemplateName', nameField:'Name' , valueField:'Id', data:templates}"></field>
                                </div>
                                <div class="col-md-2">
                                   <%-- <button type="button" class="btn btn-default" ng-click="backToHome();">Back to Home</button>--%>
                                      <a href="PrintDataSelect.aspx" class="btn btn-default">Back to Process</a>
                                </div>
                            </div>
                            <!--  icard laytout display-->
                            <div class="row ">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">ICard Format <b>{{card.templateName ? "(" + card.templateName + ")" : "" }}</b> </h3>
                                    </div>
                                    <div class="panel-body">
                                        <icard card="card" data="data" print-mode="false"></icard>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <button type="button" class="btn btn-default" ng-click="newCard();">New</button>
                                <button type="button" class="btn btn-default" <%--ng-disabled="$root.selectedTemplate ? false :true"--%> ng-click="deleteTemplate();">Delete</button>
                                <button type="button" class="btn btn-default"  ng-click="saveTemplateSetting();">Save</button><%--ng-disabled="selectedTemplate ? true :false"--%>
                               <%-- <button type="button" class="btn btn-default" ng-click="printCards();">Print</button>--%>
                                <a href="ProcessICard.aspx" class="btn-link">Goto Process</a>
                            </div>
                            <div class="row">
                                <div class="panel panel-info" style="margin-top: 15px;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Sample Card</h3>
                                    </div>
                                    <div class="panel-body">
                                        <icard card="card" data="$root.cardDataSource[0]" print-mode="true"></icard>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="panel panel-info" style="margin-top: 15px;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Generated Card</h3>
                                    </div>
                                    <div class="panel-body">
                                        <icard card="card" data="d" ng-repeat="d in finalCardSource" print-mode="true" id="std_icard_{{d.stdId}}"></icard>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>


