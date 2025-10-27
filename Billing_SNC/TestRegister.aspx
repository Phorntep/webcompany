<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TestRegister.aspx.vb" Inherits="Billing_SNC.TestRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="  ">
    <form id="form1" runat="server">
        <%--<div class=" container  ">
            <div class="row  mt-5 g-3  was-validated">
                <div class="col-md-3 col-0 "></div>
                <div class="col-md-6 col-12 bg-light border border-1 border-secondary rounded opacity-100">
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12 opacity-100 ">
                        <h2 class="text-center">Register</h2>
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txtusername" class="form-label">Username </label>
                        <asp:TextBox  runat="server" cssclass="form-control" id="txtusername"  required ></asp:TextBox>
                        <asp:Label runat="server" ID="lbl_alert_Username"></asp:Label>
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_password" class="form-label">Password</label>
                         
                         <asp:TextBox  runat="server" cssclass="form-control" id="txt_password"  required ></asp:TextBox>
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_confirm_password" class="form-label">Confirm Password</label>
                       <asp:TextBox  runat="server" cssclass="form-control" id="txt_confirm_password"  required ></asp:TextBox>
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_company" class="form-label">Company </label>
                        <input type="text" class="form-control" id="txt_company" value="" required />
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_contact" class="form-label">Contact</label>
                        <input type="text" class="form-control" id="txt_contact" value="" required />
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_address" class="form-label">Address</label>
                        <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="txt_address" value="" required></asp:TextBox>
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="txt_phone" value="" required />
                    </div>
                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                        <label for="txt_email" class="form-label">E-mail</label>
                        <input type="email" class="form-control" id="txt_email" value="" required />
                    </div>

                    <div class="col-md-12 col-12 col-sm-12 col-lg-12 m-3 opacity-100">
                        <asp:Button  runat="server" ID="btnSave" Text="Register" OnClick="btnSave_Click"></asp:Button>
                    </div>
                </div>
                <div class="col-md-3 col-0 "></div>



            </div>


        </div>--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
        <asp:TextBox ID="txtName" runat="server" />
    <asp:Button ID="btnSubmit"  Text="Submit" runat="server" OnClick="btnSubmit_Click" />
   
    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <script type="text/javascript"> 
        function showModelHappyNewYear() {
            $('#exampleModal').modal('show');
        }
        window.onload = showModelHappyNewYear;

    </script>
</body>
</html>
