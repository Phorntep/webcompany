<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register_SNC.aspx.vb" Inherits="Billing_SNC.Register_SNC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="CSSBill/cssLoginbill.css" rel="stylesheet" />           
            <link href="CSSBill/cssRegisterbill.css" rel="stylesheet" /> 

</head>
<body>
    <form id="form1" runat="server">
        <div>
           

            <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>


            <br />
            <div style="width: 100%; height: 100%;">
                <div>
                    <div style="width: 670px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                        <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                            <asp:Label runat="server" Text="Register" Font-Size="24px"></asp:Label>
                        </div>
                    </div>
                    <div style="width: 630px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080; padding-left: 20px; padding-right: 20px;">
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Username : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtusername" Font-Size="25px" CssClass="textboxregister" OnTextChanged="txtusername_TextChanged" Text=""  AutoPostBack="true"></asp:TextBox>
                                  
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Password : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtpassword" Font-Size="25px" CssClass="textboxregister" TextMode="Password" Width="275px"> </asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Confirm Password :" Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtconfirmPass" Font-Size="25px" CssClass="textboxregister" TextMode="Password" Width="275px"></asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Company : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtCompany" Font-Size="25px" CssClass="textboxregister"></asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Contact : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtSupplier" Font-Size="25px" CssClass="textboxregister"></asp:TextBox>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Address : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtaddress" Font-Size="25px" CssClass="textboxregister" TextMode="MultiLine" Height="100px" Width="340px"></asp:TextBox>
                                <font style="color: red;">*</font>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Phone : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txtPhone" Font-Size="25px" CssClass="textboxregister"></asp:TextBox>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                            <div style="width: 250px; text-align: left; padding: 20px 15px 20px 0px; float: left;">
                                <asp:Label runat="server" Text="Email : " Font-Size="25px"></asp:Label>
                            </div>
                            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                                <asp:TextBox runat="server" ID="txt_email" Font-Size="25px" CssClass="textboxregister" OnTextChanged="txt_email_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <div style="clear: left;">
                            </div>
                        </div>
                        <div>
                              <div text-align: left; float: left; style="background-color: gainsboro;">
                                  <%--<asp:Label runat="server" Text ="ข้อมูลส่วนบุคคลที่ท่านให้ ที่เข้าใช้ในการบริการของระบบวางบิลทั้งหมดนั้นท่านยินยอมที่จะมอบให้ทางบริษัท"></asp:Label> 
                                  <br />
                                  <asp:RadioButton runat="server" id="rdio_ture" text="ยอมรับ" ForeColor="Green" GroupName="PDPA" />
                                  <asp:RadioButton runat="server" id="rdio_false" text="ไม่ยอมยอมรับ" ForeColor="red"  GroupName="PDPA" />--%>
                                  <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Policy/Personaldataprotectionpolicy.aspx">นโยบายการคุ้มครองข้อมูลส่วนบุคคล (Privacy Policy)</asp:LinkButton>
                             </div>
                            <div style="clear: left;">
                                <br />  
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
                    window.location.href = 'Login_Bill.aspx';

                }
                function alert_not_save() {
                    alert("Save Failed Please check data !!!")
                }
                function alert_length_text() {
                    alert("Please enter more than 4 characters.!!!")
                }
                function alertUser_worng() {
                    alert("This user have at system !!!!")
                }
                function alertUser_worng_l_SP() {
                    alert("Do not contain spaces between characters and must not contain more than 25 characters.")
                }
                function alertUser_pass_not_math() {
                    alert("Passwords do not match !!!")
                }
                
            </script>
        </div>
    </form>
</body>
</html>
