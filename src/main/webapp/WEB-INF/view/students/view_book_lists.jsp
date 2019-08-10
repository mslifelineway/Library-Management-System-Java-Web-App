<%-- 
    Document   : student
    Created on : 18 Mar, 2019, 1:27:02 PM
    Author     : janeman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS-All Books</title>
        <%--<c:import url="all_plugins.jsp" charEncoding="UTF-8"/>--%>
        <%@include  file="../all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <link href="${style_css}" rel="stylesheet">
        <s:url var="admin_style_css" value="/static/css/admin_dashboard_css.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${admin_style_css}" rel="stylesheet">

        <s:url var="admin_all_books_css" value="/static/css/card_css.css"/>
        <%-- CSS OF this page --%>
        <link href="${admin_all_books_css}" rel="stylesheet">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("studentId") == null) {
                response.sendRedirect("../../index");
            }
        %>
        <%@include file="../js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="../includes/student_header.jsp" %>
        <%@include file="../includes/student_menu_section.jsp" %>
        <%-- ---- admin default image --%>     
        <s:url var="url_admin_image" value="/static/img/gallery/c-programming-book1.jpg"/>
        <%--<%@include file="includes/admin_dashboard_content_section.jsp" %>--%>
        <div class="col-lg-10 col-md-12 col-sm-12" style="color:black">
            <div class="row p-2">
                <%-- contents goes here inside this div row --%> 
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${SingleBookDetailsWithBookNumbers}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==0}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>COMMON TO ALL DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
                        </c:if>
                    </c:if>  
                    <c:if test="${ab.book.departmentName ==1}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>CSE DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
                        </c:if>
                    </c:if>
                    <c:if test="${ab.book.departmentName ==2}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>ECE DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
                        </c:if>
                    </c:if>
                    <c:if test="${ab.book.departmentName ==3}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>EEE DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
                        </c:if>
                    </c:if>
                    <c:if test="${ab.book.departmentName ==4}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>CIVIL DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
                        </c:if>
                    </c:if>
                    <c:if test="${ab.book.departmentName ==5}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>MECHANICAL DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
                        </c:if>
                    </c:if>
                    <c:if test="${empty SingleBookDetailsWithBookNumbers}">
                        <div class="col-lg-12 col-md-12 wow fadeInRight">     
                            <h1>Not Issued Yet</h1>
                        </div>
                    </c:if>

                    <div class="col-lg-3 col-md-3 wow fadeInRight"> 
                        <%-- card design starts here --%>
                        <div class="image-flip">
                            <div class="mainflip">
                                <div class="frontside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <p><img class="img-fluid" src="${url_admin_image}" alt=""></p>
                                            <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                            <label class="card-text">Book Number - ${ab.bookNumbers.bookNumber}</label><br>
                                            <c:choose>
                                                <c:when test="${ab.student.studentId=='0'}">
                                                    <span class="badge badge-warning p-2">(Available)</span>
                                                </c:when>    
                                                <c:otherwise>
                                                    <span class="badge badge-danger p-2">(Issued)</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="backside">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <c:choose>
                                                <c:when test="${ab.student.studentId=='0'}">
                                                    <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                    <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                    <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                    <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                    <label class="card-text">Book Number - ${ab.bookNumbers.bookNumber}</label><br>
                                                </c:when>    
                                                <c:otherwise>
                                                    <s:url var="url_student_image" value="/static/user_profile_images/${ab.student.profileImage}" />
                                                    <p><img class="img-fluid  rounded-circle" src="${url_student_image}" alt="" style="width: 120px; height: 120px; border: 1px solid white;"></p>
                                                    <h4 class="card-text text-white">${ab.student.studentName}</h4>
                                                    <small class="badge badge-danger text-black">Book Number - ${ab.bookNumbers.bookNumber}</small><br>
                                                    <label>Admission No - ${ab.student.admissionNo}</label>
                                                    <label>Hall Ticket No - ${ab.student.hallTicketNo}</label>
                                                    <label>Issued On - ${ab.issueBooks.issuedDate}</label>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- card design ends here --%>
                    </div>

                </c:forEach>

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
