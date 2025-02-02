<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<title>Introduction.jsp</title>
</head>
<body>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="MenuNavbar_admin.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbOGRoC%2Fbtrops663eP%2FM81FWcPmrZe4IZ1AKK39d0%2Fimg.jpg" alt="...">
						<!-- src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."> -->
						<!-- 나중에 서로 손 잡고있는 사진 등으로 교체하기! 600x700  -->
				</div>
				<div class="col-md-6" style="align-content: flex-start;">
					<!--＠ 서로란/서울사는 솔로(1인가구~) 고정 -->
					<h1 class="display-5 fw-bolder">서로란?</h1>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through">서울 사는
							솔로(1인가구)들을 위한 사이트</span>
					</div>
					<!-- 수정 가능 -->
					<p class="lead">Lorem ipsum dolor sit amet consectetur
						adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi
						consequatur obcaecati excepturi alias magni, accusamus eius
						blanditiis delectus ipsam minima ea iste laborum vero? Lorem ipsum
						dolor sit amet consectetur adipisicing elit. Praesentium at
						dolorem quidem modi. Nam sequi consequatur obcaecati excepturi
						alias magni, accusamus eius blanditiis delectus ipsam minima ea
						iste laborum vero?</p>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button type="submit" href="<%=cp%>/UpdateIntroduction.jsp" class="btn btn-primary">수정하기</button>
				<!-- 쟤 왜 안가징,,,? 나중에 수정해보기 -->
				<%-- <a class="btn btn-primary" href="<%=cp%>/UpdateIntroduction.jsp" role="button">수정하기</a> --%>
			</div>
			<br><br>
		</div>


	</section>


</body>
</html>