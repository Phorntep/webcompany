<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterpageBill.Master" CodeBehind="Billing_all1.aspx.vb" Inherits="Billing_SNC.Billing_all1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--****************************--%>
    <link href="Jquery/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="Jquery/bootstrap.min.css" rel="stylesheet" />
    <script src="Jquery/jquery-1.8.3.min.js"></script>
    <%--  <script src="Jquery/bootstrap-datetimepicker.js"></script>
    <script src="Jquery/bootstrap-datetimepicker.fr.js"></script>--%>
    <link href="cssBill/cssBill_ALL.css" rel="stylesheet" />
    <link href="cssBill/cssModel_manager_bill.css" rel="stylesheet" />
    <link href="cssBill/cssModel_openEditdateConfirm.css" rel="stylesheet" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <%--***********************************************--%>
            <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />--%>
            <%--<script src="//code.jquery.com/jquery-1.10.2.js"></script>--%>
            <%--<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>
            <%--***********************************************--%>

            <br />
            <br />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div style="margin: 0 auto; width: 100%; height: auto">
                        <div style="margin: 0 auto; width: 93%; text-align: center; height: 90%;">
                            <div style="margin: 0 auto; width: auto; height: auto; text-align: center; margin-top: 10px; border-radius: 15px; background-color: whitesmoke; padding-bottom: 30px; padding-top: 5px; padding-left: 30px; padding-right: 30px;">
                                <asp:Label runat="server" Text="Billing" Font-Size="52px"></asp:Label>
                                <br />

                                <div style="" runat="server" id="box_search">
                                    <asp:Label runat="server" Text="Company : "></asp:Label>
                                    <asp:TextBox runat="server" Text="" ID="txt_company"></asp:TextBox>

                                    &nbsp;&nbsp;
                                    <asp:CheckBox Text="Date Start : " ID="chk_use_date" runat="server" />

                                    <asp:TextBox runat="server" ID="txt_date_start" placeholder="YYYY/MM/DD" Class="form_datetime"></asp:TextBox>
                                    <asp:Label runat="server" Text="Date End : " Font-Bold="true"></asp:Label>
                                    <asp:TextBox runat="server" ID="txt_date_End" placeholder="YYYY/MM/DD" Class="form_datetime"></asp:TextBox>
                                    <%--<asp:Button runat="server" ID="btn_search" Text=" Search" class="btn_search" ClientIDMode="Static" OnClientClick="date();" OnClick="btn_search_Click" />--%>
                                    <asp:Button runat="server" ID="btn_search" Text=" Search" class="btn_search" ClientIDMode="Static" OnClick="btn_search_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                    <br />
                                    <asp:Button runat="server" CssClass="btn_confirm" ID="btn_confirm" Text="Confirm Tranfer" OnClick="btn_confirm_Click" />
                                    <asp:Button runat="server" CssClass="btn_editTranfer" ID="btnEditDateTranfer" Text="Edit Date Tranfer or Status tranfer" OnClick="btnEditDateTranfer_Click" />

                                </div>
                                <br />
                                <div style="overflow: auto; height: 700px">

                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="100" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                                        OnRowCommand="GridView1_RowCommand" ShowFooter="True" ShowHeader="true">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="No.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>

                                                <ItemStyle Font-Size="14px" />

                                            </asp:TemplateField >
                                            <asp:TemplateField HeaderText="Document No." >
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Docnumber") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="link_job" runat="server" Text='<%# Bind("Docnumber") %>' CommandName="Jobload" ></asp:LinkButton>
                                                    <%--<asp:Label ID="Label2" runat="server"  Text='<%# Bind("Docnumber") %>'></asp:Label>--%>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false"  />
                                                <ItemStyle HorizontalAlign="center" Wrap="False" Font-Size="14px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Company Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Factory") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <div style="width: 350px; overflow: auto;">
                                                        <asp:Label ID="lbl_factory" runat="server" Text='<%# Bind("Factory") %>'></asp:Label>
                                                    </div>

                                                </ItemTemplate>
                                                <HeaderStyle />
                                                <ItemStyle HorizontalAlign="Left" Wrap="False" Font-Size="14px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Amount">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txt_pay_total" runat="server" Text='<%# Bind("pay_total", "{0:n2}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_pay_total" runat="server" Text='<%# Bind("pay_total", "{0:n2}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" Wrap="False" Font-Size="14px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Create">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txt_createdate" runat="server" Text='<%# Bind("dateCreate", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_date" runat="server" Text='<%# Bind("dateCreate", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" Wrap="False" Font-Size="14px" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date Tranfer">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txt_Datetranfer" runat="server" Text='<%# Bind("Datetranfer", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="link_Datetranfer" runat="server" Text='<%# Bind("Datetranfer", "{0:dd-MM-yyyy}") %>' CommandName="link_tranfer"></asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle HorizontalAlign="center" Wrap="False" Font-Size="14px" />
                                            </asp:TemplateField>
                                            <%--                         <asp:TemplateField HeaderText="Money">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Amount_money", "{0:n2}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount_money", "{0:n2}") %>'></asp:Label>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Right" />
                         </asp:TemplateField>--%>
                                            <%-- <asp:TemplateField HeaderText="Bill Supplier">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("doc_supplier", "{0:n2}") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Eval("doc_supplier", "{0:n2}") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>--%>
                                            <%--  <asp:TemplateField HeaderText="Date upload">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("datetime_doc_supplier") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Eval("datetime_doc_supplier") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                         </asp:TemplateField>--%>

                                            <%-- <asp:TemplateField HeaderText="Pay" ShowHeader="False">
                             <ItemTemplate>
                                 <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="pay" Text="Confirm" />
                             </ItemTemplate>
                             <ControlStyle CssClass=" btn_pay" />
                         </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Status Receive">

                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" ImageUrl="~/Billing/Image_billing/icon/uncheck.png" />
                                                </ItemTemplate>
                                                <ControlStyle Width="30px" />
                                                <HeaderStyle Width="100%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status Tranfer">

                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" ImageUrl="~/Billing/Image_billing/icon/uncheck.png" />
                                                </ItemTemplate>
                                                <ControlStyle Width="30px" />
                                                <HeaderStyle Width="100%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Print">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="JobPrint" ImageUrl="~/Billing/Image_billing/icon/upload.png" Width="30px" Text="Upload Bill" />
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Confirm">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Text="Confirm" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk_confirm" runat="server" CausesValidation="false" />
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk_edit" runat="server" CausesValidation="false" ClientIDMode="Static" AutoPostBack="true" OnCheckedChanged="chk_edit_CheckedChanged1" Checked='<%# Eval("status_edit") %>' />
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Select Edit ">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk_editdateTranfer" runat="server" CausesValidation="false" ClientIDMode="Static" AutoPostBack="false" />
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="true" Width="200px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="image_delete" runat="server" CausesValidation="False" CommandName="Delete1" ImageUrl="~/Billing/Image_billing/icon/cancel.png" Text="Delete" OnClientClick="Confirm_delete();" />
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
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <%--  <div style="width: 100%">
                <div style="margin: 0 auto; width: 100px">
                    <asp:Button runat="server" CssClass="btn_confirm" ID="btn_confirm" Text="CONFIRM" OnClick="btn_confirm_Click" />
                </div>
            </div>--%>




            <br />
            <br />
            </div>
        
          <%--*****************************************************--%>
            <div id="myModalEditDateconfirm" class="modalEditdateConfirm">

                <!-- Modal content -->
                <div class="modalEditdateConfirm-content">
                    <div class="modalEditdateConfirm-header">

                        <h2>Edit Date tranfer or status tranfer.</h2>
                    </div>

                    <div style="width: 80%; height: 0 auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px;">


                        <%--***************************************************--%>
                        <%--<div style="width: 90%; height: 50px; margin: 0 auto; text-align: center; margin-top: 10px; background-color: #f7f7f7;" >--%>
                        <div class ="tab">
                            <%--<div style="line-height: 1.9; text-align: left; padding-left: 2em;">--%>
                            <div   onload="openCity(event, 'Edit_date_Tranfer');" >                       
                                 
                                <asp:Button runat="server" ID="Edit_date_Tranfer1" Text="Edit date Tranfer" ClientIDMode="Static" CssClass="tab_button tablinks" OnClientClick="openCity(event, 'Edit_date_Tranfer');return false;" />
                                <asp:Button runat="server" ID="Edit_date_Tranfer2" Text="Edit Status Tranfer" ClientIDMode="Static" CssClass="tab_button tablinks" OnClientClick="openCity(event, 'Edit_Status_Tranfer');return false;" />
                                
                            </div>
                        </div>
                        <%--<div style="width: 90%; height: auto; margin: 0 auto; text-align: center; background-color: #ffffff; border-radius: 0px 0px 5px 5px; border: 0.5px solid #808080; padding-top: 20px;">--%>
                        <div id="Edit_date_Tranfer" class="tabcontent">
                            <div style="width: 70%; margin: 0 auto; border: 1px solid black; overflow: auto;">
                            
                                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" PageSize="100" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true">
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
                                                <asp:LinkButton ID="link_job" runat="server" Text='<%# Bind("Docnumber") %>'></asp:LinkButton>
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
                                            <HeaderStyle />
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
                            <div style="width: 100%; margin: 0 auto; height: auto; border: 1px solid groove; border-radius: 0px 0px 0px 0px;">
                                <div style="margin-left: 100px; text-align: center; padding-top: 10px; float: left;">
                                    <asp:Label runat="server" Text="Date Tranfer : " Font-Size="25px"></asp:Label>
                                </div>
                                <div style="text-align: left; padding-top: 10px; float: left;">
                                    <asp:TextBox runat="server" ID="txt_date_tranfer" placeholder="YYYY/MM/DD" Font-Size="20px" Class="form_datetime" Width="200px"></asp:TextBox>

                                    <font style="color: red; font-size: 25px;">**</font>
                                </div>
                                <div style="clear: left;">
                                </div>
                            </div>
                            <br />
                            <div style="width: 80%; height: auto; margin: 0 auto; padding-bottom: 50px;">
                                <asp:Button runat="server" ID="btn_edit" Text="Edit" ClientIDMode="Static" OnClick="btn_edit_Click" UseSubmitBehavior="false" OnClientClick="Confirm_tranfer();" class="Editebtn" />
                                <asp:Button runat="server" ID="btn_cancel" Text="Cancel" ClientIDMode="Static" UseSubmitBehavior="false" OnClientClick="Close_model();return false;" class="cancelbtn" />

                            </div>


                        </div>
                         <div id="Edit_Status_Tranfer" class="tabcontent">
                               <div style="width: 70%; margin: 0 auto; border: 1px solid black; overflow: auto;">
                            
                                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" PageSize="100" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true">
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
                                                <asp:LinkButton ID="link_job" runat="server" Text='<%# Bind("Docnumber") %>'></asp:LinkButton>
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
                                            <HeaderStyle />
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
                              <br />
                             
                             <div style="width: 80%; height: auto; margin: 0 auto; padding-bottom: 50px;">
                                <asp:Button runat="server" ID="btn_edit_status_tranfer" Text="Edit" ClientIDMode="Static" OnClick="btn_edit_status_tranfer_Click" UseSubmitBehavior="false" OnClientClick="Confirm_tranfer();" class="Editebtn" />
                                <asp:Button runat="server" ID="Button2" Text="Cancel" ClientIDMode="Static" UseSubmitBehavior="false" OnClientClick="Close_model();return false;" class="cancelbtn" />

                            </div>
                             </div>
                        <br />
                        <br />
                        <div></div>
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
                var modal = document.getElementById("myModalEditDateconfirm");
                // Get the button that opens the modal
                var btn = document.getElementById("myBtn");

                // Get the <span> element that closes the modal
                //var span = document.getElementsByClassName("close")[0];

                // When the user clicks the button, open the modal 
                //btn.onclick = function () {

                //    modal.style.display = "block";
                //}
                function OpenModel() {
                    var modal1 = document.getElementById("myModalEditDateconfirm");
                    modal1.style.display = "block";
                }
                function Close_model() {
                    var modal1 = document.getElementById("myModalEditDateconfirm");
                    modal1.style.display = "none";
                }

                // When the user clicks on <span> (x), close the modal
                //span.onclick = function () {
                //    modal.style.display = "none";
                //}

                function alert_uploaded() {
                    alert("Billed !!!")
                    window.location.href = 'index.aspx';

                }
                function Alert_status_not_confirm() {
                    alert("This job not print because status not Confirm!!!")


                }

                function Confirm_check() {
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

                function Confirm_tranfer() {
                    var confirm_value = document.createElement("INPUT");
                    confirm_value.type = "hidden";
                    confirm_value.name = "confirm_value";
                    if (confirm("Are you sure Edit ?")) {
                        confirm_value.value = "Yes";
                    } else {
                        confirm_value.value = "No";
                    }
                    document.forms[0].appendChild(confirm_value);
                }

                function openCity(evt, cityName) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " active";
                }

            </script>

            <%-- <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
            <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
            <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />--%>
            <!-- Bootstrap -->
            <!-- Bootstrap DatePicker -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
            <!-- Bootstrap DatePicker -->
            <script type="text/javascript">
                $(function () {
                    $(".form_datetime").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        format: "yyyy/mm/dd",
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
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
