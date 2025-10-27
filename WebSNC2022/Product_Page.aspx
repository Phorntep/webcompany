<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="Product_Page.aspx.vb" Inherits="WEBSNC2022.FeltPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section>
        <div class="container-fluid pt-5 pb-5">
            <div class="row ">
                <div class="  col-12   ">
                    <div class=" text-center">
                        <div>
                            <h1 style="font-size: 35px; color: #FFFFFF">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
            <div class="container marketing">
            </div>
            <div class=" container">
                <div class="row d-flex justify-content-center ">

    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">Our Team</p>
                <h1 class="display-5 mb-5">Product Line</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="Image/Products/Felt1.png" alt="" width="550" height="650">
                        <div class="team-text">
                            <h4 class="mb-0">Felt Sheet</h4>
                            <p class="text-primary">แผ่นกันความร้อน</p>
                            <div class="team-social d-flex">
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="Image/Products/HP2.png" alt="" width="550" height="650">
                        <div class="team-text">
                            <h4 class="mb-0">Hard Part</h4>
                            <p class="text-primary">ปั๊มขึ้นรูปแผ่นกันความร้อน</p>
                            <div class="team-social d-flex">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="Image/Products/melt1.png" alt="" width="550" height="650">
                        <div class="team-text">
                            <h4 class="mb-0">Mel Sheet</h4>
                            <p class="text-primary">แผ่นกันเสียง</p>
                            <div class="team-social d-flex">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->
                    

                </div>
            </div>
            <%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
        </div>
    </section>
</asp:Content>
