"use strict";
//Global variable to store product sub Category
var subCategorySearchID = "";
var searchOn = "All";
var searchStatus = 1;
$(document).ready(function () {
	$("#addCategoryNameError").text("");
	fetchProducts(showProducts);
    $("#logout").on("click", function (e) {
        logout();
    });
    $("#addCategorySubmit").on("click",function(e){
    	e.preventDefault();
		if($("#addCategoryName").val().length){
    	addCategory($("#addCategoryName").val(),function(){
        		$("#addCategoryName").val("");
        		$("#addCategorySucessMessage").css("display","block");
        		$("#addCategoryNameError").text("");
    		});
		}
		else{
			$("#addCategoryNameError").text("this field cannot be empty !!");
			$("#addCategorySucessMessage").css("display","none");
		}
    });
    $("#addSubCategorySubmit").on("click",function(e){
    	e.preventDefault();
		if($("#addSubCategoryName").val().length){
    	addSubCategory(function(){
	        		$("#addSubCategoryName").val("");
	        		$("#addSubCategorySucessMessage").css("display","block");
	        		$("#addSubCategoryNameError").text("");
	    		});
			}
			else{
				$("#addSubCategoryNameError").text("this field cannot be empty !!");
				$("#addSubCategorySucessMessage").css("display","none");
			}
    	});
	    $("#productName").on("blur", function (e) {
	        checkEmpty("#productName");
	    });
	    $("#productQuantity").on("blur", function (e) {
	        checkEmpty("#productQuantity");
	    });
	    $("#productPrice").on("blur", function (e) {
	        checkEmpty("#productPrice");
	    });
	    $("#addProductSubmit").on("click", function (e) {
	    	e.preventDefault();
	        validateAddProductForm();
	    });
	    $(".subCategoryList").on("click",function(e){
	    	subCategorySearchID = $(this).attr("data-subCategoryID");
	    	searchOn = $(this).html();
	    	fetchProducts(showProducts);
	    });
	    $("#showAll").on("click",function(e){
	    	subCategorySearchID = "";
	    	searchOn = "All";
	    	fetchProducts(showProducts);
	    });
	    $("#searchByNameSubmit").on("click",function(e){
	    	e.preventDefault();
	    	fetchProducts(showProducts);
	    	$("#searchByName").val("");
	    });
	    $(".filter").on("change",function(){
	    	fetchProducts(showProducts);
	    });
	    $("#statusSelect").on("change",function(){
	    	searchStatus = $("#statusSelect option:selected").val();
	    	fetchProducts(showProducts);
	    });
	    $(".productDetail").on("click","div.productEditPart",function(){
	    	$("#editProductSucessMessage").css("display","none");
	    	var productID = $(this).attr("data-productID");
	    	getProductDetails(productID,fillEditProductForm);
	    });
	    $("#editProductSubmit").on("click",function(e){
	    	e.preventDefault();
	    	validateEditProductForm();
	    });
	    $("#generatePdf").on("click",function(e){
	    	window.open('pdf.cfm','_blank');
	    
	    });
	});
//function to fetch product details
function getProductDetails(productID,callback){
	$.ajax({
		 url:"cfComponents/product.cfc",
		 data: {
			 method : "getProductDetails",
			 productID : productID
		},
		type:"GET",
		datatype:"json",
		success:callback ,
		error: function(){
			console.log("product detail Fetch ajax error");
		}
	});
}
//function to fill the edit product form
function fillEditProductForm(product){
	var productDetails = $.parseJSON(product);
	$("#editProductName").val(productDetails.NAME);
	$("#editSubCategoryList").val(productDetails.SUBCATEGORY);
	$("#editProductQuantity").val(productDetails.QUANTITY);
	$("#editProductPrice").val(productDetails.PRICE);
	$("#editDiscountDeduction").val(productDetails.DISCOUNT);
	$("#editProductColour").val(productDetails.COLOUR);
	$("#editProductWeight").val(productDetails.WEIGHT);
	$("#editProductSize").val(productDetails.SIZE);
	$("#editProductDescription").val(productDetails.DESCRIPTION);
	$("input[name=editStatus][value="+ productDetails.STATUS +"]").prop('checked', true);
	$("#editProductID").val(productDetails.ID);
}
//function to fetch products
function fetchProducts(callback){
	var subCategoryID = subCategorySearchID;
	var productName = $("#searchByName").val();
	var maxPrice = $("#maxPriceFilter option:selected").val();
	var minPrice = $("#minPriceFilter option:selected").val();
	var size = $("#sizeFilter").val().join();
	var colour = $("#colourFilter").val().join();
	var status = searchStatus;
	$.ajax({
		 url:"cfComponents/product.cfc",
		 data: {
			 method : "getProducts",
			 subCategoryID : subCategoryID,
			 productName : productName,
			 maxPrice : maxPrice,
			 minPrice : minPrice,
			 size : size,
			 colour : colour,
			 status : status,
		},
		type:"GET",
		datatype:"json",
		success:callback ,
		error: function(){
			console.log("product Fetch ajax error");
		}
	});
}
//function to show product
function showProducts(products){

	$("#searchOn").text(searchOn);
	var productDetails = $.parseJSON(products);
	var content = "";
	var attributes = "";
	var role = new RegExp("admin");	
	if(role.test(document.location.href)){
		 attributes = 'data-toggle="modal" data-target="#editProductFormModal"';
	}
	if(productDetails.length){
		$.each(productDetails, function( key, value ) {
			var divClass = "";
			var image = "";
			var quantity = "OUT OF STOCK";
			if(value.IMAGE.length){
				 image = "images/product images/"+value.IMAGE;
			}
			else{
				image = "https://placehold.it/150x80?text=IMAGE";
			}
			if(value.STATUS == "1"){
				 divClass = "panel panel-primary";
			}
			else{
				divClass = "panel panel-danger";
			}
			if(value.QUANTITY > 0){
				quantity = "AVAILABLE";
			}
			   content += '<div class="col-sm-3 productEditPart" '+attributes+' data-productID = "'+value.ID+'"   >\
							         <div class="'+divClass+'">\
								          <div class="panel-heading">' +value.NAME+ '</div>\
								          <div class="panel-body">\
							         		<img src="'+image+'" class="img-responsive" style="width:100%;height:25%;" alt="Image">\
			   							  </div>\
								          <div class="panel-footer">\
							         		'+quantity+'<br>\
									      	price : Rs.' +value.PRICE+ '<br>\
									      </div>\
								</div>\
							</div>'; 
			});
	}
	else{
		content = "<h3>No Products Found ...</h3>"
	}
	$("#productDisplay").html(content);
}
//function to validate add product form
function validateAddProductForm(){
	var condition = true;
	if(checkEmpty("#productName") == false){
		condition = false;
	};
	if(checkEmpty("#productQuantity") == false){
		condition = false;
	};
	if(checkEmpty("#productPrice") == false){
		condition = false;
	};

	if(condition){
			addProduct(function(){
				$("#addProductSucessMessage").css("display","block");
				$("#addProductForm").get(0).reset();
				fetchProducts(showProducts);
		});		
	}
	
}
//function to validate edit product form
function validateEditProductForm(){
	var condition = true;
	if(checkEmpty("#editProductName") == false){
		condition = false;
	};
	if(checkEmpty("#editProductQuantity") == false){
		condition = false;
	};
	if(checkEmpty("#editProductPrice") == false){
		condition = false;
	};

	if(condition){
		editProductDetails();		
	}
	
}
//function to check empty fields
function checkEmpty(field){
	
    if($(field).val().length > 0){
        $(field).css("border", "1px solid rgb(11, 243, 116)");
        $(field + "Error").text("").removeClass("errorMessage");
        return true;
    }
    else{       
        $(field).css("border", "1px solid #ff0000");
        $(field + "Error").text("This field cannot be empty !!").addClass("errorMessage");      
        return false;
    }
}
//function to call ajax to logout
function logout()
{
	$.ajax({
		 url:"cfComponents/authentication.cfc",
		 data: {
			 method : "logout",
		},
		type:"GET",
		datatype:"json",
		success: function(){
			window.open('index.cfm','_self');
		},
		error: function(){
			console.log("logout ajax error");
		}
	});
}
//function to call ajax for adding category
function addCategory(addCategoryName,callback)
{
	$.ajax({
		 url:"cfComponents/product.cfc",
		 data: {
			 method : "addCategory",
			 addCategoryName : addCategoryName,
		},
		type:"POST",
		datatype:"json",
		success: callback,
		error: function(){
			console.log("add Category ajax error");
		}
	});
}
//function to call ajax to add sub category
function addSubCategory(callback){
	var subCategoryName=$("#addSubCategoryName").val();
	var categoryId=$("#categoryList option:selected").val();
	
	$.ajax({
		 url:"cfComponents/product.cfc",
		 data: {
			 method : "addSubCategory",
			 subCategoryName : subCategoryName,
			 categoryId : categoryId,
		},
		type:"POST",
		datatype:"json",
		success: callback,
		error: function(){
			console.log("add Category ajax error");
		}
	});
}
//function to call ajax for adding products
function addProduct(callback)
{
	var formData = new FormData($("#addProductForm")[0]);
	$.ajax({
		 url:"cfComponents/product.cfc?method=addProduct",
	     data: formData,
	     enctype:"multipart/form-data",
	     processData:false,
	     contentType:false,
	     type:"POST",
	     datatype:"json",
	     success: callback,
	     error: function(){
			console.log("add product ajax error");
			return false;
		}
	});
}
//function to edit product details
function editProductDetails(){
	var formData = new FormData($("#editProductForm")[0]);
	$.ajax({
		 url:"cfComponents/product.cfc?method=editProductDetails",
		 data: formData,
	     enctype:"multipart/form-data",
	     processData:false,
	     contentType:false,
	     type:"POST",
	     datatype:"json",
	     success: function(){
			$("#editProductSucessMessage").css("display","block");
			fetchProducts(showProducts);
		} ,
		error: function(){
			$("#editProductSucessMessage").css("display","none");
			$("#editProductErrorMessage").css("display","block");
			console.log("product detail edit ajax error");
		}
	});
}