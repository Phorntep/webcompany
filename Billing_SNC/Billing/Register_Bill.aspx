<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Register_Bill.aspx.vb" Inherits="Billing_SNC.Register_Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/cssRegisterbill.css" rel="stylesheet" />
   
   <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>


            <br />
            <div style="width: 100%; height: 100%;">
                <div>
                    <div style="width: 650px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                        <div style="  line-height: 1.9; text-align: left; padding-left: 2em;">
                            <asp:Label runat="server" Text="Register" Font-Size="24px"></asp:Label>
                        </div>
                    </div>
                    <div style="width: 650px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080;">
                        <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Username" Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtusername" Font-Size="30px" CssClass="textboxregister" OnTextChanged="txtusername_TextChanged" AutoPostBack="true"></asp:TextBox>
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
                                <asp:TextBox runat="server" ID="txtconfirmPass" Font-Size="30px" CssClass="textboxregister" TextMode="Password"  Width="335px"></asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Company" Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtCompany" Font-Size="30px" CssClass="textboxregister"></asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Contract" Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtSupplier" Font-Size="30px" CssClass="textboxregister"></asp:TextBox>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Address" Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtaddress" Font-Size="30px" CssClass="textboxregister" TextMode="MultiLine" Height="100px" Width="340px"></asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>

                        <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Phone" Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtPhone" Font-Size="30px" CssClass="textboxregister"></asp:TextBox>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                         <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Email : " Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txt_email" Font-Size="30px" CssClass="textboxregister"></asp:TextBox>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Level" Font-Size="35px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:DropDownList runat="server" ID="ddLevel" Width="340px" Font-Size="30px" CssClass="textboxregister">
                                </asp:DropDownList>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <asp:Button runat="server" Text="Success" ID="btn_success" CssClass="btn_register_success" OnClientClick="Confirm_success();" OnClick="btn_success_Click" />
                            <asp:Button runat="server" Text="Cancel" ID="btn_cancel" CssClass="btn_register_cancel" OnClick="btn_cancel_Click" />
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
    </script>
</asp:Content>
