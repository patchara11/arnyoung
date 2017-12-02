<!DOCTYPE html>
<html lang="en">
<head>
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
										style="width: 500px; height: 350px;">
								</c:forEach>
							</div>
							<!-- /.col-md-8 -->
							<div class="col-md-4">
								<h1>TOP OF TALES</h1>
								<c:forEach var="listTop" items="${listTop}">
									<li><a href="#"
										onclick="LinkSCHAP(${listTop.story_header_id}, 'TOP')">${listTop.story_header_name}</a></li>
									<label>${listTop.story_header_content}</label>
									</br>
									<%-- <button class="btn btn-warning btn-lg"
										onclick="LinkSCHAP(${listTop.story_header_id}, 'TOP')">Call
										to Action!</button> --%>
								</c:forEach>
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
							<div class="col-md-4 center">
								<h2 class="text-center">Action (HOT)</h2>
								<c:forEach var="listActionTop" items="${listActionTop}">
									<div class="cols-md-12 text-center">
										<img id="imgSH" name="imgSH"
											src="http://localhost:8080/arnyoung/images/${listActionTop.story_header_img}"
											onclick="LinkSCHAP(${listActionTop.story_header_id}, 'ActionHOT')"
											atl="Mountain View" class="img-responsive center-block"
											style="width: 100px; height: 100px;"> <a
											class="center-block" href="#"
											onclick="LinkSCHAP(${listActionTop.story_header_id}, 'ActionHOT')">${listActionTop.story_header_name}</a>
										<label class="">${listActionTop.story_header_content}</label>
									</div>
								</c:forEach>
								<!-- <a class="btn btn-default" href="#">More Info</a> -->
							</div>
							<!-- /.col-md-4 -->
							<div class="col-md-4">
								<h2 class="text-center">Drama (HOT)</h2>
								<c:forEach var="listDramaTop" items="${listDramaTop}">
									<div class="cols-md-12 text-center">
										<img id="imgSH" name="imgSH"
											src="http://localhost:8080/arnyoung/images/${listDramaTop.story_header_img}"
											onclick="LinkSCHAP(${listDramaTop.story_header_id}, 'DramaHOT')"
											atl="Mountain View" class="img-responsive center-block"
											style="width: 100px; height: 100px;"> <a
											class="center-block" href="#"
											onclick="LinkSCHAP(${listDramaTop.story_header_id}, 'ActionHOT')">${listDramaTop.story_header_name}</a>
										<label class="">${listDramaTop.story_header_content}</label>
									</div>
								</c:forEach>
								<!-- <a class="btn btn-default" href="#">More Info</a> -->
							</div>
							<!-- /.col-md-4 -->
							<div class="col-md-4">
								<h2 class="text-center">Horror (HOT)</h2>
								<c:forEach var="listHorrorTop" items="${listHorrorTop}">
									<div class="cols-md-12 text-center">
										<img id="imgSH" name="imgSH"
											src="http://localhost:8080/arnyoung/images/${listHorrorTop.story_header_img}"
											onclick="LinkSCHAP(${listHorrorTop.story_header_id}, 'HorrorHOT')"
											atl="Mountain View" class="img-responsive center-block"
											style="width: 100px; height: 100px;"> <a
											class="center-block" href="#"
											onclick="LinkSCHAP(${listHorrorTop.story_header_id}, 'ActionHOT')">${listHorrorTop.story_header_name}</a>
										<label class="">${listHorrorTop.story_header_content}</label>
									</div>

								</c:forEach>
								<!-- <a class="btn btn-default" href="#">More Info</a> -->
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
									<h2 class="text-center">Action</h2>
									<c:forEach var="listAction" items="${listAction}">
										<div class="col-md-12 text-center">
											<a href="#"
												onclick="LinkSCHAP(${listAction.story_header_id}, 'Action')">${listAction.story_header_name}</a>
										</div>
									</c:forEach>
									<div class="col-md-12 text-center">
										<a class="btn btn-default text-center" href="#"
											onclick=FictionType('Action')>More Info</a>
									</div>
								</div>
								<!-- /.col-md-4 -->
								<div class="col-md-4">
									<h2 class="text-center">Drama</h2>
									<c:forEach var="listDrama" items="${listDrama}">
										<div class="col-md-12 text-center">
											<a href="#"
												onclick="LinkSCHAP(${listDrama.story_header_id}, 'Drama')">${listDrama.story_header_name}</a>
										</div>
									</c:forEach>
									<div class="col-md-12 text-center">
										<a class="btn btn-default text-center" href="#"
											onclick=FictionType('Drama')>More Info</a>
									</div>
								</div>
								<!-- /.col-md-4 -->
								<div class="col-md-4">
									<h2 class="text-center">Horror</h2>
									<c:forEach var="listHorror" items="${listHorror}">
										<div class="col-md-12 text-center">
											<a href="#"
												onclick="LinkSCHAP(${listHorror.story_header_id}, 'Horror')">${listHorror.story_header_name}</a>
										</div>
									</c:forEach>
									<div class="col-md-12 text-center">
										<a class="btn btn-default text-center" href="#"
											onclick=FictionType('Horror')>More Info</a>
									</div>
								</div>
								<!-- /.col-md-4 -->
							</div>
							<!-- /.row -->

							<!-- Footer -->
							<footer style="margin-top: 100px; margin-bottom: 0px;">
								<div class="row">
									<div class="col-lg-12">
										<p>
											<b><label id="lbCopy"></label></b>
										</p>
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
		$(document).ready(function(){
			var d = new Date();
			var n = d.getFullYear();
			document.getElementById('lbCopy').innerHTML = 'Copyright Arnyoung @'+n;
		}); 
		
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
			
			function LinkSCHAP(story_header_id, strTop) {		
				storyHeaderId = story_header_id;
				
				var storyHeaderName = "";
				var storyHeaderImg = "";
				var storyHeaderContent = "";
				var linkMemberId = "";
				
				switch (strTop) {
				case 'TOP':
					<c:forEach var="item" items="${listTop}" varStatus="status">
		          //  alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	   linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
					break;
				case 'ActionHOT':
					<c:forEach var="item" items="${listActionTop}" varStatus="status">
		         //   alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
				    break;
				case 'DramaHOT':
					<c:forEach var="item" items="${listDramaTop}" varStatus="status">
		         //   alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
				    break;
				case 'HorrorHOT':
					<c:forEach var="item" items="${listHorrorTop}" varStatus="status">
		         //   alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
				    break;
				case 'Action':
					<c:forEach var="item" items="${listAction}" varStatus="status">
		         //   alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
				    break;
				case 'Drama':
					<c:forEach var="item" items="${listDrama}" varStatus="status">
		          //  alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
				    break;
				case 'Horror':
					<c:forEach var="item" items="${listHorror}" varStatus="status">
		          //  alert(strTop);
			            if('${item.story_header_id}' == storyHeaderId){
			           	   /* alert("${item.story_header_name}"); */
			           	   
			           	   storyHeaderName = '${item.story_header_name}';
			           	   storyHeaderContent = '${item.story_header_content}';
			           	   storyHeaderImg = '${item.story_header_img}';
			           	linkMemberId =  '${item.member_id}';
			            }
		            </c:forEach>
				    break;
				default:
					break;
				}
				
				
				//sessionStorage.setItem("storyHeaderId", storyHeaderId);
				
				//sessionStorage.story_header_id = storyHeaderId;
				//alert(sessionStorage.story_header_id);
				
				 $.ajax({
				      url:'storyheaderid',
				      type:'POST',
				      data:{storyHeaderId: storyHeaderId, storyHeaderName: storyHeaderName, storyHeaderImg: storyHeaderImg, storyHeaderContent: storyHeaderContent, linkMemberId: linkMemberId},
				      success : function(data){
				    	  window.location.href="storychapter"; 
				     //alert('Logout success');
				     // window.location = data.url; 
				    //location.reload();
				      }
				    });  
				    
				 
				  //window.location = "storychapter.jsp?story_header_id="+storyHeaderId; */
			}
		
			
		</script>
</body>
</html>