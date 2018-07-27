"use strict";
//Global variable to store product sub Category
var subCategorySearchID = "";
$(document).ready(function () {
	$("#addCategoryNameError").text("");
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
	    	console.log(subCategorySearchID);
	    	fetchProducts(showProducts);
	    });
	    $("#showAll").on("click",function(e){
	    	subCategorySearchID = "";
	    	console.log(subCategorySearchID);
	    	fetchProducts(showProducts);
	    });
	    $("#searchByNameSubmit").on("click",function(e){
	    	e.preventDefault();
	    	fetchProducts(showProducts);
	    	$("#searchByName").val("");
	    });
	});
//function to fetch products
function fetchProducts(callback){
	var subCategoryID = subCategorySearchID;
	var productName = $("#searchByName").val();
	$.ajax({
		 url:"cfComponents/product.cfc",
		 data: {
			 method : "getProducts",
			 subCategoryID : subCategoryID,
			 productName : productName
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
	var productDetails = $.parseJSON(products);
	var content = "";
	$.each(productDetails, function( key, value ) {
		
		var divClass = "";
		if(value.STATUS == "1"){
			 divClass = "panel panel-primary";
		}
		else{
			divClass = "panel panel-danger";
		}
		   content += 
			"<div class='col-sm-3'>\
		         <div class='"+divClass+"'>\
			          <div class='panel-heading'>BLACK FRIDAY DEAL</div>\
			          <div class='panel-body'><img src='https://placehold.it/150x80?text=IMAGE' class='img-responsive' style='width:100%' alt='Image'></div>\
			          <div class='panel-footer'>\
				      	Name:" +value.NAME+ "<br>\
				      	price:Rs. " +value.PRICE+ "\
					  </div>\
			      </div>\
		      </div>";
		    
		});
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
			$("#addProductForm").get(0).reset();
    		$("#addProductSucessMessage").css("display","block");
		});
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
	var productName= $("#productName").val();
	var productImage=$("#productImage").val();
	var subCategory=$("#subCategoryList option:selected").val();
	var productQuantity=$("#productQuantity").val();
	var productPrice= $("#productPrice").val();
	var discountDeduction= $("#discountDeduction").val();
	var productColour=$("#productColour").val();
	var productWeight= $("#productWeight").val();
	var productSize=$("#productSize").val();
	var productDescription= $("#productDescription").val();
	

	$.ajax({
		 url:"cfComponents/product.cfc",
		 data: {
			 method : "addProduct",
			 productName : productName,
			 productImage :productImage ,
			 subCategoryID : subCategory,
			 productQuantity : productQuantity,
			 productPrice : productPrice,
			 discountDeduction : discountDeduction,
			 productColour : productColour,
			 productWeight : productWeight,
			 productSize : productSize,
			 productDescription : productDescription,
		},
		type:"POST",
		datatype:"json",
		success: callback,
		error: function(){
			console.log("add product ajax error");
			return false;
		}
	});
}