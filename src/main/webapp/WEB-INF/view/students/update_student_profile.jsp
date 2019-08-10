<%-- 
    Document   : update_student_profile
    Created on : 4 May, 2019, 11:26:32 PM
    Author     : janeman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <%@include  file="../all_plugins.jsp"%>
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
        <%@include file="../js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="../includes/student_header.jsp" %>
        <%@include file="../includes/student_menu_section.jsp" %>
        <%--<%@include file="includes/admin_dashboard_content_section.jsp" %>--%>
        <div class="col-lg-10 col-md-12 col-sm-12 wow fadeInRight" style="color:black">
            <div class="row">
                <%-- contents goes here inside this div row --%>
                <c:set var="st" value="${student}"/>
                <div class="col-lg-12 col-md-12"> 
                    <%-- card design starts here --%>
                    <div class="frontside">
                        <div class="card">
                            <div class="card-body p-2">
                                <h5 class="card-text text-white">  Update Your Profile.</h5>

                                <s:url var="url_profile_updation" value="/student/confirm_profile_updation"/>
                                <f:form id="multipart-form" action="${url_profile_updation}" method="post" modelAttribute="student_profile_data_command" enctype="multipart/form-data">
                                    <fieldset class="fieldset-border">
                                        <legend class="fieldset-border">FILL YOUR PROFILE DATA</legend>
                                        <label>Hello : ${st.studentName}</label>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <f:input type="text" class="form-control" path="student.studentName" placeholder="Enter your name" />
                                            <c:if test="${param.act eq 'name'}">
                                                <p class="wow fadeInRight rounded_border text-danger bg-white" style="font-size:10px;"><b>Name is missing.</b></p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Hall Ticket No</label>
                                            <f:input type="text" class="form-control" path="student.hallTicketNo" placeholder="Enter hall ticket no" />
                                            <c:if test="${param.act eq 'htno'}">
                                                <p class="wow fadeInRight rounded_border text-danger bg-white" style="font-size:10px;"><b>Hall Ticket Number is missing.</b></p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Admission No</label>
                                            <f:input type="text" class="form-control" path="student.admissionNo" placeholder="Enter admission no" />
                                            <c:if test="${param.act eq 'adno'}">
                                                <p class="wow fadeInRight rounded_border text-danger bg-white" style="font-size:10px;"><b>admission no is missing.</b></p>
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
                                            <label>Mobile No</label>
                                            <f:input type="text" class="form-control" maxlength="10" path="student.contactNo" placeholder="Enter your name" />
                                            <c:if test="${param.act eq 'mbno'}">
                                                <p class="wow fadeInRight rounded_border text-danger bg-white" style="font-size:10px;"><b>contact no is missing.</b></p>
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>Date Of Birth</label><br>
                                            <f:select id="selectDate" path="birth_date">
                                                <f:option value="0">DD</f:option>
                                                <f:option value="01">01</f:option>
                                                <f:option value="02">02</f:option>
                                                <f:option value="03">03</f:option>
                                                <f:option value="04">04</f:option>
                                                <f:option value="05">05</f:option>
                                                <f:option value="06">06</f:option>
                                                <f:option value="07">07</f:option>
                                                <f:option value="08">08</f:option>
                                                <f:option value="09">09</f:option>
                                                <f:option value="10">10</f:option>
                                                <f:option value="11">11</f:option>
                                                <f:option value="12">12</f:option>
                                                <f:option value="13">13</f:option>
                                                <f:option value="14">14</f:option>
                                                <f:option value="15">15</f:option>
                                                <f:option value="16">16</f:option>
                                                <f:option value="17">17</f:option>
                                                <f:option value="18">18</f:option>
                                                <f:option value="19">19</f:option>
                                                <f:option value="20">20</f:option>
                                                <f:option value="21">21</f:option>
                                                <f:option value="22">22</f:option>
                                                <f:option value="23">23</f:option>
                                                <f:option value="24">24</f:option>
                                                <f:option value="25">25</f:option>
                                                <f:option value="26">26</f:option>
                                                <f:option value="27">27</f:option>
                                                <f:option value="28">28</f:option>
                                                <f:option value="29">29</f:option>
                                                <f:option value="30">30</f:option>
                                                <f:option value="31">31</f:option>
                                            </f:select>
                                            <f:select id="selectMonth" path="birth_month">
                                                <f:option value="">MM</f:option>
                                                <f:option value="April">April</f:option>
                                                <f:option value="May">May</f:option>
                                                <f:option value="June">June</f:option>
                                                <f:option value="July">July</f:option>
                                                <f:option value="August">August</f:option>
                                                <f:option value="September">September</f:option>
                                                <f:option value="October">October</f:option>
                                                <f:option value="November">November</f:option>
                                                <f:option value="December">December</f:option>
                                                <f:option value="January">January</f:option>
                                                <f:option value="February">February</f:option>
                                                <f:option value="March">March</f:option>
                                                <f:option value="April">April</f:option>
                                                <f:option value="May">May</f:option>
                                                <f:option value="June">June</f:option>
                                                <f:option value="July">July</f:option>
                                                <f:option value="August">August</f:option>
                                                <f:option value="September">September</f:option>
                                            </f:select>
                                            <f:select id="selectYear" path="birth_year">
                                                <f:option value="0">YY</f:option>
                                                <f:option value="1980">1980</f:option>
                                                <f:option value="1982">1982</f:option>
                                                <f:option value="1983">1983</f:option>
                                                <f:option value="1984">1984</f:option>
                                                <f:option value="1985">1985</f:option>
                                                <f:option value="1986">1986</f:option>
                                                <f:option value="1987">1987</f:option>
                                                <f:option value="1988">1988</f:option>
                                                <f:option value="1989">1989</f:option>
                                                <f:option value="1990">1990</f:option>
                                                <f:option value="1991">1991</f:option>
                                                <f:option value="1992">1992</f:option>
                                                <f:option value="1993">1993</f:option>
                                                <f:option value="1994">1994</f:option>
                                                <f:option value="1995">1995</f:option>
                                                <f:option value="1996">1996</f:option>
                                                <f:option value="1997">1997</f:option>
                                                <f:option value="1998">1998</f:option>
                                                <f:option value="1999">1999</f:option>
                                                <f:option value="2000">2000</f:option>
                                                <f:option value="2001">2001</f:option>
                                                <f:option value="2002">2002</f:option>
                                                <f:option value="2003">2003</f:option>
                                                <f:option value="2004">2004</f:option>
                                                <f:option value="2005">2005</f:option>
                                                <f:option value="2006">2006</f:option>
                                                <f:option value="2007">2007</f:option>
                                                <f:option value="2008">2008</f:option>
                                                <f:option value="2009">2009</f:option>
                                                <f:option value="2010">2010</f:option>
                                                <f:option value="2011">2011</f:option>
                                                <f:option value="2012">2012</f:option>
                                                <f:option value="2013">2013</f:option>
                                                <f:option value="2014">2014</f:option>
                                                <f:option value="2015">2015</f:option>
                                                <f:option value="2016">2016</f:option>
                                                <f:option value="2017">2017</f:option>
                                                <f:option value="2018">2018</f:option>
                                                <f:option value="2019">2019</f:option>
                                            </f:select>
                                        </div>
                                        <button class="rounded_border btn" type="submit" style="background-color: transparent" class="default-button">Update</button>
                                    </fieldset> 
                                </f:form>
                                <%-- code for displying errors or messages or any notifications on this page--%>
                                <c:if test="${param.act eq 'fm'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Some fields are missing...");
                                        });
                                    </script>
                                </c:if>

                                <c:if test="${param.act eq 'lg_ano'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Updation Failed! <br>you can't use admission no more than 10 characters.");
                                        });
                                    </script>
                                </c:if>

                                <c:if test="${param.act eq 'ic'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Updation Failed! please enter a valid contact no.<br> (size: 10)");
                                        });
                                    </script>
                                </c:if>

                                <c:if test="${param.act eq 'lg_cno'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Updation Failed! <br> you can't use more than 10 digits.");
                                        });
                                    </script>
                                </c:if>
                                <c:if test="${param.act eq 'ar'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Account is already registered on this new Admission number!");
                                        });
                                    </script>
                                </c:if>

                                <c:if test="${param.act eq 'updated'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Profile Updated Successfully!");
                                        });
                                    </script>
                                </c:if>

                                <c:if test="${param.act eq 'nv'}">
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#open-modal').modal('show');
                                            $('#info').html("Account is already registered on this credentials but not verified yet. <br> please contact to Admin for account verification.");
                                        });
                                    </script>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>          
        <%-- below three closing div must be there that is not an error 
        it's opening tag is inside admin_dashboard_menu_section.jsp page --%>
    </div>
</div>
</div>
<%-- auto popup model for displaying message, errors or notifications--%>
<div class="modal fade" id="open-modal" role="dialog">
    <div class="modal-dialog modal-lg">
        <!--Modal Content-->
        <div class="modal-content" id="content-modal-box">
            <div class="modal-body" style="padding:10px">
                <p id="info" style="font-family: serif; color: #FFF"></p>
                <p class="pull-right" aria-hidden="true" style="color:red;margin: 5px;background: cyan;cursor: pointer;font-size: 25px;padding: 4px 10px;" data-dismiss="modal" aria-label="Close">x</p>
            </div>
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
