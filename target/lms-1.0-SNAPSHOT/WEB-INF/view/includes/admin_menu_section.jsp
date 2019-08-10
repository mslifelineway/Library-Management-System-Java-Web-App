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
                     <s:url var="url_dashboard_page" value="/admin/dashboard"/>
                    <li class="wow fadeInUp">
                        <a href="${url_dashboard_page}">Dashboard<img src="${url_add_book_icon}" alt="" class="img-responsive" /></a>
                    </li>
                    <s:url var="url_add_books_page" value="/admin/add_books_page"/>
                    <li class="wow fadeInUp">
                        <a href="${url_add_books_page}">Add Book<img src="${url_add_book_icon}" alt="" class="img-responsive" /></a>
                    </li>
                        <s:url var="url_view_all_book_icon" value="/static/img/gallery/book-preview.png" />
                        <s:url var="url_all_books_page" value="/admin/library/all_books"/>
                    <li class="wow fadeInUp">
                        <a href="${url_all_books_page}">All Books<img src="${url_view_all_book_icon}" alt="" class="img-responsive" /></a>
                    </li>
                        <s:url var="url_upload_book_icon" value="/static/img/gallery/book-upload.png" />
                        <s:url var="url_pending_students" value="/students/pending_students"/>
                    <li class="wow fadeInUp">
                        <div class="form-group">
                        <a href="${url_pending_students}">Pending Students<img src="${url_upload_book_icon}" alt="" class="img-responsive" />
                            <span class="count_all_pending_students badge badge-danger" style="font-size: 12px; display: none"></span></a>
                        </div>
                    </li>
                     
                </ul>
            </div>
                            
    <script>
        $(document).ready(function(){
            setInterval(getTotalPendingStudentsAjaxCall, 1000); //1000 MS == 1 seconds
            function getTotalPendingStudentsAjaxCall() {
                $.ajax({
                    url: '../admin/count_pending_students', /// since, this page location is -->  /lms/students/count_pending_students
                    method: 'post',
                    success: function(data){
                        if(data.trim() === ''){
                            $('.count_all_pending_students').css("display",'none');
                        }
                        else{
                            if(data.trim() === '0'){
                                $('.count_all_pending_students').css("display",'none');
                            }
                            else{
                                $('.count_all_pending_students').css("display",'initial');
                                $('.count_all_pending_students').text(data); /// data will display only if 'data>0'
                            }
                        }
                    }
                });
            }
        });
    </script>