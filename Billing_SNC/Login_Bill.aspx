<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login_Bill.aspx.vb" Inherits="Billing_SNC.Login_Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SNC SOUNDPROOF</title>
    <link href="CSSBill/cssLoginbill.css" rel="stylesheet" />
    <link href="CSSBill/cssModelCookie.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="bg">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <div style="width: 100%;">
                    <div style="width: 350px; height: auto; margin: 0 auto; margin-top: 20px; border: 2px solid gray; background-color: rgba(0,0,0,0.7); border-radius: 15px; padding: 10px;">
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
                        <div style="padding: 0px 0px 5px 20px; text-align: center;">
                            <asp:Button CssClass="btnlogin" runat="server" ID="btn_login" Text="login" UseSubmitBehavior="true" OnClick="btn_login_Click" />
                            <asp:Button CssClass="btnregister" runat="server" ID="btn_register" Text="Register" OnClick="btn_register_Click" />
                        </div>
                        <div style="padding: 0px 10px 10px  0px; width: 100%; text-align: right;">
                            <asp:LinkButton ID="LinkButton1" PostBackUrl="~/Forgetpassword/Forgetpassword.aspx" runat="server" ForeColor="Orange">Forget Username/Password </asp:LinkButton>
                        </div>
                    </div>
                    <br />

                    <div style="width: 1000px; height: auto; margin: 0 auto; border: 2px solid gray; background-color: rgba(0,0,0,0.7); border-radius: 15px; padding: 0px 20px 0px 20px;">
                        <br />

                        <div style="width: 100%; text-align: center">
                            <a style="color: white; font-size: 40px; text-align: center">ประกาศ</a>
                            <br />
                            <br />
                        </div>
                        <%--<a style="color: white; font-size: 20px;">• Vendor เจ้าใดที่ยังไม่มีรหัสในการเข้าระบบ Billing ของบริษัท SNC SOUNDPROOF ให้ทำการส่ง E-mail เพื่อให้ผู้ดูแลงานระบบ Billing Appove รหัสของท่าน</a>--%>
                       
                        <a style="color: white; font-size: 20px;">• Vendor เจ้าใดที่ยังไม่มีรหัสในการเข้าระบบ Billing ของบริษัท SNC SOUNDPROOF ให้ทำการ Register ในการเข้าใช้งานระบบ </a>
                        <br />
                        <a style="color: white; font-size: 20px;">• ท่านจะได้รับ E-mail แจ้งการ Appove รหัสของท่าน</a><br />
                        <br />
                        <a style="color: white; font-size: 20px;">• กรุณาเก็บรหัสให้เป็นความลับ</a><br />
                        <br />
                     
                        <div style="width: 100%; text-align: center">
                            <a style="color: orange; font-size: 32px; text-align: center">วันที่ทำการวางบิลของ SNC ปี 2565</a>
                            <br />

                        </div>
                        <div style="display:flex;">
                            <div style="margin: 0 auto;">
                                <table border="1" style="border-color: white">

                                    <tr>
                                        <th></th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ม.ค.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ก.พ.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">มี.ค.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">เม.ย.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">พ.ค.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">มิ.ย.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ก.ค.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ส.ค.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ก.ย.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ต.ค.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">พ.ย.</a><br />
                                        </th>
                                        <th><a style="color: white; font-size: 20px; padding-left: 14px; padding-right: 14px;">ธ.ค.</a><br />
                                        </th>
                                    </tr>
                                    <tr style="text-align: center;">
                                        <td><a style="color: white; font-size: 20px;">กำหนดวันวางบิล</a></td>
                                        <td><a style="color: white; font-size: 20px;">4,5,6</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,3</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,3</a></td>
                                        <td><a style="color: white; font-size: 20px;">4,5</a></td>
                                        <td><a style="color: white; font-size: 20px;">5,6</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,6</a></td>
                                        <td><a style="color: white; font-size: 20px;">4,5</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,3</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,5</a></td>
                                        <td><a style="color: white; font-size: 20px;">3,4</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,3</a></td>
                                        <td><a style="color: white; font-size: 20px;">2,6</a></td>
                                    </tr>
                                    <tr style="text-align: center">
                                        <td><a style="color: white; font-size: 20px;">กำหนดวันจ่าย</a></td>
                                        <td><a style="color: white; font-size: 20px;">31</a></td>
                                        <td><a style="color: white; font-size: 20px;">28</a></td>
                                        <td><a style="color: white; font-size: 20px;">31</a></td>
                                        <td><a style="color: white; font-size: 20px;">29</a></td>
                                        <td><a style="color: white; font-size: 20px;">31</a></td>
                                        <td><a style="color: white; font-size: 20px;">30</a></td>
                                        <td><a style="color: white; font-size: 20px;">29</a></td>
                                        <td><a style="color: white; font-size: 20px;">31</a></td>
                                        <td><a style="color: white; font-size: 20px;">30</a></td>
                                        <td><a style="color: white; font-size: 20px;">31</a></td>
                                        <td><a style="color: white; font-size: 20px;">30</a></td>
                                        <td><a style="color: white; font-size: 20px;">30</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <br />


                        <p style="color: white; font-size: 20px; text-align: center;">สอบถามรายละเอียด  การวางบิลและชำระเงิน  ฝ่ายบัญชี คุณวิยดา เบอร์ต่อ  120  </p>
                        <br />

                    </div>

                </div>
                <br />
                <br />
                <div style="width: 1000px; height: auto; margin: 0 auto; border: 2px solid gray; background-color: rgba(0,0,0,0.7); border-radius: 15px; padding: 10px 20px 0px 20px;">
                    <div style="width: 800px; margin: 0 auto; text-align: center;">
                        <asp:Label ID="lbl_herder" runat="server" Text="Tutorial Billing" Font-Size="40px" Font-Names="David" ForeColor="White"></asp:Label>
                    </div>
                    <div style="width: 800px; margin: 0 auto;">
                        <%-- <video src="Billing/Video/Billing.mp4" controls="controls" width="800" height="400" />--%>
                        <%--<video src="https://www.youtube.com/watch?v=FrIuyCHrzdg&feature=youtu.be" controls="controls" width="800" height="400" />--%>
                        <iframe width="800" height="400" src="https://www.youtube.com/embed/KDIsqtVBiLE"></iframe>
                        <br />
                        <br />
                    </div>
                </div>
                <div id="myModalCookie" class="modalCookie">
                    <!-- Modal content -->
                    <div class="modalCookie-contentCookie" style="box-shadow: 0px 5px 10px  rgba(0,0,0,1)">
                        <div class="modalCookie-table" style="width: 70%;">
                            <div class="modalCookie-bodyCookie">
                                <a>เราใช้คุกกี้เพื่อเพิ่มประสิทธิภาพและประสบการณ์ที่ดีในการใช้เว็บไซต์ ท่านสามารถศึกษารายละเอียดการใช้คุกกี้ได้ที่ </a>
                                <asp:HyperLink runat="server" Text="“นโยบายการใช้คุกกี้”" NavigateUrl="~/Cookie/Cookiespolicies.aspx"></asp:HyperLink>
                                <br />
                            </div>
                        </div>
                        <div class="modalCookie-table" style="width: 30%; text-align: center;">
                            <div class="modalCookie-bodyCookie" style="margin: auto; width: 200px; margin-top: 10px">
                                <asp:Button runat="server" ID="btn_cookie" Text="Accept cookies" CssClass="btncookie" OnClick="btn_cookie_Click" />
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <br />
        <br />
        <script>
            function alert_Error_Password_not_math() {
                alert("Password wrong. Please check password !!!")
                //window.location.href = 'Add_Payment_Main.aspx';
            }
            function alert_status_not_approve() {
                alert("your user not approve in system billing. Please Contract admin or sent email.")
                //window.location.href = 'Add_Payment_Main.aspx';
            }
            function alert_Demo() {
                alert("หากเกิดปัญหาหรือบัคใด ๆ รบกวนแจ้งปัญหามาที่ nattiko@sncsoundproof.com ")
                //window.location.href = 'Add_Payment_Main.aspx';
            }
            function alert_Close() {
                alert("ปิดปรับปรุงชั่วคราว ขออภัยในความไม่สะดวก จะเปิดใช้ประมาณ 15.00 น.")
                //window.location.href = 'Add_Payment_Main.aspx';
            }


            function show_modelCookie() {
                document.getElementById('myModalCookie').style.display = 'block';
                // modalCookie.style.display = 'block';
            }
            function hide_modelCookie() {
                document.getElementById('myModalCookie').style.display = 'none';
                //modalCookie.style.display = 'none';

            }
        </script>
    </form>
</body>
</html>
