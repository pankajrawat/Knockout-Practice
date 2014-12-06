<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TableData.aspx.cs" Inherits="WebApplication15.TableData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    
        
        <br /><span>Total No of Rows </span><span data-bind="text: totalRows"></span>
    <input id="Button1" type="button" value="Get Data" data-bind="click: getData" /><br />
    </div>
    </form>
     <script src="knockout-3.2.0.js" type="text/javascript"></script>
    <script src="Scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var PatientViewModel = function () {
            var that = this;
            that.totalRows = ko.observable("10");
            that.patientData = ko.observableArray();
            that.getData = function () {
                alert('hi');
                $.getJSON('Service1.svc/GetData', function (result) {
                    alert(ko.toJSON(result));
                });
            }
            
        }
        ko.applyBindings(PatientViewModel);
    </script>
</body>
</html>
