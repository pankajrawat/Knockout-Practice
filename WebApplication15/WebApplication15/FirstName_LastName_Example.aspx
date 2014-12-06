<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstName_LastName_Example.aspx.cs" Inherits="WebApplication15.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="knockout-3.2.0.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    First Name :<input type="text" data-bind="value: firstName" /><br />
    Last Name :<input type="text" data-bind="value: lastName" /><br />
    Full Name :<input type="text" data-bind="value: fullName" /><br />
    </div>
    </form>
    <script type="text/javascript">
        function SampleViewModel()
        {
            this.firstName = ko.observable("pankaj");
            lastName = ko.observable("rawat");
            fullName = ko.computed(function () {
                return this.firstName() + " " + lastName();
            }, this);
        }

        ko.applyBindings(SampleViewModel);
    </script>
</body>
</html>
