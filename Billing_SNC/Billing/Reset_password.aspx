<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Reset_password.aspx.vb" Inherits="Billing_SNC.Reset_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/cssRegisterbill.css" rel="stylesheet" />
    <br />
    <div style="width: 100%; height: 100%;">
        <div>
            <div style="width: 650px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                    <asp:Label runat="server" Text="Reset Password" Font-Size="24px"></asp:Label>
                </div>
            </div>
            <div style="width: 650px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080;">
                <div>
                    <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                        <asp:Label runat="server" Text="Username" Font-Size="35px"></asp:Label>
                    </div>
                    <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                        <asp:TextBox runat="server" ID="txtusername" Font-Size="30px" CssClass="textboxregister" Enabled="false" AutoPostBack="true"></asp:TextBox>
                        <font style="color: red;">*</font>
                    </div>
                    <div style="clear: left;">
                    </div>
                </div>
                <div>
                    <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                        <asp:Label runat="server" Text="Password" Font-Size="35px"></asp:Label>
                    </div>
                    <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                        <asp:TextBox runat="server" ID="txtpassword" Font-Size="30px" CssClass="textboxregister" TextMode="Password" Width="335px"> </asp:TextBox>
                        <font style="color: red;">*</font>
                    </div>
                    <div style="clear: left;">
                    </div>
                </div>
                <div>
                    <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                        <asp:Label runat="server" Text="Confirm Password" Font-Size="30px"></asp:Label>
                    </div>
                    <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                        <asp:TextBox runat="server" ID="txtconfirmPass" Font-Size="30px" CssClass="textboxregister" TextMode="Password" Width="335px"></asp:TextBox>
                        <font style="color: red;">*</font>
                    </div>
                    <div style="clear: left;">
                    </div>
                </div>

                <div style="padding-bottom: 20px;">
                    <asp:Button runat="server" Text="Reset" ID="btn_success" CssClass="btn_register_success" OnClientClick="Confirm_success();" OnClick="btn_success_Click" />

                </div>

            </div>

        </div>
    </div>
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <br />
    <br />
    <br />
    <br />
    <br />
    <script>
        function Confirm_success() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want Save ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        function alert_Error_crypTO() {
            alert("Not EnCryption Password !!!")
            //window.location.href = 'Add_Payment_Main.aspx';
        }
        function alert_Select_all_data() {
            alert("Please select data all !!!")
        }
        function alert_save_data_success() {
            alert("Save data Success!!!")
            window.location.href = 'index.aspx';

        }
        function alert_not_save() {
            alert("Save Failed Please check data !!!")
        }
        function alert_length_text() {
            alert("Please key password minlength > 4 !!!")
        }
        function alertUser_pass_not_math() {
            alert("Passwords do not match !!!") 
        }
    </script>
</asp:Content>
