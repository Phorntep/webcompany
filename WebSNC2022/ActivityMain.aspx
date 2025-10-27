<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterIndexPageForm01.Master" CodeBehind="ActivityMain.aspx.vb" Inherits="WEBSNC2022.ActivityMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .crop-container {
            width: 200px;
            height: 300px;
            overflow: hidden;
        }

            .crop-container img {
                margin-top: -100px;
                margin-left: -200px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">

                <h1 class="display-5 mb-5">SNC SOUNDPROOF</h1>

                <p class="fs-5 fw-bold text-primary">Various activities that the company organizes for our employees</p>
            </div>
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline rounded mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter="*">All</li>
                        <li class="mx-2" data-filter=".first">Afforest</li>
                        <li class="mx-2" data-filter=".second">CSR</li>
                        <li class="mx-2" data-filter=".third">Travel</li>
                        <li class="mx-2" data-filter=".fourth">Internal Activities</li>
                        <li class="mx-2" data-filter=".fifth">Anniversary</li>
                        <li class="mx-2" data-filter=".sixth">Party</li>
                    </ul>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
                <%--Toyota Executives Visit--%>
                <div class="col-lg-4 col-md-6 portfolio-item fourth wow fadeInUp" data-wow-delay="0.1s">
                    <div class="portfolio-inner rounded" style ="width :400px;height :400px" >
                        <img class="img-fluid" src="Image/Image_Event/Toyota_Executives_Visit SNC_2022/showimg.jpg" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">Toyota Executives Visit</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5068.JPG" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5132.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5136.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5148.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5161.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5166.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5186.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5209.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5214.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5230.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5239.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5242.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5247.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5263.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5274.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5277.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5288.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5292.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5299.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Toyota_Executives_Visit SNC_2022/IMG_5324.JPG" data-lightbox="portfolio"></a>
                                
                            </div>

                        </div>
                    </div>
                </div>
                <%-- END Toyota Executives Visit--%>


                <div class="col-lg-4 col-md-6 portfolio-item fourth wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded" style ="width :400px;height :400px" >
                        <img class="img-fluid" src="Image/Image_Event/5S/show.png" alt="" width="550" height="550">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">กิจกรร 5 ส.</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/5S/5sV2.png" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.5s">
                    <div class="portfolio-inner rounded" style ="width :400px;height :400px" >
                        <%--<img class="img-fluid" src="Image/Image_Event/Afforest/IMG_0173.JPG" alt="" width="550" height="550">--%>
                        <img src="Image/Image_Event/Afforest/IMG_0173.JPG" alt="" class="bd-placeholder-img card-img-top" width="100" height="400" />
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">Afforest</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/Afforest/IMG_0173.JPG" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/Afforest/IMG_0210.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Afforest/IMG_0216.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Afforest/IMG_0219.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Afforest/IMG_0223.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Afforest/IMG_0225.JPG" data-lightbox="portfolio"></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.1s">
                    <div class="portfolio-inner rounded"  style ="width :400px;height :400px">
                        <%--<img class="img-fluid" src="Image/Image_Event/afforest 2022/IMG_5442.JPG" alt="" width="550" height="550">--%>
                        <img src="Image/Image_Event/afforest 2022/IMG_5442.JPG" alt="" class="bd-placeholder-img card-img-top" width="100" height="400" />
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">afforest 2022</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/afforest 2022/IMG_5442.JPG" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5447.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5448 (1).JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5449.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5452.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5459.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5461.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/afforest 2022/IMG_5469.JPG" data-lightbox="portfolio"></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item fifth wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded"  style ="width :400px;height :400px">
                        <%--<img class="img-fluid" src="Image/Image_Event/Anniversary 25/IMG_4646.JPG" alt="" width="550" height="550">--%>
                        <img src="Image/Image_Event/Anniversary 25/IMG_4646.JPG" alt="" class="bd-placeholder-img card-img-top" width="100" height="400" />
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">Anniversary 25</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/Anniversary 25/IMG_4646.JPG" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4669.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4671.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4677.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4710.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4734.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4743.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4750.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4752.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4755.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4756.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4757.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4760.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4761.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4762.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Anniversary 25/IMG_4765.JPG" data-lightbox="portfolio"></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item second wow fadeInUp" data-wow-delay="0.5s">
                    <div class="portfolio-inner rounded"  style ="width :400px;height :400px">
                        <%--<img class="img-fluid" src="Image/Image_Event/CSR/CIMG0084.JPG" alt="" width="550" height="550">--%>
                        <img src="Image/Image_Event/CSR/CIMG0084.JPG" alt="" class="bd-placeholder-img card-img-top" width="100" height="400" />
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">CSR</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/CSR/CIMG0084.JPG" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/CSR/CIMG0096.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/CSR/CIMG0097.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/CSR/CIMG0098.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/CSR/CIMG0105.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/CSR/IMG_6128.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/CSR/IMG_6131.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/CSR/IMG_6285.JPG" data-lightbox="portfolio"></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item fourth wow fadeInUp" data-wow-delay="0.5s">
                    <div class="portfolio-inner rounded" style ="width :400px;height :400px">
                        <img class="img-fluid" src="Image/Image_Event/Fire_drill1/IMG_25621206_142746.jpg" alt="" width="550" height="550" >
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">Fire_drill</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/Fire_drill1/IMG_25621206_142746.jpg" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_25621206_145051.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3708.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3712.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3726.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3731.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3736.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3743.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3748.JPG.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3752.JPG.jpg" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill1/IMG_3767.JPG.jpg" data-lightbox="portfolio"></a>
                               
                            </div>
                        </div>
                    </div>
                </div>
                  
                <div class="col-lg-4 col-md-6 portfolio-item fourth wow fadeInUp" data-wow-delay="0.5s">
                    <div class="portfolio-inner rounded" style ="width :400px;height :400px" >
                        <%--<img class="img-fluid" src="Image/Image_Event/Fire_drill2/IMG_3963.JPG" alt="" width="550" height="550">--%>
                        <img src="Image/Image_Event/Fire_drill2/IMG_3963.JPG" alt="" class="bd-placeholder-img card-img-top" width="100" height="400" />
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">Fire_drill</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="Image/Image_Event/Fire_drill2/IMG_3963.JPG" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3965.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3966.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3970.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3971.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3974.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3983.JPG" data-lightbox="portfolio"></a>
                                <a href="Image/Image_Event/Fire_drill2/IMG_3987.JPG" data-lightbox="portfolio"></a>
                                
                            </div>
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
    </div>
    <!-- Projects End -->


 
</asp:Content>
