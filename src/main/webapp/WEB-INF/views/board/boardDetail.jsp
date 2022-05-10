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

	<section class="blog_area single-post-area section-padding4">
		<div class="container">
			<hr>
			<div class="blog_details">
				<h2>제목 : ${board.title}</h2>
				<div class="listing__details__comment__item__text">
					<h5>닉네임 : ${board.userId}</h5>
                    <span>만든날짜 : ${board.createDate}</span>
				</div>
				<c:if test="${sessionScope.User.userId == board.userId}">
					<div class="row">
						<div class="col-md-2"><input type="button" class="btn list-btn mt-20" onclick="boardModify()" value="수정"></div>
						<div class="col-md-2"><input type="button" class="btn list-btn mt-20" onclick="boardDelete()" value="삭제"></div>
					</div>
				</c:if>
			</div>
			<hr>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">					
                     	<p class="excert">${board.content}</p>
					</div>
				</div>
			</div>	 
			
			<div class="listing__details__comment">
				<h5>댓글</h5>
	            <input type="hidden" id="boardId" name="boardId" value="${board.id}">
				<textarea placeholder="공개 댓글 추가..." rows="3" cols="80" id="comment" name="comment"></textarea>
				<br><input type="button" class="btn" onclick="commentCreate();" value="댓글"><br><br>
				<div id="comment_container">
					<c:forEach var="comment" items="${comments}">
						<div class="listing__details__comment__item">
	                		<div class="listing__details__comment__item__pic">
	                    		<img class="listing__details__comment__item__profile" style="background: gray;" src="<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png">
	                		</div>
	                		<div class="listing__details__comment__item__text">
	                    		<span>${comment.createDate}</span>
                        		<h5>${comment.userId}</h5>
                        		<p>${comment.comment}</p>
	                		</div>
	           	 		</div>
					</c:forEach>
				</div>	
			</div>
		</div>
	</section>
</main>
<script>
	function boardModify() {
		$.ajax({
			url: "/home/loginCheck.do",
			type: "POST",
			success: function(data) {
				if (data.command === '로그인 안됨') {
					alert('로그인을 해주세요.');
					window.location.href = '/home/login';
				} else {
					window.location.href = '/home/board/modify/${board.id}';
				}				
			},
			error: function() {
				alert("관리자에게 문의해주세요.");
			}
		});
	}
	
	function boardDelete() {
		$.ajax({
			url: "/home/loginCheck.do",
			type: "POST",
			success: function(data) {
				if (data.command === '로그인 안됨') {
					alert('로그인을 해주세요.');
					window.location.href = '/home/login';
				} else {
					var result = confirm('게시판 내용을 삭제하시겠습니까?');
					if (result == true) {
						window.location.href = '/home/board/delete/${board.id}';
					}
				}			
			},
			error: function() {
				alert("관리자에게 문의해주세요.");
			}
		});
	}
	
	function commentCreate() {
		var comment = $("#comment").val();
		if (comment == '') {
			alert("댓글을 입력해주세요~!!");
			return;
		}
		
		$.ajax({
			url: "/home/comment.do",
			type: "POST",
			data: {
				comment:$("#comment").val(),
				boardId:$("#boardId").val()
			},
			success: function(data) {
				if (data.command === '로그인 안됨') {
					alert('로그인을 해주세요.');
					window.location.href = '/home/login';
				} else {
					var today = new Date();

					var year = today.getFullYear();
					var month = ('0' + (today.getMonth() + 1)).slice(-2);
					var day = ('0' + today.getDate()).slice(-2);
					var hours = ('0' + today.getHours()).slice(-2); 
					var minutes = ('0' + today.getMinutes()).slice(-2);
					var seconds = ('0' + today.getSeconds()).slice(-2); 			
					var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes  + ':' + seconds;
					
					var container = document.querySelector('#comment_container');
					
					var item = document.createElement('div');
					item.className = 'listing__details__comment__item';
					
					var div1 = document.createElement('div');
					div1.className = 'listing__details__comment__item__pic';
					
					var img = document.createElement('img');
					img.className = 'listing__details__comment__item__profile';
					img.src = '<%=request.getContextPath()%>/resources/assets/img/logo/nolgaLogo.png';
					img.style.background = 'gray';
					
					var div2 = document.createElement('div');
					div2.className = 'listing__details__comment__item__text';
					
					var span = document.createElement('span');
					span.innerHTML = dateString;
					
					var h5 = document.createElement('h5');
					h5.innerHTML = data.userId;
					
					var p = document.createElement('p');
					p.innerHTML = comment;
					
					container.appendChild(item);
					item.appendChild(div1);
					div1.appendChild(img);
					item.appendChild(div2)
					div2.appendChild(span);
					div2.appendChild(h5);
					div2.appendChild(p);
					
					document.getElementById("comment").value = '';
				}				
			},
			error: function() {
				alert("관리자에게 문의해주세요.");
			}
		});
	}
</script>
<%@ include file="../inc/footer.jsp" %>