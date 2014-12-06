<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabPrescribe.aspx.cs" Inherits="WebApplication15.LabPrescribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="knockout-3.2.0.js" type="text/javascript"></script>
    <script src="Scripts/knockout.mapping-latest.js" type="text/javascript"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    <table>
    <thead>
        <tr>
            <th>S.No</th>
            <th>Name</th>
            <th>category</th>
            <th>price</th>
        </tr>
    </thead>
    <tbody data-bind="foreach: list">
        <tr>
            <td data-bind="text:($index()+1)"></td>
            <td data-bind="text: name"></td>
            <td data-bind="text: category"></td>
            <td data-bind="text: price"></td>
        </tr>
    </tbody>
        
</table>
        <input type="button" data-bind="click: updateData" value="Update Local Data" /><br />
        <input type="button" data-bind="click: updateServerData" value="Update Server Data" />
        <span data-bind="text: list().length"></span>
    </form>
    
    <script type="text/javascript">
        function customerViewModel() {
            var self = this;

            //a JSON string that we got from the server that wasn't automatically converted to an object
            var JSONdataFromServer = '[{"name":"Peach","category":"Fruits","price":1},{"name":"Plum","category":"Fruits","price":0.75},{"name":"Donut","category":"Bread","price":1.5},{"name":"Milk","category":"Dairy","price":4.50}]';

            //parse into an object
            var dataFromServer = ko.utils.parseJson(JSONdataFromServer);
            self.list = ko.observableArray(dataFromServer);

            self.updateData = function () {
                var newJSONdataFromServer = '[{"name":"Pankaj","category":"Admin","price":0},{"name":"Plum","category":"Fruits","price":0.75},{"name":"Donut","category":"Bread","price":1.5},{"name":"Milk","category":"Dairy","price":4.50}]';
                //parse into an object
                var NewdataFromServer = ko.observableArray();
                NewdataFromServer = ko.utils.parseJson(newJSONdataFromServer);
                self.list(NewdataFromServer);
                
            }

            self.updateServerData = function () {

                $.ajax({
                    type: 'POST',
                    url: "CommonService.asmx/GetDataTempData",
                    contentType: "application/json; charset=utf-8",
                    timeout: 120000,
                    dataType: "json",
                    success: function (data) {
                        //alert(data.d);
                        //parse into an object
                        var NewdataFromServer = ko.utils.parseJson(data.d);
                        self.list(NewdataFromServer);
                    },
                    error: function (jq, st, error) {
                        alert(error);
                    }
                });
                
                
                
            }

            //self.customerList = ko.observableArray();

            /*
            self.getCustomers = function () {
                $.ajax({
                    type: 'GET',
                    url: "CommonService.asmx/GetData",
                    contentType: "application/javascript",
                    dataType: "jsonp",
                    success: function (data) {
                        alert(data);
                        //var observableData = ko.mapping.fromJS(data);
                        //var array = observableData();
                        //self.customerList(array);
                    },
                    error: function (jq, st, error) {
                        alert(error);
                    }
                });
            };
            */
        }

        $(document).ready(function () {
            ko.applyBindings(new customerViewModel());
        });

        
    </script>
</body>
</html>
