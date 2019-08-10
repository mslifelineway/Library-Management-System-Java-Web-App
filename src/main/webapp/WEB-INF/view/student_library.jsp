<%-- 
    Document   : student library
    Created on : 18 Mar, 2019, 1:27:02 PM
    Author     : janeman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS-Student Library</title>
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
        <%-- CSS OF this page --%>
        <link href="${admin_all_books_css}" rel="stylesheet">

    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("studentId") == null) {
                response.sendRedirect("/lms/index");
            }
        %>
        <%@include file="js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="includes/student_header.jsp" %>
        <%@include file="includes/student_menu_section.jsp" %>
        <%-- ---- admin default image --%>     
        <s:url var="url_admin_image" value="/static/img/gallery/c-programming-book1.jpg"/>
        <div class="col-lg-10 col-md-12 col-sm-12" style="color:black">
            <div class="row p-2">
                <%-- contents goes here inside this div row --%> 

                <c:if test="${empty StudentLibrary}">
                    <div class="col-lg-12 col-md-12 wow fadeInRight">     
                        <h1>No Books Found In Your Library</h1>
                    </div>
                </c:if>
                <%-- Issued Books Details --%>
                <c:if test="${!empty StudentLibrary}">
                    <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>Issued Books</b></h5></div>
                </c:if>
                            
                <c:forEach var="sl" items="${StudentLibrary}" varStatus="st">
                    <c:if test="${sl.issueBooks.status==1}">
                        <div class="col-lg-3 col-md-3 wow fadeInRight"> 
                            <%-- card design starts here --%>
                            <div class="image-flip">
                                <div class="mainflip">
                                    <div class="frontside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <p><img class="img-fluid" src="${url_admin_image}" alt=""></p>
                                                <h4 class="card-text text-white">${sl.book.bookName}</h4>
                                                <label class="card-text">Author - ${sl.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${sl.book.edition}</label><br>
                                                <label class="card-text text-white">Book Number - ${sl.bookNumbers.bookNumber}</label><br>
                                                <label class="card-text">Issued Date - ${sl.issueBooks.issuedDate}</label><br>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${sl.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${sl.book.edition}</label><br>
                                                <label class="card-text">Author - ${sl.book.authorName}</label><br>
                                                <label class="card-text text-white">Book Number - ${sl.bookNumbers.bookNumber}</label><br>
                                                <label class="card-text">Issued Date - ${sl.issueBooks.issuedDate}</label><br>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
                </c:forEach>
                    
                <c:if test="${!empty StudentLibrary}">
                    <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>Returned Books</b></h5></div>
                </c:if>
                    
                <c:forEach var="sl" items="${StudentLibrary}" varStatus="st">
                    <c:if test="${sl.issueBooks.status==2}">
                        <div class="col-lg-3 col-md-3 wow fadeInRight"> 
                            <%-- card design starts here --%>
                            <div class="image-flip">
                                <div class="mainflip">
                                    <div class="frontside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <p><img class="img-fluid" src="${url_admin_image}" alt=""></p>
                                                <h4 class="card-text text-white">${sl.book.bookName}</h4>
                                                <label class="card-text">Author - ${sl.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${sl.book.edition}</label><br>
                                                <label class="card-text">Book Number - ${sl.bookNumbers.bookNumber}</label><br>
                                                <label class="card-text">Return Date - ${sl.issueBooks.returnedDate}</label><br>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${sl.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${sl.book.edition}</label><br>
                                                <label class="card-text">Author - ${sl.book.authorName}</label><br>
                                                <label class="card-text">Book Number - ${sl.bookNumbers.bookNumber}</label><br>
                                                <label class="card-text">Issued Date - ${sl.issueBooks.issuedDate}</label><br>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
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
