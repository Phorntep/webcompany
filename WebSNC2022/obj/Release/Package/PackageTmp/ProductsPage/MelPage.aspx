<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="MelPage.aspx.vb" Inherits="WEBSNC2022.MelPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class=" container pt-5">
            <div class="col text-center">
                <h1>Mel</h1>
            </div>
            <div class="row p-1   bg-secondary ">
                <div class="col">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">

                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 5"></button>

                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item  active">
                                <img src="../Image/Products/Mel/m1.jpg" class="d-block w-auto rounded mx-auto " style="height: 600px;" />

                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Products/Mel/m2.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Products/Mel/m3.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Products/Mel/m4.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Products/Mel/m5.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Products/Mel/m6.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col mt-5 pb-5">
                    <h3>แผ่นกันความร้อน</h3>
                    <p>แผ่นกันเสียง ( ASPHALT SHEET หรือ MEL SHEET หรือ DAMPING SHEET ) ซึ่งจะผลิตที่โรงผลิต 2 ผลิตภัณฑ์ที่ผลิตจะขอเรียกว่า ASPHALT SHEET หรือ MEL SHEET หรือ DAMPING SHEET ซึ่งได้แยกประเภทตามสูตรการผลิตหรือตามมาตรฐานของลูกค้า</p>

                </div>
            </div>
        </div>
    </section>


</asp:Content>
