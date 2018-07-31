<cfif NOT isUserLoggedIn() OR NOT isUserInRole('user') >
	<cflocation url="index.cfm" addToken="no">
</cfif>

<head>
	<cfinclude template="includes/head.cfm" />
  </head>
  <body>
	<cfinclude template="includes/navBar.cfm" />
<div class="container-fluid text-center">
	<div class="row content">
		<cfinclude template="includes/productFilter.cfm" />
	  	<div class="col-sm-9 container-fluid">
			<p>search results for "<span id="searchOn"></span>" sub-categories<hr></p>
			<div class="row" id="productDisplay"></div>
		</div>
	</div>
</div><br><br>

  <cfinclude template="includes/footer.cfm" />

<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type = "text/javascript" src="jquerry/pagesScript.js"></script>
  </body>
