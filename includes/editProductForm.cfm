<span id = "editProductSucessMessage" class = "sucessMessage">product edited sucessfully !!</span><hr>
<form name = "editProductForm" id = "editProductForm">
  <div class="form-group">
    <label for="editProductName">Product Name:</label>
    <input type="text" class="form-control" name="editProductName" id="editProductName">
  </div>
  <div class = "form-group">
      <label for ="editProductImage">Image</label>
	 <span class ="errorMessage" id = "editProductImageError"></span>
      <input type = "text" class = "form-control" id = "editProductImage" name = "editProductImage" placeholder = "product Image" >
    </div>
    <div class = "form-group">
      <label for = "editSubCategoryList">Sub Category</label>
      <select class = "form-control" id = "editSubCategoryList" name="editSubCategoryList">
			<cfoutput query = "variables.getSubCategoryQuery">
				<option  value = "#subCategoryID#">#categoryName#-#subCategoryName#</option>
			</cfoutput>
      </select>
    </div>
	<div class = "form-group">
              <label for = "editProductQuantity">Quantity</label>
              <input type = "number" class = "form-control" id = "editProductQuantity" name = "editProductQuantity" >
    </div>
	<div class = "form-group">
              <label for = "editProductPrice">Price</label>
              <input type = "number" class = "form-control" id = "editProductPrice" name = "editProductPrice" >
    </div>
	<div class = "form-group">
              <label for = "editDiscountDeduction">Discount Deduction</label>
              <input type = "number" class = "form-control" id = "editDiscountDeduction" name = "editDiscountDeduction">
    </div>
	<div class = "form-group">
              <label for = "editProductColour">Colour</label>
              <input type = "text" class = "form-control" id = "editProductColour" name = "editProductColour" >
    </div>
	<div class = "form-group">
              <label for = "editProductWeight">Weight</label>
              <input type = "number" class = "form-control" id = "editProductWeight" name = "editProductWeight" >
    </div>
	<div class = "form-group">
              <label for = "editProductSize">size</label>
              <input type = "number" class = "form-control" id = "editProductSize" name = "editProductSize" >
    </div>
	<div class = "form-group">
              <label for = "editProductDescription">Description</label>
              <input type = "text" class = "form-control" id = "editProductDescription" name = "editProductDescription" >
    </div>
	  <div class="form-group">
            <lable><b>Status</b></lable><br>
            <label class="radio-inline"><input type="radio" name="editStatus"  value="1" checked>Active</label>
            <label class="radio-inline"><input type="radio" name="editStatus"  value="0">Inactive</label>
       </div>
	<input type="hidden" id="editProductID" name="editProductID">
	<button type = "submit" class = "btn btn-default btn-success btn-block" id = "editProductSubmit">Edit</button>
</form>

