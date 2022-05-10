<%@page import="com.nolja.home.dto.Camp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<main>
	<!-- Hero Start-->
	<div class="hero-area3 hero-overly2 d-flex align-items-center ">
	    <div class="container">
	        <div class="row justify-content-center">
	            <div class="col-xl-8 col-lg-9">
	                <div class="hero-cap text-center pt-50 pb-20">
	                    <h2>캠핑장 리스트</h2>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--Hero End -->
	<!-- listing Area Start -->
	<div class="listing-area pt-120 pb-120">
	    <div class="container">
	        <div class="row">
	            <!-- Left content -->
	            <div class="col-xl-4 col-lg-4 col-md-6">
	                <div class="row">
	                    <div class="col-12">
	                            <div class="small-section-tittle2 mb-45">
	                            <h4>상세 검색</h4>
	                        </div>
	                    </div>
	                </div>
	                <!-- Job Category Listing start -->
	                <form action="list" method="get">                
		                <div class="category-listing mb-50">
		                    <!-- single one -->
		                    <div class="single-listing">
		                    	<input type="hidden" name="page" value="1">
		                    	
		                        <!-- input -->
		                        <div class="input-form">
		                            <input type="text" name="query" placeholder="캠핑장 이름 검색" value="${param.query}">
		                        </div>
		                        
		                        <!-- 도시 검색 -->
		                        <div class="select-job-items1">
		                            <select name="doo" class="selectDoo" onchange="changeSelection()">
		                            	<c:choose>
		                            		<c:when test="${param.doo == ''}"><option value="">전체/도</option></c:when>
		                            		<c:otherwise><option value="${param.doo}">${param.doo}</option></c:otherwise>
		                            	</c:choose>
		                                <option value="">전체/도</option>
		                                <option value="서울시">서울시</option>
		                                <option value="부산시">부산시</option>
		                                <option value="대구시">대구시</option>
		                                <option value="인천시">인천시</option>
		                                <option value="광주시">광주시</option>
		                                <option value="대전시">대전시</option>
		                                <option value="울산시">울산시</option>
		                                <option value="세종시">세종시</option>
		                                <option value="경기도">경기도</option>
		                                <option value="강원도">강원도</option>
		                                <option value="충청북도">충청북도</option>
		                                <option value="충청남도">충청남도</option>
		                                <option value="전라북도">전라북도</option>
		                                <option value="전라남도">전라남도</option>
		                                <option value="경상북도">경상북도</option>
		                                <option value="경상남도">경상남도</option>
		                                <option value="제주도">제주도</option>
		                            </select>
		                        </div>
		                        
		                        <!-- 상세 도시 검색 -->
		                        <!-- <div class="select-job-items2">
		                            <select name="si" class="selectSi">
		                                <option value="">전체/시/군</option>
		                            </select>
		                        </div> -->
		                        
		                        <!-- 테마 검색 -->
		                        <div class="select-job-items2">
		                            <select name="thema">
		                            	<c:choose>
		                            		<c:when test="${param.thema == ''}"><option value="">전체테마</option></c:when>
		                            		<c:otherwise><option value="${param.thema}">${param.thema}</option></c:otherwise>
		                            	</c:choose>
		                                <option value="">전체테마</option>
		                                <option value="일반야영장">일반야영장</option>
		                                <option value="자동차야영장">자동차야영장</option>
		                                <option value="글램핑">글램핑</option>
		                                <option value="카라반">카라반</option>
		                            </select>
		                        </div>
		                        
		                        <div class="category-listing mb-50">
								  <div class="">
									  <ul>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.elec == '전기'}"><input type="checkbox" id="facil" name="elec" value="전기" checked/>전기</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="elec" value="전기"/>전기</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.internet == '무선인터넷'}"><input type="checkbox" id="facil" name="internet" value="무선인터넷" checked/>무선인터넷</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="internet" value="무선인터넷"/>무선인터넷</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.wood == '장작판매'}"><input type="checkbox" id="facil" name="wood" value="장작판매" checked/>장작판매</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="wood" value="장작판매"/>장작판매</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.water == '온수'}"><input type="checkbox" id="facil" name="water" value="온수" checked/>온수</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="water" value="온수"/>온수</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.pool == '물놀이장'}"><input type="checkbox" id="facil" name="pool" value="물놀이장" checked/>물놀이장</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="pool" value="물놀이장"/>물놀이장</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.playground == '놀이터'}"><input type="checkbox" id="facil" name="playground" value="놀이터" checked/>놀이터</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="playground" value="놀이터"/>놀이터</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.walk == '산책로'}"><input type="checkbox" id="facil" name="walk" value="산책로" checked/>산책로</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="walk" value="산책로"/>산책로</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.ground == '운동장'}"><input type="checkbox" id="facil" name="ground" value="운동장" checked/>운동장</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="ground" value="운동장"/>운동장</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.workout == '운동시설'}"><input type="checkbox" id="facil" name="workout" value="운동시설" checked/>운동시설</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="workout" value="운동시설"/>운동시설</c:otherwise>
		                            		</c:choose>
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.mart == '마트.편의점'}"><input type="checkbox" id="facil" name="mart" value="마트.편의점" checked/>마트.편의점</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="mart" value="마트.편의점"/>마트.편의점</c:otherwise>
		                            		</c:choose>
									  		
									  	</li>
									  	<li>
									  		<c:choose>
		                            			<c:when test="${param.tram == '트렘폴린'}"><input type="checkbox" id="facil" name="tram" value="트렘폴린" checked/>트렘폴린</c:when>
		                            			<c:otherwise><input type="checkbox" id="facil" name="tram" value="트렘폴린"/>트렘폴린</c:otherwise>
		                            		</c:choose>
									  	</li>
									  </ul>
								  </div>
								</div>
		                        <!--  Select job items End-->
		                    </div>
		
		                    <div class="single-listing">
		                         <input type="submit" class="btn list-btn mt-20" value="캠핑장 검색">
		                    </div>
		                </div>
	                </form>
	                <!-- Job Category Listing End -->
	            </div>
	            <%
	            	boolean user = (session.getAttribute("User") != null);
	            	String[] st = (String[]) pageContext.findAttribute("userSteaming");
	            %>
	            <!-- Right content -->
	            <div class="col-xl-8 col-lg-8 col-md-6">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="count mb-35">
	                            <span>총 ${listCount}개 캠핑장이 검색되었습니다.</span>
	                        </div>
	                    </div>
	                </div>
	                <!-- listing Details Stat-->
	                <div class="listing-details-area">
	                    <div class="container">
	                        <div class="row">
	                        	<c:forEach var="campList" items="${campLists}">   	
		                            <div class="col-lg-6 ">
		                                <div class="single-listing mb-30">
		                                    <div class="list-img">
		                                    	<c:choose>
												  	<c:when test="${campList.img1 != null}">
												  		<img src="${campList.img1}" alt="">	
												  	</c:when>
												  	<c:otherwise>
												        <img style="background-color: grey; height: 16rem;" src="<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png" alt="">	
												  	</c:otherwise>
											    </c:choose>
		                                        <!-- <span>Open</span> -->
		                                    </div>
		                                    <div class="list-caption">
		                                        <span id="camp${campList.contentId}" style="background: white; color: black; border: 1px solid red;">
		                                        	<c:choose>
		                                        		<c:when test="<%=user%>">	
		                                        			<%
			                                        			boolean result = false;
			                                        		    Camp camp = (Camp) pageContext.findAttribute("campList");
			                                        			for (int i = 0; i < st.length; i++) {
			                                        				if (st[i].equals(camp.getContentId())) {
			                                        					result = true;
			                                        				}
			                                        			}
			                                        		%>
		                                        			<c:choose>
												  				<c:when test="<%=result%>">
												  				 	<i id="i${campList.contentId}" class="fas fa-heart" style="color: red; cursor: pointer;" onclick="steamingDelete(${campList.contentId})"> ${campList.steamingCount} 좋아요</i>
												  				</c:when>
												  				<c:otherwise>
																	<i id="i${campList.contentId}" class="far fa-heart" style="color: red; cursor: pointer;" onclick="steamingAdd(${campList.contentId})"> ${campList.steamingCount} 좋아요</i>
												  				</c:otherwise>
											    			</c:choose>                                			
												  		</c:when>
												  		<c:otherwise>
												        	<i class="far fa-heart add" style="color: red; cursor: pointer;" onclick="steamingAdd(${campList.contentId})"></i> ${campList.steamingCount} 좋아요
												  		</c:otherwise>
		                                        	</c:choose>                      	
		                                        </span>
		                                        <h5><a href="detail/${campList.contentId}">${campList.facltNm}</a></h5>
		                                        <p>${campList.induty}</p>
		                                        <p>${campList.addr}</p>
		                                        <div class="list-footer">
		                                            <ul>
		                                                <li>${campList.sbrsCl}</li>
		                                            </ul>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>		   
	      						</c:forEach>
	                        </div>
	                    </div>
	                </div>
	                <!-- listing Details End -->
	                <!--Pagination Start  -->
	                <div class="pagination-area pt-70 text-center">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-xl-12">
	                                <div class="single-wrap d-flex justify-content-center">
	                                    <nav aria-label="Page navigation example">
	                                        <ul class="pagination justify-content-start">	                                        	
	                                        	<li class="page-item">
	                                        	<c:choose>
												  <c:when test="${param.page == 1}">
												    <a class="page-link" style="pointer-events:none; color:white; border:1px solid white;">&laquo;</a>
											      </c:when>
												  <c:otherwise>
												    <a class="page-link" href="list?page=1&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">&laquo;</a>
												  </c:otherwise>
											    </c:choose>
	                                        	</li>
	                                        	<li class="page-item">
	                                        	<c:choose>
												  <c:when test="${param.page == 1}">
												    <a class="page-link" style="pointer-events:none; color:white; border:1px solid white;">&lt;</a>
											      </c:when>
												  <c:otherwise>
												    <a class="page-link" href="list?page=${param.page - 1}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">&lt;</a>
												  </c:otherwise>
											    </c:choose>
	                                        	</li>
	                                        	<c:choose>
	                                        	
											      <c:when test="${lastPage < 6}">										      
											        <c:forEach var="num" begin="1" end="${lastPage}">
											          <c:choose>
												  		  <c:when test="${param.page == num}">
												  		  	<li class="page-item"><a class="page-link active" style="pointer-events:none; color:red; border-color:red;">${num}</a></li>
												  		  </c:when>
												  		  <c:otherwise>
												     	    <li class="page-item">
										                	  <a class="page-link" href="list?page=${num}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">${num}</a>
											          		</li>
												  		  </c:otherwise>
											    		</c:choose>   
											        </c:forEach>											        
											      </c:when>							      
											      <c:otherwise>
											      
											        <c:if test="${param.page >= 4 && param.page < (lastPage - 3)}">
											          <c:forEach var="num" begin="1" end="6">
											            <c:choose>
												  		  <c:when test="${param.page == param.page + num - 4}">
												  		    <li class="page-item"><a class="page-link active" style="pointer-events:none; color:red; border-color:red;">${param.page + num - 4}</a></li>
												  		  </c:when>
												  		  <c:otherwise>
												     	    <li class="page-item">
										                  	  <a class="page-link" href="list?page=${param.page + num - 4}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">${param.page + num - 4}</a>
											     	    	</li>
												  		  </c:otherwise>
											    		</c:choose>
											          </c:forEach>
											        </c:if>
											   
											        <c:if test="${param.page >= (lastPage - 3)}">
											          <c:forEach var="num" begin="1" end="6">
											            <c:choose>
												  		  <c:when test="${param.page == (lastPage - (6 - num))}">
												  		    <li class="page-item"><a class="page-link active" style="pointer-events:none; color:red; border-color:red;">${lastPage - (6 - num)}</a></li>
												  		  </c:when>
												  		  <c:otherwise>
												     	    <li class="page-item">
										                  	  <a class="page-link" href="list?page=${lastPage - (6 - num)}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">${lastPage - (6 - num)}</a>
											       	    	</li>
												  		  </c:otherwise>
											    		</c:choose>
											          </c:forEach>
											        </c:if>
											   
													<c:if test="${param.page <= 3}">
													  <c:forEach var="num" begin="1" end="6">
													  	<c:choose>
												  		  <c:when test="${param.page == num}">
												  			<li class="page-item"><a class="page-link" style="pointer-events:none; color:red; border-color:red;">${num}</a></li>
												  		  </c:when>
												  		  <c:otherwise>
												     	    <li class="page-item">
											              	  <a class="page-link" href="list?page=${num}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">${num}</a>
												        	</li>
												  		  </c:otherwise>
											    		</c:choose>
												      </c:forEach>
													</c:if>
													
											      </c:otherwise>
											      
											    </c:choose>
	                                        	<li class="page-item">
	                                        	<c:choose>
												  <c:when test="${param.page == lastPage}">
												    <a class="page-link" style="pointer-events:none; color:white; border:1px solid white;">&gt;</a>
											      </c:when>
												  <c:otherwise>
												    <a class="page-link" href="list?page=${param.page + 1}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">&gt;</a>
												  </c:otherwise>
											    </c:choose>
	                                        	</li>
	                                        	<li class="page-item">
	                                        	<c:choose>
												  <c:when test="${param.page == lastPage}">
												    <a class="page-link" style="pointer-events:none; color:white; border:1px solid white;">&raquo;</a>
											      </c:when>
												  <c:otherwise>
												    <a class="page-link" style="border:1px solid #f0f0f0;" href="list?page=${lastPage}&query=${param.query}&doo=${param.doo}&si=&thema=${param.thema}&elec=${param.elec}&internet=${param.internet}&wood=${param.wood}&water=${param.water}&pool=${param.pool}&playground=${param.playground}&walk=${param.walk}&ground=${param.ground}&workout=${param.workout}&mart=${param.mart}&tram=${param.tram}">&raquo;</a>
												  </c:otherwise>
											    </c:choose>
	                                        	</li>
	                                        </ul>
	                                    </nav>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!--Pagination End  -->
	            </div>
	        </div>
	    </div>
	</div>
	<!-- listing-area Area End -->
</main>
<script>

	var selectDoo = document.querySelector('.selectDoo');
	
	function changeSelection() { 
		var selectSi = document.querySelector('.selectSi');
		var mainOption = selectDoo.options[selectDoo.selectedIndex].innerText;
		
		var subOptions = {
				seoul: ['강남', '압구정'],
				busan: ['해운대', '광안리'],
				jeju: ['제주시', '서귀포시'],
				gyeonggi: ['가평시', '수원시', '의정부시']
		}
		
		switch (mainOption) {
		case '서울시':
			var subOption = subOptions.seoul;
			break;
		case '부산시':
			var subOption = subOptions.busan;
			break;
		case '제주도':
			var subOption = subOptions.jeju;
			break;
		case '경기도':
			var subOption = subOptions.gyeonggi;
			break;
		}
		
		selectSi.options.length = 0;
		
		for (var i = 0; i < subOption.length; i++) {
			var option = document.createElement('option');
			option.innerText = subOption[i];
			option.value = subOption[i];
			selectSi.append(option);
		}
		
	}
	function steamingAdd(boardId) {
		console.log("Add");
		
		$.ajax({
			url: "/home/loginCheck.do",
			type: "POST",
			success: function(data) {
				if (data.command === '로그인 안됨') {
					alert('로그인을 해주세요.');
					window.location.href = '/home/login';
				} else {
					$.ajax({
						url: "/home/steamingAdd.do",
						type: "POST",
						data: {
							boardId: boardId
						},
						success: function(data) {
							document.querySelector("#i" + boardId).setAttribute('onclick', 'steamingDelete('+boardId+')');
							document.querySelector("#i" + boardId).setAttribute('class', '');
							document.querySelector("#i" + boardId).setAttribute('class', 'fas fa-heart');
							$("i" + boardId).remove;	
							document.querySelector("#i" + boardId).innerHTML = " " + data.command + " 좋아요";
						},
						error: function() {
							alert("관리자에게 문의해주세요.");
						}	
			  		});
				}				
			},
			error: function() {                                        
				alert("관리자에게 문의해주세요.");
			}	
  		});
	}
	
	function steamingDelete(boardId) {
		console.log("Delete");
		
		$.ajax({
			url: "/home/loginCheck.do",
			type: "POST",
			success: function(data) {
				if (data.command === '로그인 안됨') {
					alert('로그인을 해주세요.');
					window.location.href = '/home/login';
				} else {
					$.ajax({
						url: "/home/steamingDelete.do",
						type: "POST",
						data: {
							boardId: boardId
						},
						success: function(data) {
							document.querySelector("#i" + boardId).setAttribute('onclick', 'steamingAdd('+boardId+')');
							document.querySelector("#i" + boardId).setAttribute('class', '');
							document.querySelector("#i" + boardId).setAttribute('class', 'far fa-heart');
							$("i" + boardId).remove;	
							document.querySelector("#i" + boardId).innerHTML = " " + data.command + " 좋아요";
						},
						error: function() {
							alert("관리자에게 문의해주세요.");
						}	
			  		});
				}				
			},
			error: function() {
				alert("관리자에게 문의해주세요.");
			}	
  		});
	}
</script>
<%@ include file="../inc/footer.jsp" %>