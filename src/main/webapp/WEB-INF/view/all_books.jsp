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
        <title>LMS-All Books</title>
        <%--<c:import url="all_plugins.jsp" charEncoding="UTF-8"/>--%>
        <%@include  file="all_plugins.jsp"%>
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

                <c:if test="${empty allBooksWithCountIssuedBooks}">
                    <div class="col-lg-12 col-md-12 wow fadeInRight">     
                        <h1>No Books Added In The Library</h1>
                    </div>
                </c:if>
                <%-- COMMON FOR ALL DEPARTMENT --%>
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${allBooksWithCountIssuedBooks}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==0}" var="v">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>COMMON TO ALL DEPARTMENT</b></h5></div>

                            <c:set var="x" value="2"/>
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
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Total Books - ${ab.book.totalBooks}</label><br>
                                                <label class="card-text">Issued - ${ab.countIssuedBook}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                        <s:url var="url_view_details" value="/admin/library/view_book_list">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                        </s:url>
                                                        <a href="${url_view_details}" class="text-warning"><p class="text-warning"><b>View Details</b></p></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
                </c:forEach>
                <%-- CSE DEPARTMENT --%>
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${allBooksWithCountIssuedBooks}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==1}">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>CSE DEPARTMENT</b></h5></div>
                                        <c:set var="x" value="2"/>
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
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Total Books - ${ab.book.totalBooks}</label><br>
                                                <label class="card-text">Issued - ${ab.countIssuedBook}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                         <s:url var="url_view_details" value="/admin/library/view_book_list">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                        </s:url>
                                                        <a href="${url_view_details}" class="text-warning"><p class="text-warning"><b>View Details</b></p></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
                </c:forEach>
                <%--   ECE DEPARTMENT --%>
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${allBooksWithCountIssuedBooks}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==2}">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>ECE DEPARTMENT</b></h5></div>
                                        <c:set var="x" value="2"/>
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
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Total Books - ${ab.book.totalBooks}</label><br>
                                                <label class="card-text">Issued - ${ab.countIssuedBook}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                        <s:url var="url_view_details" value="/admin/library/view_book_list">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                        </s:url>
                                                        <a href="${url_view_details}" class="text-warning"><p class="text-warning"><b>View Details</b></p></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
                </c:forEach>
                <%-- EEE DEPARTMENT --%>
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${allBooksWithCountIssuedBooks}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==3}">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>EEE DEPARTMENT</b></h5></div>
                                        <c:set var="x" value="2"/>
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
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Total Books - ${ab.book.totalBooks}</label><br>
                                                <label class="card-text">Issued - ${ab.countIssuedBook}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                        <s:url var="url_view_details" value="/admin/library/view_book_list">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                        </s:url>
                                                        <a href="${url_view_details}" class="text-warning"><p class="text-warning"><b>View Details</b></p></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
                </c:forEach>
                <%-- CIVIL DEPARTMENT --%>
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${allBooksWithCountIssuedBooks}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==4}">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>CIVIL DEPARTMENT</b></h5></div>
                                        <c:set var="x" value="2"/>
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
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Total Books - ${ab.book.totalBooks}</label><br>
                                                <label class="card-text">Issued - ${ab.countIssuedBook}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                        <s:url var="url_view_details" value="/admin/library/view_book_list">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                        </s:url>
                                                        <a href="${url_view_details}" class="text-warning"><p class="text-warning"><b>View Details</b></p></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:if>
                </c:forEach>
                <%-- MEC DEPARTMENT --%>
                <c:set var="x" value="1"/>
                <c:forEach var="ab" items="${allBooksWithCountIssuedBooks}" varStatus="st">
                    <c:if test="${ab.book.departmentName ==5}">
                        <c:if test="${x==1}">
                            <div id="dept" class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><h5><b>MECHANICAL DEPARTMENT</b></h5></div>
                                        <c:set var="x" value="2"/>
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
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="backside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <p class="card-text text-dark">Chaitanya Institute Of Technology & Science <br> Central Library</p>
                                                <label class="card-text">Edition - ${ab.book.edition}</label><br>
                                                <label class="card-text">Author - ${ab.book.authorName}</label><br>
                                                <label class="card-text">Total Books - ${ab.book.totalBooks}</label><br>
                                                <label class="card-text">Issued - ${ab.countIssuedBook}</label><br>
                                                <label class="card-text">Available - (${ab.book.totalBooks-ab.countIssuedBook}/${ab.book.totalBooks})</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                        <s:url var="url_view_details" value="/admin/library/view_book_list">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                        </s:url>
                                                        <a href="${url_view_details}" class="text-warning"><p class="text-warning"><b>View Details</b></p></a>
                                                    </li>
                                                </ul>
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
