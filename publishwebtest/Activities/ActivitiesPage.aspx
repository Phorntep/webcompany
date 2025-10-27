<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="ActivitiesPage.aspx.vb" Inherits="WEBSNC2022.ActivitiesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <span class="link_name">รวมกิจกรรมทั้งหมด</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="#">รวมกิจกรรมทั้งหมด</a></li>
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
                        <li><a class="link_name" href="#">ปี</a></li>
                        <li><a href="PageOfYear2019.aspx">ปี 2019</a></li>                                               
                        <li><a href="PageOfYear2022.aspx">ปี 2022</a></li>
                      
                    </ul>
                </li>
            </ul>
        </div>

        <section class="home-section">
            <div class="home-content">
                <i class='bx bx-menu'></i>
                <span class="text">ACTIVITIES</span>
            </div>

            <div class="container-fluid pt-5 pb-5 ">
                <div class="row ">
                </div>
                <div class=" container">
                    <div class="row row-cols-md-1 row-cols-sm-1 row-cols-lg-3 g-4 pt-5 d-flex justify-content-center">
                        <div class="col zoom_img">
                            <a href="5sPage.aspx" />
                            <div class="card " style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/5S/5sV2.png" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">5 ส</h5>
                                    <p class="card-text">กิจกรรม 5 ส</p>
                                    <a href="5sPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>
                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                            <a href="ReforestationPage.aspx"/> 
                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/Afforest/IMG_0173.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Reforestation</h5>
                                    <p class="card-text">กิจกรรม ปลูกป่า </p>

                                    <a href="Activities/ReforestationPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>

                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                             <a href="25yearPage.aspx"/>
                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">

                                <img src="../Image/Image_Event/Anniversary%2025/IMG_4646.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Anniversary 25 Year</h5>
                                    <p class="card-text">งานเลี้ยงครบ 25 ปี</p>

                                    <a href="Activities/25yearPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>
                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                            <a href="sportAndpartyPage.aspx"/>
                            <div class="card  " style="border-radius: 1.5em 1.5em 1.5em 1.5em;">

                                <img src="../Image/Image_Event/sport/IMG20191221081836.jpg" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Sport Day & New Year Party</h5>
                                    <p class="card-text">งานกีฬาสี และ งานเลี้ยงปีใหม่</p>

                                    <a href="Activities/sportAndpartyPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>
                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                             <a href="FireDillPage.aspx"/>
                            <div class="card  " style="border-radius: 1.5em 1.5em 1.5em 1.5em;">

                                <img src="../Image/Image_Event/Fire_drill1/IMG_25621206_142746.jpg" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Fire Dill</h5>
                                    <p class="card-text">ซ้อมดับเพลิง</p>

                                    <a href="Activities/FireDillPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>
                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                            <a href="SocialContributionPage.aspx"/>
                            <div class="card  " style="border-radius: 1.5em 1.5em 1.5em 1.5em;">

                                <img src="../Image/Image_Event/CSR/CIMG0096.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Social contribution</h5>
                                    <p class="card-text">กิจกรรม อาสา</p>

                                    <a href="Activities/SocialContributionPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>
                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                            <a href="CompanyTripPage.aspx"/>
                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/travel/106.jpg" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Company Trip 2019</h5>
                                    <p class="card-text">เที่ยวบริษัท</p>

                                    <a href="Activities/CompanyTripPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>
                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">


                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5324.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Visit SNC 2022</h5>
                                    <p class="card-text">Toyota Executives Visit SNC 2022 </p>

                                    <a href="Activities/ReforestationPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>

                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                            <a href="Activities/ReforestationPage.aspx" />
                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/afforest 2022/IMG_5442.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Reforestation</h5>
                                    <p class="card-text">กิจกรรม ปลูกป่า 2022 </p>

                                    <a href="Activities/ReforestationPage.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
