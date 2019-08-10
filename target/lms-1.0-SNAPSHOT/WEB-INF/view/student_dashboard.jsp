<%-- 
    Document   : student_dashboard
    Created on : 17 Mar, 2019, 11:25:33 PM
    Author     : janeman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LMS-Student Dashboard</title>
        <%@include  file="all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <link href="${style_css}" rel="stylesheet">
        <s:url var="admin_style_css" value="/static/css/admin_dashboard_css.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${admin_style_css}" rel="stylesheet">
        <%-- CARD css--%>
        <s:url var="admin_all_books_css" value="/static/css/card_css.css"/>
        <link href="${admin_all_books_css}" rel="stylesheet">
        <style>
            #multipart-form{

            }
            #multipart-form input[type=file]{
                opacity: 1;
                visibility: none;
                display: none;
                background: transparent;    
                border: 2px solid red;
            }

            #multipart-form #span{
                text-color: white;
                height: 45px;
                width: 45px;
                text-align: center;
                font-size: 40px;
                color: yellowgreen;
                transition: 0.5s;
                cursor: pointer;
            }
            #multipart-form #span:hover {
                text-color: red;
                background: green;
                transition: 0.5s;
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
        <%@include file="js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="includes/student_header.jsp" %>
        <%@include file="includes/student_menu_section.jsp" %>
        <div class="col-lg-10 col-md-12 col-sm-12 wow fadeInRight" style="color:black">
            <div class="row">
                <%-- contents goes here inside this div row --%> 
                <c:set var="st" value="${StudentProfile}"/>
                <c:if test="${st.status==1}">
                    <div class="col-lg-12 col-md-12"> 
                        <%-- contents goes here inside this div (FEATURES/PROCEDURES FOR NOT-VERIFIED STUDENT)--%>     
                        <%-- card design starts here --%>
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body p-2">
                                    <h5 class="card-text text-white">  PROFILE IS NOT COMPLETED YET.</h5>
                                    <p class="card-text text-danger">please fill and submit your data, 
                                        then visit to the admin for profile verifications.</p>

                                    <s:url var="url_complete_student_profile" value="/student/submit_profile_data"/>
                                    <f:form id="multipart-form" action="${url_complete_student_profile}" method="post" modelAttribute="student_profile_data_command" enctype="multipart/form-data">
                                        <fieldset class="fieldset-border">
                                            <legend class="fieldset-border">COMPLETE PROFILE DATA</legend>
                                            <label>Hello : ${st.studentName}</label>
                                            <div class="form-group">
                                                <label>Hall Ticket No</label>
                                                <f:input type="text" class="form-control" path="student.hallTicketNo" placeholder="Enter hall ticket no" />
                                                <c:if test="${param.act eq 'htno'}">
                                                    <p class="wow fadeInRight rounded_border text-danger bg-white" style="font-size:10px;"><b>Hall Ticket Number is missing.</b></p>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label>Select Course</label><br>
                                                <f:select path="student.course" class="form-control text-center">
                                                    <f:option value="1">Computer Science Engineering</f:option>
                                                    <f:option value="2">Electronics & Communication Engineering</f:option>
                                                    <f:option value="3">Electrical & Electronics Engineering</f:option>
                                                    <f:option value="4">Civil Engineering</f:option>
                                                    <f:option value="5">Mechanical Engineering</f:option>
                                                </f:select>
                                            </div>
                                            <div class="form-group">
                                                <label>Appearing Year</label><br>
                                                <f:select path="student.year" class="form-control text-center">
                                                    <f:option value="1">1</f:option>
                                                    <f:option value="2">2</f:option>
                                                    <f:option value="3">3</f:option>
                                                    <f:option value="4">4</f:option>
                                                </f:select>
                                            </div>
                                            <div class="form-group">
                                                <label>Appearing Semester</label><br>
                                                <f:select path="student.sem" class="form-control text-center">
                                                    <f:option value="1">1</f:option>
                                                    <f:option value="2">2</f:option>
                                                </f:select>
                                            </div>
                                            <div class="form-group">
                                                Profile Image : &nbsp;<f:input path="fileUpload.files" id="file" class="inputFile" type="file" cssStyle="border-radius:10px; background: white;"/>
                                                <input type="text" disabled="disabled"/>&nbsp;&nbsp;<label for="file" class="align-self-center"><span id="span" class="ion ion-upload align-self-center"></span></label>

                                            </div>
                                            <button class="rounded_border btn" type="submit" style="background-color: transparent" class="default-button">Submit</button>
                                        </fieldset> 
                                    </f:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${st.status==2}">
                    <div class="col-lg-12 col-md-12"> 
                        <%-- contents goes here inside this div (FEATURES/PROCEDURES FOR NOT-VERIFIED STUDENT)--%>   
                        <h4 class="card-text text-white"> PROFILE IS VERIFIED.</h4><br>

                    </div>

                </c:if>
                <c:if test="${st.status==3}">
                    <div class="col-lg-12 col-md-12"> 
                        <%-- contents goes here inside this div (FEATURES/PROCEDURES FOR PENDING STATUS STUDENT)--%>   
                        <div class="container bg-white">
                            <div class="p-4 bg-white">
                                <h5 class="card-text">Request Sent &nbsp;<span class="ion ion-checkmark-circled text-info"></span></h5>
                                <p class="card-text text-danger">please visit to the admin/librarian for account verification.</p>
                            </div>
                        </div>
                    </div>

                </c:if>
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
    $(document).ready(function () {
        $('#multipart-form input[type="file"]').change(function (e) {
            $(this).siblings('input[type="text"]').val(e.target.files[0].name);
        });
    });
</script>  

</body>
</html>
