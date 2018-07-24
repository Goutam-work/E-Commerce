 <form name="loginform" id="loginform">
            <div class="form-group">
              <label for="loginEmail"><span class="glyphicon glyphicon-user"></span>Email</label>
				<span class="errorMessage" id="loginEmailError"></span>
              <input type="text" class="form-control" id="loginEmail" name="loginEmail" placeholder="Enter email" required>
            </div>
            <div class="form-group">
              <label for="loginPassword"><span class="glyphicon glyphicon-eye-open">
				</span> Password</label><span class="errorMessage" id="loginPasswordError"></span>
              <input type="text" class="form-control" id="loginPassword" name="loginPassword" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
 </form>