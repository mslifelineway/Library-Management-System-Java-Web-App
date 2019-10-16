
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
