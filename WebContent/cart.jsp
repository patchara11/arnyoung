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
					<h2>Your Cart</h2>

					<p style="color: red;">${errorString}</p>
					<table class="table table-striped" id="tableStoryHeader"
						name="tableStoryHeader">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th>Chapter name</th>
								<th>Price</th>
								<th class="btn-group pull-right thEditDelete">Remove</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${StoryChapterModel}" var="story_h"
								varStatus="count">
								<tr>
									<td class="text-center">${count.count}</td>
									<td><a herf="#">${story_h.story_detail_act}</a></td>
									<td>${story_h.story_header_price}</td>
									<td class="tdEditDelete"><div class="btn-group pull-right">
											<button type="button" class="btn btn-danger"
												style="width: 100px;"
												onclick="ConfirmDelSH(${story_h.story_detail_id})">Remove</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
                     
                     <div class="row">
                        <div class="col-md-12 text-right pull-right">
                           <label>Total price </label><span style="color: orange">${totalPrice}</span><label> Baht</label>
                        </div>
                     </div>

				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalAddStoryHeader" tabindex="-1"
		role="dialog" aria-labelledby="modalAddStoryHeader">
		<div class="modal-dialog" role="document" style="width: 90%;">
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
							<%@ include file="addstorychapter.jsp"%>


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
		$(document).ready(function(){
			
		}); 
		
		function ConfirmDelSH(story_detail_id) {		
			storyDetailId = story_detail_id;
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
				      url:'deletecart',
				      type:'POST',
				      data:{storyDetailId: storyDetailId},
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
		
			
	</script>

</body>
</html>


