<div class="col-md-2"></div>
<div class="col-md-8">
	<div class="main-login main-center">
		<h5>Add your story header below.</h5>
		<form class="" method="post" action="AddStoryHeaderServlet"
			enctype="multipart/form-data" accept-charset="UTF-8">

			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label"> Your
					Story header name</label>
				<div class="cols-sm-10">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-pencil"
							aria-hidden="true"></i></span> <input type="text" class="form-control"
							name="storyHeaderName" id="storyHeaderName" required="required"
							placeholder="Enter your story header name" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label"> Your
					Story header content</label>
				<div class="cols-sm-12">
					<textarea class="form-control" name="storyHeaderContent"
						id="storyHeaderContent" required="required"
						placeholder="Enter your story header content here."></textarea>
				</div>
			</div>


			<div class="form-group">
				<label for="name" class="cols-md-2 control-label"> Your
					Your price every chapter.</label>
				<div class="cols-md-12">
					<select class="selectpicker" id="storyChapterPrice" name="storyChapterPrice">
						<option>Free</option>
						<option>5.00</option>
						<option>10.00</option>
					</select>
					<label class="control-label">Baht</label>
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="cols-sm-2 control-label"> Your
					Story Picture</label>
				<div class="cols-sm-10">
					<input type="file" id="fileField" name="fileField" />
				</div>
			</div>


			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4 pull-right">
					<input type="submit" class="btn btn-success pull-right" value="Add" />
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