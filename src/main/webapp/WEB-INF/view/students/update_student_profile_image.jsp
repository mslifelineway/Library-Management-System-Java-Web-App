<%-- 
    Document   : update_student_profile_image
    Created on : 4 May, 2019, 11:26:55 PM
    Author     : janeman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Image-${studentName}</title>
        <%@include  file="../all_plugins.jsp"%>
        <s:url var="style_css" value="/static/css/style.css"/>
        <link href="${style_css}" rel="stylesheet">
        <s:url var="admin_style_css" value="/static/css/admin_dashboard_css.css"/>
        <%-- Main Stylesheet CSS File --%>
        <link href="${admin_style_css}" rel="stylesheet">
        <%-- CARD css--%>
        <s:url var="admin_all_books_css" value="/static/css/card_css.css"/>
        <link href="${admin_all_books_css}" rel="stylesheet">

        <%-- plugins for cropping image --%>
        <s:url var="url_cropper_css" value="/static/cropper/croppie.css"/>
        <link  href="${url_cropper_css}" rel="stylesheet"> 

        <%-- plugins for cropping image end --%>

        <s:url var="image_frame" value="/static/images/3d_frame.jpg"/>
        <s:url var="image_frame1" value="/static/images/star_frame.png"/>
        <style>
           
/*            #image_container{
                border-image-source: url('${image_frame1}');
                border-image-repeat: round;
                border-image-slice: 30;
                border-image-width: 10px;
                padding: 6px 6px;
                width:270px;
                height:auto;
            }*/
/*            #img-frame{
                border-image-source: url('${image_frame}');
                border-image-repeat: round;
                border-image-slice: 30;
                border-image-width: 10px;
                padding:10px 10px;
            }*/
/*            #img-frame img{
                width:270px;
                height:240px;
            }*/
            .action-section a: visited{
                color: white;
            }
            #cropped_image_section img {
                max-width: 100%; /* This rule is very important, please do not ignore this! */
            }
        </style>
    </head>
    <body>

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

                            <div class="image-section col-lg-3 col-md-3 text-center">
                                <div id="image_container">
                                    <div id="img-frame" >
                                        <img id="crop_image_init" class="img-fluid img-responsive profile_image" src="${url_student_image}"  alt=""/>
                                    </div>
                                </div>
                            </div> 
                             <div id="image_container" class="col-lg-9 col-md-9">
                                 <div class="action-area" style="margin-top:30px; margin-left: 20px;">
                                     <div class="input-area bg-white col-lg-6 col-md-6 rectangle_button" style="color: black;">
                                         <input type="file" id="imgInput"/>
                                     </div>
                                     <br><br><h4 class="btn btn-md btn-danger rectangle_button bg-white text-info" id="crop_img"><b>Crop and Upload Image</b></h4>
                                 </div>
                            </div>
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
 <s:url var="url_cropper_js" value="/static/cropper/croppie.js"/>
<script src="${url_cropper_js}"></script>  
<%-- java scripting code goes here --%>
<script type="text/javascript">
    $(window).scroll(function () {
        $('nav').toggleClass('scrolled', $(this).scrollTop() > 50);
    });
/////////// cropping selected image /////////
    
    ////// previewing selected image onto the div or img tag////
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.profile_image').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInput").change(function () {
        readURL(this);
    });
    
    $(document).ready(function(){
        $image_crop = $("#crop_image_init").croppie({
            enableExif: true,
            viewport: {
                width: 200,
                height: 200,
                type: 'square' // can be circle also
            },
            boundary: {
                width: 300,
                height: 300
            }
        });
        
        $('#imgInput').on('change',function(){
            var reader = new FileReader();
            reader.onload = function (event){
                $image_crop.croppie('bind',{
                    url: event.target.result
                }).then(function(){
//                    console.log("jquery bind image complete");
                });
            };
            reader.readAsDataURL(this.files[0]);
        });
        
        $('#crop_img').on('click',function(event){
            $image_crop.croppie('result',{
                type: 'canvas',
                size: 'viewport'
            }).then(function(response){
                $('.profile_image').attr('src', response);
                $.ajax({
                    url: 'get_cropped_image',
                    method: 'post',
                    data: {image: response},
                    success: function(data){
                        if(data === "SUCCESS"){
                            alert("Profile Image Successfully Changed!");
                        }
                        else{
                             if(data === "FAILED"){
                                 alert("Failed To Change Profile Image!");
                            }
                            else{
                                alert("Oops! something went wrong.");
                            }
                        }
                    }
                });
            });
        });
    });


</script>  

</body>
</html>
