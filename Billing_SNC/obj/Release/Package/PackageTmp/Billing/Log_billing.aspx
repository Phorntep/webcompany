<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Log_billing.aspx.vb" Inherits="Billing_SNC.Log_billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <link href="cssBill/cssBill_ALL.css" rel="stylesheet" />
    <link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />
    <br />
    <br />
    <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div style="margin: 0 auto; width: 100%;">
                        <div style="margin: 0 auto; width: 93%; text-align: center;">
                            <div style="margin: 0 auto; width: auto; height: auto; text-align: center; margin-top: 20px; border-radius: 15px; background-color: whitesmoke; padding-bottom: 30px; padding-top: 30px; padding-left: 30px; padding-right: 30px;">
                                <asp:Label runat="server" Text="Log Billing" Font-Size="52px"></asp:Label>
                                <br />
                                <br />
                                <div style="overflow: auto;">
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="100" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" 
                                       >
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="No.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Session">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="link_job" runat="server" Text='<%# Bind("Id") %>' CommandName="Jobload"></asp:LinkButton>
                                                    <%--<asp:Label ID="Label2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:Label>--%>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_factory" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100%" />
                                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Mode">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Mode") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_factory" runat="server" Text='<%# Bind("Mode") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100%" />
                                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                            </asp:TemplateField>
                                               <asp:TemplateField HeaderText="JobID">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("JobID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_factory" runat="server" Text='<%# Bind("JobID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100%" />
                                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Date ">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txt_Datetranfer" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy HH:mm:ss}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="link_Datetranfer" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy HH:mm:ss}") %>' CommandName="link_tranfer"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UserAction">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserAction") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_factory" runat="server" Text='<%# Bind("UserAction") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100%" />
                                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
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
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>


            

            <br />
            
            <br />
            <br />
            </div>
             </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
