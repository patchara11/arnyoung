<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Laravel Tutorials</title>

<%@ include file="header.jsp"%>
<!-- Styles -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>

	<style>
.loading {
	background: lightgoldenrodyellow
		url('{{asset(' images/ processing.gif ')}}') no-repeat center 65%;
	height: 80px;
	width: 100px;
	position: fixed;
	border-radius: 4px;
	left: 50%;
	top: 50%;
	margin: -40px 0 0 -50px;
	z-index: 2000;
	display: none;
}
</style>
	<div class="container-fluid">
		<div class="row"></div>
		<div class="row">
			<!--  <div class="col-md-3"></div> -->
			<div class="col-md-12">

				<%@include file="menu.jsp"%>

				<div id="content">


					<div class="container">

						<!-- Heading Row -->
						<div class="row">
							<div class="col-md-8">
								<c:forEach var="listTopImg" items="${listTop}">
									<img id="imgSH" name="imgSH"
										src="http://localhost:8080/arnyoung/images/${listTopImg.story_header_img}"
										atl="Mountain View" class="text-center"
										style="width: 600px; height: 500px;">
								</c:forEach>
							</div>
							<!-- /.col-md-8 -->
							<div class="col-md-4">
								<h1>TOP OF TALES</h1>
								<c:forEach var="listTop" items="${listTop}">
									<li><a href="#">${listTop.story_header_name}</a></li>
									<label>${listTop.story_header_content}</label>
									</br>
								</c:forEach>
								<a class="btn btn-success btn-lg" href="#">Call to Action!</a>
							</div>
							<!-- /.col-md-4 -->
						</div>
						<!-- /.row -->

						<hr>

						<!-- Call to Action Well -->
						<div class="row">
							<div class="col-lg-12">
								<div class="well text-center">This is a well that is a
									great spot for a business tagline or phone number for easy
									access!</div>
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<!-- /.row -->

						<!-- Content Row -->
						<div class="row">
							<div class="col-md-4">
								<h2>Action (HOT)</h2>
								<c:forEach var="listActionTop" items="${listActionTop}">
									<li><a href="#">${listActionTop.story_header_name}</a></li>
								</c:forEach>
								<a class="btn btn-default" href="#">More Info</a>
							</div>
							<!-- /.col-md-4 -->
							<div class="col-md-4">
								<h2>Drama (HOT)</h2>
								<c:forEach var="listDramaTop" items="${listDramaTop}">
									<li><a href="#">${listDramaTop.story_header_name}</a></li>
								</c:forEach>
								<a class="btn btn-default" href="#">More Info</a>
							</div>
							<!-- /.col-md-4 -->
							<div class="col-md-4">
								<h2>Horror (HOT)</h2>
								<c:forEach var="listHorrorTop" items="${listHorrorTop}">
									<li><a href="#">${listHorrorTop.story_header_name}</a></li>
									<label>${listHorrorTop.story_header_content}</label>
									</br>
								</c:forEach>
								<a class="btn btn-default" href="#">More Info</a>
							</div>
							<!-- /.col-md-4 -->

							<!--                 <div class="row">
            <div class="col-md-4">
                <h2>Action (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            /.col-md-4
            <div class="col-md-4">
                <h2>Drama  (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            /.col-md-4
            <div class="col-md-4">
                <h2>Horror  (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            /.col-md-4 -->
							<div class="row">
								<div class="col-md-4">
									<h2>Action</h2>
									<c:forEach var="listAction" items="${listAction}">
										<li><a href="#">${listAction.story_header_name}</a></li>
									</c:forEach>
									<a class="btn btn-default" href="#">More Info</a>
								</div>
								<!-- /.col-md-4 -->
								<div class="col-md-4">
									<h2>Drama</h2>
									<c:forEach var="listDrama" items="${listDrama}">
										<li><a href="#">${listDrama.story_header_name}</a></li>
									</c:forEach>
									<a class="btn btn-default" href="#">More Info</a>
								</div>
								<!-- /.col-md-4 -->
								<div class="col-md-4">
									<h2>Horror</h2>
									<c:forEach var="listHorror" items="${listHorror}">
										<li><a href="#">${listHorror.story_header_name}</a></li>
									</c:forEach>
									<a class="btn btn-default" href="#">More Info</a>
								</div>
								<!-- /.col-md-4 -->
							</div>
							<!-- /.row -->

							<!-- Footer -->
							<footer>
								<div class="row">
									<div class="col-lg-12">
										<p>Copyright &copy; Your Website 2014</p>
									</div>
								</div>
							</footer>

						</div>
						<!-- /.container -->

						<!-- jQuery -->
						<!--   <script src="bootstrap/js/jquery-1.11.3.min.js"></script> -->

						<!-- Bootstrap Core JavaScript -->
						<!--   <script src="bootstrap/js/bootstrap.min.js"></script> -->



					</div>
					<div class="loading"></div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<!-- JavaScripts -->
		<!-- <script src="http://www.tutorialspoint.com/bootstrap/scripts/jquery.min.js">
        </script>
 	 <script src="http://www.tutorialspoint.com/bootstrap/js/bootstrap.min.js"></script> -->
		<script>
			function ajaxLoad(filename, content) {
				content = typeof content !== 'undefined' ? content : 'content';
				//   $('.loading').show();
				$.ajax({
					type : "GET",
					url : filename,
					//  contentType: false,
					success : function(data) {
						$("#content").html(data);

					},
					error : function(xhr, status, error) {
						alert(xhr.responseText);
					}
				});

			}
		</script>
</body>
</html>