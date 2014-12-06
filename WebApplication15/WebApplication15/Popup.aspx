<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Popup.aspx.cs" Inherits="WebApplication15.Popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Knockout and Bootstrap Popover</title>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="border:solid;border-width:thin">
        <tr style="border:solid;border-width:thin">
            <td>ID</td>
            <td>Name</td>
            <td>Designation</td>
            <td>Department</td>
            <td></td>
        </tr>
        <tbody data-bind="foreach: list">
        <tr style="border:solid;border-width:thin">
            <td data-bind="text: id"></td>
            <td data-bind="text: name"></td>
            <td data-bind="text: designation"></td>
            <td data-bind="text: department"></td>
            <td>Edit</td>
        </tr>
            </tbody>
    </table>
    </div>
        <div id="divPopup" style="display:none">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" /></td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td><input type="text" /></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td><input type="text" /></td>
                </tr>
            </table>
        </div>
    </form>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var ViewModel = function () {
            var that = this;
            that.firstName = ko.observable('pankaj');
            that.list = ko.observableArray();
            that.list.push({
                id: 1,
                name: 'Deepak',
                designation: 'Software Engineer',
                department: 'IT'
            });
            that.list.push({
                id: 2,
                name: 'Salek',
                designation: 'Software Engineer',
                department: 'IT'
            });
            that.list.push({
                id: 3,
                name: 'Vishal',
                designation: 'Time Pass',
                department: 'HR'
            });
        }
        
        $(document).ready(function () {
            ko.applyBindings(ViewModel);
            
            //$('#divPopup').modal('show');
        });
    </script>
</body>
</html>
