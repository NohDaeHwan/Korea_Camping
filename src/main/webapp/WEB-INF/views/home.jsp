<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp" %>
	<div class="slider-area hero-overly">
            <div class="single-slider slider-height d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8 col-lg-9">                        
                            <div class="hero__caption">
                                <span>Explore the city</span>
                                <h1>Discover Great Places</h1>
                            </div>
                        </div>
                    </div>
                </div>
           	</div>
        </div>
       <!--  Hero Area End -->
       
        <!-- Popular Locations Start -->
        <div class="popular-location section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">                      
                        <div class="section-tittle text-center mb-80">
                            <span>Most visited places</span>
                            <h2>Popular Locations</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/assets/img/gallery/seoul.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>서울</p>
                                <a href="/home/camp/list?page=1&doo=서울시&thema=" class="location-btn"><i class="ti-plus"></i> 자세히보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/assets/img/gallery/gyeongi.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>경기도</p>
                                <a href="/home/camp/list?page=1&&doo=경기도&thema=" class="location-btn"><i class="ti-plus"></i> 자세히보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/assets/img/gallery/busan.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>부산</p>
                                <a href="/home/camp/list?page=1&doo=부산&thema=" class="location-btn"><i class="ti-plus"></i> 자세히보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/assets/img/gallery/jeju.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>제주도</p>
                                <a href="/home/camp/list?page=1&doo=제주도&thema=" class="location-btn"><i class="ti-plus"></i> 자세히보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/assets/img/gallery/incheon.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>인천</p>
                                <a href="/home/camp/list?page=1&doo=인천시&thema=" class="location-btn"><i class="ti-plus"></i> 자세히보기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="resources/assets/img/gallery/kangwon.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>강원도</p>
                                <a href="/home/camp/list?page=1&doo=강원도&thema=" class="location-btn"><i class="ti-plus"></i> 자세히보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row justify-content-center">
                    <div class="room-btn pt-20">
                        <a href="/home/camp/list?page=1&doo=&thema=" class="btn view-btn1">전체 캠핑장 보기</a>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="inc/footer.jsp" %>