
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="top-navbar navbar navbar-expand-md navbar-dark fixed-top" >
    <div class="container-fluid">
        <div class="align-self-center" style="float: right;width: 100%">
            <%-- NAVBAR FOR ADMIN --%>
            <s:url var="url_admin_logout" value="/admin/logout"/>
            <s:url var="url_admin_image" value="/static/images/admin.jpg"/>
            <img id="admin-account-settings" src="${url_admin_image}" alt="image" class="img-responsive rounded-circle bg-warning pull-right" width="60" height="60" style="border: 1px solid #fff;"/>
            <form id="searchForm" >
                <input type="submit" value="Search" class="pull-right " />

                <input type="text" id="serchInputField" class="pull-right" name="formText" placeholder="Search"  />
            </form>
        </div>
</nav>
<%@include file="../js_plugins.jsp" %> 
<script type="text/javascript">

    //--- popover option for admin options --//
    $(document).ready(function () {
        $("#admin-account-settings").popover({
            title: loadAdminSettings,
            html: true,
            placement: 'bottom'
        });
    });
    function loadAdminSettings() {
        return "<div class='account-settings-popover'>\n\
                    <div class='card'>\n\
                        <div class='card-body text-center'>\n\
                            <a href='#' class='wow fadeInRight'>View Profile</a><br>\n\
                            <a href='#' class='wow fadeInLeft'>Notifications</a><br>\n\
                            <a href='#' class='wow fadeInRight'>Account Settings</a><br>\n\
                            <a href='${url_admin_logout}' class='wow fadeInLeft'>Logout</a><br>\n\
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