<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- =================== MAIN SECTION OR CONTENT AREA ===================== --%>
<main id="main">

    <%-- =================== ABOUT US SECTION ===================== --%>
    <section id="about" class="section-bg">
        <div class="container-fluid">
            <div class="section-header">
                <h3 class="section-title">About Us</h3>
                <span class="section-divider"></span>
                <p class="section-description">
                    Chaitanya Educational Institutions, Warangal, Telangana. India established 
                    Chaitanya Institute of Technology and Science in the year 2010 and emerging as an ideal
                    and model colleges unique among affiliated colleges of Kakatiya University,
                    Warangal of Telangana region. Providing wonderful resource for trained technical
                    man power to the country.
                </p>
            </div>

            <div class="row">
                <div class="col-lg-12 content fadeInRight">
                    <p>
                        <strong>Our persuasion is in the following goals:</strong></p>
                    <ul>    
                        <li><i class="ion-android-checkmark-circle"></i>To enhance the academic quality and competitiveness of our college.</li>
                        <li><i class="ion-android-checkmark-circle"></i>To improve teaching and learning with state-if-the-art infrastructure.</li>
                        <li><i class="ion-android-checkmark-circle"></i>To strengthen scholarly research and creative achievement in students and faculties.</li>
                        <li><i class="ion-android-checkmark-circle"></i>To support and sustain student development and quality of life.</li>
                        <li><i class="ion-android-checkmark-circle"></i>To broaden global perspectives.</li>
                        <li><i class="ion-android-checkmark-circle"></i>To open new avenues and horizons.</li>
                        <li><i class="ion-android-checkmark-circle"></i>To advance only college in every possible way to be on the lead.</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <%-- =================== CLIENTS SECTION ===================== --%>
    <section id="clients">
        <div class="container-fluid">

            <div class="row wow fadeInUp col-lg-12">

                <div class="col-md-2">
                    <s:url var="cse_image_png" value="/static/img/gallery/cse.png" />
                    <img src="${cse_image_png}" alt="" style="height:200px">
                </div>

                <div class="col-md-2">
                    <s:url var="ece_image_png" value="/static/img/gallery/ece.png" />
                    <img src="${ece_image_png}" alt="" style="height:200px">
                </div>

                <div class="col-md-2">
                    <s:url var="eee_image_png" value="/static/img/gallery/eee.png" />
                    <img src="${eee_image_png}" alt="" style="height:200px">
                </div>

                <div class="col-md-2">
                    <s:url var="ece_image_png" value="/static/img/gallery/ece.png" />
                    <img src="${ece_image_png}" alt="" style="height:200px;">
                </div>

                <div class="col-md-2">
                    <s:url var="civil_image_png" value="/static/img/gallery/civil.png" />
                    <img src="${civil_image_png}" alt="" style="height:200px">
                </div>
                
                <div class="col-md-2">
                    <s:url var="cse1_image_png" value="/static/img/gallery/cse1.png" />
                    <img src="${cse1_image_png}" alt="" style="height:200px">
                </div>
            </div>
        </div>
    </section>
    <%-- =================== OUR TEAM SECTION ===================== --%>
    <section id="team" class="section-bg">
        <div class="container">
            <div class="section-header">
                <h3 class="section-title">Our Team</h3>
                <span class="section-divider"></span>
                <p class="section-description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
            </div>
            <div class="row wow fadeInUp">
                <div class="col-lg-3 col-md-6">
                    <div class="member">
                        <div class="pic">
                            <s:url var="team1_image" value="/static/img/team/mukesh.jpeg"/>
                            <img src="${team1_image}" alt="">
                        </div>
                        <h4>M. Kumar</h4>
                        <span>Web Designer And Developer</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="member">
                        <div class="pic">
                            <s:url var="team2_image" value="/static/img/team/jahangeer.jpeg"/>
                            <img src="${team2_image}" alt="">
                        </div>
                        <h4>Jahangeer Ansari</h4>
                        <span>Product Manager</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="member">
                        <div class="pic">
                            <s:url var="team3_image" value="/static/img/team/irfan.jpeg"/>
                            <img src="${team3_image}" alt="">
                        </div>
                        <h4>Irfan Ansari</h4>
                        <span>CEO</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="member">
                        <div class="pic">
                            <s:url var="team4_image" value="/static/img/team/raka.jpeg"/>
                            <img src="${team4_image}" alt="">
                        </div>
                        <h4>Raka Ahmed</h4>
                        <span>Accountant</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <%-- =================== GALLERY SECTIION ===================== --%>
    <section id="gallery">
        <div class="container-fluid">
            <div class="section-header">
                <h3 class="section-title">Gallery</h3>
                <span class="section-divider"></span>
                <p class="section-description">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
            </div>

            <div class="row no-gutters">

                <div class="col-lg-4 col-md-6">
                    <div class="gallery-item wow fadeInUp">
                        <s:url var="gallery1" value="/static/img/gallery/cse.png"/>
                        <a href="${gallery1}" class="gallery-popup">
                            <img src="${gallery1}" alt="">
                        </a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="gallery-item wow fadeInUp">
                        <s:url var="gallery2" value="/static/img/gallery/ece.png"/>
                        <a href="${gallery2}" class="gallery-popup">
                            <img src="${gallery2}" alt="">
                        </a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="gallery-item wow fadeInUp">
                        <s:url var="gallery3" value="/static/img/gallery/eee.png"/>
                        <a href="${gallery3}" class="gallery-popup">
                            <img src="${gallery3}" alt="">
                        </a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="gallery-item wow fadeInUp">
                        <s:url var="gallery4" value="/static/img/gallery/me.png"/>
                        <a href="${gallery4}" class="gallery-popup">
                            <img src="${gallery4}" alt="">
                        </a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="gallery-item wow fadeInUp">
                        <s:url var="gallery5" value="/static/img/gallery/civil.png"/>
                        <a href="${gallery5}" class="gallery-popup">
                            <img src="${gallery5}" alt="">
                        </a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="gallery-item wow fadeInUp">
                        <s:url var="gallery6" value="/static/img/gallery/cse1.png"/>
                        <a href="${gallery6}" class="gallery-popup">
                            <img src="${gallery6}" alt="">
                        </a>
                    </div>
                </div>

            </div>

        </div>
    </section>
    <%-- =================== CONTACT SECTION ===================== --%>
    <section id="contact">
        <div class="container">
            <div class="row wow fadeInUp">

                <div class="col-lg-4 col-md-4">
                    <div class="contact-about">
                        <h4>Chaitanya Colleges</h4>
                        <p>At chaitanya we care deeply about the experience of every single one of our students.
                            The individual attention that our faculty gives to our student, is one of the reason 
                            why we have such outstanding success rates on our courses.</p>
                        <div class="social-links">
                            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                            <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-4">
                    <div class="info">
                        <div>
                            <i class="ion-ios-world-outline"></i>
                            <p> <a href="http://www.chaitanyacolleges.com/">www.chaitanyacolleges.com</a>
                                <a href="http://www.citswarangal.com/"> www.citswarangal.com</a></p>
                        </div>
                        <div>
                            <i class="ion-ios-home-outline"></i>
                            <p>Kishanpura, Hanamkonda,Warngal.</p>
                        </div>

                        <div>
                            <i class="ion-ios-email-outline"></i>
                            <p><a href="mailto:chaitanya@chaitanyacolleges.com"> chaitanya@chaitanyacolleges.com<br />cpreddycpreddy@gmail.com</a></p>
                        </div>

                        <div>
                            <i class="ion-ios-telephone-outline"></i>
                            <p><a href="tel:870-2552555"> +91-870-2552555, 2555355, 2555055</a></p>
                        </div>

                    </div>
                </div>

                <div class="col-lg-4 col-md-4">
                    <div class="contact-about">
                        <h4>Chaitanya Websites</h4>
                        <ul>
                            <li style="list-style: none;"><a href="http://www.chaitanyacolleges.com/" target='_blank' style="color: #515151; text-decoration:none;">Chaitanya Group of Colleges</a></li>
                            <li style="list-style: none;"><a href="http://convocation.chaitanyacolleges.com/" target='_blank' style="color: #515151; text-decoration:none;">Chaitanya Convocation</a> </li>
                            <li style="list-style: none;"><a href="http://cits.chaitanyacolleges.com/" target='_blank' style="color: #515151; text-decoration:none;">Chaitanya Institute of Technology & Science</a></li>
                            <li style="list-style: none;"><a href="http://pharmacy.chaitanyacolleges.com/" target='_blank' style="color: #515151; text-decoration:none;">Chaitanya College of Pharmacy Education & Research</a></li>
                            <li style="list-style: none;"><a href="http://chaitanyotsav.chaitanyacolleges.com/" target='_blank' style="color: #515151; text-decoration:none;">Chaitanyotsav</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>