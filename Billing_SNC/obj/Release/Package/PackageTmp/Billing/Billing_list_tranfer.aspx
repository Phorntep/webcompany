<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Billing_list_tranfer.aspx.vb" Inherits="Billing_SNC.Billing_list_tranfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <link href="cssBill/cssBill_ALL.css" rel="stylesheet" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="width: 100%; height: auto; margin: 0 auto;">
        <div style="width: 1200px; margin: 0 auto; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 12px 40px 0 rgba(0,0,0,0.19); background-color: aliceblue; padding-bottom: 30px;">
            <div style="width: 100%; margin: 0 auto; border: 1px solid groove; padding: 2px 16px; background-color: #5cb85c; color: white;">
                <asp:Label runat="server" Text="Report Tranfer" Font-Size="40px"></asp:Label>

            </div>
            <div style="width: 100%; height: auto; margin: 0 auto; " >
                <div style="text-align: left; padding-top: 30px;padding-left:100px; float: left; width: 200px;">
                    <asp:Label runat="server" Text="Job ID : " Font-Size="25px"></asp:Label>
                </div>
                 <div style="text-align: left; padding-top: 30px; float: left; width: 200px;">
                    <asp:Label runat="server" Text="xxxx" Font-Size="25px" ID="lbl_Job_id"></asp:Label>
                </div>
                 <div style="text-align: right; padding-top: 30px; float: left; width: 120px;">
                    <asp:Label runat="server" Text="Factory : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 30px; float: left; width: auto;">
                    <asp:Label runat="server" Text="xxxx" Font-Size="25px" ID="lbl_fac"></asp:Label>
                </div>
                   <div style="clear: left;">
                </div>
            </div>
             <div style="width: 100%; height: auto; margin: 0 auto;">
                <div style="text-align: left; padding-top: 15px;padding-left:100px; float: left; width: 200px;">
                    <asp:Label runat="server" Text="Address : " Font-Size="25px"></asp:Label>
                </div>
                 <div style="text-align: left; padding-top: 15px; float: left; width: 200px;">
                    <asp:Label runat="server" Text="xxxx" Font-Size="25px" ID="lbl_address"></asp:Label>
                </div>
                 <div style="clear: left;">
                </div>
            </div>
              <div style="width: 100%; height: auto; margin: 0 auto;">
                <div style="text-align: left; padding-top: 15px;padding-left:100px; float: left; width: 200px;">
                    <asp:Label runat="server" Text="Supplier : " Font-Size="25px"></asp:Label>
                </div>
                 <div style="text-align: left; padding-top: 15px; float: left; width: 200px;">
                    <asp:Label runat="server" Text="xxxx" Font-Size="25px" ID="lbl_supplier"></asp:Label>
                </div>
                 
                 <div style="clear: left;">
                </div>
            </div>
       
          
          <%--  <div style="width: 1000px; margin: 0 auto; height: auto; background-color: aliceblue; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                <div style="text-align: right; padding-top: 30px; float: left; width: 300px;">
                    <asp:Label runat="server" Text="Job ID : " Font-Size="25px"></asp:Label>
                </div>
                <div style="text-align: left; padding-top: 30px; float: left;">
                    <asp:TextBox runat="server" ID="txt_job_id" Text="" Enabled="false" Font-Size="25px" CssClass="txtbox_supplier"></asp:TextBox>

                </div>
                <div style="clear: left;">
                </div>
            </div>--%>
             <div style="text-align:center;"> 
                    <h3>Tranfer</h3>
                </div>
            <div style="margin: 0 auto; width: 80%; border: 1px solid;">
                
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" ShowFooter="True" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Date Invoice" FooterStyle-HorizontalAlign="Center">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date_invoice", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date_invoice", "{0:dd-MM-yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Invoice Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Number_invoice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Number_invoice") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                      
                       
                     
                          <asp:TemplateField HeaderText="Tranfer Total"   >
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_total" runat="server" Text='<%# Bind("total_money", "{0:n2}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_total" runat="server" Text='<%# Bind("total_money", "{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                               <FooterStyle HorizontalAlign="Right" />
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
                <div style="margin-top:15px;margin-bottom:15px; width:100%; text-align:center;">
                    <asp:Button runat="server" ID="btn_print" Text="Print Tranfer" OnClick="btn_print_Click" CssClass="btn_confirm" />
                </div> 
            </div> 
            <br /> 
            <br />
           <hr />

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
        function alert_owner_job() {
            alert("This job not open because you not owner!!!!") 
        }
    </script>
</asp:Content>
