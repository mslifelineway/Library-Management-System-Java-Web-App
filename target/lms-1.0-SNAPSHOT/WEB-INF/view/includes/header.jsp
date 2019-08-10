<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- ========== HEADER SECTION ====================== --%>
<header id="header">
    <div class="container">

        <div id="logo" class="pull-left">
            <h1><a href="#intro"><b>CITS</b></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="#intro"><img src="img/logo.png" alt="" title=""></a> -->
        </div>
        
        <nav id="nav-menu-container">
            <ul class="nav-menu">
                <s:url var="url_home" value="/"/>
                <li class="active"><a href="${url_home}">Home</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#team">Team</a></li>
                <li><a href="#gallery">Gallery</a></li>
                <li><a href="#contact">Contact Us</a></li>
            </ul>
        </nav><!-- #nav-menu-container -->
    </div>
</header>