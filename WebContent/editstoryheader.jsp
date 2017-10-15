<div class="col-md-2"></div>
<div class="col-md-8">
	<div class="main-login main-center">
		<h4 class="text-center">Edit your story header below.</h4>
		<form class="" method="post" action="EditStoryHeaderServlet"
			enctype="multipart/form-data" accept-charset="UTF-8">

			<div class="form-group text-center">
				<div class="cols-sm-12">
					<img id="imgSH" name="imgSH" src="" atl="Mountain View"
						class="text-center" style="width: 200px; height: 200px;">
				</div>
				<br>
			</div>

			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label"> Your
					Story header name</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-pencil"
							aria-hidden="true"></i></span> <input type="text" class="form-control"
							name="editStoryHeaderName" id="editStoryHeaderName"
							required="required" placeholder="Enter your story header name" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label"> Edit your
					Story header content.</label>
				<div class="cols-sm-12">
					<textarea class="form-control" name="editStoryHeaderContent"
						id="editStoryHeaderContent" required="required"
						placeholder="Enter your story header content here."></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="cols-sm-12">
					<input type="hidden" class="form-control" name="editStoryHeaderId"
						id="editStoryHeaderId" required="required" />
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label"> Edit your
					Story Picture.</label>
				<div class="cols-sm-10">
					<input type="file" id="editFileField" name="editFileField" />
				</div>
			</div>

			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4 pull-right">
					<input type="submit" class="btn btn-info pull-right" value="Edit" />
				</div>
			</div>


		</form>
	</div>
</div>
<div class="col-md-2"></div>


<!-- <form action = "AddStoryHeaderServlet" method = "post" enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" />
         <br />
         <input type = "submit" value = "Upload File" />
      </form> -->