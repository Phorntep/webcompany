<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Manage_admin_email.aspx.vb" Inherits="Billing_SNC.Manage_admin_email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <link href="../CSSBill/cssRegisterbill.css" rel="stylesheet" />
    <link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />

    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="width: 100%; height: auto; margin: 0 auto;">
        <div style="width: 1000px; margin: 0 auto; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 12px 40px 0 rgba(0,0,0,0.19); background-color: aliceblue; padding-bottom: 30px;">
            <div style="width: 100%; margin: 0 auto; border: 1px solid groove; padding: 2px 16px; background-color: #5cb85c; color: white;">
                <asp:Label runat="server" Text="Select User admin in system" Font-Size="40px"></asp:Label>

            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 30px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Current Email :" Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 30px; float: left;">
                    <asp:TextBox runat="server" ID="txt_current_email" Text="" Enabled="false" Font-Size="25px" CssClass="txtbox_supplier"></asp:TextBox>

                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Select Email :" Font-Size="25px"></asp:Label>



                </div>
                <div style="text-align: left; padding-top: 10px; float: left; width: 250px;">
                    <asp:DropDownList runat="server" ID="dd_email" Font-Size="25px">
                    </asp:DropDownList>
                </div>
                <div style="clear: left;">
                </div>
                <br />
                <div style="width: 100%; margin: 0 auto; text-align: center;">
                    <asp:Button runat="server" Text="Select" CssClass="btn_register_success" ID="Button1" OnClick="btn_select_email_Click" />
                </div>
            </div>
        </div>

        <br />
        <br />
        <br />
          <div style="width: 1000px; margin: 0 auto; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 12px 40px 0 rgba(0,0,0,0.19); background-color: aliceblue; padding-bottom: 30px;">
            <div style="width: 100%; margin: 0 auto; border: 1px solid groove; padding: 2px 16px; background-color: #5cb85c; color: white;">
                <asp:Label runat="server" Text="Select Function Create Bill" Font-Size="40px"></asp:Label>

            </div>
          
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Select Function :" Font-Size="25px"></asp:Label>



                </div>
                <div style="text-align: left; padding-top: 10px; float: left; width: 250px;">
                    <asp:DropDownList runat="server" ID="dd_status_function" Font-Size="25px">                    
                        <asp:ListItem Text="--Please select--"  ></asp:ListItem>
                        <asp:ListItem Text="Close" Value ="0"></asp:ListItem>
                            <asp:ListItem Text="Open" Value ="1"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div style="clear: left;">
                </div>
                <br />
                <div style="width: 100%; margin: 0 auto; text-align: center;">
                    <asp:Button runat="server" Text="Select" CssClass="btn_register_success" ID="btn_open_create" OnClick="btn_open_create_Click" />
                </div>
            </div>
        </div>
    </div>
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
        function alert_password_not_math() {
            alert("Password wrong !!!")
        }

    </script>
</asp:Content>
