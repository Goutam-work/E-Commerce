//"use strict";
var stateByCountry = {
    USA: ["NY", "NJ"],
    Singapore: ["taas", "naas"]
}
$(document).ready(function () {
    resetSelection();
    $("#fname").on("blur", function (e) {
        if(checkEmpty("#fname")){
        validText("#fname");
        }
    });
    $("#mname").on("blur", function (e) {
        if($("#mname").val().length != 0){
            validText("#mname");
        }
        else{
            $("#mname").css("border","none");
            $("#mnameError").text("").removeClass("errorMessage");
        }
    });

    $("#lname").on("blur", function (e) {
        if(checkEmpty("#lname")){
        validText("#lname");
        }
    });
    $("#mail").on("blur", function (e) {
        if(checkEmpty("#mail")){
            validMail("#mail");
            }        
    });
    $("#phone").on("blur", function (e) {
        if(checkEmpty("#phone")){
            validPhNo("#phone");
            }  
    });
    $("#password").on("blur", function (e) {
        if(checkEmpty("#password")){
            validPassword("#password");
        }
    });
    $("#repassword").on("blur", function (e) {
        if(checkEmpty("#repassword") && validPassword("#repassword")){
            matchPassword(("#password"),("#repassword"));
        }
    });
    $("#dob").on("blur", function (e) {
        if(checkEmpty("#dob")){
            validDate("#dob");
        }
    });
    $("#address").on("blur", function (e) {
        if(checkEmpty("#address")){
            validAddress("#address");
        }
    });
    $("#city").on("blur", function (e) {
        if(checkEmpty("#city")){
        validText("#city");
        }
    });
    $("#zip").on("blur", function (e) {
        if(checkEmpty("#zip")){
        validZip("#zip");
        }
    });
    $("#countrySelect").on("blur", function (e) {
        checkEmpty("#countrySelect");
    });
});
function validateForm(){
    if(checkEmpty("#fname")){
        validText("#fname");
    }
    if($("#mname").val().length){
        validText("#mname");
    }
    else{
        $("#mname").css("border","1px solid #ccc");
        $("#mnameError").text("").removeClass("errorMessage");
    }
    if(checkEmpty("#lname")){
        validText("#lname");
    }
    if(checkEmpty("#mail")){
        validMail("#mail");
    } 
    if(checkEmpty("#phone")){
        validPhNo("#phone");
    }
    if(checkEmpty("#password")){
        validPassword("#password");
    }
    if(checkEmpty("#repassword") && validPassword("#repassword")){
        matchPassword(("#password"),("#repassword"));
    }
    if(checkEmpty("#dob")){
        validDate("#dob");
    }
    if(checkEmpty("#address")){
        validAddress("#address");
    }
    if(checkEmpty("#city")){
        validText("#city");
    }
    if(checkEmpty("#zip")){
        validZip("#zip");
    }
    
    checkEmpty("#countrySelect");
    if($("#registrationForm").find(".errorMessage").length){
        return false;
    }
    else{
    	 senddata();
    }
   
}
function senddata()
{
	var fname= $("#fname").val();
	var mname=$("#mname").val();
	var lname= $("#lname").val();
	var mail=$("#mail").val();
	var phone= $("#phone").val();
	var password=$("#password").val();
	var dob= $("#dob").val();
	var gender=$('input[name=gender]:checked').val();
	var address= $("#address").val();
	var city=$("#city").val();
	var zip= $("#zip").val();
	var country=$("#countrySelect option:selected").val();
	var state= $("#stateSelect option:selected").val();

	$.ajax({
		 url:"cfComponents/register.cfc",
		 data: {
			 method : "registration",
			 fname : fname,
			 mname :mname ,
			 lname : lname,
			 mail : mail,
			 phone : phone,
			 password : password,
			 dob : dob,
			 gender : gender,
			 address : address,
			 city : city,
			 zip : zip,
			 country :country,
			 state : state
		},
		type:"POST",
		datatype:"json",
		success: function(){
			return true;
		},
		error: function(){
			console.log("ajax error");
			return false;
		}
	});
}
function makeSubmenu(obj) {
    var value = obj.value;
    if (value.length == 0) {
        $("#stateSelect").html("<option>state</option>");
    }
    else {
        var statesOptions = "";
        for (var stateId in stateByCountry[value]) {
            statesOptions += "<option>" + stateByCountry[value][stateId] + "</option>";
        }
        $("#stateSelect").html(statesOptions);
    }
}
function resetSelection() {
    $("#countrySelect").selectedIndex = 0;
    $("#stateSelect").selectedIndex = 0;
}
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
function validText(text) {
    var fieldName = $(text).attr('name');
    var patt = /^[a-zA-Z][a-zA-Z\s]+$/;
    if ($(text).val().match(patt)) {
            $(text).css("border", "1px solid rgb(11, 243, 116)");
            $(text + "Error").text("").removeClass("errorMessage");
    }
    else {
            $(text).css("border", "1px solid #ff0000");
            if (fieldName === "city") {
                $(text + "Error").text("City name shouldn't contain numbers or symbols !!").addClass("errorMessage");
            }
            else {
                $(text + "Error").text("Name shouldn't contain numbers or symbols !!").addClass("errorMessage");
            }
    }
    
}
function validMail(mail) {
        var patt = /^(\w[\w_.]+)@(\S)+\.([a-zA-Z]+)$/;
        if ($(mail).val().match(patt)) {
        	checkMailExists($(mail).val(),function(data){
        		if(data){
                	$(mail).css("border", "1px solid #ff0000");
                    $("#mailError").text("Email ID already exists !!").addClass("errorMessage");
                }
            	else{
    	            $(mail).css("border", "1px solid rgb(11, 243, 116)");
    	            $("#mailError").text("").removeClass("errorMessage");
            	}
        	});
        	
        }        
        else {
            $(mail).css("border", "1px solid #ff0000");
            $("#mailError").text("Enter a valid email !!").addClass("errorMessage");
        }
    }
function checkMailExists(mail,callback)
{
	$.ajax({
		 url:"cfComponents/checkEmail.cfc",
		 data: {
			 method : "checkEmail",
			 mail : mail,
		},
		type:"GET",
		datatype:"json",
		success: callback,
		error: function(){
			console.log("mail ajax error");
		}
	});
}
function validPhNo(number) {
    var length = $(number).val().length;
        var numbers = /^[0-9]+$/;
        if ($(number).val().match(numbers) && length === 10) {
            $(number).css("border", "1px solid rgb(11, 243, 116)");
            $("#phoneError").text("").removeClass("errorMessage");
        }
        else {
            $("#phoneError").text("phone no. should be 10 digits").addClass("errorMessage");
        }
    
}
function validPassword(password) {
    var length = $(password).val().length;
        var pattern = /^\S+$/;
        if ($(password).val().match(pattern) && length >= 8) {
            $(password).css("border", "1px solid rgb(11, 243, 116)");
            $(password + "Error").text("").removeClass("errorMessage");
            return true;
        }
        else {
            $(password).css("border", "1px solid #ff0000");
            $(password + "Error").text("password should be minimum 8 non-space charecters").addClass("errorMessage");
            return false;            
        }
}
function matchPassword(password,repassword){
    if($(password).val() != $(repassword).val()){
        $(password).css("border","1px solid #ff0000");
        $("#passwordError").text("passwords do not match !!").addClass("errorMessage");
        $(repassword).css("border","1px solid #ff0000");
        $("#repasswordError").text("passwords do not match !!").addClass("errorMessage");
    }
    else{
        $(password).css("border","1px solid rgb(11, 243, 116)");
        $(repassword).css("border","1px solid rgb(11, 243, 116)");
        $("#passwordError").text("").removeClass("errorMessage");
        $("#repasswordError").text("").removeClass("errorMessage");
    }
}
function validDate(date){
        var today = new Date();
        var day = today.getDate();
        var mon = today.getMonth()+1;
        var year = today.getFullYear();
        if(day<10){
                day="0"+day;
            } 
            if(mon<10){
                mon="0"+mon;
            }        
        today = year+"-"+mon+"-"+day;
        if( $(date).val() > today){
            $(date).css("border","1px solid #ff0000");
            $("#dobError").text("can't be future date!!").addClass("errorMessage");
        } 
        else{
            $(date).css("border","1px solid rgb(11, 243, 116)");
            $("#dobError").text("").removeClass("errorMessage");
        }
       
}
function validAddress(address){
    var pattern = /^\w[\w\.\/\,\s\(\):-]+$/;
    if($(address).val().match(pattern))
    {
    $(address).css("border","1px solid rgb(11, 243, 116)");
    $("#addressError").text("").removeClass("errorMessage");
    }
    else
    {
    $(address).css("border","1px solid #ff0000");
    $("#addressError").text("Address should contain only letters,numbers or (: / . () - ,)").addClass("errorMessage");
    }
}
function validZip(number) {
    var length = $(number).val().length;
    var numbers = /^[0-9]+$/;
    var zero=/0{6}/;
    if($(number).val().match(numbers) && !(zero.test($(number).val())) && length===6) {
            $(number).css("border", "1px solid rgb(11, 243, 116)");
            $("#zipError").text("").removeClass("errorMessage");
        }
        else {
            $(number).css("border", "1px solid #ff0000");
            $("#zipError").text("zip code should be 6 digits and not 6 0's").addClass("errorMessage");
        }
    
}