<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Main.jsp</title>

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.bg { 
	background-color:rgba(0, 0, 0, 0.5); /*살짝 투명한 검정으로 배경색*/ 
	width:100%; 
	height:100%; 
	position: absolute; /*다른 요소들 위로 겹쳐질 수 있게함*/  
}

.bg img{
	margin-top: -15%;
	filter: brightness(50%);
}

</style>

<!-- Custom styles for this template -->
<link href="<%=cp%>/css/carousel.css" rel="stylesheet">
</head>
<body>
	<div>
		<c:import url="/nav.action"></c:import>
	</div>
	<div class="main">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="bg col-md-12">
						<img src="<%=cp %>/images/mainseoul.jpg" class="d-block w-100">
					</div>
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" role="img" aria-label=" :  "
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title> </title><rect width="100%" height="100%" fill="#FFFFFF" />
						<text x="50%" y="50%" fill="#FFFFFF" dy=".3em"> </text></svg>

					<div class="container">
						<div class="carousel-caption text-left">
							<h1>메인페이지 1</h1>
							<p>Some representative placeholder content for the first
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="bg col-md-12">
						<img src="<%=cp %>/images/room.jpg" class="d-block w-100">
					</div>
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" role="img" aria-label=" :  "
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title> </title><rect width="100%" height="100%" fill="#FFFFFF" />
						<text x="50%" y="50%" fill="#FFFFFF" dy=".3em"> </text></svg>

					<div class="container">
						<div class="carousel-caption">
							<h1>메인페이지 2</h1>
							<p>Some representative placeholder content for the second
								slide of the carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="bg col-md-12">
						<img src="<%=cp %>/images/river.jpeg" class="d-block w-100">
					</div>
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" role="img" aria-label=" :  "
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title> </title><rect width="100%" height="100%" fill="#FFFFFF" />
						<text x="50%" y="50%" fill="#FFFFFF" dy=".3em"> </text></svg>

					<div class="container">
						<div class="carousel-caption text-right">
							<h1>메인페이지 3</h1>
							<p>Some representative placeholder content for the third
								slide of this carousel.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Browse gallery</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#myCarousel" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">
			<div class="row featurette">
				<div class="col-md-12">
					<h2 class="featurette-heading">
						공지사항 <span class="text-muted"> Notice</span>
					</h2>
					<p class="lead">&nbsp;</p>
				</div>
			</div>
			<div class="row featurette">
				<table class="table col-md-11 mx-auto">
				  <tbody>
				  	<c:forEach var="notice" items="${noticeList }">
				  		<tr>
					      <th scope="row" class="col-md-1">${notice.num }</th>
					      <td class="col-md-8"><a href="noticeview.action?no_no=${notice.no_no }">${notice.title }</a></td>
					      <td class="col-md-2">${notice.nodate }</td>
					    </tr>
				  	</c:forEach>
				  </tbody>
				</table>
			</div>

			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-6">
					<h2 class="featurette-heading">
						인기 지역정보
					</h2>
					<p class="lead">&nbsp;</p>
				</div>
				<div class="col-md-6">
					<h2 class="featurette-heading">
						인기 체크리스트
					</h2>
					<p class="lead">&nbsp;</p>
				</div>
			</div>
			<div class="row featurette">
				<!-- 지역정보 -->
				<div class="col-md-6">
					<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">순위</th>
					      <th scope="col">구</th>
					      <th scope="col">동</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach var="local" items="${localList }">
					  		<tr onclick="location.href='readlocal.action?dongNo=${local.dongNo}'">
						      <th scope="row">${local.rank }</th>
						      <td>${local.guName }</td>
						      <td>${local.dongName }</td>
						    </tr>
					  	</c:forEach>
					  </tbody>
					</table>
				</div>
				
				<!-- 체크리스트 -->
				<div class="col-md-6">
					<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">순위</th>
					      <th scope="col">구</th>
					      <th scope="col">동</th>
					      <th scope="col">&nbsp;</th>
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach var="check" items="${checkList }">
						  	<tr onclick="location.href='readcheck.action?checkNo=${check.check_no}'">
						      <th scope="row">${check.rank }</th>
						      <td>${check.guName }</td>
						      <td>${check.dongName }</td>
						      <td>의 체크리스트</td>
						    </tr>
						  </c:forEach>
					  </tbody>
					</table>
				</div>
				
			</div>

			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->


		<!-- FOOTER -->
		<footer class="container">
			<p class="float-right">
				<a href="#">▲ top</a>
			</p>
			<p>
				&copy; 2021 Seolo, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
			</p>
		</footer>
	</div><!-- div.main 끝 -->

<!-- 필요없는 부분 같음...?
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
 -->
</body>
</html>