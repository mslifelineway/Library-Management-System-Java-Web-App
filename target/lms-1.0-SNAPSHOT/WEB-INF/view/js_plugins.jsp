<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<%-- =============== JavaScript Libraries ================ --%>
<s:url var="jquery_min_js" value="/static/lib/jquery/jquery.min.js"/>
<script src="${jquery_min_js}"></script>

<s:url var="migrate_min_js" value="/static/lib/jquery/jquery-migrate.min.js"/>
<script src="${migrate_min_js}"></script>

<s:url var="bootstrap_bundle_min_js" value="/static/lib/bootstrap/js/bootstrap.bundle.min.js"/>
<script src="${bootstrap_bundle_min_js}"></script>

<s:url var="easing_min_js" value="/static/lib/easing/easing.min.js"/>
<script src="${easing_min_js}"></script>

<s:url var="wow_min_js" value="/static/lib/wow/wow.min.js"/>
<script src="${wow_min_js}"></script>

<s:url var="hoverIntent_js" value="/static/lib/superfish/hoverIntent.js"/>
<script src="${hoverIntent_js}"></script>

<s:url var="superfish_min_js" value="/static/lib/superfish/superfish.min.js"/>
<script src="${superfish_min_js}"></script>

<s:url var="magnific_popup_min_js" value="/static/lib/magnific-popup/magnific-popup.min.js"/>
<script src="${magnific_popup_min_js}"></script>

<!-- Template Main Javascript File -->
<s:url var="main_js" value="/static/js/main.js"/>
<script src="${main_js}"></script>