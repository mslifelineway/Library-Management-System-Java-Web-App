<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="middle-section container-fluid">
    <div class="content"> 
        <div class="row">
            <%-- Above three opening div must be there that is not an error 
     it's closing tag onto the page where it is included --%>
            <div class="menu-div col-lg-2  col-md-12 col-sm-12 wow fadeInLeft">
                <ul>
                    <s:url var="url_add_book_icon" value="/static/img/gallery/book-plus.png" />
                     <s:url var="url_dashboard_page" value="/student/student_dashboard"/>
                    <li class="wow fadeInUp">
                        <a href="${url_dashboard_page}">Dashboard<img src="${url_add_book_icon}" alt="" class="img-responsive" /></a>
                    </li>
                    <s:url var="url_student_library" value="/student/student_library"/>
                    <li class="wow fadeInUp">
                        <a href="${url_student_library}">My Library<img src="${url_add_book_icon}" alt="" class="img-responsive" /></a>
                    </li>
                        <s:url var="url_view_all_book_icon" value="/static/img/gallery/book-preview.png" />
                        <s:url var="url_all_books_page" value="/student/library/all_books"/>
                    <li class="wow fadeInUp">
                        <a href="${url_all_books_page}">All Books<img src="${url_view_all_book_icon}" alt="" class="img-responsive" /></a>
                    </li>
                        
                </ul>

            </div>