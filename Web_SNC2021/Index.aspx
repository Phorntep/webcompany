<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="Web_SNC.Index2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>SNC SOUNDPROOF CO.,LTD.</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="CSSwebSNC/cssIndex.css" rel="stylesheet" />
    <script>
        var myVar;
        function myFunction_load() {
            myVar = setTimeout(showPage_load, 100);
        }
        function showPage_load() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("myDiv").style.display = "block";
        }        
    </script>
</head>
<body onload="myFunction_load();" style="margin: 0;">
    <form id="form1" runat="server">
        <div id="loader"></div>
        <div style="display: none;" id="myDiv" class="animate-bottom">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <button onclick="topFunction()" type="button" id="myBtn" class="myBtn" title="Go to top">Top</button>
                    <div class="navbar" id="navbar" style="box-shadow: 0px 5px 10px rgba(0,0,0,0.8);">
                        <div class="topnav" id="myTopnav">
                            <a href="Index.aspx" class="">HOME</a>
                            <div class="dropdown">
                                <button class="dropbtn" type="button">
                                    PRODUCT <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="#box_product">FELT</a>
                                    <a href="#mel">MEL</a>
                                    <a href="#hardpart">HARD PART</a>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button class="dropbtn" type="button">
                                    ACTIVITIES <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="#5s" onclick="open_ativity('5s');">5 s</a>
                                    <a href="#Afforest" onclick="open_ativity('Afforest');">Reforestation</a>
                                    <a href="#Anniversary" onclick="open_ativity('Anniversary');">ANNIVERSARY 25 YEARS</a>
                                    <a href="#Sport_day" onclick="open_ativity('Sport_day');">Sport Day & Happy New Year</a>
                                    <a href="#Fire_drill" onclick="open_ativity('Fire_drill');">Fire Drill</a>
                                    <a href="#CSR" onclick="open_ativity('CSR');">Social contribution</a>
                                    <a href="#travel" onclick="open_ativity('travel');">Company Trip</a>
                                </div>
                            </div>
                            <a href="#job" onclick="open_ativity('job');">JOB</a>
                            <div class="dropdown">
                                <button class="dropbtn" type="button">
                                    ABOUT <i class="fa fa-caret-down"></i>
                                </button>


                                <div class="dropdown-content">
                                    <a href="#Aboutus">ABOUT US</a>
                                    <a href="#contact">CONTRACT US</a>
                                    
                                  <%--  <a href="Billing/Main_bill.aspx">BILLING</a>
                                    <a href="http://www.sncsoundproof.com/Billings/">New BILLING Online</a>--%>
                                </div>
                            </div>
                            <div class="dropdown">
                                <button class="dropbtn" type="button">
                                    BILLING <i class="fa fa-caret-down"></i>
                                </button> 
                                <div class="dropdown-content">                                    
                                    <%--<a href="Billing/Main_bill.aspx">BILLING</a>--%>
                                    <a href="http://www.sncsoundproof.com/Billings/">New BILLING Online</a>
                                </div>
                            </div>
                            <div class="topnav-right">
                                <font style="color: #ff6a00; font-size: 45px; text-align: center;">SNC </font>
                                <font style="color: white; font-size: 45px; text-align: center;">SOUNDPROOF</font>
                            </div>
                            <a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunctionHidemenu()">&#9776;</a>
                        </div>
                    </div>
                    <div class="imageBG">
                        <%--<img  src="Image/image_factory/IMG_20191207_093222_1.jpg" style="width: 100%;"   />--%>
                        <%--<div style="height: 950px; background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0,0.6)),url('../Image/image_factory/IMG_20191207_093222_1.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;"></div>--%>

                        <div class="top-right1"></div>
                        <div class="top-right2"></div>
                        <div class="top-right3"></div>
                        <div class="hero-text">
                            <font style="/*white-space: nowrap; */ font-size: 70px">WELCOME TO SNC SOUNDPROOF</font>
                        </div>
                    </div>
                    <div id="myModal" class="modal">
                        <span class="close">&times;</span>
                        <img class="modal-content" id="img01" />
                        <div id="caption"></div>
                    </div>
                    <%--<div>

                        <div class="hero-text">
                            <font style="/*white-space: nowrap; */ font-size: 70px">WELCOME TO SNC SOUNDPROOF</font>
                        </div>
                    </div>--%>
                    <div style="width: 100%" class="fade-in">
                        <div style="width: 700px; margin: auto;">
                            <h1 style="text-align: center">SNC SOUNDPROOF</h1>

                            <p>SNC formerly known as SNC Sound proof Co ., Ltd. was incorporated in Thailand on the 27th July 1994 with its principal activity in business is manufacturing of car. Vibration Damping Sheet an important products that use to protect noise in car. Hard Part (Insulator) made help to quiet engine noise and keep the heat. Resin Felt  for heat insulation and sound insulation in automotive industry. As shown in the picture below are used in a vehicle.</p>
                            <p>We are ready to publish a policy for Occupational Health and Safety The Company is ready to publish health and Safety Policy Employees and the publish to know and understand the user of valuable resources . </p>
                            <%--<p>เราพร้อมที่จะเผยแพร่นโยบายด้านอาชีวอนามัยและความปลอดภัย บริษัท พร้อมที่จะเผยแพร่นโยบายด้านสุขภาพและความปลอดภัยพนักงานและการเผยแพร่เพื่อทำความรู้จักและเข้าใจผู้ใช้ทรัพยากรที่มีค่า</p>--%>
                            <%--<p>เป็นบริษัทร่วมลงทุนระหว่างไทย-ญี่ปุ่น  ทำการผลิตชิ้นส่วนรถยนต์ ประเภท แผ่นกันเสียงและกันความร้อน ใช้ประกอบในอุตสาหกรรมรถยนต์ โดยมุ่งเน้นที่จะผลิตสินค้า และ บริการอย่างมีคุณภาพ และ ตระหนักถึงความสำคัณในการ ใช้ทรัพยากรธรรมชาติ ตลอดจนผลกระทบต่อสิ่งแวดล้อม</p>--%>

                            <br />
                        </div>
                    </div>
                    <div style="margin: auto; background-color: #f2f2f2; height: auto; width: 100%;">
                        <%--**************************************************felt**************************************************--%>
                        <div id="box_product" class="slideshow-container">
                            <font style="font-size: 72px;">Product</font>
                            <img src="Image/Product/nittoku-Ori.jpg" style="width: 100%; height: 600px;" class="sss">
                            <br />
                        </div>
                        <%--************************************************felt*******************************************************--%>
                        <div>
                            <div class="slideshow-container">
                                <font style="font-size: 52px;">Felt</font>
                                <div class="mySlides1 fade">
                                    <div class="numbertext">1 / 4</div>
                                    <img src="Image/Product/Felt/IMG_20200220_160522.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>
                                <div class="mySlides1 fade">
                                    <div class="numbertext">2 / 4</div>
                                    <img src="Image/Product/Felt/IMG_20200224_162658.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Two</div>--%>
                                </div>
                                <div class="mySlides1 fade">
                                    <div class="numbertext">3 / 4</div>
                                    <img src="Image/Product/Felt/IMG_20200224_162709.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Three</div>--%>
                                </div>
                                <div class="mySlides1 fade">
                                    <div class="numbertext">4 / 4</div>
                                    <img src="Image/Product/Felt/IMG_20200225_090106.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Two</div>--%>
                                </div>
                                <a class="prev" onclick="plusSlides1(-1)">&#10094;</a>
                                <a class="next" onclick="plusSlides1(1)">&#10095;</a>
                            </div>
                            <br>
                            <div style="text-align: center">
                                <span class="dot1" onclick="currentSlide1(1)"></span>
                                <span class="dot1" onclick="currentSlide1(2)"></span>
                                <span class="dot1" onclick="currentSlide1(3)"></span>
                                <span class="dot1" onclick="currentSlide1(4)"></span>

                                <div class="text" style="margin: 0 auto; width: 1000px;">
                                    <p>
                                        <b>แผ่นกันความร้อน </b>
                                        <br>
                                        ผลิตภัณฑ์ที่ผลิต จะเรียกว่า RESIN FELT ซึ่งแบ่งออกเป็น 2 ชนิด ดังนี้
                                                    <br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. SEMI CURED FELT ผลิตภัณฑ์นี้จะแยกตามสูตรการผลิต
                                                    <br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. FULLY CURED FELT ผลิตภัณฑ์นี้ จะแบ่งแยกตามความ
                                                    <br>
                                    </p>
                                </div>
                            </div>
                            <br />
                        </div>


                    </div>
                    <%--************************************************mel*******************************************************--%>
                    <div id="mel">
                        <div style="clear: both">
                            <div class="slideshow-container">
                                <font style="font-size: 52px;">Mel</font>
                                <div class="mySlides2 fade">
                                    <div class="numbertext">1 / 5</div>
                                    <img src="Image/Product/Mel/m1.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>

                                <div class="mySlides2 fade">
                                    <div class="numbertext">2 / 5</div>

                                    <img src="Image/Product/Mel/m2.jpg" style="width: 100%; height: 600px;" class="sss">

                                    <%--<div class="text">Caption Two</div>--%>
                                </div>

                                <div class="mySlides2 fade">
                                    <div class="numbertext">3 / 5</div>

                                    <img src="Image/Product/Mel/m3.jpg" style="width: 100%; height: 600px;" class="sss">


                                    <%--<div class="text">Caption Three</div>--%>
                                </div>
                                <div class="mySlides2 fade">
                                    <div class="numbertext">4 / 5</div>
                                    <img src="Image/Product/Mel/m4.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>
                                <div class="mySlides2 fade">
                                    <div class="numbertext">5 / 5</div>
                                    <img src="Image/Product/Mel/m5.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>

                                <a class="prev" onclick="plusSlides2(-1)">&#10094;</a>
                                <a class="next" onclick="plusSlides2(1)">&#10095;</a>
                            </div>
                            <br>
                            <div style="text-align: center">
                                <span class="dot2" onclick="currentSlide2(1)"></span>
                                <span class="dot2" onclick="currentSlide2(2)"></span>
                                <span class="dot2" onclick="currentSlide2(3)"></span>
                                <span class="dot2" onclick="currentSlide2(4)"></span>
                                <span class="dot2" onclick="currentSlide2(5)"></span>
                                <div class="text" style="margin: 0 auto; width: 1000px;">
                                    <p>
                                        แผ่นกันเสียง ( ASPHALT SHEET หรือ MEL SHEET หรือ DAMPING SHEET ) ซึ่งจะผลิตที่โรงผลิต 2 ผลิตภัณฑ์ที่ผลิตจะขอเรียกว่า  ASPHALT SHEET หรือ MEL SHEET หรือ DAMPING SHEET ซึ่งได้แยกประเภทตามสูตรการผลิตหรือตามมาตรฐานของลูกค้า
                                                    <br>
                                    </p>
                                </div>
                            </div>
                            <br />

                        </div>
                    </div>
                    <%--************************************************Hard Part********************************************************--%>
                    <div id="hardpart">
                        <div style="clear: both; background-color: #f2f2f2;">
                            <div class="slideshow-container">
                                <font style="font-size: 52px;">Hard Part</font>
                                <div class="mySlides3 fade">
                                    <div class="numbertext">1 / 5</div>
                                    <img src="Image/Product/Hard_part/HP01.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>
                                <div class="mySlides3 fade">
                                    <div class="numbertext">2 / 5</div>
                                    <img src="Image/Product/Hard_part/IMG_20200225_090140.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Two</div>--%>
                                </div>
                                <div class="mySlides3 fade">
                                    <div class="numbertext">3 / 5</div>
                                    <img src="Image/Product/Hard_part/IMG_20200225_090227.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Three</div>--%>
                                </div>
                                <div class="mySlides3 fade">
                                    <div class="numbertext">4 / 5</div>
                                    <img src="Image/Product/Hard_part/IMG_20200225_090329.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>
                                <div class="mySlides3 fade">
                                    <div class="numbertext">5 / 5</div>
                                    <img src="Image/Product/Hard_part/IMG_20200225_090520.jpg" style="width: 100%; height: 600px;" class="sss">
                                    <%--<div class="text">Caption Text</div>--%>
                                </div>
                                <a class="prev" onclick="plusSlides3(-1)">&#10094;</a>
                                <a class="next" onclick="plusSlides3(1)">&#10095;</a>
                            </div>
                            <br>
                            <div style="text-align: center">
                                <span class="dot3" onclick="currentSlide3(1)"></span>
                                <span class="dot3" onclick="currentSlide3(2)"></span>
                                <span class="dot3" onclick="currentSlide3(3)"></span>
                                <span class="dot3" onclick="currentSlide3(4)"></span>
                                <span class="dot3" onclick="currentSlide3(5)"></span>
                                <div class="text" style="margin: 0 auto; width: 1000px;">
                                    <p>
                                        ปั๊มขึ้นรูปแผ่นกันความร้อน  ซึ่งเรียกผลิตภัณฑ์นี้ว่า ( HARD PART) 
                                                    <br>
                                    </p>
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                    <br />
                    <%--*******************************************************************************************************--%>

                    <div>
                        <div style="text-align: center;">
                            <font size="52px">ACTIVITIES</font>
                        </div>

                        <%--*********************5s***********************--%>
                        <button id="5s" class="accordion" onclick="return false">5 ส</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">กิจกรรม 5 ส</font>
                                        <div class="mySlides_5s fade">
                                            <div class="numbertext">1 / 1</div>

                                            <img src="Image/Image_Event/5S/5sV2.png" style="width: 100%; height: 600px;" />

                                        </div>
                                        <a class="prev" onclick="plusSlides_5s(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_5s(1)">&#10095;</a>
                                    </div>
                                    <br>
                                    <div style="text-align: center;">
                                        <span class="dot_5s" onclick="currentSlide_5s(1)"></span>
                                        <div class="text" style="margin: 0 auto; width: 700px;">
                                            <p>
                                                <b>5 ส คืออะไร</b>
                                                <br>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;กิจกรรม 5 ส เป็นแนวคิดการจัดระเบียบเรียบร้อยในที่ทำงานก่อให้เกิดสภาพการทำงานที่ดี ปลอดภัย มีระเบียบเรียบร้อย นำไปสู่การเพิ่มผลผลิต
                                                    <br>
                                                สะสาง (SERI) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; คือ การแยกของที่ต้องการ ออกจากของที่ไม่ต้องการและขจัดของที่ไม่ต้องการทิ้งไป
                                                    <br>
                                                สะดวก (SEITON)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; คือ การจัดวางสิ่งขอต่าง ๆ ในที่ทำงาน ให้เป็นระเบียบเพื่อความสะดวก และ ปลอดภัย
                                                    <br>
                                                สะอาด (SEISO)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; คือ การทำความสะอาด เครื่องมือ อุปกรณ์ และสถานที่ทำงาน
                                                    <br>
                                                สุขลักษณะ (SEIKETSU) &nbsp; คือ สภาพหมดจด สะอาดตา ถูกสุขลักษณะ และรักษาให้ดีตลอดไป
                                                    <br>
                                                สร้างนิสัย (SHITSUKE) &nbsp;&nbsp;&nbsp; คือ การอบรม สร้างนิสัยในการปฏิบัติงานตามระเบียบวินัย ข้อบังคับอย่างเคร่งครัด
                                                    <br>
                                            </p>


                                        </div>
                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>

                        <%--**********************Afforest**********************--%>
                        <button id="Afforest" class="accordion" onclick="return false">Reforestation</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">Reforestation 2019</font>
                                        <div class="mySlides_Afforest fade">
                                            <div class="numbertext">1 / 6</div>
                                            <img src="Image/Image_Event/Afforest/IMG_0173.JPG" style="width: 100%; height: 600px;" class="sss" />

                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Afforest fade">
                                            <div class="numbertext">2 / 6</div>
                                            <img src="Image/Image_Event/Afforest/IMG_0210.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>

                                        <div class="mySlides_Afforest fade">
                                            <div class="numbertext">3 / 6</div>
                                            <img src="Image/Image_Event/Afforest/IMG_0216.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Afforest fade">
                                            <div class="numbertext">4 / 6</div>
                                            <img src="Image/Image_Event/Afforest/IMG_0219.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Afforest fade">
                                            <div class="numbertext">5 / 6</div>
                                            <img src="Image/Image_Event/Afforest/IMG_0223.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Afforest fade">
                                            <div class="numbertext">6 / 6</div>
                                            <img src="Image/Image_Event/Afforest/IMG_0225.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <a class="prev" onclick="plusSlides_Afforest(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_Afforest(1)">&#10095;</a>
                                    </div>
                                    <br>
                                    <div style="text-align: center">
                                        <span class="dot_Afforest" onclick="currentSlide_Afforest(1)"></span>
                                        <span class="dot_Afforest" onclick="currentSlide_Afforest(2)"></span>
                                        <span class="dot_Afforest" onclick="currentSlide_Afforest(3)"></span>
                                        <span class="dot_Afforest" onclick="currentSlide_Afforest(4)"></span>
                                        <span class="dot_Afforest" onclick="currentSlide_Afforest(5)"></span>
                                        <span class="dot_Afforest" onclick="currentSlide_Afforest(6)"></span>
                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <%--*********************Anniversary***********************--%>
                        <button id="Anniversary" class="accordion" onclick="return false">ANNIVERSARY 25 YEARS</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">Anniversary 25 Year</font>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">1 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4646.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">2 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4669.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>

                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">3 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4671.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">4 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4677.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">5 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4710.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">6 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4734.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">7 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4743.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">8 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4750.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">9 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4752.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">10 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4755.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">11 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4756.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">12 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4757.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">13 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4760.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">14 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4761.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">15 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4762.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Anniversary fade">
                                            <div class="numbertext">16 / 16</div>
                                            <img src="Image/Image_Event/Anniversary%2025/IMG_4765.JPG" style="width: 100%; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>

                                        <a class="prev" onclick="plusSlides_Anniversary(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_Anniversary(1)">&#10095;</a>
                                    </div>
                                    <br>
                                    <div style="text-align: center">
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(1)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(2)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(3)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(4)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(5)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(6)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(7)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(8)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(9)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(10)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(11)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(12)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(13)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(14)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(15)"></span>
                                        <span class="dot_Anniversary" onclick="currentSlide_Anniversary(16)"></span>
                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <%--*********************Sport_day***********************--%>
                        <button id="Sport_day" class="accordion" onclick="return false">Sport Day & Happy New Year</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">Sport Day & Happy New Year</font>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">1 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221075239.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">2 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081231.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">3 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081255.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">4 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081300.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">5 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081322.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">6 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081350.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">7 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081754.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">8 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221081836.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">9 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221083530.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">10 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221085049.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">11 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221085220.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">12 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221170000.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">13 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221175140.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_sport_day fade">
                                            <div class="numbertext">14 / 14</div>
                                            <img src="Image/Image_Event/sport/IMG20191221175154.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>



                                        <a class="prev" onclick="plusSlides_sport_day(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_sport_day(1)">&#10095;</a>
                                    </div>
                                    <br>
                                    <div style="text-align: center">
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(1)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(2)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(3)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(4)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(5)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(6)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(7)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(8)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(9)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(10)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(11)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(12)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(13)"></span>
                                        <span class="dot_sport_day" onclick="currentSlide_sport_day(14)"></span>

                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <%--*********************Fire_drill***********************--%>
                        <button id="Fire_drill" class="accordion" onclick="return false">Fire Drill</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">Fire  Drill</font>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">1 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_25621206_142746.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">2 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_25621206_145051.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">3 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3708.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">4 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3712.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">5 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3726.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">6 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3731.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">7 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3736.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">8 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3743.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">9 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3748.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">10 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3752.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">11 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill1/IMG_3767.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">12 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3963.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">13 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3965.JPG" style="width: auto; height: 600px;" class="sss" />

                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">14 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3966.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">15 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3970.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">16 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3971.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">17 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3974.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">18 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3983.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_Fire_drill fade">
                                            <div class="numbertext">19 / 19</div>
                                            <img src="Image/Image_Event/Fire_drill2/IMG_3987.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>


                                        <a class="prev" onclick="plusSlides_Fire_drill(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_Fire_drill(1)">&#10095;</a>
                                    </div>
                                    <br>
                                    <div style="text-align: center">
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(1)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(2)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(3)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(4)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(5)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(6)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(7)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(8)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(9)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(10)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(11)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(12)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(13)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(14)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(15)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(16)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(17)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(18)"></span>
                                        <span class="dot_Fire_drill" onclick="currentSlide_Fire_drill(19)"></span>


                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <%--*********************CSR***********************--%>
                        <button id="CSR" class="accordion" onclick="return false">Social contribution</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">Social contribution</font>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">1 / 8</div>

                                            <img src="Image/Image_Event/CSR/CIMG0084.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">2 / 8</div>
                                            <img src="Image/Image_Event/CSR/CIMG0096.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>

                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">3 / 8</div>
                                            <img src="Image/Image_Event/CSR/CIMG0097.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">4 / 8</div>
                                            <img src="Image/Image_Event/CSR/CIMG0098.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">5 / 8</div>
                                            <img src="Image/Image_Event/CSR/CIMG0105.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">6 / 8</div>
                                            <img src="Image/Image_Event/CSR/IMG_6128.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">7 / 8</div>
                                            <img src="Image/Image_Event/CSR/IMG_6131.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_CSR fade">
                                            <div class="numbertext">8 / 8</div>
                                            <img src="Image/Image_Event/CSR/IMG_6285.JPG" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <a class="prev" onclick="plusSlides_CSR(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_CSR(1)">&#10095;</a>
                                    </div>
                                    <br>

                                    <div style="text-align: center">
                                        <span class="dot_CSR" onclick="currentSlide_CSR(1)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(2)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(3)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(4)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(5)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(6)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(7)"></span>
                                        <span class="dot_CSR" onclick="currentSlide_CSR(8)"></span>

                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>
                        <%--*********************travel***********************--%>
                        <button id="travel" class="accordion" onclick="return false">Company Trip</button>
                        <div class="panel">
                            <div>
                                <div style="clear: both; background-color: #f2f2f2;">
                                    <div class="slideshow-container">
                                        <font style="font-size: 52px;">Company Trip 2019</font>

                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">1 / 38</div>
                                            <img src="Image/Image_Event/travel/2.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">2 / 38</div>
                                            <img src="Image/Image_Event/travel/3.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">3 / 38</div>
                                            <img src="Image/Image_Event/travel/4.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">4 / 38</div>
                                            <img src="Image/Image_Event/travel/5.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">5 / 38</div>
                                            <img src="Image/Image_Event/travel/10.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">6 / 38</div>
                                            <img src="Image/Image_Event/travel/11.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">7 / 38</div>
                                            <img src="Image/Image_Event/travel/15.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">8 / 38</div>
                                            <img src="Image/Image_Event/travel/40.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">9 / 38</div>
                                            <img src="Image/Image_Event/travel/44.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">10 / 38</div>
                                            <img src="Image/Image_Event/travel/52-1.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">11 / 38</div>
                                            <img src="Image/Image_Event/travel/53.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">12 / 38</div>
                                            <img src="Image/Image_Event/travel/66.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">13 / 38</div>
                                            <img src="Image/Image_Event/travel/71.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">14 / 38</div>
                                            <img src="Image/Image_Event/travel/74.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">15 / 38</div>
                                            <img src="Image/Image_Event/travel/78.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">16 / 38</div>
                                            <img src="Image/Image_Event/travel/85.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">17 / 38</div>
                                            <img src="Image/Image_Event/travel/101.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">18 / 38</div>
                                            <img src="Image/Image_Event/travel/106.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">19 / 38</div>
                                            <img src="Image/Image_Event/travel/112.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">20 / 38</div>
                                            <img src="Image/Image_Event/travel/113.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">21 / 38</div>
                                            <img src="Image/Image_Event/travel/118.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">22 / 38</div>
                                            <img src="Image/Image_Event/travel/121.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">23 / 38</div>
                                            <img src="Image/Image_Event/travel/124.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">24 / 38</div>
                                            <img src="Image/Image_Event/travel/125.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">25 / 38</div>
                                            <img src="Image/Image_Event/travel/143.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">26 / 38</div>
                                            <img src="Image/Image_Event/travel/161.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">27 / 38</div>
                                            <img src="Image/Image_Event/travel/166.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">28 / 38</div>
                                            <img src="Image/Image_Event/travel/185.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">29 / 38</div>
                                            <img src="Image/Image_Event/travel/188.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">30 / 38</div>
                                            <img src="Image/Image_Event/travel/193.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">31 / 38</div>
                                            <img src="Image/Image_Event/travel/194.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">32 / 38</div>
                                            <img src="Image/Image_Event/travel/199.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">33 / 38</div>
                                            <img src="Image/Image_Event/travel/201.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">34 / 38</div>
                                            <img src="Image/Image_Event/travel/202.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">35 / 38</div>
                                            <img src="Image/Image_Event/travel/205.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">36 / 38</div>
                                            <img src="Image/Image_Event/travel/220.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">37 / 38</div>
                                            <img src="Image/Image_Event/travel/225.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>
                                        <div class="mySlides_travel fade">
                                            <div class="numbertext">38 / 38</div>
                                            <img src="Image/Image_Event/travel/239.jpg" style="width: auto; height: 600px;" class="sss" />
                                            <%-- <div class="text">
                                                
                                            </div>--%>
                                        </div>

                                        <a class="prev" onclick="plusSlides_travel(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides_travel(1)">&#10095;</a>
                                    </div>
                                    <br>
                                    <div style="text-align: center">
                                        <span class="dot_travel" onclick="currentSlide_travel(1)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(2)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(3)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(4)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(5)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(6)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(7)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(8)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(9)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(10)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(11)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(12)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(13)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(14)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(15)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(16)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(17)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(18)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(19)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(20)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(21)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(22)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(23)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(24)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(25)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(26)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(27)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(28)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(29)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(30)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(31)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(32)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(33)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(34)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(35)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(36)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(37)"></span>
                                        <span class="dot_travel" onclick="currentSlide_travel(38)"></span>



                                    </div>
                                    <br />

                                </div>
                            </div>
                        </div>

                        <%--*********************job***********************--%>
                        <button id="job" class="accordion" onclick="return false">Job</button>
                        <div class="panel">
                            <div style="width: 100%; height: auto; background-color: #ffffff;" class="settable">
                                <table>
                                    <tr>
                                        <th style="width: 50%">สวัสดิการของบริษัท</th>
                                        <th style="width: 50%"></th>
                                    </tr>
                                    <tr>
                                        <td>- ค่าอาหาร (กลางวัน) 30 บาท/วัน,กะดึก 40</td>
                                        <td>- รถรับ-ส่งพนักงาน 11 สาย</td>
                                    </tr>
                                    <tr>
                                        <td>- ค่าอาหาร (กรณีทำ OT) ตอนเย็น 20 บาท,วันหยุด 35 บาท</td>
                                        <td>- กองทุนสำรองเลี้ยงชีพนายจ้างสมทบ 4 %</td>
                                    </tr>
                                    <tr>
                                        <td>- เบี้ยขยัน 500,600,700 บาท</td>
                                        <td>- เบี้ยเลี้ยง กรณีไปปฎิบัติงานภายนอกบริษัท 40 บาท/วัน</td>
                                    </tr>
                                    <tr>
                                        <td>- ค่ากะ 90 บาท/คืน</td>
                                        <td>- ลากิจพิเศษได้ 4 วัน โดยได้รับค่าจ้างปกติ</td>
                                    </tr>
                                    <tr>
                                        <td>- ค่ารักษาพยาบาล (พนักงาน,ครอบครัว) 13,000 บาท/ปี</td>
                                        <td>- ลากิจพิเศษ กรณีภรรยาคลอดบุตร ได้ 2 วันโดยได้รับค่าจ้าง</td>
                                    </tr>
                                    <tr>
                                        <td>- โบนัส(ขึ้นอยู่กับผลประกอบการ)</td>
                                        <td>- ข้าวฟรี</td>
                                    </tr>
                                    <tr>
                                        <td>- ค่ามรณกรรม (พนักงาน) 30,000 บาท</td>
                                        <td>- ปรับค่าจ้างประจำปี (ขึ้นอยู่กับผลประกอบการ)</td>
                                    </tr>
                                    <tr>
                                        <td>- ค่ามรณกรรม (ครอบครัว) 10,000 บาท</td>
                                        <td>- ท่องเที่ยวประจำปี</td>
                                    </tr>
                                    <tr>
                                        <td>- เงินช่วยเหลือ กรณีสมรส 1,000 บาท</td>
                                        <td>- ชุดฟอร์มพนักงาน 2ชุด/ปี</td>
                                    </tr>
                                    <tr>
                                        <td>- เงินกู้ฉุกเฉิน 50% ของเงินเดือน</td>
                                        <td>- เงินรางวัล กรณีพนักงานดีเด่นประจำปี 1,500 บาท/ปี</td>
                                    </tr>
                                    <tr>
                                        <td>- เงินช่วยเหลือ กรณีคลอดบุตร 3,000 บาท/ครั้ง(ไม่เกิน 2 ครั้ง)</td>
                                        <td></td>

                                    </tr>

                                </table>
                            </div>
                        </div>
                    </div>

                    <%--****************************************************Aboutus***************************************************--%>
                    <div id="Aboutus">
                        <div style="width: 100%;">
                            <div id="tabbar" class="tab">
                                <button class="tablinks" type="button" onmouseover="openCity(event, 'Introduction')">Introduction</button>
                                <button class="tablinks" type="button" onmouseover="openCity(event, 'Factory1')">SNC 1</button>
                                <button class="tablinks" type="button" onmouseover="openCity(event, 'Factory2')">SNC 2</button>

                            </div>
                            <div id="Introduction" class="tabcontent">
                                <div style="width: 100%; height: auto; text-align: center;">
                                    <br />
                                    <img src="Image/image_factory/Factory_snc1.jpg" style="width: 500px; height: auto;" />
                                </div>
                                <h3>SNC SOUNDPROOF CO.,LTD.</h3>
                                <hr />
                                <p>
                                    ที่ตั้ง: 700/302 หมู่ 6 นิคมอุตสาหกรรมอมตะนคร ถ.บางนา-ตราด ต.ดอนหัวฬ่อ อ.เมือง จ.ชลบุรี 20000
                            <br>
                                    ก่อตั้ง : 27 มิถุนายน 2537
                            <br>
                                    เริ่มดำเนินกิจการ : 1 สิงหาคม 2538 (25 ปี)<br>
                                    ทุนจดทะเบียน : 80,000,000 บาท<br>
                                    ผลิตภัณฑ์  : ผลิตแผ่นกันเสียงกันความร้อนในรถยนต์ Vibration-damping sheet, Resin Felt and Hard Parts  (Sound absorbing Material) for Automobiles<br>
                                    ยอดขาย : 524.5 ล้านบาท (ในปี 2554)<br>
                                    จำนวนพนักงาน: 311 คน (รวมญี่ปุ่น 2 คน)<br>
                                    การได้รับการรับรองมาตรฐาน: <em><a style="color: coral;">ISO9001:2008, ISO/TS16949:2009, ISO14001:2004 </a></em>
                                    <br>
                                </p>
                            </div>
                            <div id="Factory1" class="tabcontent">
                                <h2 style="text-align: center">Factory SNC 1</h2>

                                <div class="container_fac1">
                                    <div class="mySlides_fac1">
                                        <div class="numbertext_fac1">1 / 6</div>

                                        <img src="Image/image_factory/SNC1/IMG_20191207_092415.jpg" style="width: auto; height: 600px;" class="sss" />
                                    </div>

                                    <div class="mySlides_fac1">
                                        <div class="numbertext_fac1">2 / 6</div>
                                        <img src="Image/image_factory/SNC1/IMG_20191207_092455.jpg" style="width: auto; height: 600px;" class="sss" />
                                    </div>

                                    <div class="mySlides_fac1">
                                        <div class="numbertext_fac1">3 / 6</div>
                                        <img src="Image/image_factory/SNC1/IMG_20191207_092513.jpg" style="width: auto; height: 600px;" class="sss" />
                                    </div>

                                    <div class="mySlides_fac1">
                                        <div class="numbertext_fac1">4 / 6</div>
                                        <img src="Image/image_factory/SNC1/IMG_20191207_092736.jpg" style="width: auto; height: 600px;" class="sss" />
                                    </div>

                                    <div class="mySlides_fac1">
                                        <div class="numbertext_fac1">5 / 6</div>
                                        <img src="Image/image_factory/SNC1/IMG_20191207_093101.jpg" style="width: auto; height: 600px;" class="sss" />
                                    </div>

                                    <div class="mySlides_fac1">
                                        <div class="numbertext_fac1">6 / 6</div>
                                        <img src="Image/image_factory/SNC1/IMG_20191207_093222_1.jpg" style="width: auto; height: 600px;  " class="sss" />
                                    </div>

                                    <a class="prev_fac1" onclick="plusSlides_fac1(-1)">❮</a>
                                    <a class="next_fac1" onclick="plusSlides_fac1(1)">❯</a>

                                    <div class="caption-container_fac1">
                                        <p id="caption_fac1"></p>
                                    </div>

                                    <div class="row_fac1">
                                        <div class="column_fac1">
                                            <img class="demo_fac1 cursor_fac1" src="Image/image_factory/SNC1/IMG_20191207_092415.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac1(1)" alt="SNC 1">
                                        </div>
                                        <div class="column_fac1">
                                            <img class="demo_fac1 cursor_fac1" src="Image/image_factory/SNC1/IMG_20191207_092455.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac1(2)" alt="SNC 1">
                                        </div>
                                        <div class="column_fac1">
                                            <img class="demo_fac1 cursor_fac1" src="Image/image_factory/SNC1/IMG_20191207_092513.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac1(3)" alt="SNC 1">
                                        </div>
                                        <div class="column_fac1">
                                            <img class="demo_fac1 cursor_fac1" src="Image/image_factory/SNC1/IMG_20191207_092736.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac1(4)" alt="SNC 1">
                                        </div>
                                        <div class="column_fac1">
                                            <img class="demo_fac1 cursor_fac1" src="Image/image_factory/SNC1/IMG_20191207_093101.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac1(5)" alt="SNC 1">
                                        </div>
                                        <div class="column_fac1">
                                            <img class="demo_fac1 cursor_fac1" src="Image/image_factory/SNC1/IMG_20191207_093222_1.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac1(6)" alt="SNC 1">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="Factory2" class="tabcontent">
                                <h2 style="text-align: center">Factory SNC 2</h2>

                                <div class="container_fac2 ">
                                    <div class="mySlides_fac2">
                                        <div class="numbertext_fac2">1 / 6</div>
                                        <img src="Image/image_factory/SNC2/IMG_20200220_112558.jpg" style="width: auto; height: 600px;" />
                                    </div>

                                    <div class="mySlides_fac2">
                                        <div class="numbertext_fac2">2 / 6</div>
                                        <img src="Image/image_factory/SNC2/IMG_20200220_112445.jpg" style="width: auto; height: 600px;" />
                                    </div>

                                    <div class="mySlides_fac2">
                                        <div class="numbertext_fac2">3 / 6</div>
                                        <img src="Image/image_factory/SNC2/IMG_20200220_112619.jpg" style="width: auto; height: 600px;" />
                                    </div>

                                    <div class="mySlides_fac2">
                                        <div class="numbertext_fac2">4 / 6</div>
                                        <img src="Image/image_factory/SNC2/IMG_20200220_112654.jpg" style="width: auto; height: 600px;" />
                                    </div>

                                    <div class="mySlides_fac2">
                                        <div class="numbertext_fac2">5 / 6</div>
                                        <img src="Image/image_factory/SNC2/IMG_20200220_112725.jpg" style="width: auto; height: 600px;" />
                                    </div>

                                    <div class="mySlides_fac2">
                                        <div class="numbertext_fac2">6 / 6</div>
                                        <img src="Image/image_factory/SNC2/IMG_20200220_112748.jpg" style="width: auto; height: 600px;" />
                                    </div>
                                    <a class="prev_fac1" onclick="plusSlides_fac2(-1)">❮</a>
                                    <a class="next_fac1" onclick="plusSlides_fac2(1)">❯</a>
                                    <div class="caption-container_fac2">
                                        <p id="caption_fac2"></p>
                                    </div>

                                    <div class="row">
                                        <div class="column_fac2">
                                            <img class="demo_fac2 cursor_fac2" src="Image/image_factory/SNC2/IMG_20200220_112558.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac2(1)" alt="SNC 2">
                                        </div>
                                        <div class="column_fac2">
                                            <img class="demo_fac2 cursor_fac2" src="Image/image_factory/SNC2/IMG_20200220_112445.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac2(2)" alt="SNC 2">
                                        </div>
                                        <div class="column_fac2">
                                            <img class="demo_fac2 cursor_fac2" src="Image/image_factory/SNC2/IMG_20200220_112619.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac2(3)" alt="SNC 2">
                                        </div>
                                        <div class="column_fac2">
                                            <img class="demo_fac2 cursor_fac2" src="Image/image_factory/SNC2/IMG_20200220_112654.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac2(4)" alt="SNC 2">
                                        </div>
                                        <div class="column_fac2">
                                            <img class="demo_fac2 cursor_fac2" src="Image/image_factory/SNC2/IMG_20200220_112725.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac2(5)" alt="SNC 2">
                                        </div>
                                        <div class="column_fac2">
                                            <img class="demo_fac2 cursor_fac2" src="Image/image_factory/SNC2/IMG_20200220_112748.jpg" style="width: 100%; height: 120px;" onclick="currentSlide_fac2(6)" alt="SNC 2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <%--*******************************************************************************************************--%>

                    <div style="width: 100%; height: 500px; border-top: 1px solid; border-bottom: 1px solid;">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1650.5805512090073!2d101.0290349685859!3d13.432557514839796!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x311d36f93143b529%3A0x5f4c21235bccabfa!2z4Lia4LiI4LiBLiDguYDguK3guKog4LmA4Lit4LmH4LiZIOC4i-C4tSDguIvguLLguKfguJTguYwg4Lie4Lij4Li44LmK4Lif!5e0!3m2!1sth!2sth!4v1576052955610!5m2!1sth!2sth" width="100%" height="500px" style="border: 0;"></iframe>
                    </div>
                    <%--*******************************************************************************************************--%>
                    <div id="cuntomer" class="slideshow-container">
                        <font style="font-size: 72px;">Customers</font>
                        <img src="Image/Customer/Customer2020.png" style="width: 100%; height: 600px;" class="sss">
                        <br />
                    </div>
                    <div id="contact" style="background-color: #f5f5f7; width: 100%; height: 200px;">
                        <div style="margin: auto; width: 700px;">
                            <font style="font-size: 34px;">Contact</font>
                            <br />

                            <hr />
                            <h4>SNC Sound Proof Co., Ltd.</h4>
                            <%--<p>700/302 Amata Nakorn Induatrial Estate, Moo 6, Bangna-Trad Rd. Km. 57, Don Hua Lo, Muang Chonburi, Chonburi, 20000, Thailand  Tel.038-457-081</p>--%>
                            <p>700/302 Moo 6, Bangna-Trad Rd. Km. 57, Don Hua Lau, Muang Chonburi, Chonburi, 20000, Thailand  Tel.038-457-081</p>
                            <p style="font-size: 14px; color: #808080">Copyright © 2020 SNC SOUNDPROOF CO.,LTD. สงวนสิทธิ์ทุกประการ</p>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>

</body> 
<script> 


    window.onscroll = function () { scrollFunction() };

    var navbar = document.getElementById("navbar");
    var sticky = navbar.offsetTop;
    var mybutton = document.getElementById("myBtn");
    //function scrollFunction() {
    //    if (window.pageYOffset >= sticky) {
    //        navbar.classList.add("sticky")
    //        mybutton.style.display = "block";
    //    } else {
    //        navbar.classList.remove("sticky");
    //        mybutton.style.display = "none";
    //    }
    //}
    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
              navbar.classList.add("sticky")
        } else {
             navbar.classList.remove("sticky");
            mybutton.style.display = "none";
        }
    }
    function myFunctionHidemenu() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";s
        }
    }
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }

    //*********************1********************************************
    var myslide_count = document.getElementsByClassName("mySlides1");
    var slideIndex1 = 1;
    showSlides1(slideIndex1);
    function plusSlides1(n) {
        showSlides1(slideIndex1 += n);
    }

    function currentSlide1(n) {
        showSlides1(slideIndex1 = n);
    }

    function showSlides1(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides1");
        var dots = document.getElementsByClassName("dot1");
        if (n > slides.length) { slideIndex1 = 1 }
        if (n < 1) { slideIndex1 = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active1", "");
        }
        slides[slideIndex1 - 1].style.display = "block";
        dots[slideIndex1 - 1].className += " active1";
    }

    //*******************************2*****************************************
    var slideIndex2 = 1;
    showSlides2(slideIndex2);

    function plusSlides2(n) {
        showSlides2(slideIndex2 += n);
    }

    function currentSlide2(n) {
        showSlides2(slideIndex2 = n);
    }

    function showSlides2(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides2");
        var dots = document.getElementsByClassName("dot2");
        if (n > slides.length) { slideIndex2 = 1 }
        if (n < 1) { slideIndex2 = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active2", "");
        }
        slides[slideIndex2 - 1].style.display = "block";
        dots[slideIndex2 - 1].className += " active2";
    }

    //**********************3*******************************************
    var slideIndex3 = 1;
    showSlides3(slideIndex3);

    function plusSlides3(n) {
        showSlides3(slideIndex3 += n);
    }

    function currentSlide3(n) {
        showSlides3(slideIndex3 = n);
    }

    function showSlides3(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides3");
        var dots = document.getElementsByClassName("dot3");
        if (n > slides.length) { slideIndex3 = 1 }
        if (n < 1) { slideIndex3 = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active3", "");
        }
        slides[slideIndex3 - 1].style.display = "block";
        dots[slideIndex3 - 1].className += " active3";
    }
    //*****************************************************************
    var acc = document.getElementsByClassName("accordion");
    var ii;

    for (ii = 0; ii < acc.length; ii++) {
        acc[ii].addEventListener("click", function () {
            this.classList.toggle("active_accordion");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
    //*****************************************************************
    var slideIndex_5s = 1;
    showSlides_5s(slideIndex_5s);

    function plusSlides_5s(n) {
        showSlides_5s(slideIndex_5s += n);
    }

    function currentSlide_5s(n) {
        showSlides_5s(slideIndex_5s = n);
    }

    function showSlides_5s(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_5s");
        var dots = document.getElementsByClassName("dot_5s");
        if (n > slides.length) { slideIndex_5s = 1 }
        if (n < 1) { slideIndex_5s = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_5s", "");
        }
        slides[slideIndex_5s - 1].style.display = "block";
        dots[slideIndex_5s - 1].className += " active_5s";
    }
    //*******************************Afforest**********************************
    var slideIndex_Afforest = 1;
    showSlides_Afforest(slideIndex_Afforest);

    function plusSlides_Afforest(n) {
        showSlides_Afforest(slideIndex_Afforest += n);
    }

    function currentSlide_Afforest(n) {
        showSlides_Afforest(slideIndex_Afforest = n);
    }

    function showSlides_Afforest(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_Afforest");
        var dots = document.getElementsByClassName("dot_Afforest");
        if (n > slides.length) { slideIndex_Afforest = 1 }
        if (n < 1) { slideIndex_Afforest = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_Afforest", "");
        }
        slides[slideIndex_Afforest - 1].style.display = "block";
        dots[slideIndex_Afforest - 1].className += " active_Afforest";
    }
    //*******************************Anniversary**********************************
    var slideIndex_Anniversary = 1;
    showSlides_Anniversary(slideIndex_Anniversary);

    function plusSlides_Anniversary(n) {
        showSlides_Anniversary(slideIndex_Anniversary += n);
    }

    function currentSlide_Anniversary(n) {
        showSlides_Anniversary(slideIndex_Anniversary = n);
    }

    function showSlides_Anniversary(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_Anniversary");
        var dots = document.getElementsByClassName("dot_Anniversary");
        if (n > slides.length) { slideIndex_Anniversary = 1 }
        if (n < 1) { slideIndex_Anniversary = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_Anniversary", "");
        }
        slides[slideIndex_Anniversary - 1].style.display = "block";
        dots[slideIndex_Anniversary - 1].className += " active_Anniversary";
    } //*******************************SportDay**********************************
    var slideIndex_sport_day = 1;
    showSlides_sport_day(slideIndex_sport_day);

    function plusSlides_sport_day(n) {
        showSlides_sport_day(slideIndex_sport_day += n);
    }

    function currentSlide_sport_day(n) {
        showSlides_sport_day(slideIndex_sport_day = n);
    }

    function showSlides_sport_day(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_sport_day");
        var dots = document.getElementsByClassName("dot_sport_day");
        if (n > slides.length) { slideIndex_sport_day = 1 }
        if (n < 1) { slideIndex_sport_day = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_sport_day", "");
        }
        slides[slideIndex_sport_day - 1].style.display = "block";
        dots[slideIndex_sport_day - 1].className += " active_sport_day";
    }
    //*******************************Fire_drill**********************************
    var slideIndex_Fire_drill = 1;
    showSlides_Fire_drill(slideIndex_Fire_drill);

    function plusSlides_Fire_drill(n) {
        showSlides_Fire_drill(slideIndex_Fire_drill += n);
    }

    function currentSlide_Fire_drill(n) {
        showSlides_Fire_drill(slideIndex_Fire_drill = n);
    }

    function showSlides_Fire_drill(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_Fire_drill");
        var dots = document.getElementsByClassName("dot_Fire_drill");
        if (n > slides.length) { slideIndex_Fire_drill = 1 }
        if (n < 1) { slideIndex_Fire_drill = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_Fire_drill", "");
        }
        slides[slideIndex_Fire_drill - 1].style.display = "block";
        dots[slideIndex_Fire_drill - 1].className += " active_Fire_drill";
    }
    //*******************************CSR**********************************
    var slideIndex_CSR = 1;
    showSlides_CSR(slideIndex_CSR);

    function plusSlides_CSR(n) {
        showSlides_CSR(slideIndex_CSR += n);
    }

    function currentSlide_CSR(n) {
        showSlides_CSR(slideIndex_CSR = n);
    }

    function showSlides_CSR(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_CSR");
        var dots = document.getElementsByClassName("dot_CSR");
        if (n > slides.length) { slideIndex_CSR = 1 }
        if (n < 1) { slideIndex_CSR = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_CSR", "");
        }
        slides[slideIndex_CSR - 1].style.display = "block";
        dots[slideIndex_CSR - 1].className += " active_CSR";
    }
    //*******************************travel**********************************
    var slideIndex_travel = 1;
    showSlides_travel(slideIndex_travel);

    function plusSlides_travel(n) {
        showSlides_travel(slideIndex_travel += n);
    }

    function currentSlide_travel(n) {
        showSlides_travel(slideIndex_travel = n);
    }

    function showSlides_travel(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_travel");
        var dots = document.getElementsByClassName("dot_travel");
        if (n > slides.length) { slideIndex_travel = 1 }
        if (n < 1) { slideIndex_travel = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active_travel", "");
        }
        slides[slideIndex_travel - 1].style.display = "block";
        dots[slideIndex_travel - 1].className += " active_travel";
    }
    //*****************************************************************
    //var acc = document.getElementsByClassName("accordion");
    //var ii;
    //var caa = document.getElementById("5s").getElementsByClassName("slideshow-container");
    //var iii = document.getElementById("5s").getElementsByClassName("slideshow-container").length;

    //for (ii = 0; ii < acc.length; ii++) {
    //    acc[ii].addEventListener("click", function () {
    //        this.classList.toggle("active_accordion");
    //        var panel = this.nextElementSibling;
    //        if (panel.style.maxHeight) {
    //            panel.style.maxHeight = null;
    //        } else {
    //            panel.style.maxHeight = panel.scrollHeight + "px";
    //        }
    //    });
    //    caa.style.color = "red";
    //    caa.addEventListener("Click", test);
    //        function myFunction() {
    //  var x = document.getElementsByClassName("example")[2];
    //  x.getElementsByClassName("child color")[1].style.backgroundColor = "red";
    //}

    //     var slideIndex3 = 1;
    //showSlides3(slideIndex3);

    //function plusSlides3(n) {
    //    showSlides3(slideIndex3 += n);
    //}

    //function currentSlide3(n) {
    //    showSlides3(slideIndex3 = n);
    //}

    //function showSlides3(n) {
    //    var i;
    //    var slides = document.getElementsByClassName("mySlides3");
    //    var dots = document.getElementsByClassName("dot3");
    //    if (n > slides.length) { slideIndex3 = 1 }
    //    if (n < 1) { slideIndex3 = slides.length }
    //    for (i = 0; i < slides.length; i++) {
    //        slides[i].style.display = "none";
    //    }
    //    for (i = 0; i < dots.length; i++) {
    //        dots[i].className = dots[i].className.replace(" active3", "");
    //    }
    //    slides[slideIndex3 - 1].style.display = "block";
    //    dots[slideIndex3 - 1].className += " active3";
    //}
    //}
    //*****************************************************************
    //var imageslide = document.getElementsByClassName("")
    //var myslide_count = document.getElementsByClassName("mySlides");
    //for (i = 0; i < myslide_count.length;i++) {
    //}
    //var slideIndex = 1;
    //showSlides(slideIndex);
    //function plusSlides(n) {
    //    showSlides(slideIndex += n);
    //}
    //function currentSlide(n) {
    //    showSlides(slideIndex = n);
    //}
    //function showSlides(n) {
    //    var i;
    //    var slides = document.getElementsByClassName("mySlides");
    //    var dots = document.getElementsByClassName("dot");
    //    if (n > slides.length) { slideIndex = 1 }
    //    if (n < 1) { slideIndex = slides.length }
    //    for (i = 0; i < slides.length; i++) {
    //        slides[i].style.display = "none";
    //    }
    //    for (i = 0; i < dots.length; i++) {
    //        dots[i].className = dots[i].className.replace(" active", "");
    //    }
    //    slides[slideIndex - 1].style.display = "block";
    //    dots[slideIndex - 1].className += " active";
    //} 
    //**************************button Hover****************************
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
        var h = document.getElementsByClassName("tabcontent");
        document.getElementById("tabbar").style.height = h.clientHeight;

    }
    //******************************SNC1***********************************
    var slideIndex_fac1 = 1;
    showSlides_fac1(slideIndex_fac1);

    function plusSlides_fac1(n) {
        showSlides_fac1(slideIndex_fac1 += n);
    }
    function currentSlide_fac1(n) {
        showSlides_fac1(slideIndex_fac1 = n);
    }
    function showSlides_fac1(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_fac1");
        var dots = document.getElementsByClassName("demo_fac1");
        var captionText = document.getElementById("caption_fac1");
        if (n > slides.length) { slideIndex_fac1 = 1 }
        if (n < 1) { slideIndex_fac1 = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex_fac1 - 1].style.display = "block";
        dots[slideIndex_fac1 - 1].className += " active";
        captionText.innerHTML = dots[slideIndex_fac1 - 1].alt;
    }
    //*****************************SNC2************************************
    var slideIndex_fac2 = 1;
    showSlides_fac2(slideIndex_fac2);

    function plusSlides_fac2(n) {
        showSlides_fac2(slideIndex_fac2 += n);
    }

    function currentSlide_fac2(n) {
        showSlides_fac2(slideIndex_fac2 = n);
    }

    function showSlides_fac2(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides_fac2");
        var dots = document.getElementsByClassName("demo_fac2");
        var captionText = document.getElementById("caption_fac2");
        if (n > slides.length) { slideIndex_fac2 = 1 }
        if (n < 1) { slideIndex_fac2 = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex_fac2 - 1].style.display = "block";
        dots[slideIndex_fac2 - 1].className += " active";
        captionText.innerHTML = dots[slideIndex_fac2 - 1].alt;
    }

    //*****************************modal********************************
    var modal = document.getElementById("myModal");
    //var img = document.getElementById("myImg");
    var i;
    var count_cls_img = document.getElementsByClassName("sss");
    var img = [];
    for (i = 0; i < count_cls_img.length; i++) {
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");

        count_cls_img[i].addEventListener("click", function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        });
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function () {
            modal.style.display = "none";
        }
    };

    //*******************************click button  & open activity**********************************

    var num_ativity;

    function open_ativity(num_ativity) {

        var acc = document.getElementById(num_ativity);
        acc.classList.toggle("active_accordion");
        var panel = acc.nextElementSibling;

        if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    }

</script> 

</html>
