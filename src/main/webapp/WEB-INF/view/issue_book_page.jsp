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
        <title>LMS-Issue Book</title>
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
                response.sendRedirect("/login_form");
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
                <c:set var="ab" value="${singleBookDetailsWithBookNumbers}"/>
                <c:choose>
                    <c:when test="${empty singleBookDetailsWithBookNumbers}">
                        <div class="col-lg-12 col-md-12 wow fadeInRight">     
                            <h1>Oops! something went wrong. Book Missing...</h1>
                        </div>
                    </c:when>
                    <c:otherwise>

                        <div class="col-lg-3 col-md-4 col-sm-3 wow fadeInRight"> 
                            <%-- card design starts here --%>
                            <div class="image-flip">
                                <div class="mainflip">
                                    <div class="frontside">
                                        <div class="card">
                                            <div class="card-body text-center">
                                                <p><img class="img-fluid" src="${url_admin_image}" alt=""></p>
                                                <h4 class="card-text text-white">${ab.book.bookName}</h4>
                                                <label class="card-text">Book Number - ${ab.bookNumbers.bookNumber}</label><br>
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
                                                <label class="card-text">Book Number - ${ab.bookNumbers.bookNumber}</label><br>
                                                <ul class="list-inline text-danger">
                                                    <li class="list-inline-item">
                                                        <s:url var="url_issue_book" value="/all_books/issue_book">
                                                            <s:param name="bookId" value="${ab.book.bookId}"/>
                                                            <s:param name="bookNumber" value="${ab.bookNumbers.bookNumber}"/>
                                                        </s:url>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- card design ends here --%>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="col-lg-9 col-md-8 col-sm-12 wow fadeInRight bg-white p-3"> 
                    <s:url var="url_store_books" value="/admin/store_book_details"/>
                    <f:form>
                        <div class="form-group">
                            <h4>Find Student</h4>
                            <input type="text" path="findText" class="form-control" id="find_text" name="findText" placeholder="enter admission no/Hall ticket no"/>
                            <p class="error"></p>
                            <input type="button" onclick="findStudent(${ab.book.bookId},${ab.bookNumbers.bookNumber})" class="btn btn-primary pull-right" value="Find"/>
                            <br><br>
                        </div> 
                    </f:form>
                    <div class="data-info"></div> 
                    <c:choose>
                        <c:when test="${param.act eq 'ss'}">
                            <div class="bg-warning p-4">Book Issued SuccessFully <span class="ion ion-checkmark text-success"></span></div>
                            </c:when>
                            <c:otherwise>
                            <%-- other wise displaying null --%>
                            <div></div>
                            </c:otherwise>
                        </c:choose>

                    <c:choose>
                        <c:when test="${param.act eq 'be'}">
                            <div class="bg-danger p-4 text-white">Failed due to Student have this subject book already &nbsp;<span class="ion ion-close-circled text-white"></span></div>
                            </c:when>
                            <c:otherwise>
                                <%-- other wise displaying null --%>
                            <div></div>
                            </c:otherwise>
                        </c:choose>   
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

    //---------- finding student by admission no or hall ticket number ----
    function findStudent(book_id, book_number) {
        var findText = $("#find_text").val().trim();
        if (findText === "") {
            $(".error").html("<p class='wow fadeInRight text-danger'>please fill this field.</p>");
            $(".data-info").html("");
        } else {
            $.ajax({
                url: 'find_student',
                data: {searchText: findText, bookId: book_id, bookNumber: book_number},
                success: function (data) {
                    $(".data-info").html(data);
                    $(".error").html("");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("ERROR: ", jqXHR);
                    $(".data-info").html("something went wrong :(");
                    $(".error").html("");
                }
            });
        }
    }
</script>

</body>
</html>
