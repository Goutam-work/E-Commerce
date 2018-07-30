
<cfcomponent output = "false" >

	 <!--- function to add category --->
	<cffunction name = "addCategory" access = "remote" output = "false" >
		<cfargument name = "addCategoryName" required = "true" >
		<cftry>
		<cfquery name = "addCategoryquery">
	    	INSERT INTO product.product_category VALUES(
	    	<cfqueryparam value = "#arguments.addCategoryName#" cfsqltype = "cf_sql_varchar" />
	    	);
		</cfquery>
		<cfcatch type = "any">
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- function to add sub category --->
	<cffunction name = "addSubCategory" access = "remote" output = "false" >
		<cfargument name = "subCategoryName" required = "true" >
		<cfargument name = "categoryId" required = "true" >
		 <cftry>
		<cfquery name = "addSubCategoryquery">
	    	INSERT INTO product.product_subCategory VALUES
	    	(
	    	<cfqueryparam value = "#arguments.subCategoryName#" cfsqltype = "cf_sql_varchar" />,
	    	<cfqueryparam value = "#arguments.categoryId#" cfsqltype = "cf_sql_integer" />
	    	);
		</cfquery>
		 <cfcatch type = "any">
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		 </cfcatch>
		 </cftry>
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
		<cftry>
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
		<cfcatch type="any">
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		</cfcatch>
		</cftry>
	</cffunction>

	<!--- function to get category --->
	<cffunction name = "getCategory" access = "public" output = "false" returntype = "query" >
		<cfset getCategoryQuery = "">
		<cftry>
		<cfquery name = "getCategoryQuery">
	    	SELECT categoryID,categoryName FROM product.product_category;
		</cfquery>
		<cfcatch type = "any">
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		</cfcatch>
		</cftry>
		<cfreturn getCategoryQuery />
	</cffunction>

	<!--- function to get sub category --->
	<cffunction name = "getSubCategory" access = "public" output = "false" returntype = "query" >
		<cfset getSubCategoryQuery = "">
		<cftry>
		<cfquery name = "getSubCategoryQuery">
	    	 SELECT S.subCategoryID,S.subCategoryName,C.categoryName,C.categoryID FROM product.product_subCategory AS S
  			INNER JOIN product.product_category AS C ON S.categoryID = C.categoryID
			ORDER BY C.categoryID;
		</cfquery>
		<cfcatch type = "any">
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		</cfcatch>
		</cftry>
		<cfreturn getSubCategoryQuery />
	</cffunction>

	<!--- function to get sub category of a perticular category --->
	<cffunction name = "getSubCategoryByCategory" access = "public" output = "false" returntype = "query" returnformat="json" >
		<cfargument name = "categoryID" required = "true" />
 		<cfset SubCategoryQuery = "">
		<cftry>
		<cfquery name = "SubCategoryQuery">
	    	SELECT subCategoryName FROM product.product_subCategory
	    	WHERE categoryID = <cfqueryparam value = "#arguments.categoryID#" cfsqltype = "cf_sql_integer"  />;
		</cfquery>
		<cfcatch>
			<cfdump var = "get sub category by category error" />
		</cfcatch>
		</cftry>
		<cfreturn SubCategoryQuery />
	</cffunction>

	 <!--- function to return products --->
		<cffunction name = "getProducts" access = "remote" output = "false"  returnformat="json" >
		<cfargument name = "subCategoryID" required = "true">
		<cfargument name = "productName" required = "true">
		<cfargument name = "maxPrice" required = "true">
		<cfargument name = "minPrice" required = "true">
		<cfargument name = "size" required = "false">
		<cfargument name = "colour" required = "false">
		<cfargument name = "status" required = "true">
		<cfset response = [] />
		<cfset getProductQuery = "">
		<cftry>
		<cfquery name = "getProductQuery">
	    	SELECT productID,productName,productImage,actualPrice,color,status FROM product.product
	    	WHERE actualPrice BETWEEN
									<cfqueryparam value = "#arguments.minPrice#" cfsqltype = "cf_sql_integer" />
									AND
									<cfqueryparam value = "#arguments.maxPrice#" cfsqltype = "cf_sql_integer" />
	    	<cfif #len(arguments.subCategoryID)# >
				AND subCategoryID = <cfqueryparam value = "#arguments.subCategoryID#" cfsqltype = "cf_sql_integer" />
			</cfif>
			<cfif #len(arguments.productName)# >
				AND productName LIKE <cfqueryparam value = "%#arguments.productName#%" cfsqltype = "cf_sql_varchar" />
			</cfif>
			<cfif #len(arguments.size)# >
				AND size IN (<cfqueryparam value = "#arguments.size#" cfsqltype = "cf_sql_varchar" list="yes" />)
			</cfif>
			<cfif #len(arguments.colour)# >
				AND color IN (<cfqueryparam value = "#arguments.colour#" cfsqltype = "cf_sql_varchar" list="yes" />)
			</cfif>
			<cfif #len(arguments.status)# >
				AND status = <cfqueryparam value = "#arguments.status#" cfsqltype = "cf_sql_bit" />
			</cfif>
			ORDER BY productID DESC;
		</cfquery>
	    <cfloop query="getProductQuery">
		    <cfset obj = structNew()>
	        <cfset obj.ID = getProductQuery.productID />
	        <cfset obj.NAME = getProductQuery.productName />
	        <cfset obj.PRICE = getProductQuery.actualPrice />
	        <cfset obj.STATUS = getProductQuery.status />
	        <cfset obj.IMAGE = getProductQuery.productImage />
	        <cfset obj.COLOUR = getProductQuery.color />
	        <cfset arrayAppend(response, obj) />
	    </cfloop>
	    <cfcatch type = "any">
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		</cfcatch>
		</cftry>
		<cfreturn response />
	</cffunction>

	<!--- function to return product details --->
		<cffunction name = "getProductDetails" access = "remote" output = "false"  returnformat="json" >
			<cfargument name = "productID" required = "true">
	 		<cfset getProductDetailsQuery = "">
	 		<cfset obj = structNew()>
	 		<cftry>
				<cfquery name = "getProductDetailsQuery">
			    	SELECT productID,productName,productImage,subCategoryID,
			    	quantity,actualPrice,discountDeduction,color,weight,size,description,status FROM product.product
			    	WHERE productID = <cfqueryparam value = "#arguments.productID#" cfsqltype = "cf_sql_integer" />;
				</cfquery>
			    <cfset obj.ID = getProductDetailsQuery.productID />
			    <cfset obj.NAME = getProductDetailsQuery.productName />
			    <cfset obj.IMAGE = getProductDetailsQuery.productImage />
			    <cfset obj.SUBCATEGORY = getProductDetailsQuery.subCategoryID />
			    <cfset obj.QUANTITY = getProductDetailsQuery.quantity />
			    <cfset obj.PRICE = getProductDetailsQuery.actualPrice />
			    <cfset obj.DISCOUNT = getProductDetailsQuery.discountDeduction />
			    <cfset obj.COLOUR = getProductDetailsQuery.color />
			    <cfset obj.WEIGHT = getProductDetailsQuery.weight />
			    <cfset obj.SIZE = getProductDetailsQuery.size />
			    <cfset obj.DESCRIPTION = getProductDetailsQuery.description />
			    <cfset obj.STATUS = getProductDetailsQuery.status />
		    <cfcatch type = "any">
				<cfset type="#cfcatch.Type#" />
				<cfset message="#cfcatch.cause.message#" />
				<cflog type="Error"
					file="ECommerce"
					text="Exception error --
					   	  Exception type: #type#
						  Message: #message#" />
			</cfcatch>
			</cftry>
			<cfreturn obj />
		</cffunction>

	<!--- function to edit Product --->
	<cffunction name = "editProductDetails" access = "remote" output = "false" >
 		<cfargument name = "productID" required = "true" />
		<cfargument name = "productName" required = "true" />
		<cfargument name = "productImage" required = "false" />
		<cfargument name = "subCategoryID" required = "true" />
		<cfargument name = "productQuantity" required = "true" />
		<cfargument name = "productPrice" required = "true" />
		<cfargument name = "discountDeduction" required = "false" default = 0 />
		<cfargument name = "productColour" required = "false" />
		<cfargument name = "productWeight" required = "false" default = 0 />
		<cfargument name = "productSize" required = "false" />
		<cfargument name = "productDescription" required = "false" />
		<cfargument name = "productStatus" required = "true" />
		<cfset editProductquery="" />
		<cftry>
			<cfquery name="editProductquery">
		    	UPDATE product.product SET
		    	productName = <cfqueryparam value = "#arguments.productName#" cfsqltype = "cf_sql_varchar" />,
		    	productImage = <cfqueryparam value = "#arguments.productImage#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productImage)#" />,
		    	subCategoryID = <cfqueryparam value = "#arguments.subCategoryID#" cfsqltype = "cf_sql_integer" />,
		    	quantity = <cfqueryparam value = "#arguments.productQuantity#" cfsqltype = "cf_sql_integer" />,
		    	actualPrice = <cfqueryparam value = "#arguments.productPrice#" cfsqltype = "cf_sql_float" />,
		    	discountDeduction = <cfqueryparam value = "#arguments.discountDeduction#" cfsqltype = "cf_sql_float" null = "#not len(arguments.discountDeduction)#" />,
		    	color = <cfqueryparam value = "#arguments.productColour#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productColour)#" />,
		    	weight = <cfqueryparam value = "#arguments.productWeight#" cfsqltype = "cf_sql_float" null = "#not len(arguments.productWeight)#" />,
		    	size = <cfqueryparam value = "#arguments.productSize#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productSize)#" />,
		    	description = <cfqueryparam value = "#arguments.productDescription#" cfsqltype = "cf_sql_varchar" null = "#not len(arguments.productDescription)#" />,
		    	status = <cfqueryparam value = "#arguments.productStatus#" cfsqltype = "cf_sql_bit"  />
		    	WHERE productID = <cfqueryparam value = "#arguments.productID#" cfsqltype = "cf_sql_integer"  />;
			</cfquery>
		<cfcatch>
			<cfset type="#cfcatch.Type#" />
			<cfset message="#cfcatch.cause.message#" />
			<cflog type="Error"
				file="ECommerce"
				text="Exception error --
				   	  Exception type: #type#
					  Message: #message#" />
		</cfcatch>
		</cftry>
	</cffunction>

</cfcomponent>