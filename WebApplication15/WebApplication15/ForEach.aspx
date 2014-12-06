<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForEach.aspx.cs" Inherits="WebApplication15.ForEach" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="//cdn.eventcore.com/js/knockout/knockout-3.0.0.js" type="text/javascript"></script>
    
    <%--<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>--%>
    <style type="text/css">
        .auto-style1 {
            width: 494px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Add Item in List 
        <input type="text" placeholder="Type Text here......" data-bind='value: ItemToAdd, valueUpdate: "afterkeydown"' />&nbsp;&nbsp;<input type="submit"  value="Add" data-bind="click:AddItem,enable: ItemToAdd().length > 0" /><br />
    
    </div>
        Total Items <span data-bind="text: myObservableArray().length"></span><br />
        Display List of Add Item<br />
        <select data-bind="options: myObservableArray"></select>
        <table id="ListOfItems" style="border:solid; border-width:1px" data-bind="visible: myObservableArray().length>0">
            <thead>
            <tr>
                <td class="auto-style1">S.NO</td>
                <td class="auto-style1">Items</td>
                <td>Not Working</td>
            </tr>
                </thead>
            <tbody data-bind="foreach: myObservableArray">
                <tr>
                    <td data-bind="text: sNo"></td>
                    <td data-bind="text: title"></td>
                    <td><img src="Delete.gif" data-bind="click:RemoveItem" /></td>
                </tr>
            </tbody>
        </table>
    </form>
    <script type="text/javascript">
        //create observable array
        var sampleViewModel = function () {
            var self = this;
            self.ItemToAdd = ko.observable("");
            self.myObservableArray = ko.observableArray();
            self.AddItem = function () {
                if (this.ItemToAdd != "") {
                    this.myObservableArray.push(new task({ title: this.ItemToAdd(), sno: this.myObservableArray().length+1 }));
                    this.ItemToAdd("");
                }
            }.bind(self);// Ensure that "this" is always this view model

            function task(data)
            {
                this.sNo = ko.observable(data.sno);
                this.title = ko.observable(data.title);
            }
            self.RemoveItem = function (task)
            {
                
                self.myObservableArray.remove(task);
                
            }
            
        }
        ko.applyBindings(sampleViewModel);
    </script>
</body>
</html>
