<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="PageOfYear2022.aspx.vb" Inherits="WEBSNC2022.PageOfYear2022" %>
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
                            <span class="link_name">กิจกรรมแต่ละเดือน</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow'></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">กิจกรรมปี 2022</a></li>
                        <li><a href="Reforestation2022.aspx">ปลูกป่า 2022</a></li>                        
                        <li><a href="ToyotaExecutivesVisitSNC2022.aspx">Toyota Excusive Visit 2022</a></li>
                        
                    </ul>
                </li>
            </ul>
        </div>

        <section class="home-section">
            <div class="home-content">
                <i class='bx bx-menu'></i>
                <span class="text">ACTIVITIES OF 2022</span>
            </div>

               <div class="container-fluid pt-5 pb-5 ">
                <div class="row ">
                </div>
                <div class=" container">
                    <div class="row row-cols-md-1 row-cols-sm-1 row-cols-lg-3 g-4 pt-5 d-flex justify-content-center">                 
                                     
                        <div class="col zoom_img">
                            <a href="ToyotaExecutivesVisitSNC2022.aspx" />
                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5324.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Visit SNC 2022</h5>
                                    <p class="card-text">Toyota Executives Visit SNC 2022 </p>

                                    <a href="ToyotaExecutivesVisitSNC2022.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>

                                </div>
                            </div>
                        </div>
                        <div class="col zoom_img">
                            <a href="Reforestation2022.aspx"/>
                            <div class="card" style="border-radius: 1.5em 1.5em 1.5em 1.5em;">
                                <img src="../Image/Image_Event/afforest 2022/IMG_5442.JPG" class="card-img-top" style="height: 16rem; border-radius: 1.5em 1.5em 0em 0em;" />
                                <div class="card-body">
                                    <h5 class="card-title">Reforestation</h5>
                                    <p class="card-text">กิจกรรม ปลูกป่า 2022 </p>

                                    <a href="Reforestation2022.aspx" class="btn btn-primary">ดูเพิ่มเติม</a>

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
