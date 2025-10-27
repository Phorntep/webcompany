<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Billing_supplier_edit.aspx.vb" Inherits="Billing_SNC.Billing_supplier_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Jquery/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="Jquery/bootstrap.min.css" rel="stylesheet" />
    <script src="Jquery/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <link href="cssBill/cssBill_ALL.css" rel="stylesheet" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="width: 100%; height: auto; margin: 0 auto;">
        <div style="width: 1000px; margin: 0 auto; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 12px 40px 0 rgba(0,0,0,0.19); background-color: aliceblue; padding-bottom: 30px;">
            <div style="width: 100%; margin: 0 auto; border: 1px solid groove; padding: 2px 16px; background-color: #5cb85c; color: white;">
                <asp:Label runat="server" Text="Billing Supplier" Font-Size="40px"></asp:Label>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 30px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Job ID : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 30px; float: left;">
                    <asp:TextBox runat="server" ID="txt_job_id" Text="" Enabled="false" Font-Size="25px" CssClass="txtbox_supplier"></asp:TextBox>
                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Company Name : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:TextBox runat="server" ID="txt_factory" Text="" Enabled="false" Font-Size="25px" CssClass="txtbox_supplier"></asp:TextBox>
                    <font style="color: red; font-size: 25px;">**</font>
                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Invoice number : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:TextBox runat="server" ID="txt_invoice_number" Text="" Enabled="true" Font-Size="25px" CssClass="txtbox_supplier"></asp:TextBox>
                    <font style="color: red; font-size: 25px;">**</font>
                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Description : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:TextBox runat="server" ID="txt_des" Text="" Enabled="true" Font-Size="25px" CssClass="txtbox_supplier" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Date Invioce : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <%-- <asp:Calendar ID="Calendar1" runat="server" Visible="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged" >
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>--%>
                    <asp:TextBox runat="server" ID="txt_date_invoice" Text="" Font-Size="25px" CssClass="txtbox_supplier form_datetime"></asp:TextBox>
                    <%-- <asp:LinkButton Text="Get date" runat="server" ID="lnk_get_date" OnClick="lnk_get_date_Click"></asp:LinkButton>--%>
                    <font style="color: red; font-size: 25px;">**</font>
                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Total Amount : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:TextBox runat="server" ID="txt_money" Text="" Enabled="true" Font-Size="25px" CssClass="txtbox_supplier" placeholder="" onblur='makeMoney(this);' onkeypress="return event.keyCode != 13;" AutoPostBack="false"></asp:TextBox>
                    <font style="color: red; font-size: 25px;">**</font>
                </div>
                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Witholding Tax base (W/H) : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:TextBox runat="server" ID="txt_pay_rate" Text="0" Enabled="true" Font-Size="25px" CssClass="txtbox_supplier" onblur='makeMoney(this);' onkeypress="return event.keyCode != 13;" AutoPostBack="false"></asp:TextBox>

                </div>

                <div style="clear: left;">
                </div>
            </div>
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Witholding Tax Rate (W/H): " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:TextBox runat="server" ID="txt_rate_vat" Text="0" Enabled="true" Font-Size="25px" CssClass="txtbox_supplier" onblur='makeMoney(this);' onkeypress="return event.keyCode != 13;" AutoPostBack="false"></asp:TextBox>
                    <asp:Label runat="server" Text="%" Font-Size="25px"></asp:Label>
                </div>

                <div style="clear: left;">
                </div>
            </div>

            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                </div>
                <div style="text-align: left; padding-top: 10px; float: left;">
                    <asp:Button runat="server" Text="ADD" CssClass="btn_add_invioce" ID="btn_Add_invoice" OnClick="btn_Add_invoice_Click" />
                </div>
                <div style="clear: left;"></div>
            </div>
            <br />
            <br />
            <div style="margin: 0 auto; width: 90%; border: 1px solid; overflow: auto;">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" ShowFooter="True"
                    OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowUpdating="GridView1_RowUpdating" ShowHeaderWhenEmpty="true">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Invoice">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Date_invoice" runat="server" Text='<%# Bind("Date_invoice", "{0:dd-MM-yyyy}") %>' CssClass="form_datetime_ingridview"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Date_invoice" runat="server" Text='<%# Bind("Date_invoice", "{0:dd-MM-yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Invoice Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Invoice_number" runat="server" Text='<%# Bind("Number_invoice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Invoice_number" runat="server" Text='<%# Bind("Number_invoice") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Description" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Description" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_Money" runat="server" Text='<%# Bind("invioce_money", "{0:n2}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_Money" runat="server" Text='<%# Bind("invioce_money", "{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tax Base">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_amount_money" runat="server" Text='<%# Bind("amount_money", "{0:n2}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_amount_money" runat="server" Text='<%# Bind("amount_money", "{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tax Rate">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_vat_rate" runat="server" Text='<%# Bind("vat_rate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_vat_rate" runat="server" Text='<%# Bind("vat_rate") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Withholding tax">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_amount_vat" runat="server" Text='<%# Bind("amount_vat", "{0:n2}") %>' Enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_amount_vat" runat="server" Text='<%# Bind("amount_vat", "{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_total_money" runat="server" Text='<%# Bind("total_money", "{0:n2}") %>' Enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_total_money" runat="server" Text='<%# Bind("total_money", "{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" ShowHeader="False" ItemStyle-Wrap="false">
                            <EditItemTemplate>
                                <asp:ImageButton ID="Image_update" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/Billing/Image_billing/icon/save.png" Text="Update" />
                                &nbsp;<asp:ImageButton ID="Image_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/Billing/Image_billing/icon/cancel.png" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Billing/Image_billing/icon/pencil.png" Text="Edit" />
                            </ItemTemplate>
                            <ControlStyle Width="30px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">

                            <ItemTemplate>
                                <asp:ImageButton ID="Image_delete" runat="server" CausesValidation="False" CommandName="Delete1" ImageUrl="~/Billing/Image_billing/icon/cancel.png" Text="Delete" OnClientClick="Confirm_delete();" />
                            </ItemTemplate>
                            <ControlStyle Width="30px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <div style="clear: left;"></div>
            </div>
            <hr />
            <div runat="server" id="DivUpload_Invoice" style="margin: 0 auto; width: 90%; margin-top: 10px;">

                <asp:Label ID="labal1" runat="server" Text="Upload Receipt : "> </asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                &nbsp;
                <asp:Button ID="btn_upload" runat="server" Text="Upload" OnClick="btn_upload_Click" />

                <div runat="server" style="margin: 0 auto; width: 50%; margin-top: 15px; border: 1px solid;">

                    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" ShowFooter="True" OnRowCommand="GridView2_RowCommand" ShowHeaderWhenEmpty="true">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FileName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Invoice_number" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Invoice_number" runat="server" Text='<%# Bind("fileName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">

                                <ItemTemplate>
                                    <asp:ImageButton ID="Image_delete_file_upload" runat="server" CausesValidation="False" CommandName="Delete1" ImageUrl="~/Billing/Image_billing/icon/cancel.png" Text="Delete" OnClientClick="Confirm_delete();" />
                                </ItemTemplate>
                                <ControlStyle Width="30px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>

            <hr />
            <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">

                <div style="text-align: center; padding-top: 10px; margin: 0 auto;">
                    <asp:Button runat="server" Text="Save" CssClass="btn_add_invioce" ID="btn_Save" OnClick="btn_Save_Click" Visible="true" UseSubmitBehavior="false" />

                </div>
                <div style="clear: left;"></div>
            </div>

        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <script>
        function Confirm_delete() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want Delete this item ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
             function Filemaximum10MB() {
            alert("Files larger than 10MB!!!") 
             
        }

        function Nothing_Data() {
            alert("Please key data !!!")

        }
        function complete_eRROR_send_data() {
            alert("Error !!!")

        }
        function Not_owner_job() {
            alert("you not owner Job!!!")
            window.location.href = 'Billing_all1.aspx';
        }
        function complete_send_data() {
            alert("Complete !!!")
            window.location.href = 'Billing_all1.aspx';
        }
        function lock_user_of_date() {
            alert("To day can't use system billing.Can be used on the 2nd and 3rd day of the month. If it falls on Saturday or Sunday, it will be postponed to the next week. !!!")
            window.location.href = 'Billing_all1.aspx';
        }
        function Alert_use_system_billing() {
            alert("Can be used on the 2nd and 3rd day of the month. If it falls on Saturday or Sunday, it will be postponed to the next week. !!!")

        }
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        function makeMoney(source) {
            //Grab the value from the element
            var money = parseFloat(source.value, 10).toFixed(2);

            //Format your value
            source.value = money.toString();
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $(".form_datetime").datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "tr",
                autoclose: true

            });
        });
        $(function () {
            $(".form_datetime_ingridview").datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd-mm-yyyy",
                language: "tr",
                autoclose: true

            });
        });

                // $(function () {
                //    $('[id*=txt_date_End]').datepicker({
                //        changeMonth: true,
                //        changeYear: true,
                //        format: "yyyy/mm/dd",
                //        language: "tr"
                //    });
                //});
    </script>
</asp:Content>
