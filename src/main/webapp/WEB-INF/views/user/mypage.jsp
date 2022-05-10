<%@page import="com.nolja.home.dto.Camp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
<!-- Hero Start-->
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-12">
	                <div class="hero-cap text-center pt-50">
	                    <h2>마이페이지</h2>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
<!--Hero End -->
<section class="mypage-area">
	<div class="container box_1170"> 
		<h3 class="mb-30">프로필</h3>
		<div class="row">
			<div class="col-md-3">
				<div class="profile-pic">
					<img src="<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png" style="background: gray;" class="listing__details__comment__item__profile">
				</div>
				
			</div>
			<div class="col-md-9 mt-sm-20">
				<br><br>
				<h3>이름 : ${User.userId}</h3>
				<h3>이메일 : ${User.userEmail}</h3>
				<h3>주소 : ${User.userAddress}</h3>
				<!-- <a href="#" class="genric-btn danger">프로필 수정</a> -->
			</div>
		</div>
		<hr>
		<h3 class="mb-30">좋아하는 캠핑장</h3>
		<c:set var="value" value="0" />
		<c:set var="result" value="${campLists.size()}" />
		
		<c:forEach var="campList" items="${campLists}">
			<c:if test="${value % 3 == 0}">
				<div class="row">
			</c:if>
			<div class="col-md-4">
				<div class="card mb-4">
					<a href="<%=request.getContextPath()%>/camp/detail/${campList.contentId}">
						<div style="height:18rem;">
							<c:choose>
								<c:when test="${campList.img1 != null}">
									<img style="height: 16rem; width: 100%;" src="${campList.img1}" alt="">	
								</c:when>
								<c:otherwise>
									<img style="background-color: grey; height: 16rem; width: 100%;" src="<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png" alt="">	
								</c:otherwise>
							</c:choose>
						</div>
					</a>
					<div class="card-body">
						<h5><a href="<%=request.getContextPath()%>/camp/detail/${campList.contentId}">${campList.facltNm}</a></h5>
					</div>
				</div>
			</div>	
			<c:if test="${value % 3 == 2}">
				</div>
			</c:if>
			<c:set var="value" value="${value + 1}" />
		</c:forEach>
		<c:if test="${result % 3 != 0}">
			</div>
		</c:if>
		</div>
</section>
</main>
<%@ include file="../inc/footer.jsp" %>