<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Add_Payment_Main.aspx.vb" Inherits="Billing_SNC.Add_Payment_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div style="width: 100%; height: auto;">
        <div>
            <div style="margin: 0 auto; width: 1000px; height: auto; text-align: center; border: 1px solid black; margin-top: 70px; border-radius: 15px; background-color: whitesmoke; padding-bottom: 30px; padding-top: 30px;">
                <font style="text-align: center; color: black; font-size: 45px;">Add Payment</font>
                <br />
                <br />
                <div style="width: 300px; float: left;">
                    <asp:Label runat="server" Text="Number Sequence: "></asp:Label>
                    <asp:DropDownList ID="dd_Seqeunce" runat="server" Width="110px">
                    </asp:DropDownList>
                </div>
                <div style="width: 300px; float: left;">
                    <asp:Label runat="server" Text="Name Payment: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtnamePay"></asp:TextBox>
                </div>
                <div style="width: 300px; float: left;">
                    <asp:Label runat="server" Text="File : "></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div style="clear: left;"></div>
                <br />
                <div style="margin: 0 auto; width: 100%">
                    <asp:Button runat="server" ID="btn_upload" Text="Upload" OnClick="btn_upload_Click" ClientIDMode="Static" OnClientClick="Confirm_upload();" />
                </div>
            </div>
            <div style="margin: 0 auto; width: 1000px; height: auto; text-align: center; border: 1px solid black; margin-top: 20px; border-radius: 15px; background-color: whitesmoke; padding-bottom: 30px; padding-top: 30px; padding-left: 30px; padding-right: 30px;">
                <font style="text-align: center; color: black; font-size: 45px;">Payment</font>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ClientIDMode="Static" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name payment">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NameBill") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("NameBill") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100%" Wrap="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name File">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FilePDF") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("FilePDF") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100%" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="Confirm_confirm_delete();" ClientIDMode="Static"></asp:LinkButton>
                            </ItemTemplate>
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
                <br />
                <asp:Button runat="server" Text="Delete ALL" ID="btn_delete_all" OnClick="btn_delete_all_Click" OnClientClick="Confirm_confirm_delete_all();" />
            </div>
        </div>
    </div>
    <script>
        function alert_Tpyefile() {
            alert("File type only .PDF")
            //window.location.href = 'Add_Payment_Main.aspx';
        } function alert_selectnumber() {
            alert("Please select number or key name payment !!!")
            //window.location.href = 'Add_Payment_Main.aspx';
        }
        function alert_Complete_upload() {
            alert("File type only .PDF")
            //window.location.href = 'Add_Payment_Main.aspx';
        }
        function Confirm_upload() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want upload ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        function Confirm_confirm_delete() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want upload ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        function Confirm_confirm_delete_all() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want Delete All ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
