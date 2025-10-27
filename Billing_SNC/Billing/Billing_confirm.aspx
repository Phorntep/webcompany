<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Billing_confirm.aspx.vb" Inherits="Billing_SNC.Billing_confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="cssBill/cssBill_ALL.css" rel="stylesheet" />
    <link href="cssBill/cssComfirm.css" rel="stylesheet" />
    <div id="myModal" class=" ">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <%--<span class="close">&times;</span>--%>
                <%--<span class="close" onclick="Close_model();" ><asp:Label Text="&times;" runat="server" ></asp:Label></span>--%>

                <h2>Confirm Invoice</h2>
            </div>
            <div style="width: 90%; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                    <asp:Label runat="server" Text="Confirm Invoice" Font-Size="24px"></asp:Label>
                </div>
            </div>
            <div style="width: 90%; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080; padding-top: 20px">
                <div style="width: 70%; margin: 0 auto; border: 1px solid black">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" PageSize="100" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Document No.">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Docnumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="link_job" runat="server" Text='<%# Bind("Docnumber") %>' CommandName="Jobload"></asp:LinkButton>
                                    <%--<asp:Label ID="Label2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:Label>--%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" />
                                <ItemStyle HorizontalAlign="center" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Factory">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Factory") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_factory2" runat="server" Text='<%# Bind("Factory") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100%" />
                                <ItemStyle HorizontalAlign="center" Wrap="False" />
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
                <div style="width: 1000px; margin: 0 auto; height: auto; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                    <div style="text-align: right; padding-top: 10px; float: left; width: 300px;">
                        <asp:Label runat="server" Text="Date Tranfer : " Font-Size="25px"></asp:Label>
                    </div>
                    <div style="text-align: left; padding-top: 10px; float: left;">
                        <asp:Calendar ID="Calendar1" runat="server" Visible="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        <asp:TextBox runat="server" ID="txt_date_invoice" Text="" Enabled="false" Font-Size="25px" CssClass="txtbox_supplier"></asp:TextBox>
                        <asp:LinkButton Text="Get date" runat="server" ID="lnk_get_date" OnClick="lnk_get_date_Click"></asp:LinkButton>
                        <font style="color: red; font-size: 25px;">**</font>
                    </div>
                    <div style="clear: left;">
                    </div>
                </div>

                <br />
                <asp:Button runat="server" ID="btn_confirm_check" Text="Confirm" ClientIDMode="Static" OnClick="btn_confirm_check_Click" UseSubmitBehavior="false" OnClientClick="Confirm_tranfer();" class="btn_confirm" />
                <br />
                <br />

            </div>

            <br />
            <br />
        </div>
        <br />
        <br />
    </div>
    <script>
        function Confirm_tranfer() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want Confirm ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
