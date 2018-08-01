
<form name="registration" id="registrationForm" method="POST">
          <div class="form-group">
            <label for="fname">First Name</label><span  id="fnameError" value="errorMessage"></span>
            <input type="text" class="form-control" name="fname" id="fname" placeholder="Your first name..">
          </div>
          <div class="form-group">
            <label for="mname">Middle Name</label><span  id="mnameError" value="errorMessage"></span>
            <input type="text" class="form-control" name="mname" id="mname" placeholder="Your middle name..">
          </div>
          <div class="form-group">
            <label for="lname">Last Name</label><span  id="lnameError" value="errorMessage"></span>
            <input type="text" class="form-control" name="lname" id="lname" placeholder="Your last name..">
          </div>
          <div class="form-group">
            <label for="mail">Email</label><span  id="mailError" value="errorMessage"></span>
            <input type="email" class="form-control" name="mail" id="mail"  placeholder="xyz@abc.com">
          </div>
          <div class="form-group">
            <label for="phone">Phone No.</label><span  id="phoneError" value="errorMessage"></span>
            <input type="text" class="form-control" name="phone" id="phone" placeholder="12345.....">
          </div>
          <div class="form-group">
            <label for="password"><span class="glyphicon glyphicon-eye-open"></span>Password</label><span  id="passwordError" value="errorMessage"></span>
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="repassword"><span class="glyphicon glyphicon-eye-open"></span>Re-enter Password</label><span  id="repasswordError" value="errorMessage"></span>
            <input type="password" class="form-control" name="repassword" id="repassword" placeholder="re enter Password">
          </div>
          <div class="form-group">
            <label for="dob">Date of Birth</label><span  id="dobError" value="errorMessage"></span>
            <input type="date" class="form-control" name="dob" id="dob" >
          </div>
          <div class="form-group">
            <lable><b>Gender</b></lable><br>
            <label class="radio-inline"><input type="radio" name="gender"  value="male" checked>Male</label>
            <label class="radio-inline"><input type="radio" name="gender"  value="female">Female</label>
            <label class="radio-inline"><input type="radio" name="gender" value="others">Others</label>
          </div>
          <div class="form-group">
            <label><b>Address</b></label><span  id="addressError" value="errorMessage"></span>
            <input type="text" name="address" class="form-control" id="address" placeholder="address...">
            <span  id="cityError" value="errorMessage"></span>
            <input type="text" name="city" class="form-control" id="city" placeholder="city">
            <span  id="zipError" value="errorMessage"></span>
            <input type="text" name="zip" class="form-control" id="zip" placeholder="Zip-Code">
            <span  id="countrySelectError" value="errorMessage"></span>
            <select  name="country"  id="countrySelect" class="form-control" onchange="makeSubmenu(this)">
              <option value="" >country</option>
              <option value="USA" >USA</option>
              <option value="Singapore" >Singapore</option>
            </select>
            <select name="state" id="stateSelect" class="form-control">
              <option value="">state</option>
            </select>

          </div>
          <button type="button" class="btn btn-default btn-success btn-block" id="registerSubmit" >
            <span class="glyphicon glyphicon-user"></span>Sign up
          </button>
        </form>