<cfset  variables.getCategoryQuery = application.products.getCategory() />
<span id = "addSubCategorySucessMessage" class = "sucessMessage">sub category added sucessfully !!</span><hr>
<form name = "addSubCategoryForm" id = "addSubCategoryForm">
	<div class = "form-group">
              <label for = "addSubCategoryName">Sub Category</label>
				<span class = "errorMessage" id = "addSubCategoryNameError"></span>
              <input type="text" class="form-control" id = "addSubCategoryName" name = "addSubCategoryName"
				placeholder = "sub-category name" required>
    </div>
    <div class = "form-group">
      <label for = "categoryList">Category</label>
      <select class = "form-control" id = "categoryList">
			<cfoutput query = "variables.getCategoryQuery">
				<option  value = "#categoryID#">#categoryName#</option>
			</cfoutput>
      </select>
    </div>
	<button type = "button" class = "btn btn-default btn-success btn-block" id = "addSubCategorySubmit"> Add</button>
</form>