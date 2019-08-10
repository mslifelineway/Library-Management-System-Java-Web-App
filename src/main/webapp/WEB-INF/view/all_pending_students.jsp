<%-- 
    Document   : admin_dashboard
    Created on : 18 Mar, 2019, 1:27:02 PM
    Author     : janeman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS-All Pending Students</title>
        <%--<c:import url="all_plugins.jsp" charEncoding="UTF-8"/>--%>
        <%@include  file="all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <link href="${style_css}" rel="stylesheet">
        <s:url var="admin_style_css" value="/static/css/admin_dashboard_css.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${admin_style_css}" rel="stylesheet">
        <%-- CARD css--%>
        <s:url var="admin_all_books_css" value="/static/css/card_css.css"/>
        <link href="${admin_all_books_css}" rel="stylesheet">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("adminId") == null) {
                response.sendRedirect("../login_form");
            }
        %>
        <%@include file="js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="includes/admin_header.jsp" %>
        <%@include file="includes/admin_menu_section.jsp" %>
        <%-- ---- admin default image --%>     
        <s:url var="url_admin_image" value="/static/img/gallery/c-programming-book1.jpg"/>
        <%--<%@include file="includes/admin_dashboard_content_section.jsp" %>--%>
        <div class="col-lg-10 col-md-12 col-sm-12" style="color:black">
            <div class="row p-2">
                <%-- contents goes here inside this div row --%> 
                <c:set var="x" value="1"/>

                <c:if test="${empty AllPendingStudents}">
                    <div class="col-lg-12 col-md-12 wow fadeInRight">     
                        <h1>Zero Pending Students.</h1>
                    </div>
                </c:if>

                <c:forEach var="ab" items="${AllPendingStudents}" varStatus="st">
                    <div class="col-lg-3 col-md-3 wow fadeInRight"> 
                        <%-- card design starts here --%>
                        <div class="image-flip">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <s:url var="url_student_image" value="/static/user_profile_images/${ab.profileImage}"/>
                                            <img class="img-fluid  rounded-circle" src="${url_student_image}" alt="" style="width: 120px; height: 120px; border: 1px solid white;"></p>
                                            <h4 class="card-text text-white">${ab.studentName}</h4>
                                            <label class="card-text">Admission Number - ${ab.admissionNo}</label><br>
                                            <label class="card-text">Hall Ticket Number - ${ab.hallTicketNo}</label><br>
                                            <c:if test="${ab.course==1}">
                                                <label>Course : CSE</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==2}">
                                                <label>Course : ECE</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==3}">
                                                <label>Course : EEE</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==4}">
                                                <label>Course : CIVIL</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==5}">
                                                <label>Course : MECHANICAL</label><br>
                                            </c:if>
                                            <%-- YEAR --%>
                                            <c:if test="${ab.year==1}">
                                                <label>Year : First Year</label><br>
                                            </c:if>
                                            <c:if test="${ab.year==2}">
                                                <label>Year : II nd</label><br>
                                            </c:if>
                                            <c:if test="${ab.year==3}">
                                                <label>Year : III rd</label><br>
                                            </c:if>
                                            <c:if test="${ab.year==4}">
                                                <label>Year : IV th</label><br>
                                            </c:if>
                                            <%-- SEMESTER --%>
                                            <c:if test="${ab.sem==1}">
                                                <label>Semester : I st</label><br>
                                            </c:if>
                                            <c:if test="${ab.sem==2}">
                                                <label>Semester : II nd</label><br>
                                            </c:if>  
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <h5 class="card-text text-white">Name - ${ab.studentName}</h5> 
                                            <label>Admission No - ${ab.admissionNo}</label><br>
                                            <label>Hall Ticket No - ${ab.hallTicketNo}</label> <br>
                                            <c:if test="${ab.course==1}">
                                                <label>Course : CSE</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==2}">
                                                <label>Course : ECE</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==3}">
                                                <label>Course : EEE</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==4}">
                                                <label>Course : CIVIL</label><br>
                                            </c:if>
                                            <c:if test="${ab.course==5}">
                                                <label>Course : MECHANICAL</label><br>
                                            </c:if>
                                            <%-- YEAR --%>
                                            <c:if test="${ab.year==1}">
                                                <label>Year : First Year</label><br>
                                            </c:if>
                                            <c:if test="${ab.year==2}">
                                                <label>Year : II nd</label><br>
                                            </c:if>
                                            <c:if test="${ab.year==3}">
                                                <label>Year : III rd</label><br>
                                            </c:if>
                                            <c:if test="${ab.year==4}">
                                                <label>Year : IV th</label><br>
                                            </c:if>
                                            <%-- SEMESTER --%>
                                            <c:if test="${ab.sem==1}">
                                                <label>Semester : I st</label><br>
                                            </c:if>
                                            <c:if test="${ab.sem==2}">
                                                <label>Semester : II nd</label><br>
                                            </c:if>   
                                            <ul class="list-inline text-danger">
                                                <li class="list-inline-item">
                                                    <s:url var="url_student_profile" value="/student/view_profile">
                                                        <s:param name="studentId" value="${ab.studentId}"/>
                                                    </s:url>
                                                    <a class=" text-xs-center" target="_blank" href="${url_student_profile}">
                                                        <span class="badge badge-danger">View Profile</span>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <s:url var="url_verify_student" value="/penging_students/verify">
                                                        <s:param name="student_id" value="${ab.studentId}"/>
                                                    </s:url>
                                                    <a class=" text-xs-center" href="${url_verify_student}">
                                                        <span class="badge badge-warning">Verify</span>
                                                    </a>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${param.act eq 'v'}">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#open-modal').modal('show');
                            $('#info').html("Verified");
                        });
                    </script>
                </c:if>
                <%-- auto popup model for displaying message, errors or notifications--%>
                <div class="modal" id="open-modal" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!--Modal Content-->
                        <div class="modal-content p-4" id="content-modal-box">
                            <div class="modal-body" style="padding:0px;">
                                <p id="info" style="font-family: serif; color: #FFF ;font-size: 25px;"></p>
                                <p class="pull-right btn btn-sm" aria-hidden="true" style="color:red;padding 0px 0px;font-size:25px;background: cyan;cursor: pointer;" data-dismiss="modal" aria-label="Close">x</p>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- contents ends here inside this div --%> 
            </div>
        </div>
        <%-- below three closing div must be there that is not an error 
        it's opening tag is inside admin_dashboard_menu_section.jsp page --%>
    </div>
</div>
</div>
<%-- java scripting code goes here --%>
<script type="text/javascript">

    $(window).scroll(function () {
        $('nav').toggleClass('scrolled', $(this).scrollTop() > 100);
    });
</script>

</body>
</html>
