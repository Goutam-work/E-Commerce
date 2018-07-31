<cfif NOT isUserLoggedIn() >
	<cflocation url="index.cfm" addToken="no">
</cfif>
<head>
	<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type = "text/javascript" src="jquerry/pagesScript.js"></script>
</head>
<body>
<cfset variables.result = application.products.getProducts(#session.subCategoryID#,#session.productName#,#session.maxPrice#,#session.minPrice#,#session.size#,#session.colour#,#session.status#) />
<cfdocument format="PDF">
   <table id="pdfTable" style="width:100%;text-align:center;">
	<tr style="border:1px solid black">
		<th>name</th>
		<th>price</th>
		<cfif isUserInRole('admin')>
			<th>quantity</th>
			<th>status</th>
		<cfelse>
			<th>availability</th>
		</cfif>

	</tr>
	<cfloop array="#variables.result#" index="product">
		<cfoutput>
			<tr>
				<td style="border:1px solid black">#product.NAME#</td>
				<td style="border:1px solid black">#product.PRICE#</td>
				<cfif isUserInRole('admin')>
					<td style="border:1px solid black">#product.QUANTITY#</td>
					<td style="border:1px solid black">#product.STATUS#</td>
				<cfelse>
					<cfif #product.QUANTITY#>
						<td style="border:1px solid black">AVAILABLE</td>
					<cfelse>
						<td style="border:1px solid black">OUT OF STOCK</td>
					</cfif>
				</cfif>
			</tr>
		</cfoutput>
	</cfloop>
	</table>
</cfdocument>
</body>