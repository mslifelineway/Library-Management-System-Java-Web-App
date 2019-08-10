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
        <%@include file="js_plugins.jsp" %>
        <div class="col-lg-10 col-md-12 col-sm-12 bg-white">
            <div class="row p-2 bg-white">
                <c:set var="st" value="${student}"/>
                <c:choose>
                    <c:when test="${empty student}">
                        <div class="frontside col-lg-6 col-md-12 col-sm-12 bg-info p-3 text-white">
                            No Record Found...
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="frontside col-lg-6 col-md-12 col-sm-12">
                            <div class="card">
                                <div class="card-body text-center">
                                    <%-- ---- admin default image --%>     
                                    <s:url var="url_student_image" value="/static/images/im.jpeg"/>
                                    <p><img class="img-fluid  rounded-circle" src="${url_student_image}" alt="" style="width: 120px; height: 120px; border: 1px solid white;"></p>
                                    <h4 class="card-text text-white">${st.studentName}</h4>
                                    <label class="card-text">Admission No : ${st.admissionNo}</label><br>
                                    <label class="card-text">Hall Ticket Number - ${st.hallTicketNo}</label><br>
                                    <c:if test="${st.course==1}">
                                        <label>Course : CSE</label><br>
                                    </c:if>
                                    <c:if test="${st.course==2}">
                                        <label>Course : ECE</label><br>
                                    </c:if>
                                    <c:if test="${st.course==3}">
                                        <label>Course : EEE</label><br>
                                    </c:if>
                                    <c:if test="${st.course==4}">
                                        <label>Course : CIVIL</label><br>
                                    </c:if>
                                    <c:if test="${st.course==5}">
                                        <label>Course : MECHANICAL</label><br>
                                    </c:if>
                                    <%-- YEAR --%>
                                    <c:if test="${st.year==1}">
                                        <label>Year : First Year</label><br>
                                    </c:if>
                                    <c:if test="${st.year==2}">
                                        <label>Year : II nd</label><br>
                                    </c:if>
                                    <c:if test="${st.year==3}">
                                        <label>Year : III rd</label><br>
                                    </c:if>
                                    <c:if test="${st.year==4}">
                                        <label>Year : IV th</label><br>
                                    </c:if>
                                    <%-- SEMESTER --%>
                                    <c:if test="${st.sem==1}">
                                        <label>Semester : I st</label><br>
                                    </c:if>
                                    <c:if test="${st.sem==2}">
                                        <label>Semester : II nd</label><br>
                                    </c:if>  
                                </div>
                            </div>
                        </div>
                        <div class="frontside col-lg-6 col-md-12 col-sm-12">
                            <%-- STATUS=1 ==> NOT VERIFIED , STATUS=2 ==> VERIFIED , STATUS=3 ==> PENDING --%>
                            <c:if test="${st.status==1}">
                                <label>This account profile is not completed yet&nbsp;<span class="ion ion-close-circled text-danger" style="font-size:20px"></span></label><br>
                                <p><font color="red">Notice </font>: Student must complete his account by filling all the required details.</p>
                                <h5>This student is unable to issue any books.</h5>
                            </c:if> 
                            <c:if test="${st.status==2}">
                                <label>This account is verified <span class="ion ion-checkmark-circled text-primary" style="font-size:20px"></span></label><br>
                                
                                
                                <s:url var="url_confirm_issue_book" value="/admin/issue_books/confirm">
                                    <s:param name="studentId" value="${st.studentId}"/>
                                    <%-- HERE, bookId and bookNumber is comming through controller and passing from issue_book_page.jsp
to it's controller that is the controller which is calling this view --%>
                                    <s:param name="bookId" value="${bookId}"/>
                                    <s:param name="bookNumber" value="${bookNumber}"/>
                                </s:url>
                                <c:choose>
                                    <c:when test="${empty issueBooks}">
                                        <c:if test="${totalIssuedBooks<5}">
                                        <h5>This student is able to issue book.</h5>
                                        <br><br><a href="${url_confirm_issue_book}" class="btn btn-primary btn-md form-control">Confirm</a>
                                    </c:if>
                                    </c:when>
                                        <c:otherwise>
                                            <h4>Unable to issue book with this book number : ${bookNumber} </h4>
                                            <p><font color="red">Notice </font>: The book with this book number is already issued by other student.<br>
                                            please try with other book number.</p>
                                        </c:otherwise>
                                        
                                </c:choose>
                                
                                <c:if test="${totalIssuedBooks>=5}">
                                    <br> <h4>Student has issued 5 books already so, this student is not able to issue any books.</h4>
                                    <p><font color="red">Notice </font>: Student must return some books then he will be able to issue any books.</p>
                                </c:if>
                                </c:if>

                            <c:if test="${st.status==3}">
                                <label>This account is not verified by admin <span class="ion ion-alert-circled text-warning" style="font-size:20px"></span></label><br>
                                <p><font color="red">Notice </font>: Student should visit to admin for final verification.</p>
                                <h5>This student is unable to issue any books.</h5>
                                </c:if> 
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <%-- java scripting code goes here --%>
        <script type="text/javascript">
        </script>
    </body>
</html>
