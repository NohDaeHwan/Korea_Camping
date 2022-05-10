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
							<h2>로그인</h2>
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
	        <div class="col-md-6">
	          <div class="detail-box">
	            <h3>
	              무료로 계정을 만드세요.
	            </h3>
	            <p>
	              지금 무료로 계정을 만들고 전국 캠핑장을 찾아보세요 ~
	            </p>
	            <a href="register">
	              회원가입
	            </a>
	          </div><br>
	          <a id="kakao-login-btn" href="javascript:loginWithKakao()">
	          	<img id="kakao-login-btn" src="https://kauth.kakao.com/public/widget/login/kr/kr_02_medium.png" 
	          	onmouseover="this.src='https://kauth.kakao.com/public/widget/login/kr/kr_02_medium_press.png'" 
	          	onmouseout="this.src='https://kauth.kakao.com/public/widget/login/kr/kr_02_medium.png'" style="cursor: pointer">
	          </a>
	        </div>
	        <div class="col-md-6">
	          <div class="login_form">
	            <h5>
	              로그인
	            </h5><br>
	            <form action="/home/login" method="post">
	              <div>
	                <input type="text" name="userId" placeholder="아이디를 입력해주세요." />
	              </div>
	              <div>
	                <input type="password" name="userPassword" placeholder="비밀번호를 입력해주세요." />
	              </div>
	              <c:choose>
	              	<c:when test="${fail == 'fail'}">
	              		<br>
	              		<h6 style="color:red;">아이디 또는 비밀번호가 잘못 입력 되었습니다.</h6>
	                	<h6 style="color:red;">아이디와 비밀번호를 정확히 입력해 주세요.</h6>
	              	</c:when>
	              	<c:otherwise>
	              		<br><br><br>
	              	</c:otherwise>
	              </c:choose>
	              <div class="p-5">
	                <button type="submit" class="genric-btn primary">로그인</button>
	              </div>
	            </form>          
	          </div>
	        </div>
	      </div>
	    </div>
  	</div>
</main>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	//SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('78c1cf90058867ac555cc95638bcbd09');
	// SDK 초기화 여부를 판단합니다.
	console.log(Kakao.isInitialized());

	function loginWithKakao() {
    	Kakao.Auth.login({
      		success: function(authObj) {
        		alert(JSON.stringify(authObj))
      		},
      		fail: function(err) {
        		alert(JSON.stringify(err))
      		},
   	 	})
  	}
</script>
<%@ include file="inc/footer.jsp" %>