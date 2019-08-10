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
        <title>LMS-Add Books</title>
        <%--<c:import url="all_plugins.jsp" charEncoding="UTF-8"/>--%>
        <%@include  file="all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <link href="${style_css}" rel="stylesheet">
        <s:url var="admin_style_css" value="/static/css/admin_dashboard_css.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${admin_style_css}" rel="stylesheet">

        <%-- Main Stylesheet RESPONSIVE File --%>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("adminId") == null) {
                response.sendRedirect("admin/login_form");
            }
        %>
        <%@include file="js_plugins.jsp" %>
        <%--<%@include file="includes/header.jsp" %>--%>
        <%-- content area  ---%>
        <%@include file="includes/admin_header.jsp" %>
        <%@include file="includes/admin_menu_section.jsp" %>
        <%--<%@include file="includes/admin_dashboard_content_section.jsp" %>--%>
        <div class="col-lg-10 col-md-12 col-sm-12 wow fadeInRight" style="color:black">
            <div class="row">
                <%-- contents goes here inside this div row --%> 
                <div class="col-lg-12 col-md-12"> 
                    <%-- contents goes here inside this div --%>     
                    <s:url var="url_store_books" value="/admin/store_book_details"/>
                    <f:form action="${url_store_books}" modelAttribute="add_books_command">
                        <!--<form>-->
                        <fieldset class="fieldset-border">
                            <legend class="fieldset-border">Add Books</legend>
                            <div class="form-group">
                                <label>Book Name</label>
                                <f:input type="text" id="book_name" path="bookName" class="form-control" placeholder="enter book name" />
                                <div style="clear: both; font-size: 10px" id="bname_mesg"></div>
                            </div>
                            <div class="form-group">
                                <label>Author Name</label>
                                <f:input type="text" path="authorName" id="author_name" class="form-control" placeholder="enter author name" />
                                <div style="clear: both; font-size: 10px" id="aname_mesg"></div>
                            </div>
                            <div class="form-group">
                                <label>Department</label>
                                <f:select path="deptName" class="form-control">
                                    <f:option value="1">CSE</f:option>
                                    <f:option value="2">ECE</f:option>
                                    <f:option value="3">EEE</f:option>
                                    <f:option value="4">CIVIL</f:option>
                                    <f:option value="5">MEC</f:option>
                                    <f:option value="0">COMMON FOR ALL</f:option>
                                </f:select>
                                <div style="clear: both; font-size: 10px" id="aname_mesg"></div>
                            </div>
                            <div class="form-group">
                                <label>Edition</label>
                                <f:input type="number" maxlength="50" min="1" path="edition" id="b_edition" class="form-control" placeholder="enter book edition" />
                                <div style="clear: both; font-size: 10px" id="ed_mesg"></div>
                            </div>
                            <div  class="form-group">
                                <label class="pull-right remove_field rounded_border bg-danger" style="font-size:12px"><b>Remove a Field</b></label>
                                <label class="pull-right add_field rounded_border bg-info" style="font-size:12px"><b>Add More Fields</b></label>
                                <br>
                                <label>Book Number</label>
                                <div id="field_box">
                                    <div style="margin: 2px;" class="pull-left" > 
                                        <f:input onclick="disableSubmitButton()" id="bn" path="bookNumbers" class='rounded_border text-center text-dark text-center bg-light'  type="text" placeholder="enter book number"/>
                                    </div>
                                </div>
                                <div style="clear: both; font-size: 10px" id="validate_mesg"></div>
                            </div>
                            <div class="form-group" style="clear:both">
                                <p class="text-black bg-info p-2">(click on validate to validating your book numbers, Only Integer and Unique values are allowed for Book Numbers)</p>
                                <br>
                                <label class="pull-right btn rounded_border bg-warning" style="font-size:12px;color: black" onclick="validateBookNumbers()"><b>Validate</b></label>

                                <button class="submit-button btn rounded_border bg-primary" disabled="true"><b>Submit</b></button>
                            </div>
                        </fieldset>
                    </f:form>
                    <%-- code for event message through popup window --%>
                    <c:if test="${param.act eq 'success'}">
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('#open-modal').modal('show');
                                $('#info').html("Books are added successfully in the Library!");
                            });
                        </script>
                    </c:if>
                    <c:if test="${param.act eq 'failed'}">
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('#open-modal').modal('show');
                                $('#info').html("Failed to add books in the Library!");
                            });
                        </script>
                    </c:if>
                    <%-- auto popup model for displaying message, errors or notifications--%>
                    <div class="modal fade" id="open-modal" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <!--Modal Content-->
                            <div class="modal-content" id="content-modal-box">
                                <div class="modal-body" style="padding:10px;">
                                    <p id="info" style="font-family: serif; color: #FFF; font-size: 20px"></p>
                                    <p class="pull-right btn" aria-hidden="true" style="color:red;margin: 5px; padding: 2px 15px;font-size: 25px;background: cyan;cursor: pointer;" data-dismiss="modal" aria-label="Close">x</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- auto popup model for displaying message, errors or notifications ends--%>
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
    //--- adding/removing text box dynamically for bookNumber
    $(document).ready(function () {
        var x = 1;
        $(".add_field").on("click", function () {
            /*
             * <form:input path = "name" /> is same as 
             * <input id = "name" name = "name" type = "text" value = ""/> ---> this is used inside script tag generally 
             * because java script doesn't understand spring tag library like form:input
             */
//            $("#field_box").append("<div class='pull-left'><input id='bn' path='bookNumbers' onclick='disableSubmitButton()' class='rounded_border text-center text-dark text-center bg-light' type='text' placeholder='enter book number'/></div>");
            $("#field_box").append("<div class='pull-left'><input id='bn' name='bookNumbers' type='text' value='' onclick='disableSubmitButton()' class='rounded_border text-center text-dark text-center bg-light' placeholder='enter book number'/>");
            ++x;
        });
        $(".remove_field").on("click", function () {
            if (x > 1) {
                $("#field_box").children().last().remove();
                --x;
            }
        });
    });

    function disableSubmitButton() {
        $(".submit-button").attr("disabled", true);
        $("#validate_mesg").html("<p class='rounded_border text-danger bg-white' style='font-size: 10px'><b>Click on verify button to verify.</b></p>");

    }
    //------------- validating book numbers ----
    function validateBookNumbers() {
        //--- getting all the data from the all book number input fields
        var book_name = $("#book_name").val().trim();
        if (book_name === "")
        {
            $("#bname_mesg").html("<p class='rounded_border wow fadeInRight text-danger bg-white' style='font-size: 10px'><b>Book name is required</b></p>");
            return;
        } else {
            $("#bname_mesg").html("");
        }
        var author_name = $("#author_name").val().trim();
        if (author_name === "")
        {
            $("#aname_mesg").html("<p class='rounded_border wow fadeInRight text-danger bg-white' style='font-size: 10px'><b>Author name is required</b></p>");
            return;
        } else {
            $("#aname_mesg").html("");
        }
        var edition = $("#b_edition").val().trim();
        if (edition === "")
        {
            $("#ed_mesg").html("<p class='rounded_border wow fadeInRight text-danger bg-white' style='font-size: 10px'><b>Edition is required</b></p>");
            return;
        } else {
            $("#ed_mesg").html("");
        }
        var allData = [];
        var count = 1;//-- required variable
        allData = $("input[id='bn']").map(function () {
            if ($(this).val().trim() !== "") {
                count++;
                return $(this).val().trim();
            } else {
                if (count === 1)
                    $("#validate_mesg").html("<p class='rounded_border text-danger bg-white' style='font-size: 10px'><b>Atleast one Book number is required.</b></p>");
            }

        }).get();
        if (allData[0].toString().trim() === "") {
            $("#validate_mesg").html("<p class='rounded_border text-danger bg-white' style='font-size: 10px'><b>Atleast one Book number is required.</b></p>");
        } else {
            for (var c = 0; c < allData.length; c++) {
                for (var d = c + 1; d < allData.length; d++) {
                    if (allData[c] === allData[d]) {
                        $("#validate_mesg").html("<p class='rounded_border text-danger bg-white' style='font-size: 10px'><b>Error : due to duplicate value entered : " + allData[c] + "</b></p>");
                        return;
                    }
                }
            }


            $.ajax({
                url: 'check_book_numbers',
                data: {bookNumbers: allData},
                success: function (data) {
                    if (data === "verified") {
                        $("#validate_mesg").html("<p class='rounded_border text-success bg-warning' style='font-size: 10px' ><b>VERIFIED</b></p>");
                        $(".submit-button").removeAttr("disabled");
                    } else {
                        $("#validate_mesg").html("<p class='rounded_border text-danger bg-white' style='font-size: 10px'><b>" + data + "</b></p>");
                    }
                }
            });
        }
    }

</script>  

</body>
</html>
