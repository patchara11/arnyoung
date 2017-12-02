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
						Categories <span style="color: orange">${categories}</span>
					</h2>
					<p style="color: red;">${errorString}</p>
					<table class="table table-striped" id="tableStoryHeader"
						name="tableStoryHeader">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th>Story name</th>
								<th>Pesudonym</th>
								<th class="text-center thLike">Like</th>
								<th class="text-center">Total Like</th>								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${StoryHeaderModel}" var="story_h"
								varStatus="count">
								<tr>
									<td class="text-center">${count.count}</td>
									<td><a herf="#" onclick="LinkSCHAP(${story_h.story_header_id})">${story_h.story_header_name}</a></td>
									<td>${story_h.pesudonym}</td>
									<td class="text-center tdLike"><a id="up_${story_h.story_header_id}" class="btn btn-warning fa fa-thumbs-up" aria-hidden="true" onclick="LikeThis(${story_h.story_header_id})"></a>
									<a id="down_${story_h.story_header_id}" class="btn btn-danger fa fa-thumbs-down" aria-hidden="true" onclick="UnLikeThis(${story_h.story_header_id})"></a></td>
									<td class="text-center">${story_h.total_like}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
	$(document).ready(function(){
		var member_id = '<%=session.getAttribute("member_id")%>';
		//alert(member_id);
		if(member_id == "null"){
			 $('th.thLike').hide();
			 $('td.tdLike').hide();
		}else{
			CheckLike();
		}

		
	}); 
	
	function CheckLike() {				
		<c:forEach var="item" items="${StoryHeaderModel}" varStatus="status">
		    if('${item.payment}' == 0 && '${item.story_header_price}' != 0.0){
		    	    //alert("#down_${item.story_header_id}");
		       	$("#down_${item.story_header_id}").hide();
		    	    $("#up_${item.story_header_id}").hide();
		    }else{
		    	  if('${item.m_like}' == 0){
		    		  $("#down_${item.story_header_id}").hide();
		    	  }else{
		    		  $("#up_${item.story_header_id}").hide();
		    	  }		    	
		    } 
         </c:forEach>
	}
	
	function LikeThis(story_header_id){
		 $.ajax({
		      url:'likethis',
		      type:'POST',
		      data:{story_header_id: story_header_id, type: "LIKE"},
		      success : function(data){
		    	  //window.location.href="storychapter"; 
		     //alert('Logout success');
		     // window.location = data.url; 
		        location.reload();
		      }
		    });  
	}
	function UnLikeThis(story_header_id){
		 $.ajax({
		      url:'likethis',
		      type:'POST',
		      data:{story_header_id: story_header_id, type: "UNLIKE"},
		      success : function(data){
		    	  //window.location.href="storychapter"; 
		     //alert('Logout success');
		     // window.location = data.url; 
		        location.reload();
		      }
		    });  
	}
	
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
                	   
                	   if('${item.story_header_price}' == 0.00){
                		   $("#editStoryChapterPrice").val("Free");
                	   }else{
                		   $("#editStoryChapterPrice").val(parseFloat('${item.story_header_price}').toFixed(2));
                		   //alert(strPrice);
                		  // alert('${item.story_header_price}');
                	   }
                	  
                	   
                	   
                	  
                 }
             </c:forEach>
			$("#modalEditStoryHeader").modal('show');
		}
		
		function LinkSCHAP(story_header_id) {		
			storyHeaderId = story_header_id;
			
			var storyHeaderName = "";
			var storyHeaderImg = "";
			var storyHeaderContent = "";
			var linkMemberId = "";
			
			<c:forEach var="item" items="${StoryHeaderModel}" varStatus="status">
            //alert("${item.story_header_name}");
            if('${item.story_header_id}' == storyHeaderId){
           	   /* alert("${item.story_header_name}"); */
           	   
           	   storyHeaderName = '${item.story_header_name}';
           	   storyHeaderContent = '${item.story_header_content}';
           	   storyHeaderImg = '${item.story_header_img}';
           	   linkMemberId =  '${item.member_id}';
           	   
            }
        </c:forEach>
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


