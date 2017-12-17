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
						Story of <span style="color: orange">${storyname}</span>
					</h2>

					<div class="form-group text-center">
						<div class="cols-sm-12">
							<img id="imgSH" name="imgSH"
								src="http://localhost:8080/arnyoung/images/${storyimg}"
								atl="Mountain View" class="text-center"
								style="width: 200px; height: 200px;">
						</div>
						<br>
					</div>

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Story
							header content.</label>
						<div class="cols-sm-12">
							<label name="storyHeaderContent" id="storyHeaderContent"
								style="color: gray">${storycontent}</label>
						</div>
					</div>

					<p style="color: red;">${errorString}</p>
					<table class="table table-striped" id="tableStoryHeader"
						name="tableStoryHeader">
						<thead>
							<tr>
								<th class="text-center">Act</th>
								<th>Chapter name</th>
								<th>Price (Baht)</th>
								<th class="thBuy">Buy</th>
								<th class="btn-group pull-right thEditDelete">Edit & Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${StoryChapterModel}" var="story_h"
								varStatus="count">
								<tr>
									<td class="text-center">${count.count}</td>
									<td><a herf="#"
										onclick="LinkSCHAP(${story_h.story_detail_id})">${story_h.story_detail_act}</a></td>
									<td>${story_h.story_header_price}</td>
									<td class="tdBuy"><a id="buy_${story_h.story_detail_id}"
										class="btn btn-warning fa fa-btc" aria-hidden="true"
										onclick="Buy(${story_h.story_detail_id})"></a></td>
									<td class="tdEditDelete"><div class="btn-group pull-right">
											<button type="button" class="btn btn-info"
												style="width: 80px;"
												onclick="EditSH(${story_h.story_detail_id})">Edit</button>
											<button type="button" class="btn btn-danger"
												style="width: 80px;"
												onclick="ConfirmDelSH(${story_h.story_detail_id})">Delete</button>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<button id="addNew" type="button"
						class="btn btn-success pull-right" style="width: 80px;"
						onclick="Add()">Add</button>


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
			var member_id = '<%=session.getAttribute("member_id")%>';
			var linkMemberId = '<%=session.getAttribute("linkMemberId")%>';
			if(member_id != linkMemberId){
				document.getElementById('addNew').style.visibility = 'hidden';
				 $('th.thEditDelete').hide();
				 $('td.tdEditDelete').hide();
				 
				 CheckBuy();
			}else{
				$('th.thBuy').hide();
				$('td.tdBuy').hide();
			}

		}); 
	
		function CheckBuy() {				
			//alert("ok");
			<c:forEach var="item" items="${StoryChapterModel}" varStatus="status">
			    if('${item.payment}' != 0 || '${item.story_header_price}' == 0.0){
			    //	alert('${item.payment}');
			    	  $("#buy_${item.story_detail_id}").hide();
			    	 // alert("#buy_${item.story_detail_id}");
			    }
	         </c:forEach>
		}
		
		function Buy(story_detail_id){
			var storyHeaderId = "";
			
			<c:forEach var="item" items="${StoryChapterModel}" varStatus="status">
			    if('${item.story_detail_id}' == story_detail_id){
			     	storyHeaderId  = '${item.story_header_id}';
			    }
	         </c:forEach> 
	         //alert(storyHeaderId);
			var member_id = '<%=session.getAttribute("member_id")%>';
			if (member_id != "null") {
				 $.ajax({
				      url:'payment',
				      type:'POST',
				      data:{storyHeaderId: storyHeaderId, storyDetailId: story_detail_id},
				      success : function(data){
				        location.reload();
				      }
				    });
			} else {
				alert("Please login.");
			}
		}
		
	    var storyHeaderId = 0;
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
				      url:'DeleteStoryChapterServlet',
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
		
		function Add(){
			document.getElementById('btnAdd').style.visibility = 'visible';
			document.getElementById('btnEdit').style.visibility = 'hidden';
			
			 $("#storyActName").val("");
      	     CKEDITOR.instances['editor1'].setData("")
      	    $("#modalAddStoryHeader").modal('show');
		}
		
		function AddData(){
			//debugger;
			var txt = CKEDITOR.instances['editor1'].getData();
			$("#txt").val(txt);
			//alert($("#txt").val());
			
			 $.ajax({
			      url:'AddStoryChapterServlet',
			      contentType: "application/x-www-form-urlencoded;charset=utf-8",
			      type:'POST',
			      data:{storyActName: $("#storyActName").val(), editor1:  $("#txt").val(), storyDetailId: 0},
			      success : function(data){
			    location.reload();
			      }
			    }); 
		}
		
		function EditData(){
			//debugger;
			var txt = CKEDITOR.instances['editor1'].getData();
			$("#txt").val(txt);
			//alert($("#txt").val());
			
			 $.ajax({
			      url:'AddStoryChapterServlet',
			      contentType: "application/x-www-form-urlencoded;charset=utf-8",
			      type:'POST',
			      data:{storyActName: $("#storyActName").val(), editor1:  $("#txt").val(), storyDetailId: storyDetailId},
			      success : function(data){
			    location.reload();
			      }
			    }); 
		}
		
		function EditSH(story_detail_id) {		
			storyDetailId = story_detail_id;
			//alert(storyDetailId);
			// Get the size of an object
			/* var model = '${StoryHeaderModel}';
			var rows = document.getElementById("tableStoryHeader").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
			for (var int = 0; int < rows; int++) {
				
			} */
			
			document.getElementById('btnEdit').style.visibility = 'visible';
			document.getElementById('btnAdd').style.visibility = 'hidden';
			
			<c:forEach var="item" items="${StoryChapterModel}" varStatus="status">
                 //alert("${StoryChapterModel[0].story_header_name}");
                 if('${item.story_detail_id}' == storyDetailId){
                	   // alert("${item.story_detail_act}"); 
                	   
                	   $("#storyActName").val('${item.story_detail_act}');
                	   /* $("#editor1").val(''); */
                	   //CKEDITOR.instances['editor1'].setData("aaa");
                	   CKEDITOR.instances['editor1'].setData('${item.story_detail_content}')
                	   /* $("#editor1").html('${item.story_detail_content}'); */
                	   
                 }
             </c:forEach>
			$("#modalAddStoryHeader").modal('show');
		}
		
		function LinkSCHAP(story_detail_id) {		
			//storyHeaderId = story_header_id;
			var storyDetailId = story_detail_id;
			
			var storyHeaderName = "";
			var storyHeaderImg = "";
			var storyHeaderContent = "";
			var linkMemberId = "";
			
			var storyDetailName = "";
			var storyDetailContent = "";
			var paymentConfirm = 0;
			var payment = 0;
			var price = 0;
			 //storyDetailName = '${item.story_detail_name}';
         	  //storyDetailContent = '${item.story_detail_content}';
         	  
			<c:forEach var="item" items="${StoryChapterModel}" varStatus="status">
	            //alert("${item.story_header_name}");
	            if('${item.story_detail_id}' == storyDetailId){
	            	   storyDetailName = "${item.story_detail_act}"; 
	            	   storyDetailContent ="${item.story_detail_content}"; 
	           	   //alert(storyDetailName);
	           	   storyHeaderId = '${item.story_header_id}';
	           	   
	           	   storyHeaderName = '${item.story_header_name}';
	           	   storyHeaderContent = '${item.story_header_content}';
	           	   storyHeaderImg = '${item.story_header_img}';
	           	   linkMemberId =  '${item.member_id}';
	           	   
	           	   paymentConfirm =  '${item.payment_confirm}';
	           	   payment =  '${item.payment}';
	           	   price ='${item.story_header_price}';
	            }
            </c:forEach>
			//sessionStorage.setItem("storyHeaderId", storyHeaderId);
			
			//sessionStorage.story_header_id = storyHeaderId;
			//alert(sessionStorage.story_header_id);
            var member_id = '<%=session.getAttribute("member_id")%>';
           // alert(member_id +' '+linkMemberId);
           if(member_id != "null"){
   			if(linkMemberId == member_id){
				$.ajax({
				      url:'storyheaderid',
				      type:'POST',
				      data:{storyHeaderId: storyHeaderId, storyHeaderName: storyHeaderName, storyHeaderImg: storyHeaderImg, storyHeaderContent: storyHeaderContent, linkMemberId: linkMemberId, storyDetailName: storyDetailName, storyDetailContent: storyDetailContent},
				      success : function(data){
				    	  window.location.href="storycontent"; 
				     //alert('Logout success');
				     // window.location = data.url; 
				    //location.reload();
				      }
				    });  
			}else{
				if(paymentConfirm > 0 || price == 0){
					//alert(paymentConfirm);
					$.ajax({
					      url:'storyheaderid',
					      type:'POST',
					      data:{storyHeaderId: storyHeaderId, storyHeaderName: storyHeaderName, storyHeaderImg: storyHeaderImg, storyHeaderContent: storyHeaderContent, linkMemberId: linkMemberId, storyDetailName: storyDetailName, storyDetailContent: storyDetailContent},
					      success : function(data){
					    	  window.location.href="storycontent"; 
					     //alert('Logout success');
					     // window.location = data.url; 
					    //location.reload();
					      }
					    });  
				}else{
					if(payment > 0){
						alert("Plese wait for confirm by admin.");
					}else{
						alert("Plese buy this chapter.");	
					}
					
				}
			}
           }else{
        	  	 alert("Plese login.");
           }
			    
			 
			  //window.location = "storychapter.jsp?story_header_id="+storyHeaderId; */
		}
		
		/* function encode_utf8(s) {
			  return unescape(encodeURIComponent(s));
			}

			function decode_utf8(s) {
			  return decodeURIComponent(escape(s));
			} */
			
			
	</script>

</body>
</html>


