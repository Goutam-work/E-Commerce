
<cfcomponent output = "false" >

	 <!--- function to add category --->
	<cffunction name = "addCategory" access = "remote" output = "false" >
		<cfargument name = "addCategoryName" required = "true" >
		<cfquery name = "addCategoryquery">
	    	INSERT INTO product.product_category VALUES(
	    	<cfqueryparam value = "#arguments.addCategoryName#" cfsqltype = "cf_sql_varchar" />
	    	);
		</cfquery>
	</cffunction>

	<!--- function to add sub category --->
	<cffunction name = "addSubCategory" access = "remote" output = "false" >
		<cfargument name = "subCategoryName" required = "true" >
		<cfargument name = "categoryId" required = "true" >
		<cfquery name = "addSubCategoryquery">
	    	INSERT INTO product.product_subCategory VALUES
	    	(
	    	<cfqueryparam value = "#arguments.subCategoryName#" cfsqltype = "cf_sql_varchar" />,
	    	<cfqueryparam value = "#arguments.categoryId#" cfsqltype = "cf_sql_integer" />
	    	);
		</cfquery>
	</cffunction>

	<!--- function to add Product --->
	<cffunction name = "addProduct" access = "remote" output = "false" >
		<cfargument name = "productName" required = "true" >
		<cfargument name = "productImage" required = "false" >
		<cfargument name = "subCategoryID" required = "true">
		<cfargument name = "productQuantity" required = "true" >
		<cfargument name = "productPrice" required = "true" >
		<cfargument name = "discountDeduction" required = "false" default = 0 >
		<cfargument name = "productColour" required = "false" >
		<cfargument name = "productWeight" required = "false" default = 0 >
		<cfargument name = "productSize" required = "false" >
		<cfargument name = "productDescription" required = "false" >
		<cfquery name="addProductquery">
	    	INSERT INTO product.product VALUES(
	    	<cfqueryparam value = "#arguments.productName#" cfsqltype = "cf_sql_varchar" />,
	    	<cfqueryparam value = "#arguments.productImage#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productImage)#" />,
	    	<cfqueryparam value = "#arguments.subCategoryID#" cfsqltype = "cf_sql_integer" />,
	    	<cfqueryparam value = "#arguments.productQuantity#" cfsqltype = "cf_sql_integer" />,
	    	<cfqueryparam value = "#arguments.productPrice#" cfsqltype = "cf_sql_float" />,
	    	<cfqueryparam value = "#arguments.discountDeduction#" cfsqltype = "cf_sql_float" null = "#not len(arguments.discountDeduction)#" />,
	    	<cfqueryparam value = "#arguments.productColour#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productColour)#" />,
	    	<cfqueryparam value = "#arguments.productWeight#" cfsqltype = "cf_sql_float" null = "#not len(arguments.productWeight)#" />,
	    	<cfqueryparam value = "#arguments.productSize#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productSize)#" />,
	    	<cfqueryparam value = "#arguments.productDescription#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productDescription)#" />,
	    	<cfqueryparam value = "1" cfsqltype = "cf_sql_bit"  />
	    	);
		</cfquery>
	</cffunction>

	<!--- function to get category --->
	<cffunction name = "getCategory" access = "public" output = "false" returntype = "query" >
		<cfset getCategoryQuery = "">
		<cfquery name = "getCategoryQuery">
	    	SELECT categoryID,categoryName FROM product.product_category;
		</cfquery>
		<cfreturn getCategoryQuery />
	</cffunction>

	<!--- function to get sub category --->
	<cffunction name = "getSubCategory" access = "public" output = "false" returntype = "query" >
		<cfset getSubCategoryQuery = "">
		<cfquery name = "getSubCategoryQuery">
	    	 SELECT S.subCategoryID,S.subCategoryName,C.categoryName,C.categoryID FROM product.product_subCategory AS S
  			INNER JOIN product.product_category AS C ON S.categoryID = C.categoryID
			ORDER BY C.categoryID;
		</cfquery>
		<cfreturn getSubCategoryQuery />
	</cffunction>

		<!--- function to get sub category of a perticular category --->
	<cffunction name = "getSubCategoryByCategory" access = "public" output = "false" returntype = "query" returnformat="json" >
		<cfargument name = "categoryID" required = "true" />
 		<cfset SubCategoryQuery = "">
		<cfquery name = "SubCategoryQuery">
	    	SELECT subCategoryName FROM product.product_subCategory
	    	WHERE categoryID = <cfqueryparam value = "#arguments.categoryID#" cfsqltype = "cf_sql_integer"  />;
		</cfquery>
		<cfreturn SubCategoryQuery />
	</cffunction>

	 <!--- function to return products --->
		<cffunction name = "getProducts" access = "remote" output = "false"  returnformat="json" >
		<cfargument name = "subCategoryID" required = "true">
		<cfargument name = "productName" required = "true">
 		<cfset getProductQuery = "">
		<cfquery name = "getProductQuery">
	    	SELECT productID,productName,actualPrice,status FROM product.product WHERE productID IS NOT NULL
	    	<cfif #len(arguments.subCategoryID)# >
				AND subCategoryID = <cfqueryparam value = "#arguments.subCategoryID#" cfsqltype = "cf_sql_integer" />
			</cfif>
			<cfif #len(arguments.productName)# >
				AND productName LIKE <cfqueryparam value = "%#arguments.productName#%" cfsqltype = "cf_sql_varchar" />
			</cfif>;
		</cfquery>

		<cfset response = [] />
	    <cfloop query="getProductQuery">
		    <cfset obj = structNew()>
	        <cfset obj.ID = getProductQuery.productID />
	        <cfset obj.NAME = getProductQuery.productName />
	        <cfset obj.PRICE = getProductQuery.actualPrice />
	        <cfset obj.STATUS = getProductQuery.status />
	        <cfset arrayAppend(response, obj) />
	    </cfloop>

		<cfreturn response />
	</cffunction>

</cfcomponent>