<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<style type="text/css">
	.swiper-container {
		height:420px;
		border:5px solid silver;
		border-radius:7px;
		box-shadow:0 0 20px #ccc inset;
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
		align-items:center; /* 위아래 기준 중앙정렬 */
		justify-content:center; /* 좌우 기준 중앙정렬 */
	}
	.swiper-slide img {
		box-shadow:0 0 5px #555;
		max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
		/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	}
	.camp_item_g {
    	width: 100%;
    	height: auto;
    	overflow: hidden;
    	padding: 30px 3%;
    	background: #f9f9f9;
    	border-radius: 5px;
    }
    .camp_item_g ul {
    	display: block;
    	
	}
	.camp_item_g ul li {
    	display: inline-block;
    	padding: 20px 0;
    	text-align: center;
    	font-size: 15px;
    	width: 12.5%;
    	float: left;
	}
</style>
<main>
	<!-- Hero Start-->
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>${campList.facltNm}</h2>
						<h5 style="color:white;">${campList.lineIntro}</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Hero End -->
	<!-- Map -->
	<div class="listing-caption section-padding2">
		<div class="section-padding-map">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:if test="${campList.img1 != null}"><div class="swiper-slide"><img src="${campList.img1}"></div></c:if>			
					<c:if test="${campList.img2 != null}"><div class="swiper-slide"><img src="${campList.img2}"></div></c:if>			
					<c:if test="${campList.img3 != null}"><div class="swiper-slide"><img src="${campList.img3}"></div></c:if>			
					<c:if test="${campList.img4 != null}"><div class="swiper-slide"><img src="${campList.img4}"></div></c:if>			
					<c:if test="${campList.img5 != null}"><div class="swiper-slide"><img src="${campList.img5}"></div></c:if>			
					<c:if test="${campList.img6 != null}"><div class="swiper-slide"><img src="${campList.img6}"></div></c:if>			
					<c:if test="${campList.img7 != null}"><div class="swiper-slide"><img src="${campList.img7}"></div></c:if>			
					<c:if test="${campList.img8 != null}"><div class="swiper-slide"><img src="${campList.img8}"></div></c:if>			
					<c:if test="${campList.img9 != null}"><div class="swiper-slide"><img src="${campList.img9}"></div></c:if>			
					<c:if test="${campList.img10 != null}"><div class="swiper-slide"><img src="${campList.img10}"></div></c:if>					
				</div>
				<!-- 네비게이션 -->
				<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
			
				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>
			<script>
				new Swiper('.swiper-container', {
					
					slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
					spaceBetween : 30, // 슬라이드간 간격
					slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
				
					// 그룹수가 맞지 않을 경우 빈칸으로 메우기
					// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
					loopFillGroupWithBlank : true,
				
					loop : true, // 무한 반복
				
					pagination : { // 페이징
						el : '.swiper-pagination',
						clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
					},
					navigation : { // 네비게이션
						nextEl : '.swiper-button-next', // 다음 버튼 클래스명
						prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
					},
				});
			</script>
		</div>
		<!-- map -->
		<div class="container"><br><br><br>
			<table class="table">
			    <tbody>
			      <tr>
			        <td><h5><strong>캠핑장 이름</strong></h5></td>
			        <td><h5 style="color:grey;">${campList.facltNm}</h5></td>
			      </tr>
			      <tr>
			        <td><h5><strong>주소</strong></h5></td>
			        <td><h5 style="color:grey;">${campList.addr}</h5></td>
			      </tr>
			      <c:if test="${campList.tel != ''}">
			      <tr>
			        <td><h5><strong>문의처</strong></h5></td>
			        <td><h5 style="color:grey;">${campList.tel}</h5></td>
			      </tr>
			      </c:if>
			      <c:if test="${campList.lctCl != ''}">
			      <tr>
			        <td><h5><strong>캠핑장 환경</strong></h5></td>
			        <td><h5 style="color:grey;">${campList.lctCl}</h5></td>
			      </tr>
			      </c:if>
			      <tr>
			        <td><h5><strong>캠핑장 유형</strong></h5></td>
			        <td><h5 style="color:grey;">${campList.induty}</h5></td>
			      </tr>
			      <c:if test="${campList.posblFcltyCl != ''}">
			      <tr>
			        <td><h5><strong>주변 이용가능 시설</strong></h5></td>
			        <td><h5 style="color:grey;">${campList.posblFcltyCl}</h5></td>
			      </tr>
			      </c:if>
			    </tbody>
		  	</table>
		  	
			<c:if test="${campList.intro != ''}">
				<hr><h5><strong><i class="fas fa-arrow-circle-right" style="color:green;"></i> 캠핑장 소개</strong></h5><br>
				<div class="camp_intro_txt">${campList.intro}</div>
				<br><h6 style="color:grey;">최종 정보 수정일 : ${campList.modifiedtime}</h6>
			</c:if>
			
			<c:if test="${campList.sbrsCl != ''}">
			<hr><h5><strong><i class="fas fa-arrow-circle-right" style="color:green;"></i> 캠핑장 시설정보</strong></h5>
			<div class="camp_item_g">
				<ul>
					<c:forEach var="sbrs" items="${sbrsCl}">
						<c:if test="${sbrs == '전기'}"><li><i class="fas fa-bolt fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '무선인터넷'}"><li><i class="fas fa-wifi fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '장작판매'}"><li><i class="fab fa-free-code-camp fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '온수'}"><li><i class="fas fa-mug-hot fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '물놀이장'}"><li><i class="fas fa-swimming-pool fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '놀이터'}"><li><i class="fas fa-democrat fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '산책로'}"><li><i class="fas fa-tree fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '운동장'}"><li><i class="fas fa-campground fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '운동시설'}"><li><i class="fas fa-futbol fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '마트.편의점'}"><li><i class="fas fa-shopping-basket fa-2x"></i><br><span>${sbrs}</span></li></c:if>
						<c:if test="${sbrs == '트렘폴린'}"><li><i class="fas fa-child fa-2x"></i><br><span>${sbrs}</span></li></c:if>
					</c:forEach>  
				</ul>
			</div>
			</c:if>
			
			<hr><h5><strong><i class="fas fa-arrow-circle-right" style="color:green;"></i> 찾아오시는길</strong></h5>
			<br><div class="row" id="map" style="width:63vw;height:70vh;"></div>
		</div>
	</div>	
	<!--End Map -->

</main>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78c1cf90058867ac555cc95638bcbd09"></script>
	<script src="https://kit.fontawesome.com/84c60fd987.js"></script>
	<script>
		var container = document.getElementById('map'); // 지도를 표시할 div 
		var options = {
			center: new kakao.maps.LatLng('${campList.mapY}', '${campList.mapX}'), // 지도의 중심좌표
        	level: 3 // 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(container, options); // 지도를 생성합니다
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng('${campList.mapY}', '${campList.mapX}'); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px 10px 30px 5px; text-align:center">${campList.addr}<br><a href="https://map.kakao.com/link/map/${campList.addr},${campList.mapY},${campList.mapX}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${campList.addr},${campList.mapY},${campList.mapX}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
	</script>
<%@ include file="../inc/footer.jsp" %>