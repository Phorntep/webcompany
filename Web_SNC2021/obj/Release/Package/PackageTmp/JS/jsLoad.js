var myVar;

function myFunction_load2() {
    myVar = setTimeout(showPage_load, 1000);
}

function showPage_load() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
}