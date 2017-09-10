

<!-- <form action="LoginServlet" method="post">
		<fieldset style="width: 300px">
			<legend> Login to App </legend>
			<table>
				<tr>
					<td>User ID</td>
					<td><input type="text" name="username" required="required" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="userpass" required="required" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</fieldset>
	</form> -->

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="account-wall">
			<div id="my-tab-content" class="tab-content">
				<br>
				<div class="tab-pane active" id="login">
					<form action="LoginServlet" method="post">
						<input type="text" class="form-control" name="username"
							placeholder="Username" required="required" autofocus> <input
							type="password" class="form-control" name="userpass"
							placeholder="Password" required="required"> <br> <input
							type="submit" class="btn btn-lg btn-success btn-block"
							value="Login" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>


