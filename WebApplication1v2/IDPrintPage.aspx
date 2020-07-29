<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IDPrintPage.aspx.cs" Inherits="WebApplication1.IDPrintPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/css/Jquery.ui.css" rel="stylesheet" />
    <link href="Content/css/main.css" rel="stylesheet" />
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-theme.min.css" rel="stylesheet" />

    <script src="Content/js/jquery-1.12.2.min.js"></script>
    <script src="Content/js/jquery-ui.min.js"></script>
    <script src="Content/js/bootstrap.min.js"></script>
    <script src="Content/js/angular.js"></script>
    <script src="Content/js/html2canvas.js"></script>
    <script src="Content/js/imageupload.js"></script>
    <script src="Content/js/ngStorage.js"></script>
    <script src="Content/js/underscore-min.js"></script>

    <script src="Content/js/main.js"></script>
    <script src="Content/js/services.js"></script>
    <script src="Content/js/directives.js"></script>
</head>
<body ng-app="app">
    <form id="form1" runat="server">
        <div class="row" ng-controller="printController">
            <div class="col-md-12" style="padding-top: 30px;">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Generated Cards </h3>
                    </div>
                    <div class="panel-body">
                        <icard card="card" data="d" print-mode="true" id="std_icard_{{d.stdId}}" ng-repeat="d in $root.cardDataSource"></icard>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
