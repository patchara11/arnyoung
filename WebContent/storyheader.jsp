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
					<h2>Story of <span style="color: orange">${username}</span></h2>
					<p style="color: red;">${errorString}</p>
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th>Story name</th>
								<th class="btn-group pull-right">Edit & Delete</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${StoryHeaderModel}" var="story_h" varStatus="count">
							<tr>
								<td class="text-center">${count.count}</td>
								<td><a herf="#">${story_h.story_header_name}</a></td>
								<td><div class="btn-group pull-right">
										<button type="button" class="btn btn-info" style="width: 80px;">Edit</button>
										<button type="button" class="btn btn-danger" style="width: 80px;">Delete</button>
									</div></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-success pull-right" style="width: 80px;">Add</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


