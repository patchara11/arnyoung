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
								<th>Member ID</th>
								<th>Header name</th>
								<th>Chapter name</th>
								<th>Price (Baht)</th>
								<th>Payment slip</th>
								<th>Truemoney</th>
								<th>Time stamp</th>
								<th class="thConfirmPayment"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${StoryChapterModel}" var="story_h"
								varStatus="count">
								<tr>
									<td class="text-center">${count.count}</td>
									<td class="">${story_h.member_id}</td>
									<td>${story_h.story_header_name}</td>
									<td>${story_h.story_detail_act}</td>
									<td>${story_h.story_header_price}</td>
									<td><a herf="#" onclick="ViewSlip('${story_h.slip}')">${story_h.slip}</a></td>
									<td>${story_h.truemoney}</td>
									<td>${story_h.timestamp}</td>
									<td class="tdConfirmPayment">
										<div class="btn-group">
											<button type="button" class="btn btn-success"
												style="width: 100px;"
												onclick="ConfirmPaySH(${story_h.payment_id})">Confirm</button>
											<button type="button" class="btn btn-danger"
												style="width: 100px;"
												onclick="ConfirmDelSH(${story_h.payment_id})">Cancel</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

	<!-- Modal Slip -->
	<div class="modal fade" id="slipModal" tabindex="-1" role="dialog"
		aria-labelledby="slipModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="slipModalLabel">Slip</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<img id="img" name="imgSH" src="#" atl="Mountain View"
								class="text-center" style="width: 100%; height: 100%;">
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

	<script type="text/javascript">
		$(document).ready(function(){
			//ViewSlip("qq");
		});
		var paymentId = 0;
		function ConfirmPaySH(payment_id){
			paymentId = payment_id;
			 $.ajax({
			      url:'confirmpayment',
			      type:'POST',
			      data:{paymentId: paymentId, type: "confirm"},
			      success : function(data){
			     //alert('Logout success');
			    /*       window.location.href="storyheader.jsp";  */
			    location.reload();
			      }
			    });
		}
		
		function ConfirmDelSH(payment_id) {		
			paymentId = payment_id;
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
				 $.ajax({
				      url:'confirmpayment',
				      type:'POST',
				      data:{paymentId: paymentId, type: "cancel"},
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
		
		function ViewSlip(slip){
			var img = "http://localhost:8080/arnyoung/images/"+slip;
			$("#img").attr('src', img);
			//alert(img);
			$("#slipModal").modal('show');
		}
	</script>
</body>
</html>


