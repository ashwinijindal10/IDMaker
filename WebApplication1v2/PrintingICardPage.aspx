<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintingICardPage.aspx.cs" Inherits="WebApplication1.PrintingICardPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .hori {
            /*-moz-transform:rotate(180);
            -webkit-transform: rotate(360deg);
                 transform: rotate(0deg);
                */
        }

        .verti {
            /*-moz-transform:rotate(180);
            -webkit-transform: rotate(360deg);
                 transform: rotate(90deg);
                */
        }
        .disN{
            display:none;
        }
    </style>
    <script src="Content/js/jquery-1.12.2.min.js"></script>
    <script src="Content/js/html2canvas.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="DivBtnSave">
          <a id="btnback"   href="DownloadICard.aspx">Back to Home</a>    &nbsp;&nbsp;&nbsp;&nbsp; Rotate Printing I Card Style :  &nbsp;   <asp:Button ID="rotate" runat="server"  OnClick="rotate_Click" Text="Rotate 90*" />        
                                             
                                         
            &nbsp;&nbsp;&nbsp;&nbsp; <input id="Button1" type="button" value="Privew" onclick="    javascript: printDiv();" />     &nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="btnExport" Text="Export to Image" runat="server" UseSubmitBehavior="false"
    OnClick="ExportToImage" OnClientClick="return ConvertToImage(this)" />
             
            <br />
       <br />
             </div>
        

        <div id="pridat" > 
            <asp:Repeater ID="rpt1" runat="server">
                <ItemTemplate>
                    <img   src='<%# Eval("Img") %>' class='<%# Eval("cls") %>' />
                </ItemTemplate>
            </asp:Repeater> 
        </div>
          <asp:HiddenField ID="hfImageData" runat="server" />
    </form>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.rawgit.com/niklasvh/html2canvas/master/dist/html2canvas.min.js"></script>
<script type="text/javascript">
    function ConvertToImage(btnExport) {
        resizeWin();

        html2canvas($("#pridat")[0]).then(function (canvas) {
            var base64 = canvas.toDataURL();
            $("[id*=hfImageData]").val(base64);
            __doPostBack(btnExport.name, "");
        });

        maxWindow();
        return false;
    }
</script>
     <script type="text/javascript">
         function printDiv() {
             //var restorepage = $('body').html();
             //var printcontent = $('#main').clone();
             //$('body').empty().html(printcontent);
             $('#DivBtnSave').addClass('disN');
             window.print();
             //$('body').html(restorepage);
             $('#DivBtnSave').removeClass('disN');
             var id = GetParameterValues('id');
             callBack(id);
         }
         function callBack(id) {
             $.ajax({
                 type: "POST",
                 url: "PrintingICardPage.aspx/DeleteCustomer",
                 data: '{id: ' + id + '}',
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (response) { 
                 }
             });
         }
         function GetParameterValues(param) {
             var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
             for (var i = 0; i < url.length; i++) {
                 var urlparam = url[i].split('=');
                 if (urlparam[0] == param) {
                     return urlparam[1];
                 }
             }
         }
         //function goBack() {
         //    window.history.back();
         //}

         var myWindow;
 

         function resizeWin() {
             window.resizeTo(595, 842);
         }

         function maxWindow() {
             window.moveTo(0, 0);


             if (document.all) {
                 top.window.resizeTo(screen.availWidth, screen.availHeight);
             }

             else if (document.layers || document.getElementById) {
                 if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
                     top.window.outerHeight = screen.availHeight;
                     top.window.outerWidth = screen.availWidth;
                 }
             }
         }

         
     </script>
</body>
</html>
