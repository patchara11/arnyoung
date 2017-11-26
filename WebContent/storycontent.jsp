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
						<label for="name" class="cols-sm-2 control-label">Chapter name.</label>
						<div class="cols-sm-12">
							<label name="storyHeaderContent" id="storyHeaderContent"
								style="color: gray">${storydetailname}</label>
						</div>
					</div>

					<p style="color: red;">${errorString}</p>
					<div id="content" class="col-md-12">
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="alert" role="alert" id="result"></div>

	<script type="text/javascript">
		$(document).ready(function(){
			$('#content').html('${storydetailcontent}');
		}); 
	
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
		
		function LinkSCHAP(story_header_id) {		
			storyHeaderId = story_header_id;
			$.ajax({
			      url:'StoryChapterServlet',
			      type:'POST',
			      data:{storyHeaderId: storyHeaderId},
			      success : function(data){
			     //alert('Logout success');
			    /*       window.location.href="storyheader.jsp";  */
			    location.reload();
			      }
			    });
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


