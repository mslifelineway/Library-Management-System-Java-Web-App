
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Login</title>
        <meta charset="utf-8">
        <%--<%@include file="plugins.jsp" %>--%>

        <%@include file="all_plugins.jsp" %>
        <s:url var="style_css" value="/static/css/style.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${style_css}" rel="stylesheet">

        <%-- Main Stylesheet RESPONSIVE File --%>
        <s:url var="responsive_css" value="/static/css/responsive.css"/>
        <link href="${responsive_css}" rel="stylesheet">
    </head>
    <body>
        <%@include file="js_plugins.jsp" %> <%-- it should be on the top --%>
        <%-- ========== HEADER SECTION ====================== --%>
        <%@include file="includes/header.jsp" %>
        <%-- =================== INTRO SECTION ===================== --%>
        <section id="intro">

            <div class="intro-text">
                <h2>WELCOME TO CITS LIBRARY MANAGEMENT</h2>
                <p style="width: 80%; margin: 0 auto">A lack of illusion is golden, and it is quite possible that creativity is the highest form of intelligence</p>
            </div>

            <div class="product-screens">
                <div id="login-reg-row" class="row" >
                    <div class="col-lg-5 col-md-5 col-sm-12 box wow fadeInLeft" style="text-align: left; color: #000000">
                        <s:url var="url_admin_login" value="/admin/admin_dashboard"/>
                        <f:form action="${url_admin_login}" modelAttribute="admin_login_command">
                            <fieldset class="fieldset-border">
                                <legend class="fieldset-border">Librarian Login</legend>
                                <div class="form-group">
                                    <label>username</label>
                                    <f:input type="text" path="username" class="form-control" placeholder="Enter username" />
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <f:input type="password" path="password" class="form-control" placeholder="Password" />
                                </div>
                                <button type="submit" style="background-color: transparent" class="default-button">Login</button>
                            </fieldset>
                        </f:form>
                    </div>

                    <div id="vertical-line-divider"></div>
                    <f:form>
                        <fieldset class="fieldset-border">
                            <legend class="fieldset-border">Informations</legend>
                            <div class="form-group" style="color: white">
                                Some Informations related to Admin or Librarian goes here...
                            </div>
                        </fieldset>
                    </f:form>
                    <div class="col-lg-5 col-md-5 col-sm-12 box wow fadeInRight" style="text-align: left;color: #000000">

                    </div>
                </div>
            </div>
            <c:if test="${param.act eq 'fm'}">
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#open-modal').modal('show');
                        $('#info').html("Authentication Failed! due to Fields are missing.");
                    });
                </script>
            </c:if>
            <c:if test="${param.act eq 'ic'}">
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#open-modal').modal('show');
                        $('#info').html("Authentication Failed! due to Invalid Credentials.");
                    });
                </script>
            </c:if>
            <%-- auto popup model for displaying message, errors or notifications--%>
            <div class="modal fade" id="open-modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!--Modal Content-->
                    <div class="modal-content" id="content-modal-box">
                        <div class="modal-body" style="padding:0px;">
                            <p id="info" style="font-family: serif; color: #FFF"></p>
                            <p class="pull-right" aria-hidden="true" style="color:red;margin: 10px;background: cyan;cursor: pointer;" data-dismiss="modal" aria-label="Close">x</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%-- =================== MAIN SECTION OR CONTENT AREA ===================== --%>
        <%@include file="includes/contents.jsp" %>
        <%-- =================== FOOTER SECTION ===================== --%>
        <%@include file="includes/footer.jsp" %>

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


    </body>
</html>
