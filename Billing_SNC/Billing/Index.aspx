<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Index.aspx.vb" Inherits="Billing_SNC.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
            line-height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <link href="cssBill/css_index.css" rel="stylesheet" />
    <div style="width: 100%; height: auto; margin: 0 auto;">
        <div style="width: 800px; height: auto; margin: 0 auto; background-color: #f0ffff; margin-top: 50px; border-radius: 10px; border: 0px solid; padding: 20px;  box-shadow: 0px 0px 20px 10px rgb(200, 240, 240); ">

            <%-- <div style="width:100%;text-align:center;">
                <h3>วิธีการวางบิล</h3>
                
            </div>--%>
            <div style="line-height: 5px;">

                <br />
                <h3 >วิธีการวางบิล</h3>
                <p class="auto-style1">
                    -การวางบิล ตัดรอบอินวอยส์ทุกวันที่ 1- สิ้นเดือน วางบิลเดือนถัดไป
                </p>
                <p class="auto-style1">-ไม่รับวางบิล กรณีส่งของไม่จบ PO</p>
                <p class="auto-style1">-ใบกำกับภาษี/ใบแจ้งหนี้ของเดือนธันวาคม 2563 ที่จะวางบิลในเดือนมกราคม 2564 ยังสามารถวางบิลทาง E-Mail และทางไปรษณีย์ได้</p>
                <p class="auto-style1">-ส่ง EMSใบเสร็จรับเงินตัวจริง  + ใบวางบิลที่ปริ้นจาก เว็บไซด์ โดยยึดตราประทับไปรษณีย์ ไม่เกิน 2 วันทำการนับจากวันสุดท้ายของการวางบิล</p>
                
                <h3>หมายเหตุ : </h3>
                <p class="auto-style1">หากไม่ได้รับใบเสร็จภายในวันที่กำหนด จะเลื่อนวันชำระเงินออกไปเป็น ณ เดือนที่ได้รับใบเสร็จ โดยไม่แจ้งให้ทราบล่วงหน้า</p>
                 
                <br />
                <h3 style="text-align: center;">สอบถามรายละเอียด  การวางบิลและชำระเงิน  ฝ่ายบัญชี คุณวิยดา เบอร์ต่อ  120  </h3>
            </div>
        </div>
         <div style="width: 800px; height: auto; margin: 0 auto; background-color: #f0ffff; margin-top: 20px;margin-bottom:100px; border-radius: 10px; border: 0px solid; padding: 20px;  box-shadow: 0px 0px 20px 10px rgb(200, 240, 240); ">

            <%-- <div style="width:100%;text-align:center;">
                <h3>วิธีการวางบิล</h3>
                
            </div>--%>
            <div style="line-height: 5px;">

                <br />
                <h3 style="color:red">Update : 05-10-2021</h3>
                <p class="auto-style1">1.Supplier สามารถแก้ขข้อมูลส่วนตัวของเขาเองได้ เช่น ชื่อผู้ติดต่อ เบอร์โทรศัพท์ E-mail ได้ที่ Menu Edit User</p>
                <p class="auto-style1">2.Supplier สามารถแก้ใขจำนวนเงิน วันที่ เลขที่เอกสารได้ </p>  
                <p class="auto-style1">3.Supplier Upload ใบเสร็จรับเงินพร้อมวางบิลได้ กรณีลูกค้าใช้ระบบ E-tax invoice E-Receipt</p> 
                <p class="auto-style1">4.Supplier สามารถ upload ไฟล์ Excel ในการวางบิลได้ โดยใช้ไฟล์ Format จากทาง SNC เท่านั้น</p>
                <p class="auto-style1">5.Supplier ที่ลืมรหัสสามารถกด Forget password ได้ที่หน้า Login</p>                 
                <p class="auto-style1">6.1 Email สามารถสมัครได้แค่ 1 ครั้ง เท่านั้น</p>   
                
                  <br />
                <h3 style="color:red">Update : 26-01-2022</h3>
                <p class="auto-style1">1.Supplier สามารถลบรายการของ supplier ได้ในกรณีที่สถานะยังไม่ถูก Confirm เช็คได้ที่ Column <span style=" font-size: small; color:red;text-decoration:underline">Status Receive</span> </p>
                 
                  <h3>หมายเหตุ : </h3>
                 <p class="auto-style1" style="color:red;">ผู้ใช้งานสามารถรายงานปัญหาได้ทาง IT@sncsoundproof.com หรือ เบอร์ต่อ 136</p>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
    </div>
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h2>Change Password</h2>
            </div>
            <div class="modal-body">
                <asp:Label ID="lbl_day" runat="server" Text="The password will expire in 3 days."></asp:Label><br />
                <a>Please Click change password.</a><asp:HyperLink runat="server" Text="Click Here" NavigateUrl="~/Billing/Reset_password.aspx"></asp:HyperLink>
            </div>
            <div class="modal-footer">
                <h3></h3>
            </div>
        </div>

    </div>
    <script>
        // Get the modal
        var modal = document.getElementById("myModal");



        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        function show_model() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        function alert_User_worng() {
            alert("Yuor user worng Contact admin please !!!")
            window.location.href = 'Login_Bill.aspx';

        }
    </script>
</asp:Content>
