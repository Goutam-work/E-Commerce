<cfif NOT isUserLoggedIn() >
	<cflocation url="index.cfm" addToken="no">
</cfif>
<head>
     <title>PDF</title>
</head>
<body>
<cfset variables.result = application.products.getProducts(#session.subCategoryID#,#session.productName#,#session.maxPrice#,#session.minPrice#,#session.size#,#session.colour#,#session.status#) />
<cfdocument format="PDF">
   <table id="pdfTable" style="width:100%;text-align:center;border: 1px solid black;">
	<tr>
		<th style="border-right: 1px solid black;">name</th>
		<th style="border-right: 1px solid black;">price(Rs)</th>
		<th style="border-right: 1px solid black;">Sub Category</th>
		<cfif isUserInRole('admin')>
			<th style="border-right: 1px solid black;">quantity</th>
			<th>status</th>
		<cfelse>
			<th>availability</th>
		</cfif>
	</tr>
	<cfloop array="#variables.result#" index="product">
		<cfoutput>
			<tr>
				<td style="border-right: 1px solid black;border-top: 1px solid black">#product.NAME#</td>
				<td style="border-right: 1px solid black;border-top: 1px solid black">#product.PRICE#</td>
				<td style="border-right: 1px solid black;border-top: 1px solid black">#product.SUBCATEGORY#</td>
				<cfif isUserInRole('admin')>
					<td style="border-right: 1px solid black;border-top: 1px solid black">#product.QUANTITY#</td>
					<cfif #product.STATUS#>
					<td style="border-top: 1px solid black">ACTIVE</td>
					<cfelse>
					<td style="border-top: 1px solid black">INACTIVE</td>
					</cfif>
				<cfelse>
					<cfif #product.QUANTITY#>
						<td style="border-top: 1px solid black">AVAILABLE</td>
					<cfelse>
						<td style="border-top: 1px solid black">OUT OF STOCK</td>
					</cfif>
				</cfif>
			</tr>
		</cfoutput>
	</cfloop>
	</table>
</cfdocument>
</body>