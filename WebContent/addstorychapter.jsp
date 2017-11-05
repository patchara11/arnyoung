<div class="col-md-2"></div>
<div class="col-md-8">
	<div class="main-login main-center">
		<h5>Add your story chapter below.</h5>
		<!-- 		<form class="" method="post" action="AddStoryChapterServlet"
			accept-charset="UTF-8"> -->

		<div class="form-group">
			<label for="name" class="cols-sm-2 control-label"> Your story
				chapter name</label>
			<div class="cols-sm-10">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-pencil"
						aria-hidden="true"></i></span> <input type="text" class="form-control"
						name="storyActName" id="storyActName" required="required"
						placeholder="Enter your story header name" />
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="name" class="cols-sm-2 control-label"> Your story
				content</label>
			<div class="cols-md-12">
				<!--  <textarea class="form-control" name="storyDetailContent"
						id="storyDetailContent" required="required"
						placeholder="Enter your story header content here."></textarea> -->
				<textarea name="editor1" id="editor1" rows="10" cols="80"
					style="height: 1500px;">
               
                    </textarea>
				<script>
					// Replace the <textarea id="editor1"> with a CKEditor
					// instance, using default configuration.
					CKEDITOR.replace('editor1');
				</script>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8"></div>
			<div class="col-md-4 pull-right">
				<a type="button" class="btn btn-success pull-right"
					onclick="AddData()">Add</a>
			</div>
		</div>

		<input type="hidden" class="form-control" name="txt"
			id="txt" required="required"/>
		<!-- </form> -->
	</div>
</div>
<div class="col-md-2"></div>



<!-- <form action = "AddStoryHeaderServlet" method = "post" enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" />
         <br />
         <input type = "submit" value = "Upload File" />
      </form> -->