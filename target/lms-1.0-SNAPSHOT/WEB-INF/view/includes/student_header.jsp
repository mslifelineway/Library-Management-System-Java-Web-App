
<html>
    <head>
        <style>
            .auto-complete{
                margin: 0px auto;
                padding-top: 50px;
                width: 50%;
                text-align: center;
            }
            .auto-complete-list-data{
                margin: 0px auto;
                padding: 5px;
                width: 85%;
                text-align: center;
                background: white;
            }
        </style>
    </head>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="top-navbar navbar navbar-expand-md navbar-dark fixed-top" >
    <div class="container-fluid">
        <div class="align-self-center" style="float: right;width: 100%">
            <s:url var="url_student_image" value="/static/user_profile_images/${student.profileImage}"/>
            <%-- NAVBAR FOR STUDENTS --%>      
            <s:url var="url_student_logout" value="/student/logout"/>

            <div class="center-cropped pull-right">
                <img id="student-account-settings" style="border:1px solid #fff;background-position: center center; background-repeat: no-repeat; " src="${url_student_image}" alt="" class="img-responsive rounded-circle bg-warning pull-right" width="60" height="60" />
            </div>
            <form id="searchForm" >
                <input type="submit" value="Search" class="pull-right " />
                <input id="myInput" type="text" name="myCountry" class="pull-right" placeholder="Search"  />
            </form>
        </div>
    </div>
    <%-- urls used under script section --%>
    <c:url var="url_student_profile" value="/student/my_profile"/>
</nav>
<%@include file="../js_plugins.jsp" %> 
<script type="text/javascript">
    var search_data;
    //--- auto complete process that is showing data during searching --//
    function autocomplete(inp, arr) {

        ////// FETCHING DATA FROM DATABASE WHATEVER INPUT IS GIVEN
    <s:url var="url_auto_search" value="/auto_search_data/search_data"/>
        $.ajax({
            type: "post",
            url: '${url_auto_search}',
            data: {Input: inp},
            success: function (data) {
                search_data = data;
            },
            error: function (data, textStatus, errorThrown) {
                alert(data + " " + textStatus + " " + errorThrown);
            }
        });
        /*the autocomplete function takes two arguments,
         the text field element and an array of possible autocompleted values:*/
        var currentFocus;
        /*execute a function when someone writes in the text field:*/
        inp.addEventListener("input", function (e) {
            var a, b, i, val = this.value;
            /*close any already open lists of autocompleted values*/
            closeAllLists();
            if (!val) {
                return false;
            }
            currentFocus = -1;
            /*create a DIV element that will contain the items (values):*/
            a = document.createElement("DIV");
            a.setAttribute("id", this.id + "autocomplete-list");
            a.setAttribute("class", "autocomplete-items auto-complete");
            /*append the DIV element as a child of the autocomplete container:*/
            this.parentNode.appendChild(a);
            /*for each item in the array...*/
            for (i = 0; i < arr.length; i++) {
                /*check if the item starts with the same letters as the text field value:*/
                if (arr[i].substr(0, val.length).toUpperCase() === val.toUpperCase()) {
                    /*create a DIV element for each matching element:*/
                    b = document.createElement("DIV");
                    b.setAttribute("class", "auto-complete-list-data");
                    /*make the matching letters bold:*/
                    b.innerHTML = "<strong class='text-primary'>" + arr[i].substr(0, val.length) + "</strong>";
                    b.innerHTML += arr[i].substr(val.length);
                    /*insert a input field that will hold the current array item's value:*/
                    b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                    /*execute a function when someone clicks on the item value (DIV element):*/
                    b.addEventListener("click", function (e) {
                        /*insert the value for the autocomplete text field:*/
                        inp.value = this.getElementsByTagName("input")[0].value;
                        /*close the list of autocompleted values,
                         (or any other open lists of autocompleted values:*/
                        closeAllLists();
                    });
                    a.appendChild(b);
                }
            }
        });
        /*execute a function presses a key on the keyboard:*/
        inp.addEventListener("keydown", function (e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x)
                x = x.getElementsByTagName("div");
            if (e.keyCode === 40) {
                /*If the arrow DOWN key is pressed,
                 increase the currentFocus variable:*/
                currentFocus++;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode === 38) { //up
                /*If the arrow UP key is pressed,
                 decrease the currentFocus variable:*/
                currentFocus--;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode === 13) {
                /*If the ENTER key is pressed, prevent the form from being submitted,*/
                e.preventDefault();
                if (currentFocus > -1) {
                    /*and simulate a click on the "active" item:*/
                    if (x)
                        x[currentFocus].click();
                }
            }
        });
        function addActive(x) {
            /*a function to classify an item as "active":*/
            if (!x)
                return false;
            /*start by removing the "active" class on all items:*/
            removeActive(x);
            if (currentFocus >= x.length)
                currentFocus = 0;
            if (currentFocus < 0)
                currentFocus = (x.length - 1);
            /*add class "autocomplete-active":*/
            x[currentFocus].classList.add("autocomplete-active");
        }
        function removeActive(x) {
            /*a function to remove the "active" class from all autocomplete items:*/
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }
        function closeAllLists(elmnt) {
            /*close all autocomplete lists in the document,
             except the one passed as an argument:*/
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt !== x[i] && elmnt !== inp) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }
        /*execute a function when someone clicks in the document:*/
        document.addEventListener("click", function (e) {
            closeAllLists(e.target);
        });
    }

    /*An array containing all the country names in the world:*/
    var countries = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua & Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia & Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central Arfrican Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica", "Cote D Ivoire", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Polynesia", "French West Indies", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauro", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Pierre & Miquelon", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "St Kitts & Nevis", "St Lucia", "St Vincent", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor L'Este", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks & Caicos", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Virgin Islands (US)", "Yemen", "Zambia", "Zimbabwe"];

    /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
    autocomplete(document.getElementById("myInput"), countries);





    //------ popover options for students ----//
    $(document).ready(function () {
        $("#student-account-settings").popover({
            title: loadStudentSettings,
            html: true,
            placement: 'bottom'
        });
    });
    function loadStudentSettings() {
        return "<div class='account-settings-popover'>\n\
                    <div class='card'>\n\
                        <div class='card-body text-center'>\n\
                            <a href='${url_student_profile}' class='wow fadeInRight'>View Profile</a><br>\n\
                            <a href='#' class='wow fadeInLeft'>Notifications</a><br>\n\
                            <a href='#' class='wow fadeInRight'>Account Settings</a><br>\n\
                            <a href='${url_student_logout}' class='wow fadeInLeft'>Logout</a><br>\n\
                        </div>\n\
                    </div>\n\
                </div>";
    }
    //---- HIDE POPOVER BY OUTSITE CLICKING ---//
    $('html').on('click', function (e) {
        if (typeof $(e.target).data('original-title') === 'undefined' &&
                !$(e.target).parents().is('.popover.in')) {
            $('[data-original-title]').popover('hide');
        }
    });

</script>

<style>
    .popover {background-color: transparent;}
    .popover.bottom .arrow::after {border-bottom-color: transparent; }
    .popover-content {background-color: transparent;}
    .account-settings-popover .card{
        background: linear-gradient(180deg,rgba(29, 119, 215, 0.7),#1dc8cd);
        height: auto;
    }  

    .account-settings-popover{
        margin: 0px;
        padding: 0px;
    }
    .account-settings-popover .card .card-body a{
        font-size: 15px;
        line-height: 2em;
        padding: 0px;
        margin: 0px;
        font-family: "Montserrat", sans-serif;
        margin: 5px;
        color: #fff;
    }
    .account-settings-popover .card .card-body a:hover{
        font-size: 18px;
        transition: 0.8s;
        color: pink;
    }

</style>