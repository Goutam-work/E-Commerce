"use strict";
$(document).ready(function () {
    $("#logout").on("click", function (e) {
        logout();
    });
    $("#addCategorySubmit").on("click",function(){
		if($("#addCategoryName").val().length){
    	addCategory($("#addCategoryName").val(),function(){
        		$("#addCategoryName").val("");
        		$("#sucessMessage").css("display","block");
        		$("#addCategoryNameError").text("");
    		});
		}
		else{
			$("#addCategoryNameError").text("this field cannot be empty !!");
			$("#sucessMessage").css("display","none");
		}
    })
});
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