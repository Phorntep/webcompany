<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="Reforestation2022.aspx.vb" Inherits="WEBSNC2022.Reforestation2022" %>
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
                <span class="text">ACTIVITIES</span>
            </div>

             <section class="bgpicture">

        
        <div class=" container pt-5 pb-5">
            <div class="col text-center">
                <h1>Reforestation 2022</h1>
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
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 4"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7" aria-label="Slide 4"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="8" aria-label="Slide 4"></button>
                       
                        </div>
                        <div class="carousel-inner ">
                            <div class="carousel-item active">
                                <img src="../Image/Image_Event/afforest 2022/IMG_5442.JPG" class="d-block w-auto rounded mx-auto" style="height:600px;"/>
                                
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Image_Event/afforest 2022/IMG_5447.JPG" class="d-block w-auto rounded mx-auto" style="height:600px;"/>
                               
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Image_Event/afforest 2022/IMG_5448 (1).JPG" class="d-block w-auto rounded mx-auto" style="height:600px;"/>
                                 
                            </div>
                            <div class="carousel-item">
                                <img src="../Image/Image_Event/afforest 2022/IMG_5449.JPG" class="d-block w-auto rounded mx-auto" style="height:600px;"/>
                                
                            </div>
                             <div class="carousel-item">
                                 <img src="../Image/Image_Event/afforest 2022/IMG_5452.JPG" class="d-block w-auto rounded mx-auto" style="height:600px;"  />                               
                                 
                            </div>
                              <div class="carousel-item">
                                  <img src="../Image/Image_Event/afforest 2022/IMG_5459.JPG"  class="d-block w-auto rounded mx-auto" style="height:600px;"  />
                                  
                            </div>
                             <div class="carousel-item">
                                  <img src="../Image/Image_Event/afforest 2022/IMG_5461.JPG"  class="d-block w-auto rounded mx-auto" style="height:600px;"  />
                                  
                            </div>
                             <div class="carousel-item">
                                  <img src="../Image/Image_Event/afforest 2022/IMG_5469.JPG" class="d-block w-auto rounded mx-auto" style="height:600px;"  />
                                  
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
