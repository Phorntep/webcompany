<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register_snc_resp.aspx.vb" Inherits="Billing_SNC.Register_snc_resp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register SNC</title>
    <link href="CSSBill/cssLoginbill.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <div class=" container  ">
                        <div class="row  mt-5 g-3 ">
                            <div class="col-md-3 col-0 "></div>
                            <div class="col-md-6 col-12 bg-light border border-1 border-secondary rounded opacity-100">
                                <div class="col-md-12 col-12 col-sm-12 col-lg-12 opacity-100 ">
                                    <h2 class="text-center">Register</h2>
                                </div>
                                <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                    <label for="txtusername" class="form-label">Username </label>
                                    <asp:TextBox runat="server" ID="txtusername" CssClass="form-control  is-invalid" OnTextChanged="txtusername_TextChanged" pattern="[A-Za-z0-9_.]{0,}$" AutoPostBack="true"></asp:TextBox>

                                    <div class="valid-feedback">
                                        User นี้สามารถใช้งานได้
                                    </div>
                                    <div class="invalid-feedback">
                                        User นี้ไม่สามารถใช้งานได้
                                    </div>
                                </div>
                                <div class="was-validated">
                                <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                    <label for="txtpassword" class="form-label">Password</label>
                                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control " TextMode="Password" pattern="[A-Za-z0-9_.]{7,}$" required> </asp:TextBox>

                                </div>
                                </div>
                                <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                    <label for="txtconfirmPass" class="form-label">Confirm Password</label>
                                    <asp:TextBox runat="server" CssClass="form-control is-invalid" ID="txtconfirmPass" TextMode="Password" pattern="[A-Za-z0-9_.]{0,}$" AutoPostBack="true" OnTextChanged="txtconfirmPass_TextChanged"></asp:TextBox>

                                    <div class="invalid-feedback">
                                        Password Not match
                                    </div>
                                </div>

                                <div class="was-validated">
                                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                        <label for="txtCompany" class="form-label">Company </label>
                                        <asp:TextBox runat="server" ID="txtCompany" CssClass="form-control  " pattern="[A-Za-z0-9_.]{0,}$" required></asp:TextBox>

                                    </div>
                                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                        <label for="txtSupplier" class="form-label">Contact</label>
                                        <asp:TextBox runat="server" ID="txtSupplier" CssClass="form-control" required></asp:TextBox>

                                    </div>
                                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                        <label for="txtaddress" class="form-label">Address</label>
                                        <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="txtaddress" value="" required></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                        <label for="txtPhone" class="form-label">Phone</label>

                                        <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control " pattern="[0-9-]{}$" TextMode="Phone" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                    <label for="txt_email" class="form-label">E-mail</label>

                                    <asp:TextBox runat="server" ID="txt_email" TextMode="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" CssClass="form-control is-invalid" OnTextChanged="txt_email_TextChanged" AutoPostBack="true" required></asp:TextBox>
                                    <div class="valid-feedback">
                                        Email นี้สามารถใช้งานได้
                                    </div>
                                    <div class="invalid-feedback">
                                        Email นี้ไม่สามารถใช้งานได้
                                    </div>
                                </div>
                                <div class="col-md-12 col-12 col-sm-12 col-lg-12  opacity-100">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="link-primary" PostBackUrl="~/Policy/Personaldataprotectionpolicy.aspx">นโยบายการคุ้มครองข้อมูลส่วนบุคคล (Privacy Policy)</asp:LinkButton>
                                </div>

                                <div class="col-md-12 col-12 col-sm-12 col-lg-12 m-3 opacity-100">
                                    <asp:Button ID="btnSave" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnSave_Click" data-bs-toggle="modal" />

                                    <a class="btn btn-danger" href="Login_Bill.aspx">Cancel</a>

                                </div>



                            </div>
                        <div class="col-md-3 col-0 "></div>



                    </div>


                </div>
                </div>

               

                <%--<asp:Button ID="btnSave" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnSave_Click1" data-bs-toggle="modal" data-bs-target="#registerModal" />--%>


                <!-- Modal -->
                <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true" data-bs-keyboard="false" data-bs-backdrop="static">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="registerModalLabel">Register</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Do you want Register
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                                <asp:Button ID="btnSaves" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnSave_Click1" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modelError" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="registerModalLabela">Register</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Do you want Register
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

                                <asp:Button ID="Button1" runat="server" Text="Yes" class="btn btn-primary" OnClick="btnSave_Click1" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>



    </form>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


    <script type="text/javascript"> 
        function showModel() {
            $('#registerModal').modal('show');
        }
        //window.onload = showModelHappyNewYear;

    </script>
</body>
</html>
