<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>놀러가자</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS here -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/slicknav.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/flaticon.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/animate.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/themify-icons.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/slick.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/nice-select.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/logincss.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/imgslidecss.css">

</head>
<body>
	<header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="/home"><img src="<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="/home">메인화면</a></li>
                                            <li><a href="/home/camp/list?page=1&doo=&thema=">캠핑장</a></li>
                                            <li><a href="/home/camp/categori">카테고리</a></li>
                                            <li><a href="/home/board/list">게시판</a></li>
                                           	<c:choose>
										        <c:when test="${sessionScope.User != null}">
										          	<li><a href="/home/mypage/main"><i class="ti-user"></i> 마이페이지</a></li>
										          	<li><a href="/home/logout"> 로그아웃 </a></li>
										        </c:when>
										        <c:otherwise>
										          	<li><a href="/home/login"><i class="ti-user"></i> 회원가입 및 로그인</a></li>
										        </c:otherwise>
										    </c:choose>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                           <!--  Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>