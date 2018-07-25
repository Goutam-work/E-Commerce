<!---
  --- product
  --- -------
  ---
  --- author: goutamg
  --- date:   7/25/18
  --->
<cfcomponent output="false" >
	<cffunction name="addCategory" access="remote" output="false" >
		<cfargument name="addCategoryName" required="true" >

		<cfquery name="addCategoryquery">
	    	INSERT INTO product.product_category VALUES(
	    	<cfqueryparam value="#arguments.addCategoryName#" cfsqltype="cf_sql_varchar" />
	    	);
		</cfquery>

	</cffunction>

	<cffunction name="addSubCategory" access="remote" output="false" >
		<cfargument name="mail" required="true" >

		<cfquery name="mailCheckQuery" result="countEmail">
	    	SELECT userID FROM users.user_details
	    	WHERE Email=<cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar" />;
		</cfquery>

	</cffunction>

	<cffunction name="getSubCategory" access="remote" output="false" returntupe="query" >
		<cfargument name="mail" required="true" >

		<cfquery name="mailCheckQuery" result="countEmail">
	    	SELECT userID FROM users.user_details
	    	WHERE Email=<cfqueryparam value="#arguments.mail#" cfsqltype="cf_sql_varchar" />;
		</cfquery>

	</cffunction>

</cfcomponent>