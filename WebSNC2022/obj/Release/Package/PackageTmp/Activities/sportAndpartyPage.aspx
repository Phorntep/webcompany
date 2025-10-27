<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="sportAndpartyPage.aspx.vb" Inherits="WEBSNC2022.sportAndpartyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style >
        .sizecavas{
            border-radius :0.5em 0.5em 0.5em 0.5em;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">

        <div class="sidebar close ">

            <div class="logo-details">
            </div>
      <ul class="nav-links">
                <li>
                    <a href="ActivitiesPage.aspx">
                        <i class='bx bx-grid'></i>
                        <span class="link_name">รวมกิจกรรมประจำปี</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">กิจกรรมประจำปี</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="#">
                            <i class='bx bx-collection'></i>
                            <span class="link_name">กิจกรรมแต่ละปี</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                       <li><a class="link_name" href="#">รายการกิจกรรม</a></li>
                         <li><a href="25yearPage.aspx">ครบรอบ 25 ปี  SNC</a></li>                        
                        <li><a href="5sPage.aspx">กิจกรรม 5 ส.</a></li>
                        <li><a href="ReforestationPage.aspx">ปลูกป่า 2019</a></li>
                        <li><a href="FireDillPage.aspx">ซ้อมรับมือเพลิงไหม้ 2019</a></li>
                        <li><a href="sportAndpartyPage.aspx">กีฬาสีและงานฉลองขึ้นปีใหม่</a></li>
                        <li><a href="SocialContributionPage.aspx">กิจกรรมจิตอาสาช่วยเหลือสังคม</a></li>
                        <li><a href="CompanyTripPage.aspx">ท่องเที่ยว</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <section class="home-section">
            <div class="home-content">
                <i class='bx bx-menu'></i>
                <span class="text">ACTIVITIES</span>
            </div>

            <section class="bgpicture">



                <div class=" container pt-5 pb-5">
                    <div class="col text-center">
                        <h1>Sport Day & Happy New year</h1>
                    </div>
                    <div class="row p-2 border-5 bg-secondary bg-opacity-75 sizecavas ">
                        <div class="col ">
                            <div id="carouselExampleIndicators" class="carousel slide " data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="8" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="9" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="10" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="11" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="12" aria-label="Slide 4"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="13" aria-label="Slide 4"></button>


                                </div>
                                <div class="carousel-inner ">
                                    <div class="carousel-item active">
                                        <img src="../Image/Image_Event/sport/IMG20191221075239.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081231.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081255.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081300.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081322.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081350.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081754.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221081836.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221083530.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221085049.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221085220.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221170000.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221175140.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
                                    </div>
                                    <div class="carousel-item  ">
                                        <img src="../Image/Image_Event/sport/IMG20191221175154.jpg" class="d-block w-auto rounded mx-auto" style="height: 600px;" />
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

                </div>
            </section>



        </section>
        <script>
            let arrow = document.querySelectorAll(".arrow");
            for (var i = 0; i < arrow.length; i++) {
                arrow[i].addEventListener("click", (e) => {
                    let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
                    arrowParent.classList.toggle("showMenu");
                });
            }
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".bx-menu");
            console.log(sidebarBtn);
            sidebarBtn.addEventListener("click", () => {
                sidebar.classList.toggle("close");
            });
        </script>
    </div>

</asp:Content>
