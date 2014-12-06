<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dropdowne.aspx.cs" Inherits="WebApplication15.Dropdowne" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    
    <p>
    Destination country:
    <select data-bind="options: availableCountries, value: selectedval"></select>
</p>
 <input type="button" value="GetValue" data-bind="click: viewModel.getValue"  />

    </form>
    <script src="knockout-3.2.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        var viewModel =function() {
            this.selectedval = ko.observable();
            // These are the initial options
            this.availableCountries = ko.observableArray(['France', 'Germany', 'Spain']);
            
        };
        viewModel.getValue = function () {
            alert(selectedval());
        }
        ko.applyBindings(viewModel);
        // ... then later ...
        // viewModel.availableCountries.push('China'); // Adds another option
        
</script>
    
</body>
</html>
