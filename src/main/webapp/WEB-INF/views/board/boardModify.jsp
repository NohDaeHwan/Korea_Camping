<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.nolja.home.dto.User"%>
<%@ include file="../inc/header.jsp" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"/>
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
<main>
  	<div class="row justify-content-center section-padding">
		<div class="col-lg-8">
			<h3 class="mb-40">게시글 수정 </h3>
			<form class="form-contact contact_form mb-80" action="/home/board/modify_board/${board.id}" method="post">
			    <div class="row">
			        <div class="col-sm-6">
			            <div class="form-group">
			                <input class="form-control error" id="title" name="title" value="${board.title}" type="text"  placeholder="Title Here">
			            </div>
			        </div>
			    </div>
			    <div class="form-group">
      				<textarea id="summernote" class="form-control" id="content" name="content">${board.content}</textarea>
      			</div>	    
			    <div class="form-group mt-3">
			        <button type="submit" class="button button-contactForm boxed-btn">게시글 수정</button>
			    </div>
			</form>
		</div>
	</div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
	$('#summernote').summernote({
		placeholder: 'Content Here',
		tabsize: 2,
		height: 400,
		maxHeight: 400,
		minHeight: 400,
		toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	    ]
	});
</script>
<%@ include file="../inc/footer.jsp" %>