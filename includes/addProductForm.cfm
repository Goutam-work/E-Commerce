
<form name = "addProductForm" id = "addProductForm">
	<div class = "form-group">
           <label for ="productImage">Image</label>
			<span class ="errorMessage" id = "productImageError"></span>
           <input type = "file" class = "form-control" id = "productImage" name = "productImage" >
    </div>
	<div class = "form-group">
              <label for ="productName">Name</label>
				<span class = "errorMessage" id = "productNameError"></span>
              <input type = "text" class = "form-control" id = "productName" name = "productName" placeholder = "product name" required>
    </div>
    <div class = "form-group">
      <label for = "subCategoryList">Sub Category</label>
      <select class = "form-control" name="subCategory" id = "subCategoryList">

			<cfoutput query = "variables.getSubCategoryQuery">
				<option  value = "#subCategoryID#">#categoryName#-#subCategoryName#</option>
			</cfoutput>

      </select>
    </div>
	<div class = "form-group">
              <label for = "productQuantity">Quantity</label>
				<span class = "errorMessage" id = "productQuantityError"></span>
              <input type = "number" class = "form-control" id = "productQuantity" name = "productQuantity" required>
    </div>
	<div class = "form-group">
              <label for = "productPrice">Price</label>
				<span class = "errorMessage" id="productPriceError"></span>
              <input type = "number" class = "form-control" id = "productPrice" name = "productPrice" required>
    </div>
	<div class = "form-group">
              <label for = "discountDeduction">Discount Deduction</label>
				<span class = "errorMessage" id = "discountDeductionError"></span>
              <input type = "number" class = "form-control" id = "discountDeduction" name = "discountDeduction">
    </div>
	<div class = "form-group">
              <label for = "productColour">Colour</label>
				<span class = "errorMessage" id = "productColourError"></span>
              <input type = "text" class = "form-control" id = "productColour" name = "productColour" >
    </div>
	<div class = "form-group">
              <label for = "productWeight">Weight</label>
				<span class = "errorMessage" id = "productWeightError"></span>
              <input type = "number" class = "form-control" id = "productWeight" name = "productWeight" >
    </div>
	<div class = "form-group">
              <label for = "productSize">size</label>
				<span class = "errorMessage" id = "productSizeError"></span>
              <input type = "number" class = "form-control" id = "productSize" name = "productSize" >
    </div>
	<div class = "form-group">
              <label for = "productDescription">Description</label>
				<span class = "errorMessage" id = "productSizeError"></span>
              <input type = "text" class = "form-control" id = "productDescription" name = "productDescription" >
    </div>
	<button type = "button" class = "btn btn-default btn-success btn-block" id = "addProductSubmit">Add</button>
</form>