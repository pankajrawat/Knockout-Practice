<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="labPrescription.aspx.cs" Inherits="WebApplication15.labPrescription" %>

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
    <div>
    <span data-bind="text: list().Addlist"></span>
        <br />
        <select id="InstList" data-bind="options: list, optionsText: 'NAME', optionsValue: 'Investigation_ID', value: ItemID"  style="height:250px; width:200px" size="4"></select>
        <input type="button" value=">>" data-bind="click: AddItem" />
        <table style="width:300px" data-bind="visible: Addlist().length>0">
            <tr>
                <td>S.No</td>
                <td>ItemID</td>
                <td>Item Name</td>
                <td>Rate</td>
                <td>Qty</td>
                <td>Amount</td>
            </tr>
            <tbody data-bind="foreach: Addlist">
            <tr>
                <td data-bind="text:($index()+1)"></td>
                <td data-bind="text: Itemid"></td>
                <td data-bind="text: Itemname"></td>
                <td><input type="text" data-bind="value: Rate" /></td>
                <td><input type="text" data-bind="value: Qty" /></td>
                <td><input type="text" data-bind="value:Amount" /></td>
            </tr>
                </tbody>
        </table>
        <br />
        Total : <span data-bind="text:Total"></span>
        <br /><br />
        <input type="button" value="Save" data-bind="enable: Addlist().length > 0, click: save" />
    </div>
    </form>
    <script type="text/javascript">
        var LabViewModel = function () {
            var self = this;
            self.list = ko.observableArray();
            self.Addlist = ko.observableArray();
            self.ItemID = ko.observable();
            self.ItemName = ko.observable();
            self.Total = ko.computed(function () {
                var total = 0;
                ko.utils.arrayForEach(self.Addlist(), function (item) {
                    var value = parseFloat(item.Amount());
                    if(!isNaN(value))
                    {
                        total += value;
                    }
                });
                return total;
            });

            self.AddItem = function () {
                self.Addlist.push(new AddItemList(ItemID(), 'Test', '50', '1'));
            }

            self.save = function () {
                
                $.ajax({
                    type: 'POST',
                    data: JSON.stringify({ Inv: ko.mapping.toJS(self.Addlist) }),
                    url: "CommonService.asmx/SaveData",
                    contentType: "application/json; charset=utf-8",
                    timeout: 120000,
                    dataType: "json",
                    success: function (data) {
                        alert(data.d);
                        //parse into an object
                        //var NewdataFromServer = ko.utils.parseJson(data.d);
                        //self.list(NewdataFromServer);
                    },
                    error: function (jq, st, error) {
                        alert(error);
                    }
                });

             
            }

            $.ajax({
                type: 'POST',
                url: "CommonService.asmx/GetData",
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

        function AddItemList(itemid,itemname,rate,qty)
        {
            this.Itemid = ko.observable(itemid);
            this.Itemname = ko.observable(itemname);
            this.Rate = ko.observable(rate);
            this.Qty = ko.observable(qty);
            this.Amount = ko.dependentObservable(function () {
                return (this.Rate() * this.Qty()).toFixed(2);
            }, this);

        }
        $(document).ready(function () {
            ko.applyBindings(LabViewModel);
        })
    </script>
</body>
</html>
