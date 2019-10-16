
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME TO CITS LIBRARY MANAGEMENT</title>
        <%--<c:import url="all_plugins.jsp" charEncoding="UTF-8"/>--%>
        <%@include  file="all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${style_css}" rel="stylesheet">

        <%-- Main Stylesheet RESPONSIVE File --%>
        <s:url var="responsive_css" value="/static/css/responsive.css"/>
        <link href="${responsive_css}" rel="stylesheet">
    </head>
    <body>

        <%@include file="js_plugins.jsp" %>
        <%-- ========== HEADER SECTION ====================== --%>
        <%@include file="includes/header.jsp" %>

        <%-- =================== STUDENT LOGIN FORM SECTION ===================== --%>
        <section id="intro">

            <div class="intro-text">
                <h2>WELCOME TO CITS LIBRARY MANAGEMENT</h2>
                <p>A lack of illusion is golden, and it is quite possible that creativity is the highest form of intelligence</p>
            </div>

            <div class="product-screens">
                <div id="login-reg-row" class="row" >
                    <div class="col-lg-5 col-md-5 col-sm-12 box wow fadeInLeft" style="text-align: left; color: #000000">
                        <s:url var="url_login_student" value="student/login"/>
                        <f:form action="${url_login_student}" modelAttribute="student_login_command" >
                            <fieldset class="fieldset-border">
                                <legend class="fieldset-border">Student Login</legend>
                                <div class="form-group">
                                    <label>Admission No</label>
                                    <f:input type="text" class="form-control" path="admissionNo" placeholder="Enter admission no" />
                                </div>

                                <div class="form-group">
                                    <label>password</label><br>
                                    <f:input type="password" class="form-control" path="password" placeholder="********" />
                                </div>
                                <button type="submit" style="background-color: transparent" class="default-button">Login</button>
                            </fieldset>
                        </f:form>
                        <%-- code for displying errors or messages or any notifications on this page--%>
                        <c:if test="${param.act eq 'fm'}">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#open-modal').modal('show');
                                    $('#info').html("Fields are missing...");
                                });
                            </script>
                        </c:if>

                        <c:if test="${param.act eq 'ic'}">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#open-modal').modal('show');
                                    $('#info').html("Invalid Credentials!");
                                });
                            </script>
                        </c:if>

                        <c:if test="${param.act eq 'reg'}">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#open-modal').modal('show');
                                    $('#info').html("Registration Successed! <br> please login and complete your profile for final varification.");
                                });
                            </script>
                        </c:if>
                    </div>

                    <div id="vertical-line-divider"></div>

                    <div class="col-lg-5 col-md-5 col-sm-12 box wow fadeInRight" style="text-align: left;color: #000000">
                        <form>
                            <fieldset class="fieldset-border">
                                <legend class="fieldset-border">Information</legend>
                                <div class="form-group">
                                    <label> Students can login only if they have registered their account.</label>
                                </div>
                                <s:url var="student_reg_form" value="/student/registration_form"/>
                                <a href="${student_reg_form}" class="default-button">Register Your Account</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
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

        <%-- =================== STUDENT LOGIN FORM SECTION ENDS ===================== --%>
        <%-- =================== MAIN SECTION OR CONTENT AREA ===================== --%>
        <%@include file="includes/contents.jsp" %>
        <%-- =================== FOOTER SECTION ===================== --%>
        <%@include file="includes/footer.jsp" %>

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>



    </body>
</html>
