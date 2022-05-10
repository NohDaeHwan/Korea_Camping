<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp" %>
<!-- bootstrap core css -->

<main>
	<!-- Hero Start-->
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
				<div class="row">
					<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
							<h2>회원가입</h2>
					</div>
					</div>
				</div>
		</div>
	</div>
	<!--Hero End -->
	<!-- Start Sample Area -->
	<div class="login_section layout_padding">
	    <div class="container">
	      <div class="row">
	      	<div class="col-md-3"></div>
	        <div class="col-md-6">
	          <div class="login_form">
	            <h5>
	              회원가입
	            </h5>        
	            <form action="/home/register" method="post" onsubmit="return valid()">
	              	  <input type="hidden" name="cmd" value="userRegister" />
	              <div>
	              	  <input type="text" name="userId" id="userId" placeholder="아이디를 입력주세요." required />
	                  <input type="button" class="btn btn-secondray" onclick="userIdCheck();" value="아이디 중복확인" />
	              </div>
	              <div>
	                <input type="password" name="userPassword" placeholder="비밀번호를 입력해주세요." required />
	              </div>
	              <div>
	                <input type="email" name="userEmail" placeholder="이메일을 입력해주세요" required />
	              </div>
	              <div>
	              	<input type="button" class="btn btn-secondray" onclick="goPopup();" value="주소검색" />
	                <input type="text" id="userAddress" name="userAddress" placeholder="주소를 입력해주세요." required readonly />
	              </div>
	              <div class="p-5">
	              	<input type="submit" class="genric-btn primary" value="회원가입">
	              </div>
	            </form>
	        </div>
	        <div class="col-md-3"></div>
	      </div>
	    </div>
  		</div>
  	</div>
</main>
<script>
		var isChecking = false;
	  	
	  	function valid() {
	  		if (isChecking == false) {
	  			alert('아이디 중복체크를 해주세요');
	  		}
	  		return isChecking;
	  	}
	  	
	  	function userIdCheck() {
	  		var userId = $("#userId").val();
	  		if (userId == '') {
	  			alert("아이디를 입력해주세요~!!");
	  			return;
	  		}
	  		
	  		// 비동기 XMLHttpRequest 객체 생성
	  		var xhr = new XMLHttpRequest();
	  		// 상태가 변할 때의 이벤트
	  		xhr.onreadystatechange = function() {
	  			// 수신이 완료가 되면
	  			if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	  				// 결과를 String에서 javascript 구조체로 변환
	  				var result = JSON.parse(xhr.response);
	  				// result 태그에 표시
	  				alert(result.data);				
	  				if (result.data === '이미 등록되어 있는 아이디 입니다.') {
	  					isChecking = false;
	  				} else {
	  					isChecking = true;
	  				}
	  			}
	  		}
	  		// url 설정 GET방식으로 비동기(async)로 처리한다.
	  		xhr.open("POST", "test.do", true);
	  		// 송신
	  		xhr.send(userId);
	  	}
  		
	  	function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("resources/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
	  	
	  	function jusoCallBack(roadFullAddr) {
	  		var roadAddress = document.querySelector("#roadAddress");
	  		userAddress.value = roadFullAddr;
		}
</script>
<%@ include file="inc/footer.jsp" %>