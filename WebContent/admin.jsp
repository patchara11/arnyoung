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
								<th class="btn-group text-center thConfirmPayment">Confirm</th>
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
									<td>${story_h.slip}</td>
									<td>${story_h.truemoney}</td>
									<td>${story_h.timestamp}</td>
									<td class="tdConfirmPayment"><div class="btn-group pull-right">
											<button type="button" class="btn btn-success"
												style="width: 100px;"
												onclick="ConfirmPaySH(${story_h.payment_id})">Confirm</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function(){
			
		});
		
		function ConfirmPaySH(payment_id){
			 $.ajax({
			      url:'confirmpayment',
			      type:'POST',
			      data:{paymentId: payment_id},
			      success : function(data){
			     //alert('Logout success');
			    /*       window.location.href="storyheader.jsp";  */
			    location.reload();
			      }
			    });
		}
	</script>
</body>
</html>


