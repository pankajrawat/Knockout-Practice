<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToDropdowne.aspx.cs" Inherits="WebApplication15.AddToDropdowne" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <select data-bind="options:countryList"></select>
        <span data-bind="text: newItem().length"></span>
        <asp:TextBox ID="txtItemSearch" runat="server"  data-bind="value: newItem, valueUpdate: 'afterkeydown'" ></asp:TextBox><input type="button" value="Add" data-bind="    click: addItem, enable: newItem().length > 0" />
        <br /><br />
        Bind Hard code array 
        <select data-bind="options: availableCountries"></select>
    </div>
    </form>
    <script src="knockout-3.2.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        var sampleViewModel = function () {
            newItem = ko.observable('');
            countryList = ko.observableArray();

            addItem = function () {
                if (newItem != "") {
                    countryList.push(newItem());
                    newItem('');
                }
            }
            // Constructor for an object with two properties
            var Country = function (id, name) {
                this.countryID = id;
                this.countryname = name;
            };

            availableCountries : ko.observableArray([
            new Country(1,"UK"),
            new Country(2,"USA"),
            new Country(3,"Sweden")
            ])
            
            
        }
        
        ko.applyBindings(sampleViewModel);
    </script>
</body>
</html>
