<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Billing_all.aspx.vb" Inherits="Billing_SNC.Billing_all" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="cssBill/cssBill_ALL.css" rel="stylesheet" />
    <link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
<br />
<br />
<br />
    <div style="margin:0 auto; width:100%;">
        <div style="margin:0 auto; width:93%;text-align:center;">
            <div style="margin: 0 auto; width: auto; height: auto; text-align: center;  margin-top: 20px; border-radius: 15px; background-color: whitesmoke; padding-bottom: 30px; padding-top: 30px; padding-left: 30px; padding-right: 30px; ">
                <asp:Label runat="server" Text="Billing" Font-Size="52px" ></asp:Label>
                <br />
                <br />
                <div style="overflow:auto;" >
                 <%--<asp:GridView ID="GridView1" runat="server"   AllowPaging = "True" PageSize="100" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                     OnRowCommand="GridView1_RowCommand">
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                              
                            </asp:TemplateField>
                         <asp:TemplateField HeaderText="Document No.">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Factory">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Factory") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("Factory") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Width="100%" />
                             <ItemStyle HorizontalAlign="Left" Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Money">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Amount_money", "{0:n2}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount_money", "{0:n2}") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bill Supplier">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("doc_supplier", "{0:n2}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Eval("doc_supplier", "{0:n2}") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Date upload">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("datetime_doc_supplier") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Eval("datetime_doc_supplier") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Upload Bill">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="upload" ImageUrl="~/Billing/Image_billing/icon/upload.png" Width="30px" Text="Upload Bill" />
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Pay" ShowHeader="False">
                             <ItemTemplate>
                                 <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="pay" Text="Confirm" />
                             </ItemTemplate>
                             <ControlStyle CssClass=" btn_pay" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Status">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" ImageUrl="~/Billing/Image_billing/icon/uncheck.png" />
                             </ItemTemplate>
                             <ControlStyle Width="35px" />
                             <HeaderStyle Width="100%" />
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
                     </asp:GridView>--%>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped " aria-describedby="example_info" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                     OnRowCommand="GridView1_RowCommand" OnPreRender="GridView1_PreRender" >
                     <AlternatingRowStyle BackColor="White" />
                     <Columns>
                         <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                              
                            </asp:TemplateField>
                         <asp:TemplateField HeaderText="Document No.">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Factory">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Factory") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("Factory") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Width="100%" />
                             <ItemStyle HorizontalAlign="Left" Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Money">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Amount_money", "{0:n2}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount_money", "{0:n2}") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Bill Supplier">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("doc_supplier", "{0:n2}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Eval("doc_supplier", "{0:n2}") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Date upload">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("datetime_doc_supplier") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Eval("datetime_doc_supplier") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Upload Bill">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="upload" ImageUrl="~/Billing/Image_billing/icon/upload.png" Width="30px" Text="Upload Bill" />
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Pay" ShowHeader="False">
                             <ItemTemplate>
                                 <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="pay" Text="Confirm" />
                             </ItemTemplate>
                             <ControlStyle CssClass=" btn_pay" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Status">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" ImageUrl="~/Billing/Image_billing/icon/uncheck.png" />
                             </ItemTemplate>
                             <ControlStyle Width="35px" />
                             <HeaderStyle Width="100%" />
                         </asp:TemplateField>
                     </Columns>
                     
                     </asp:GridView>
                    </div>
            </div> 
            </div>
    </div>
     <br />
     <br />
     <br />
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <%--<span class="close">&times;</span>--%>
                <%--<span class="close" onclick="Close_model();" ><asp:Label Text="&times;" runat="server" ></asp:Label></span>--%>
                <span>
                    <asp:Button runat="server" ID="btn_close" ClientIDMode="Static" class="close" OnClick="btn_close_Click" Text="&times;" /></span>
                <h2>Upload Bill supllier</h2>
            </div>
            <div style="width: 650px; height: 50px; margin: 0 auto; text-align: center; margin-top: 60px; background-color: #f7f7f7; border-radius: 5px 5px 0px 0px; border: 0.5px solid #808080; border-bottom: none;">
                <div style="line-height: 1.9; text-align: left; padding-left: 2em;">
                    <asp:Label runat="server" Text="Upload File" Font-Size="24px"></asp:Label>
                </div>
            </div>
            <div style="width: 650px; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080; padding-top: 20px">
                <div style="float: left; width: 280px; text-align: right;">
                    <asp:Label runat="server" Text="Document No. : "></asp:Label>
                    <br />
                    <br />
                    <asp:Label Text="File name : " runat="server"></asp:Label>
                </div>
                <div style="text-align: left;">
                    <asp:TextBox runat="server" Text="" ID="txt_Doc_number" Enabled="false"></asp:TextBox>
                    <br />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <br />
                <asp:Button runat="server" ID="btn_save_upload_file_supplier" Text="Upload" OnClick="btn_save_upload_file_supplier_Click" />                 
                <br />
                <br />
            </div>
            <br />
            <br />
        </div>
        <br />
        <br />
    </div>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#<%= GridView1.ClientID %>').DataTable();
 
        });

        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        //btn.onclick = function () {

        //    modal.style.display = "block";
        //}
        function OpenModel() {
            var modal1 = document.getElementById("myModal");
             modal1.style.display = "block";
        }
        function Close_model() {
            var modal1 = document.getElementById("myModal");
             modal1.style.display = "none";
        }
        
        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

         function alert_uploaded() {
            alert("Billed !!!") 
             window.location.href = 'index.aspx';
        
        }
    </script>
</asp:Content>
