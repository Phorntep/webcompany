<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="Index.aspx.vb" Inherits="WEBSNC2022.Index1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header>
        <%--   <div class="container-fluid">
            <div class=" row text-light">
                <div class="col">
                    <p class="text-center " style="font-size: 72px;">WELCOME TO SNC SOUNDPROOF</p>
                </div>

            </div>
        </div>--%>
        <style>
  /* ทำฉากหลังโมดัลให้ดำและโปร่ง */
  .modal-backdrop.show {
    background-color: #000;
    opacity: .9; /* เข้ม/จาง ปรับได้ .6 - .95 */
  }

  /* ตัวกล่องป๊อปอัปโทนดำสุภาพ */
  #modalTribute .modal-content {
    background: #0e0e0e;  /* ดำหม่น */
    color: #f0f0f0;
    border: none;
    border-radius: 14px;
    box-shadow: 0 20px 60px rgba(0,0,0,.6);
  }

  /* เส้นแบ่งจาง ๆ */
  #modalTribute .modal-header,
  #modalTribute .modal-footer {
    border-color: rgba(255,255,255,.08) !important;
  }

  /* ปุ่มปิดและปุ่มดำ */
  #modalTribute .btn-close {
    filter: invert(1) opacity(.7);
  }
  #modalTribute .btn-dark {
    background: #1a1a1a;
    border-color: #1a1a1a;
  }
  #modalTribute .btn-dark:hover {
    background: #222;
    border-color: #222;
  }

  /* รูปให้ขอบจาง ๆ */
  #modalTribute img.img-fluid {
    border-radius: 10px;
    box-shadow: 0 0 0 1px rgba(255,255,255,.06), 0 10px 30px rgba(0,0,0,.5);
  }
</style>




        <!-- Carousel Start -->
        <div class="container-fluid p-0 wow fadeIn" data-wow-delay="0.1s">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="Image/image_factory/bg3.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8">
                                        <h1 class="display-1 text-white mb-5 animated slideInDown">WELLCOME TO SNC SOUNDPROOF</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="Image/image_factory/bg1.jpg" alt="Image">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-8">
                                        <h1 class="display-1 text-white mb-5 animated slideInDown">WELLCOME TO SNC SOUNDPROOF</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

    </header>

    <!-- Modal: Tribute -->
<div class="modal fade" id="modalTribute" tabindex="-1" aria-labelledby="modalTributeLabel"
     aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content border-0">
   

      <div class="modal-body">
        <div class="text-center mb-3">
          <img src="<%= ResolveUrl("~/Image/Image_Event/Queen/queen.png") %>" 
               alt="ภาพประกอบแสดงความอาลัย" class="img-fluid rounded" />
        </div>

       
      </div>

      <div class="modal-footer border-0 justify-content-center">
        <button type="button" class="btn btn-dark px-4" data-bs-dismiss="modal">Visit to website </button>
      </div>
    </div>
  </div>
</div>

<script>
// แสดงครั้งเดียวต่อวันด้วย localStorage
(function () {
  //const KEY = "snc_tribute_seen";
  //const today = new Date().toISOString().slice(0,10); // YYYY-MM-DD
  //const seen = localStorage.getItem(KEY);

  //function showModal() {
  //  // ต้องมี bootstrap.bundle.min.js ใน MasterPage
  //  var modal = new bootstrap.Modal(document.getElementById('modalTribute'));
  //  modal.show();
  //}

  // เปิดอัตโนมัติเมื่อโหลดหน้า (หน่วงเล็กน้อยให้ asset โหลดทัน)
  //document.addEventListener('DOMContentLoaded', function () {
    //if (seen !== today) {
      //setTimeout(showModal, 400);
      //localStorage.setItem(KEY, today);
    //}
    //});
    document.addEventListener('DOMContentLoaded', function () {
        var el = document.getElementById('modalTribute');
        if (el) {
            var modal = new bootstrap.Modal(el);
            // หน่วงเล็กน้อยเผื่อภาพ/asset ใหญ่
            setTimeout(function () { modal.show(); }, 300);
        }
    });
})();
</script>


    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-end">
                <div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s">
                    <img class="img-fluid rounded" data-wow-delay="0.1s" src="Image/Factory/SNC.png">
                </div>
                <div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s">
                    <div>
                        <img width="210" src="../img/icon/4.png" />
                    </div>

                    <h3>SNC SOUNDPROOF</h3>
                    <p class="mb-4">SNC formerly known as SNC Sound proof Co ., Ltd. was incorporated in Thailand on the 27th July 1994 with its principal activity in business is manufacturing of car. Vibration Damping Sheet an important products that use to protect noise in car. Hard Part (Insulator) made help to quiet engine noise and keep the heat. Resin Felt for heat insulation and sound insulation in automotive industry. As shown in the picture below are used in a vehicle.</p>
                    <p class="mb-4">We are ready to publish a policy for Occupational Health and Safety The Company is ready to publish health and Safety Policy Employees and the publish to know and understand the user of valuable resources .</p>


                </div>
                <div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="row g-5">
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <i class="fa fa-solar-panel fa-3x text-primary mb-3"></i>
                                <h4 class="mb-3">Clean Energy</h4>
                                <span>We use solar cells to reduce electricity consumption. This makes it cost-effective and environment-friendly.</span>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <i class="fa fa-check fa-3x text-primary mb-3"></i>
                                <h4 class="mb-3">It is reliable</h4>
                                <span>It has been trusted for more than 30 years as a manufacturer of materials for automobiles in Thailand.</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
    <!-- Facts Start -->
    <div class="container-fluid facts my-5 py-5" data-parallax="scroll" data-image-src="Image/image_factory/SNC1/IMG_20191207_092513.jpg">
        <div class="container py-5">
            <div class="row">
                <div class="col-sm-4 col-lg-2 text-center wow fadeIn" data-wow-delay="0.1s">
                    <img src="Image/Certification/iatf16949-iso9001_edited-03.jpg" class="d-block img-thumbnail  " style="height: 10rem; width: 10rem;" />

                </div>
                <div class="col-sm-4 col-lg-2 text-center wow fadeIn" data-wow-delay="0.3s">
                    <img src="Image/Certification/URS-3.png" class="d-block img-thumbnail rounded " style="height: 10rem; width: 15rem;" />

                </div>
                <div class="col-sm-4 col-lg-2 text-center wow fadeIn" data-wow-delay="0.5s">
                    <img src="Image/Certification/46ce866c2064d33.jpg" class="d-block img-thumbnail " style="height: 10rem; width: 15rem;" />

                </div>
                <div class="col-sm-4 col-lg-2 text-center wow fadeIn" data-wow-delay="0.7s">
                    <img src="Image/Certification/Cer_snc_1.jpg" style="height: 15rem; width: 10rem;" />

                </div>
                <div class="col-sm-4 col-lg-2 text-center wow fadeIn" data-wow-delay="0.9s">
                    <img src="Image/Certification/Cer-SNC_2.jpg" style="height: 15rem; width: 10rem;" />

                </div>
            </div>
        </div>
    </div>
    <!-- Facts End -->


    <section id="Activities">
        <div class="container-fluid pt-5 pb-5 bgcoloarfull">
            <div class="row ">
                <div class="  col-12   ">
                    <div class=" text-center text-dark">
                        <div>
                            <h1 style="font-size: 35px;">ACTIVITIES</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Service Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                        <p class="fs-5 fw-bold text-primary">Our Activity</p>
                        <h1 class="display-5 mb-5">let enjoy activity</h1>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="service-item rounded d-flex h-100">
                                <div class="service-img rounded">
                                    <img class="img-fluid" src="../Image/Image_Event/afforest 2022/IMG_5442.JPG" alt="">
                                </div>
                                <div class="service-text rounded p-5">
                                    <div class="btn-square rounded-circle mx-auto mb-3">
                                        <img class="img-fluid" src="img/icon/icon-3.png" alt="Icon">
                                    </div>
                                    <h4 class="mb-3">Afforest</h4>
                                    <p class="mb-4">The importance of reforestation projects is that human actions benefit the environment as a whole, which we at SNC Soundproof cooperate with and organize activities continuously.</p>
                                    <a class="btn btn-sm" href="../ActivityMain.aspx"><i class="fa fa-plus text-primary me-2"></i>Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="service-item rounded d-flex h-100">
                                <div class="service-img rounded">
                                    <img class="img-fluid" src="Image/Image_Event/CSR/CIMG0097.JPG" alt="">
                                </div>
                                <div class="service-text rounded p-5">
                                    <div class="btn-square rounded-circle mx-auto mb-3">
                                        <img class="img-fluid" src="img/icon/icon-6.png" alt="Icon">
                                    </div>
                                    <h4 class="mb-3">CSR</h4>
                                    <p class="mb-4">SNC Soundproof operates under ethical principles and good management, taking responsibility for society and the environment both inside and outside the organization. This leads to sustainable development.</p>
                                    <a class="btn btn-sm" href="../ActivityMain.aspx"><i class="fa fa-plus text-primary me-2"></i>Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="service-item rounded d-flex h-100">
                                <div class="service-img rounded">
                                    <img class="img-fluid" src="Image/Image_Event/travel/106.jpg" alt="">
                                </div>
                                <div class="service-text rounded p-5">
                                    <div class="btn-square rounded-circle mx-auto mb-3">
                                        <img class="img-fluid" src="img/icon/icon-5.png" alt="Icon">
                                    </div>
                                    <h4 class="mb-3">Travel</h4>
                                    <p class="mb-4">SNC Soundproof organizes an annual tourism event to give employees a break from their hard work.</p>
                                    <a class="btn btn-sm" href="../ActivityMain.aspx"><i class="fa fa-plus text-primary me-2"></i>Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="service-item rounded d-flex h-100">
                                <div class="service-img rounded">
                                    <img class="img-fluid" src="Image/Image_Event/sport/IMG20191221081836.jpg" alt="">
                                </div>
                                <div class="service-text rounded p-5">
                                    <div class="btn-square rounded-circle mx-auto mb-3">
                                        <img class="img-fluid" src="img/icon/icon-4.png" alt="Icon">
                                    </div>
                                    <h4 class="mb-3">Party</h4>
                                    <p class="mb-4">Annual celebrations or special occasions are held.</p>
                                    <a class="btn btn-sm" href="../ActivityMain.aspx"><i class="fa fa-plus text-primary me-2"></i>Read More</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="service-item rounded d-flex h-100">
                                <div class="service-img rounded">
                                    <img class="img-fluid" src="Image/Image_Event/5S/show.png" alt="">
                                </div>
                                <div class="service-text rounded p-5">
                                    <div class="btn-square rounded-circle mx-auto mb-3">
                                        <img class="img-fluid" src="img/icon/icon-8.png" alt="Icon">
                                    </div>
                                    <h4 class="mb-3">Internal Activities</h4>
                                    <p class="mb-4">Collect photos of activities in different interiors. </p>
                                    <a class="btn btn-sm" href="../ActivityMain.aspx"><i class="fa fa-plus text-primary me-2"></i>Read More</a>
                                </div>
                            </div>
                        </div>



                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="service-item rounded d-flex h-100">
                                <div class="service-img rounded">
                                    <img class="img-fluid" src="Image/Image_Event/Anniversary 25/IMG_4646.JPG" alt="">
                                </div>
                                <div class="service-text rounded p-5">
                                    <div class="btn-square rounded-circle mx-auto mb-3">
                                        <img class="img-fluid" src="img/icon/icon-2.png" alt="Icon">
                                    </div>
                                    <h4 class="mb-3">Anniversary</h4>
                                    <p class="mb-4">Celebrations due to the anniversary of the establishment of the company</p>
                                    <a class="btn btn-sm" href="../ActivityMain.aspx"><i class="fa fa-plus text-primary me-2"></i>Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Service End -->
        </div>


    </section>
    <section id="Customers">
        <div class="container-fluid pt-5 pb-5 bgcoloarfull">
            <div class="container">
                <div class="row ">
                    <div class="  col-12   ">
                        <div class=" text-center text-dark">
                            <div>
                                <h1 style="font-size: 35px;">Customers</h1>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row ">
                    <div class=" d-flex justify-content-center">
                        <div class="  border border-dark rounded-3">
                            <img src="Image/Customer/customer2.jpg" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section id="Contact">
        
            <div class="container">
                <div class="row g-5">
                    <div class="  col-12   ">
                        <div class=" text-center text-dark">
                            <div>
                                <h1 style="font-size: 35px;">Contact</h1>
                            </div>
                        </div>
                    </div>

                </div>

            
            <!-- Contact SNC 1 Start -->
            <div class="container-xxl py-5">
                <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s" style="min-height: 200px;">
                        <h3>SNC1</h3>
                        <p class="mb-4">700/302 Moo 6, Bangna-Trad Rd. Km. 57, Don Hua Lau, Muang Chonburi, Chonburi, 20000 </p>
                        <p class="mb-4">Thailand Tel : 0 3845 7081 - 088  </p>
                        <p class="mb-4">Fax.0 3845 7093</p>
                       
                    </div>

                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s" style="min-height: 200px;">
                        <div class="position-relative rounded overflow-hidden h-100">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3880.6702013242298!2d101.02740587596631!3d13.432729586926717!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x311d36f93143b529%3A0x5f4c21235bccabfa!2sSNC%20Sound%20Proof%20Company%20Limited!5e0!3m2!1sen!2sth!4v1708419616060!5m2!1sen!2sth" width="600" height="150" style="border: 0;"></iframe>
                        </div>
                    </div>

                </div>
                <!-- Contact SNC1 End -->
            </div>
                </div> 

            <!-- Contact SNC2 Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.6s" style="min-height: 200px;">
                            <h3>SNC2</h3>
                            <p class="mb-4">
                                700/398-399 Moo 6, Nong Mai Daeng, Muang Chonburi, Chonburi, 20000 (branch)
                    <p class="mb-4">Thailand Tel  : 0 3845 7700 - 702 </p>

                        </div>

                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s" style="min-height: 200px;">
                            <div class="position-relative rounded overflow-hidden h-100">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1372.0975070733477!2d101.02486430632493!3d13.419889845857615!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x311d365f0c1f7f4b%3A0x492710fea4872454!2sSNC%20Sound%20Proof!5e0!3m2!1sth!2sth!4v1708478027041!5m2!1sth!2sth" width="600" height="150" style="border: 0;"></iframe>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Contact SNC2 End -->
            </div>
        </div>
    </section>

    <!-- Modal -->
    <%-- <div class="modal fade" id="ModelNewyear" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-keyboard="false" data-bs-backdrop="static">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-center"  >
              <img src="https://cdn.pixabay.com/photo/2021/12/07/10/16/happy-new-year-6852876_960_720.jpg" class=" w-50" />
                </div>
                

            </div>
        </div>
    </div>
    <script type="text/javascript"> 
        function showModelHappyNewYear() {
            $('#ModelNewyear').modal('show');
        }
        window.onload = showModelHappyNewYear;

    </script>--%>
</asp:Content>
