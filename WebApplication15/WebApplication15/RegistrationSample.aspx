<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationSample.aspx.cs" Inherits="WebApplication15.RegistrationSample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        First Name
        <input id="Text1" type="text" data-bind="value: empoyee.firstName" /> Last Name
        <input id="Text2" type="text" data-bind="value: empoyee.lastName"/><br />
        Full Name&nbsp;<span data-bind="text: empoyee.fullName"></span>
        <br />
        DOB
        <input id="Text3" type="text" data-bind="value: empoyee.dateOfBirth" /><br />
        Eduction <input type="checkbox" id="chkGraduation" value="Graduation" data-bind="checked:empoyee.eductionList" />Graduation
        <input type="checkbox" id="chkPostGraduation" value="PostGraduation" data-bind="checked: empoyee.eductionList"/>PostGraduation
        
        <br />
        <label>Gender:</label>
            <input type="radio" id="rdoMale" name="gender" 
              value="0"  data-bind="checked: empoyee.gender" />Male
            <input type="radio" id="rdoFeMale" name="gender" 
              value="1" data-bind="checked: empoyee.gender"  />FeMale

        <br />
        Department
        <select id="ddlDepartment" name="ddlDepartment" data-bind="options: empoyee.departmentList, optionsText: 'name', optionsValue: 'id', value: empoyee.departmentID"></select>
        
        <br />
        <br />
        <input type="button" id="btnSubmit" value="Save" data-bind="click: save" /> &nbsp;&nbsp;<input type="button" id="btnReset" value="Reset" data-bind="    click: reset" />
    </div>
    </form>
    <script src="knockout-3.2.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        
        
        function Employee() {
            var that = this;
            that.firstName = ko.observable("");
            that.lastName = ko.observable("");
            that.fullName = ko.computed(function () {
                return that.firstName() + " " + that.lastName();
            });
            that.dateOfBirth = ko.observable("");
            that.eductionList = ko.observableArray();
            that.gender = ko.observable("1");
            that.departmentList = ko.observableArray([{ id: '1', name: 'HR' }, { id: '2', name: 'IT' }, { id: '3', name: 'CSSD' }, { id: '4', name: 'Admin' }]);
            that.departmentID = ko.observable("1");
        }
        RegistrationViewModel = function () {
            var that = this;
            that.empoyee = new Employee();
            
            that.reset = function () {
                that.empoyee.firstName("");
                that.empoyee.lastName("");
                that.empoyee.dateOfBirth("");
                that.empoyee.gender('1');
                alert(that.empoyee.eductionList.length);
                that.empoyee.eductionList.removeAll();
                alert(that.empoyee.eductionList.length);
            };
            that.save = function () {
                var EmpData = ko.toJSON(that.empoyee);
                alert(EmpData);
                //ajax function code here
            };
        };
        ko.applyBindings(RegistrationViewModel);
    </script>
</body>
</html>
