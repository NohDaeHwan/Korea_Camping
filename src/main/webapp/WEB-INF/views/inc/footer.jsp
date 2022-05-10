<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="footer-area">
            <div class="container">
               <div class="footer-top footer-padding">
                    <div class="row justify-content-between">
                        <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="single-footer-caption mb-30">
                                    <div class="footer-logo">
                                        <a href="//home/listhome"><img src="<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>퀵 링크</h4>
                                    <ul>
                                        <li><a href="/home">메인화면</a></li>
                                        <li><a href="/home/camp/list?page=1&doo=&thema=">캠핑장</a></li>
                                        <li><a href="/home/camp/categori">카테고리</a></li>
                                        <li><a href="/home/board/list">게시판</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>카테고리</h4>
                                    <ul>
                                        <li><a href="/home/camp/list?page=1&doo=&thema=일반야영장">일반야영장</a></li>
                                        <li><a href="/home/camp/list?page=1&doo=&thema=자동차야영장">자동차야영장</a></li>
                                        <li><a href="/home/camp/list?page=1&doo=&thema=글램핑">글램핑</a></li>
                                        <li><a href="/home/camp/list?page=1&doo=&thema=카라반">카라반</a></li>     
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <div class="footer-tittle">
                                    <h4>소셜 미디어</h4>
                                    <ul>
                                		<li><a href="#"><i class="fas fa-globe"> HomePage</i></a></li>
                                		<li><a href="https://www.facebook.com/km.university/" target="_blank"><i class="fab fa-facebook-f"> FaceBook</i></a></li>
                                		<li><a href="https://www.instagram.com/kmu_uni/" target="_blank"><i class="fab fa-instagram"> Instagram</i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
                <div class="footer-bottom">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="col-xl-9 col-lg-8">
                            <div class="footer-copy-right">
                            	<p class="text-center">Copyright &copy; 2021 NOLEGAZA COMPANY.ALL RIGHTS RESERVED..</p>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i style="color: white;" class="fas fa-level-up-alt"></i></a>
    </div>
    
    <!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="<%=request.getContextPath()%>/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/popper.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/wow.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/js/animated.headline.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.nice-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="<%=request.getContextPath()%>/resources/assets/js/contact.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.form.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.validate.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/mail-script.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="<%=request.getContextPath()%>/resources/assets/js/plugins.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
</body>
</html>