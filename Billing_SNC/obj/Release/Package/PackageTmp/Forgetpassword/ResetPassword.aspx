<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ResetPassword.aspx.vb" Inherits="Billing_SNC.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="../CSSBill/cssLoginbill.css" rel="stylesheet" />
    <link href="../CSSBill/cssRegisterbill.css" rel="stylesheet" />
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
    </script>

</head>
<body>
    <form id="form1" runat="server">
       <div>
            <div style="width: 100%; height: 100%;">
                <div>
                    <div style="width: 560px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                        <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                            <asp:Label runat="server" Text="Forget Password" Font-Size="24px"></asp:Label>
                        </div>
                    </div>
                    <div style="width: 520px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080; padding-left: 20px; padding-right: 20px;">
                        <div>
                            <div style="width:220px ;text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Your E-mail : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width:auto; text-align: left; padding: 20px 0px 20px 0px; ">
                                <asp:TextBox runat="server" ID="txtEmail" Font-Size="20px" CssClass="textboxregister"  Enabled="false"  Text=""  ></asp:TextBox>                                  
                                <font style="color: red;">*</font>
                            </div>
                            <div style="width: 220px; text-align: left; padding: 20px 15px 20px 0px;clear:left;float:left;">
                                <asp:Label runat="server" Text="New Password : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: left; padding: 20px 0px 20px 0px; float: left; ">
                                <asp:TextBox runat="server" ID="txt_password" Font-Size="20px" CssClass="textboxregister" Text="" TextMode="Password"></asp:TextBox>
                                  
                                <font style="color: red;">*</font>
                            </div>
                            <div style="width: 220px; text-align: left; padding: 20px 15px 20px 0px;clear:left;float: left; ">
                                <asp:Label runat="server" Text="Confirm Password : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width:  auto; text-align: left; padding: 20px 0px 20px 0px; float: left; ">
                                <asp:TextBox runat="server" ID="txt_passwordConfrim" Font-Size="20px" CssClass="textboxregister" Text="" TextMode="Password" ></asp:TextBox>
                                  
                                <font style="color: red;">*</font>
                            </div>
                            <div style="width:220px; text-align: left; padding: 20px 15px 20px 0px;clear:left;float: left; ">
                                <asp:Label runat="server" Text="OTP : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width:  auto; text-align: left; padding: 20px 0px 20px 0px;float: left; ">
                                <asp:TextBox runat="server" ID="txt_OTP" Font-Size="20px" CssClass="textboxregister"     Text=""  ></asp:TextBox>
                                  
                                <font style="color: red;">*</font>
                            </div>
                        </div>
                        <div style="clear:left;">
                            <asp:Label ID="lbl_message" runat="server" Text=""></asp:Label>
                        </div>
                        
                        <div style="padding-bottom: 20px;clear:left;">
                            <asp:Button runat="server" Text="Reset Password" ID="btn_success" CssClass="btn_register_success" Width="200px" OnClientClick="Confirm_success();" OnClick="btn_success_Click"  />
                            <asp:Button runat="server" Text="Cancel" ID="btn_cancel" CssClass="btn_register_cancel" PostBackUrl="~/Login_Bill.aspx"  />
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
