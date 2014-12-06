<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegularExpression.aspx.cs" Inherits="WebApplication15.RegularExpression" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#TextBox1').change(function () {
                if ($('#TextBox1').val().length > 0) {
                    
                    if ($('#TextBox1').val().length == 14) {
                        //dash validate
                        if ($('#TextBox1').val().substring(6, 7) != "-")
                        { alert('Wrong NRIC No.'); };
                        if ($('#TextBox1').val().substring(9, 10) != "-")
                        { alert('Wrong NRIC No.'); };
                        //YYMMDD-##-####
                        var dob = $('#TextBox1').val().substring(0, 6);
                        var CurDate = "2011-20-11";
                        var CDate = new Date(CurDate);

                        alert(CDate);

                        var myDate = new Date($('#TextBox1').val()).format('MM-dd-yyyy');
                        alert(myDate);
                        
                    }
                    else {
                        alert('Wrong NRIC No.');
                    };
                };
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
        <asp:TextBox ID="TextBox1" ClientIDMode="Static" runat="server" Width="128px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
