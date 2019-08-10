<%-- 
    Document   : student_profile
    Created on : 17 Mar, 2019, 11:25:33 PM
    Author     : janeman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile-${studentName}</title>
        <%@include  file="../all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <link href="${style_css}" rel="stylesheet">
        <s:url var="admin_style_css" value="/static/css/admin_dashboard_css.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${admin_style_css}" rel="stylesheet">
        <%-- CARD css--%>
        <s:url var="admin_all_books_css" value="/static/css/card_css.css"/>
        <link href="${admin_all_books_css}" rel="stylesheet">
        <s:url var="image_frame" value="/static/images/3d_frame.jpg"/>
        <s:url var="image_frame1" value="/static/images/star_frame.png"/>
        <style>

            .data-section p{
                font-size: 20px;
                width: 30%;
                display: inline;
                color: #222;
                text-align: right; 
                margin: 4px 4px;
                padding: 4px 2px;
            }
            .data-section label{
                margin: 4px 4px;
                padding: 4px 2px;
                border: 1px solid #ccc;
                width: 70%; 
                float: right;
            }
            #image_container{
                border: 1px solid transparent;
                border-image-source: url('${image_frame1}');
                border-image-repeat: round;
                border-image-slice: 30;
                border-image-width: 10px;
                padding: 6px 6px;
                width:270px;
                height:auto;
            }
            #img-frame{
/*                background: url('${image_frame}');
                background-size: cover;*/
                border: 1px solid transparent;
                border-image-source: url('${image_frame}');
                border-image-repeat: round;
                border-image-slice: 30;
                border-image-width: 10px;
                padding:10px 10px;
            }
            #img-frame img{
                background-size: cover;
                width:270px;
                height:240px;
            }
            .image-section a: visited{
                color: white;
            }
        </style>
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
        <%@include file="../js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="../includes/student_header.jsp" %>
        <%@include file="../includes/student_menu_section.jsp" %>
        <div class="col-lg-10 col-md-12 col-sm-12 wow fadeInRight" style="color:black">
            <s:url var="url_student_image" value="/static/user_profile_images/${student.profileImage}"/>
            <div class="row">
                <%-- contents goes here inside this div row --%>  
                <c:set value="${student}" var="st" />
                <%-- card design starts here --%>
                <div class="frontside">
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-lg-12 col-md-12 p-2 text-white">
                                <div class="align-self-center form-group">
                                    <label class="text-white"> Welcome : ${st.studentName} </label>&nbsp;&nbsp;
                                    <c:if test="${st.status==1}">
                                        <label class="badge badge-danger text-center align-self-center">Account Status: Not Verified &nbsp;<span class="ion ion-close-circled text-warning" style="font-size:20px"></span></label><br>
                                        </c:if> 
                                        <c:if test="${st.status==2}">
                                        <label class="badge badge-success text-center align-self-center">Account Status: verified &nbsp;<span class="ion ion-checkmark-circled text-white" style="font-size:20px"></span></label><br>
                                        </c:if>
                                        <c:if test="${st.status==3}">
                                        <label class="badge badge-warning text-center align-self-center">Account Status: pending &nbsp;<span class="ion ion-alert-circled text-danger" style="font-size:20px"></span></label><br>
                                        </c:if>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-12 ">
                                <%-- data area --%>
                                <div class="data-section text-lg-left">
                                    <div class="form-group">
                                        <p> Student Name</p> <label> ${st.studentName}</label>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${!empty st.hallTicketNo}">
                                            <p>Hall Ticket No</p><label>${st.hallTicketNo}</label>
                                        </c:if>
                                    </div>
                                    <div class="form-group">   
                                        <p>Admission No</p><label>${st.admissionNo}</label> 
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.course==1}">
                                            <p>Course</p><label> CSE</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.course==2}">
                                            <p>Course</p><label> ECE</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.course==3}">
                                            <p>Course</p><label> EEE</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.course==4}">
                                            <p>Course</p><label> CIVIL</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.course==5}">
                                            <p>Course</p><label> MECHANICAL</label> 
                                        </c:if>
                                    </div>
                                    <%-- YEAR --%>

                                    <div class="form-group">
                                        <c:if test="${st.year==1}">
                                            <p>Year</p><label> First Year</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.year==2}">
                                            <p>Year</p><label> II nd</label>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.year==3}">
                                            <p>Year</p><label> III rd</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.year==4}">
                                            <p>Year</p><label> IV th</label> 
                                        </c:if>
                                    </div>
                                    <%-- SEMESTER --%>

                                    <div class="form-group">
                                        <c:if test="${st.sem==1}">
                                            <p>Semester</p><label> I st</label> 
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <c:if test="${st.sem==2}">
                                            <p>Semester</p><label> II nd</label> 
                                        </c:if>  
                                    </div>
                                    <div class="form-group">   
                                        <p>Mobile No</p><label>${st.contactNo}</label> 
                                    </div>
                                    <div class="form-group">   
                                        <p>DOB</p><label>${st.birthDate}</label> 
                                    </div>
                                    <div class="form-group">   
                                        <p>Joined On</p><label>${st.regDate}</label> 
                                    </div>
                                    <div class="form-group">  
                                        <s:url var="url_update_profile" value="/student/update_profile"/>
                                        <a href="${url_update_profile}" class="btn btn-md bg-success text-white">Edit Profile</a>
                                    </div>
                                </div> 
                            </div> 
                            <div class="image-section col-lg-3 col-md-4 text-center">
                                <div id="image_container">
                                    <div id="img-frame">
                                        <img class="img-fluid img-responsive" src="${url_student_image}"  alt=""/>
                                    </div>
                                </div>
                                        <s:url var="url_update_profile_image" value="/student/update_profile_image"/>
                                <br><a href="${url_update_profile_image}" class="rounded_border text-white">Update Profile Image</a>
                            </div> 
                        </div>

                        <%-- card design ends here --%>
                    </div>
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
        $('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
    });

</script>  

</body>
</html>
