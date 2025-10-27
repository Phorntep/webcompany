
//window.onscroll = function () { myFunction() };

//var navbar = document.getElementById("navbar");
//var sticky = navbar.offsetTop;

//function myFunction() {
//    if (window.pageYOffset >= sticky) {
//        navbar.classList.add("sticky")

//    } else {
//        navbar.classList.remove("sticky");

//    }
//} 
function myFunctionHidemenu() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
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

//************************2*****************************************
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
//var acc = document.getElementsByClassName("accordion");
//var ii;

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
//}
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
    var caa = document.getElementsByClassName("slideshow-container");
    var iii;
    //var slideIndex3 = ii;
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
    //***************************button Hover**************************** 
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
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption1");
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
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption2");
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