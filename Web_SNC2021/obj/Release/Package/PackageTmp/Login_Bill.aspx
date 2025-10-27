<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login_Bill.aspx.vb" Inherits="Web_SNC.Login_Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SNC SOUNDPROOF</title>
    <link href="CSS/cssLoginbill.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="bg">
        <div style="width: 100%;">
            <div style="width: 350px; height: 380px; margin: 0 auto; margin-top: 10%; border: 2px solid gray; background-color: rgba(0,0,0,0.7); border-radius: 15px;">
                <div style="width: 100%; text-align: center;">
                    <br />
                    <a style="color: white; font-size: 40px;">Billing SNC</a>
                </div>
                <div style="padding: 50px 30px 30px 20px;">
                    <asp:TextBox class="textbox" runat="server" ID="username" placeholder="Username" ToolTip="Please Key username"></asp:TextBox>
                </div>
                <div style="padding: 0px 30px 30px 20px;">
                    <asp:TextBox class="textbox" runat="server" ID="password" placeholder="Password" ToolTip="Please Key password" TextMode="Password"></asp:TextBox>
                </div>
                 <div style="padding: 0px 30px 30px 20px;text-align:center;">
                    <asp:Button CssClass="btnlogin" runat="server" ID="btn_login" Text="login" OnClick="btn_login_Click"/>
                </div>
            </div>
             
            <br />
            <div style="width: 1000px; height: 200px; margin: 0 auto; border: 2px solid gray; background-color: rgba(0,0,0,0.7); border-radius: 15px; padding: 0px 20px 0px 20px;">
                <br />

                <div style="width: 100%; text-align: center">
                    <a style="color: white; font-size: 40px; text-align: center">ประกาศ</a>.
                    <br />
                    <br />
                </div>

                <a style="color: white; font-size: 20px;">• Vendor เจ้าใดที่ยังไม่มีรหัสในการเข้าระบบ Billing ของบริษัท SNC SOUNDPROOF ให้ทำการส่ง E-mail เพื่อขอรหัสในการเข้าใช้งานระบบ Billing มาที่แผนกบัญชีหรือบุลคลที่ท่านติดต่อ</a>
                <br />
                <a style="color: white; font-size: 20px;">• กรุณาเก็บรหัสที่ทางบริษัทจัดส่งให้เป็นความลับ</a><br />

            </div>
        </div>
        <script>
             function alert_Error_Password_not_math() {
            alert("Password wrong. Please check password !!!")
            //window.location.href = 'Add_Payment_Main.aspx';
        }
        </script>
    </form>
</body>
</html>
