<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="EditUserPage.aspx.vb" Inherits="Billing_SNC.EditUserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <link href="../CSSBill/cssRegisterbill.css" rel="stylesheet" />
    <%--<link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />--%>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />
    <br />
    <br />

    <div style="width: 650px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
        <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
            <asp:Label runat="server" Text="Edit User" Font-Size="24px"></asp:Label>
        </div>
    </div>
    <div style="width: 650px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080;">
        <div>
            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                <asp:Label runat="server" Text="Username : " Font-Size="35px"></asp:Label>
            </div>
            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                <asp:TextBox runat="server" ID="txtusername" Font-Size="30px" CssClass="textboxregister" Enabled="false"></asp:TextBox>
                <font style="color: red;">*</font>
            </div>
            <div style="clear: left;">
            </div>
        </div>
        <div>
            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                <asp:Label runat="server" Text="Password : " Font-Size="35px"></asp:Label>
            </div>
            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                <asp:TextBox runat="server" ID="txtpassword" Font-Size="30px" CssClass="textboxregister" TextMode="Password" Width="335px"> </asp:TextBox>
                <font style="color: red;">*</font>
            </div>
            <div style="clear: left;">
            </div>
        </div>
        <div>
            <div style="width: 250px; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                <asp:Label runat="server" Text="Confirm Password : " Font-Size="30px"></asp:Label>
            </div>
            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                <asp:TextBox runat="server" ID="txtconfirmPass" Font-Size="30px" CssClass="textboxregister" TextMode="Password" Width="335px"></asp:TextBox>
                <font style="color: red;">*</font>
            </div>
            <div style="clear: left;">
            </div>
        </div>
        <div>
            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                <asp:Label runat="server" Text="Company : " Font-Size="35px"></asp:Label>
            </div>
            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                <asp:TextBox runat="server" ID="txtCompany" Font-Size="30px" CssClass="textboxregister" Enabled="false"></asp:TextBox>
                <font style="color: red;">*</font>
            </div>
            <div style="clear: left;">
            </div>
        </div>
        <div>
            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                <asp:Label runat="server" Text="Contract : " Font-Size="35px"></asp:Label>
            </div>
            <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                <asp:TextBox runat="server" ID="txtSupplier" Font-Size="30px" CssClass="textboxregister"></asp:TextBox>
            </div>
            <div style="clear: left;">
            </div>
        </div>
        <div>
            <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                <asp:Label runat="server" Text="Address : " Font-Size="35px"></asp:Label>
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
                <asp:Label runat="server" Text="Phone : " Font-Size="35px"></asp:Label>
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
        <div style="padding-bottom: 20px;">
            <asp:Button runat="server" Text="Edit" ID="btn_success" CssClass="btn_register_success" OnClick="btn_success_Click" ClientIDMode="Static" />
           
            <%--<asp:Button runat="server" Text="Cancel" ID="btn_cancel" CssClass="btn_register_cancel" OnClick="btn_cancel_Click" UseSubmitBehavior="true" />--%>
        </div>

    </div>
    <br />
    <br />
    <%--*****************************************************--%>
    <div id="myModal_edituser" class="modal_Edituser">

        <!-- Modal content -->
        <div class="modal_Edituser-content" >
            <div class="modal_Edituser-header">
                <%--<span class="close">&times;</span>--%>
                <%--<span class="close" onclick="Close_model();" ><asp:Label Text="&times;" runat="server" ></asp:Label></span>--%>
                <%--<span>
                    <asp:Button runat="server" ID="btn_close" ClientIDMode="Static" class="close_edituser" Text="&times;" />

                </span>--%>
                <h2>Do you want Edit your profile.</h2>
            </div>
             
            <div style="width: 600px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; ">
                 
                <div style="padding : 20px;">
                    <asp:Button runat="server" Text="Confirm" ID="btn_confirm_Edit" CssClass="btn_register_success"  OnClick="btn_confirm_Edit_Click" />
        
                    <asp:Button runat="server" Text="Cancel" ID="btn_cancel" CssClass="btn_register_cancel" UseSubmitBehavior="true" />
                </div>

            </div>
            <br />
            <br />

        </div>
        <br />
        <br />
    </div>
    <%--*****************************************************--%>
  

    <script>
        // Get the modal
        var modal = document.getElementById("myModal_edituser");


        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close_edituser")[0];

        // When the user clicks the button, open the modal 
        //btn.onclick = function () {
        //    modal.style.display = "block";
        //}
        function OpenModel() {
            var modal1 = document.getElementById("myModal_edituser");
            modal1.style.display = "block";
        }
        // When the user clicks on <span> (x), close the modal
        //span.onclick = function () {
        //    modal.style.display = "none";
        //}
           function alert_save_complete() {
               alert("Save Complete!!!")
               window.location.href = 'Index.aspx';
              
        }
            function alert_not_save() {
            alert("Save Failed Please check data !!!")
        }
        function alert_length_text() {
            alert("Please key password minlength > 4 !!!")
        }

        function alert_password_not_math() {
            alert("Password wrong or not match !!!")
        }
    </script>
  
</asp:Content>
