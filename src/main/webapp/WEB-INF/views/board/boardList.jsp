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
	                    <h2>게시판</h2>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--Hero End -->
	<div class="container">
		<div class="section-padding">
			<h1>게시판</h1>
			<div class="board_area">
				<table class="list-table">
					<thead>
						<tr>
							<th width="120">번호</th>
							<th width="550">제목</th>
							<th width="170">글쓴이</th>
							<th width="150">작성일</th>
							<th width="150">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="boardList" items="${boardLists}">
							<tr>
								<td>${boardList.id}</td>
								<td><a href="/home/board/detail/${boardList.id}">${boardList.title}</a></td>
								<td>${boardList.userId}</td>
								<td>${boardList.createDate}</td>
								<td>${boardList.viewCount}</td>
							</tr>					           
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br><input type="button" class="btn" onclick="loginCheck()" value="글쓰기">
		</div>
	</div>
</main>
<script>
	  	function loginCheck() {
	  		$.ajax({
				url: "/home/loginCheck.do",
				type: "POST",
				success: function(data) {
					if (data.command === '로그인 안됨') {
						alert('로그인을 해주세요.');
						window.location.href = '/home/login';
					} else {
						location.assign("<%=request.getContextPath()%>/board/create");
					}				
				},
				error: function() {
					alert("관리자에게 문의해주세요.");
				}	
	  		});
	  	}
</script>
<%@ include file="../inc/footer.jsp" %>