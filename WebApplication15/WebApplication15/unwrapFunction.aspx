<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="unwrapFunction.aspx.cs" Inherits="WebApplication15.unwrapFunction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="text" data-bind="value: firstName" />
        <span data-bind="text: firstName"></span>
        <input type="button" value="GetValue" data-bind="click:getValue" />
    </div>
    </form>
    <script src="knockout-3.2.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        var myViewModel = function () {
            this.firstName = ko.observable('pankaj');

            this.getValue = function () {
                alert(ko.utils.unwrapObservable(firstName));
                
            }
        }
        ko.applyBindings(myViewModel);
    </script>
</body>
</html>
