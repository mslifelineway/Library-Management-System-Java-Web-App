<%-- 
    Document   : student_reg_form
    Created on : 16 Mar, 2019, 6:20:26 PM
    Author     : janeman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <title>LMS-Student Registration</title>
        <%@include  file="all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${style_css}" rel="stylesheet">
        <%-- ========== student_reg_form_responsive.css plugin ====================== --%>
        <s:url var="student_reg_form_responsive" value="/static/css/student_reg_form_responsive.css"/>
        <link href="${student_reg_form_responsive}" rel="stylesheet">
    </head>
    <body>

        <%@include file="js_plugins.jsp" %>
        <%-- ========== HEADER SECTION ====================== --%>
        <%@include file="includes/header.jsp" %>

        <%-- =================== STUDENT LOGIN FORM SECTION ===================== --%>
        <section id="intro" class="student-reg-form-intro">

            <div class="intro-text">
                <h2>WELCOME TO CITS LIBRARY MANAGEMENT</h2>
                <p style="width: 80%; margin: 0 auto">A lack of illusion is golden, and it is quite possible that creativity is the highest form of intelligence</p>
            </div>

            <div class="product-screens">
                <div id="login-reg-row" class="row student-reg-row" style="padding:5px">
                    <div class="col-lg-5 col-md-5 col-sm-12 box wow fadeInLeft" style="text-align: left; color: #000000">
                        <s:url var="url_register_student" value="/student/register"/>
                        <f:form action="${url_register_student}" modelAttribute="student_reg_command">
                            <fieldset class="fieldset-border">
                                <legend class="fieldset-border">Student Registration</legend>
                                <div class="form-group">
                                    <label>Name</label>
                                    <f:input type="text" path="student.studentName" class="form-control" placeholder="Enter your name" />
                                </div>

                                <div class="form-group">
                                    <label>Admission Number</label>
                                    <f:input type="text" maxlength="10" path="student.admissionNo" class="form-control" placeholder="Enter admission no"/>
                                </div>

                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <f:input type="text" maxlength="10" path="student.contactNo" class="form-control" placeholder="Enter mobile no" />
                                </div>

                                <div class="form-group">
                                    <label>Password</label>
                                    <f:input type="password" path="student.password" class="form-control" placeholder="********" />
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
                                <button type="submit" style="background-color: transparent" class="default-button">Register</button>
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
                                    $('#info').html("Registration Failed! <br>you can't use admission no more than 10 characters.");
                                });
                            </script>
                        </c:if>

                        <c:if test="${param.act eq 'ic'}">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#open-modal').modal('show');
                                    $('#info').html("Registration Failed! please enter a valid contact no.<br> (size: 10)");
                                });
                            </script>
                        </c:if>

                        <c:if test="${param.act eq 'lg_cno'}">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#open-modal').modal('show');
                                    $('#info').html("Registration Failed! <br> you can't use more than 10 digits.");
                                });
                            </script>
                        </c:if>
                        <c:if test="${param.act eq 'ar'}">
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#open-modal').modal('show');
                                    $('#info').html("Account is already registered on this credentials!");
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

                    <div id="vertical-line-divider"></div>

                    <div class="col-lg-5 col-md-5 col-sm-12 box wow fadeInRight" style="text-align: left;color: #000000">
                        <form>
                            <fieldset class="fieldset-border student-reg-info-section">
                                <legend class="fieldset-border">Information</legend>
                                <div class="form-group">
                                    <label> Student registration is based on contact OTP varification <br> so, make sure you are using valid contact no.</label>
                                </div>
                                <s:url var="student_login_form" value="/"/>
                                <a href="${student_login_form}" class="default-button">Login Your Account</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <%-- auto popup model for displaying message, errors or notifications--%>
            <div class="modal fade" id="open-modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!--Modal Content-->
                    <div class="modal-content" id="content-modal-box">
                        <div class="modal-body" style="padding:0px;">
                            <p id="info" style="font-family: serif; color: #FFF"></p>
                            <p class="pull-right" aria-hidden="true" style="color:red;margin: 10px;background: cyan;cursor: pointer;" data-dismiss="modal" aria-label="Close">x</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%-- =================== STUDENT LOGIN FORM SECTION ENDS ===================== --%>
        <%-- =================== MAIN SECTION OR CONTENT AREA ===================== --%>
        <%@include file="includes/contents.jsp" %>
        <%-- =================== FOOTER SECTION ===================== --%>
        <%@include file="includes/footer.jsp" %>

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

    </body>
</html>
