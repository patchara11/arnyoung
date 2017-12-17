
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggles="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home" style="color: orange;">ARNYOUNG</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li id="liName"><a href="#')"><label id="lbName"
						name="lbName" style="color: orange;">Name</label></a></li>
				<li id="liRegister"><a id="menuRegister" name="menuRegister"
					data-toggle="modal" data-target="#modalRegister" href="#"><label
						name="lbRegister" id="lbRegister">Register</label></a></li>

				<li id="liLogin"><a id="menuLogin" name="menuLogin"
					data-toggle="modal" data-target="#myModal" href="#"><label
						name="lbLogin" id="lbLogin">Log-in</label></a></li>

				<li id="liLogout"><a name="menuLogout" href="#"
					onclick="Logout()">Logout</a></li>
				<li id="liWriting"><a
					href="${pageContext.request.contextPath}/storyheader">Dream
						Writing</a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> Style <b class="caret"></b>
				</a> <%-- <div class="row">
								<div class="col-md-4">
									<h2 class="text-center">Action</h2>
									<c:forEach var="listAction" items="${listAction}">
										<div class="col-md-12 text-center">
											<a href="#"
												onclick="LinkSCHAP(${listAction.story_header_id}, 'Action')">${listAction.story_header_name}</a>
										</div>
									</c:forEach>
								</div>
						<div class="col-md-4">
								<h2 class="text-center">Drama</h2>
								<c:forEach var="listDramaTop" items="${listDrama}">
									<div class="cols-md-12 text-center"> <a
											class="center-block" href="#"
											onclick="LinkSCHAP(${listDrama.story_header_id}, 'ActionHOT')">${listDrama.story_header_name}</a>
										<label class="">${listDrama.story_header_content}</label>
									</div>
								</c:forEach>
								<!-- <a class="btn btn-default" href="#">More Info</a> -->
							</div>
						<div class="col-md-4">
									<h2 class="text-center">Horror</h2>
									<c:forEach var="listHorror" items="${listHorror}">
										<div class="col-md-12 text-center">
											<a href="#"
												onclick="LinkSCHAP(${listHorror.story_header_id}, 'Horror')">${listHorror.story_header_name}</a>
										</div>
									</c:forEach>
								</div> --%>
					<ul class="dropdown-menu">
						<li>
						<li><a href="#" onclick=FictionType('Action')>Action</a></li>
						<li><a href="#" onclick=FictionType('Drama')>Drama</a></li>
						<li><a href="#" onclick=FictionType('Horror')>Horror</a></li>
						<!--   <li class = "divider"></li>
			               <li><a href = "#">Separated link</a></li>			               
			               <li class = "divider"></li>
			               <li><a href = "#">One more separated link</a></li> -->
					</ul></li>
				<li id="liCart"><a class="fa fa-shopping-cart fa-lg"
					name="menuCart" href="#" onclick="Cart()"><label name="lbCart"
						id="lbCart">(0)</label></a></li>

				<li id="liAdmin"><a class="g" name="menuAdmin" href="${pageContext.request.contextPath}/admin"
					onclick=""><label name="lbAdmin" id=""lbAdmin"">Admin
							management</label></a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- Modal Register-->
	<div class="modal fade" id="modalRegister" tabindex="-1" role="dialog"
		aria-labelledby="modalRegisterLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalRegisterLabel">Register</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<%@ include file="register.jsp"%>


						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<!-- Modal Login -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Login</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<%@ include file="login.jsp"%>


						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function() {
		
		//alert("menuLogout");
		var username = '<%=session.getAttribute("username")%>' ;
			//alert(username);
			if(username != "admin"){
				document.getElementById("liAdmin").children[0].style.display = "none";
			}
			if (name != null && "null" != username) {
				document.getElementById("liLogin").children[0].style.display = "none";
				document.getElementById("liRegister").children[0].style.display = "none";
				document.getElementById("liLogout").children[0].style.display = "";
				document.getElementById("liName").children[0].style.display = "";
				document.getElementById("liWriting").children[0].style.display = "";
				document.getElementById("liCart").children[0].style.display = "";
				$("#lbName").text(username);
				//alert(username);
				
				
				$.ajax({
				      url:'countcart',
				      type:'POST',
				      data:'',
				      success : function(data){
				    	  //alert(data);
				         //int count = data.count;
				      $("#lbCart").text("("+data+")");
				      }
				    });
				
			} else {
				//alert(name);
				document.getElementById("liRegister").children[0].style.display = " ";
				document.getElementById("liLogin").children[0].style.display = "";
				document.getElementById("liLogout").children[0].style.display = "none";
				document.getElementById("liName").children[0].style.display = "none";
				document.getElementById("liWriting").children[0].style.display = "none";
				document.getElementById("liCart").children[0].style.display = "none";
			}
		});
				
	function Logout() {
		alert("Logout");
		//sessionstorage.clear();	
		/* Session.clear(); */
	<%-- 	var aa = '<%= session.removeAttribute("username")%>'; --%>

		    $.ajax({
		      url:'LogoutServlet',
		      type:'POST',
		      data:'',
		      success : function(data){
		          //alert('Logout success');
		          window.location.href="home";
		      }
		    });



		
		document.getElementById("liRegister").children[0].style.display = "";
		document.getElementById("liLogin").children[0].style.display = "";
		document.getElementById("liLogout").children[0].style.display = "none";
		document.getElementById("liName").children[0].style.display = "none";
		document.getElementById("liWriting").children[0].style.display = "none";
		document.getElementById("liCart").children[0].style.display = "none";
	}
	
	function FictionType(type) {
		//alert(type);
		    $.ajax({
		      url:'categoriesname',
		      type:'POST',
		      data:{categories:type},
		      success : function(data){
		          window.location.href="fictiontype";
		      }
		    }); 
	}	
	
	function Cart(){
		var member_id = '<%=session.getAttribute("member_id")%>';
		if (member_id != "null") {
			window.location.href="cart";
		} else {
			alert("Please login.");
		}
	}
	
	

	</script>

</body>
</html>