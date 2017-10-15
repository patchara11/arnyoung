<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>

<%@ include file="header.jsp"%>
<!-- Styles -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>
	<div class="container-fluid">
		<div class="row"></div>
		<div class="row">
			<!--  <div class="col-md-3"></div> -->
			<div class="col-md-12">

				<%@include file="menu.jsp"%>

				<div class="container">
					<h2>
						Story of <span style="color: orange">${username}</span>
					</h2>
					<p style="color: red;">${errorString}</p>
					<table class="table table-striped" id="tableStoryHeader"
						name="tableStoryHeader">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th>Story name</th>
								<th hidden="hidden"></th>
								<th class="btn-group pull-right">Edit & Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${StoryHeaderModel}" var="story_h"
								varStatus="count">
								<tr>
									<td class="text-center">${count.count}</td>
									<td><a herf="#">${story_h.story_header_name}</a></td>
									<td hidden="hidden">${story_h.story_header_id}</td>
									<td><div class="btn-group pull-right">
											<button type="button" class="btn btn-info"
												style="width: 80px;"
												onclick="EditSH(${story_h.story_header_id})">Edit</button>
											<button type="button" class="btn btn-danger"
												style="width: 80px;"
												onclick="ConfirmDelSH(${story_h.story_header_id})">Delete</button>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-success pull-right"
						style="width: 80px;" data-toggle="modal"
						data-target="#modalAddStoryHeader">Add</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalAddStoryHeader" tabindex="-1"
		role="dialog" aria-labelledby="modalAddStoryHeader">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalAddStoryHeader">Add story
						header</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<%@ include file="addstoryheader.jsp"%>


						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalEditStoryHeader" tabindex="-1"
		role="dialog" aria-labelledby="modalEditStoryHeader">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalEditStoryHeader">Edit story
						header</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<%@ include file="editstoryheader.jsp"%>


						</div>
					</div>
				</div> 
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


	<!-- <button class="btn btn-default" id="btn-confirm">Confirm</button> -->

	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Your story will be
						lost and can't backup again!!!</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="modal-btn-si">Accept</button>
					<button type="button" class="btn btn-default" id="modal-btn-no">Decline</button>
				</div>
			</div>
		</div>
	</div>

	<div class="alert" role="alert" id="result"></div>

	<script type="text/javascript">
	    var storyHeaderId = 0;
		function ConfirmDelSH(story_header_id) {		
			storyHeaderId = story_header_id;
			//alert(storyHeaderId);
			$("#mi-modal").modal('show');
		}
		var modalConfirm = function(callback) {

			/* $("#btn-confirm").on("click", function() {
				$("#mi-modal").modal('show');
			}); */

			$("#modal-btn-si").on("click", function() {
				callback(true);
				$("#mi-modal").modal('hide');
			});

			$("#modal-btn-no").on("click", function() {
				callback(false);
				$("#mi-modal").modal('hide');
			});
		};

		modalConfirm(function(confirm) {
			if (confirm) {
				//Acciones si el usuario confirma
				//$("#result").html("CONFIRMADO");
				//alert(storyHeaderId);
				  $.ajax({
				      url:'DeleteStoryHeaderServlet',
				      type:'POST',
				      data:{storyHeaderId: storyHeaderId},
				      success : function(data){
				     //alert('Logout success');
				    /*       window.location.href="storyheader.jsp";  */
				    location.reload();
				      }
				    });
			} else {
				//Acciones si el usuario no confirma
				//$("#result").html("NO CONFIRMADO");
			}
		});
		
		function EditSH(story_header_id) {		
			storyHeaderId = story_header_id;
			//alert(storyHeaderId);
			// Get the size of an object
			/* var model = '${StoryHeaderModel}';
			var rows = document.getElementById("tableStoryHeader").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
			for (var int = 0; int < rows; int++) {
				
			} */
			
			<c:forEach var="item" items="${StoryHeaderModel}" varStatus="status">
                 //alert("${item.story_header_name}");
                 if('${item.story_header_id}' == storyHeaderId){
                	   /* alert("${item.story_header_name}"); */
                	   
                	   $("#editStoryHeaderName").val('${item.story_header_name}');
                	   $("#editStoryHeaderContent").val('${item.story_header_content}');
                	   var img = '${item.story_header_img}';
                	   document.getElementById("imgSH").src = "http://localhost:8080/arnyoung/images/"+img;
                	   $("#editStoryHeaderId").val(storyHeaderId)
                 }
             </c:forEach>
			$("#modalEditStoryHeader").modal('show');
		}
		
		function encode_utf8(s) {
			  return unescape(encodeURIComponent(s));
			}

			function decode_utf8(s) {
			  return decodeURIComponent(escape(s));
			}
	</script>

</body>
</html>


