<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Manage_user.aspx.vb" Inherits="Billing_SNC.Manage_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <link href="../CSSBill/cssRegisterbill.css" rel="stylesheet" />
    <%--<link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />--%>
    <link href="cssBill/cssmodel_manageuser.css" rel="stylesheet" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate> 
            <br />
            <div style="width: 100%; height: 100%;">
                <div>

                    <div style="width: 90%; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                        <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                            <asp:Label runat="server" Text="User in system" Font-Size="24px"></asp:Label>
                        </div>
                    </div>
                    <div style="width: 90%; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080;">
                        <br />
                        <div style="">
                            <asp:Label runat="server" Text="Company : "></asp:Label>
                            <asp:TextBox runat="server" Text="" ID="txt_company" ></asp:TextBox>

                            &nbsp;&nbsp;
                             <asp:Label runat="server" Text="Status : "></asp:Label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="" Text="--All--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Approve"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Not Approve"></asp:ListItem>
                            </asp:DropDownList>
                      
                    <asp:Button runat="server" ID="btn_search" Text=" Search" class=" " OnClick="btn_search_Click" /> 
                            &nbsp;
                    <asp:Button runat="server" ID="btn_ExportExcel" Text=" Export To excel" class=" " OnClick="btn_ExportExcel_Click" /> 
                             
                        </div>
                        <div style="padding: 20px 20px; overflow: scroll">
                            <asp:GridView ID="GridView1" runat="server" BackColor="White" Width="100%" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                                AutoGenerateColumns="False" AllowPaging="True" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting"
                                ClientIDMode="Static" OnRowDataBound="GridView1_RowDataBound">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <Columns>
                                    <asp:TemplateField HeaderText="No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                        <HeaderStyle Width="35px" />
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Username">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Company") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Company") %>'></asp:Label>

                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Billing/Image_billing/icon/sort-arrows-couple-pointing-up-and-down.png" Width="18px" OnClick="ImageButton2_Click" />
                                        </HeaderTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Wrap="false" HorizontalAlign="Left"  />
                                         
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contract">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Supplier") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Supplier") %>'></asp:Label>

                                        </ItemTemplate>

                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Billing/Image_billing/icon/sort-arrows-couple-pointing-up-and-down.png" Width="18px" OnClick="ImageButton1_Click" />
                                        </HeaderTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Phone">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Tel") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Tel") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Level">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Description_lv") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Description_lv") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle />
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="E-mail">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit User">
                                        <ItemTemplate>
                                            <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>--%>
                                          <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Billing/Image_billing/icon/pencil.png"  CommandName="Select" />
                                        </ItemTemplate>
                                        <HeaderStyle />
                                        <ItemStyle />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="LinkButton2" runat="server" OnClientClick="Confirm_delete();" CommandName="Delete" ImageUrl="~/Billing/Image_billing/icon/cancel.png" Width="32"  ></asp:ImageButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    <br />
    <br />
    <br />
    <!-- The Modal -->
    <div id="myModal_manageUser" class="modal_manageUser">

        <!-- Modal content -->
        <div class="modal_manageUser-content">
            <div class="modal_manageUser-header">
                <%--<span class="close">&times;</span>--%>
                <%--<span class="close" onclick="Close_model();" ><asp:Label Text="&times;" runat="server" ></asp:Label></span>--%>
                <span>
                    <asp:Button runat="server" ID="btn_close" ClientIDMode="Static" class="close" OnClick="btn_close_Click" Text="&times;" /></span>
                <h2>Manager User</h2>
            </div>
            <div style="width: 650px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                    <asp:Label runat="server" Text="Edit User" Font-Size="24px"></asp:Label>
                </div>
            </div>
            <div style="width: 650px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080;">
                <div>
                    <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                        <asp:Label runat="server" Text="Username" Font-Size="35px"></asp:Label>
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
                        <asp:TextBox runat="server" ID="txtconfirmPass" Font-Size="30px" CssClass="textboxregister" TextMode="Password" Width="335px"></asp:TextBox>
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
                <div>
                    <div style="width: 250px; text-align: right; padding: 20px 15px 20px 0px; float: left;">
                        <asp:Label runat="server" Text="Status " Font-Size="35px"></asp:Label>
                    </div>
                    <div style="width: auto; text-align: right; padding: 20px 0px 20px 0px; float: left;">
                        <asp:DropDownList runat="server" ID="dd_status" Width="340px" Font-Size="30px" CssClass="textboxregister">
                            <asp:ListItem Text="Approve" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Not Approve" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <font style="color: red;">*</font>
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
                    <asp:Button runat="server" Text="Success" ID="btn_success" CssClass="btn_register_success" OnClientClick="Confirm_success();" OnClick="btn_success_Click" />
        
                    <asp:Button runat="server" Text="Cancel" ID="btn_cancel" CssClass="btn_register_cancel" OnClick="btn_cancel_Click" UseSubmitBehavior="true" />
                </div>

            </div>
            <br />
            <br />

        </div>
        <br />
        <br />
    </div>
    <%-----------------------------------%>
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
         function Confirm_delete() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want delete ?")) {
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
            window.location.href = 'Please complete Accident Data & Hazard before submit Monthly Performance';

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

        var modal = document.getElementById("myModal_manageUser");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        //btn.onclick = function () {

        //    modal.style.display = "block";
        //}
        function OpenModel() {
            var modal1 = document.getElementById("myModal_manageUser");
            modal1.style.display = "block";
        }
        function Close_model() {
            var modal1 = document.getElementById("myModal_manageUser");
            modal1.style.display = "none";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        //window.onclick = function (event) {
        //    if (event.target == modal) {
        //        modal.style.display = "none";
        //    }
        //}

    </script>
</asp:Content>
