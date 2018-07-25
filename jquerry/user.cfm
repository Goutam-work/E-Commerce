<cfif NOT isUserLoggedIn() OR NOT isUserInRole('user') >
	<cflocation url="index.cfm" addToken="no">
</cfif>

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>

  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Logo</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">Products</a></li>
          <li><a href="#">Deals</a></li>
          <li><a href="#">Stores</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#" id="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>

<div class="container-fluid text-center">
	<div class="row content">
	  <cfinclude template="includes/productFilter.cfm" />
	  <div class="col-sm-9 container-fluid">

		<cfinclude template="includes/productSearch.cfm" />

	    <cfinclude template="includes/products.cfm" />
	  </div>
	</div>
</div><br><br>

  <footer class="container-fluid text-center">
    <p>Online Store Copyright</p>
    <form class="form-inline">Get deals:
      <input type="email" class="form-control" size="50" placeholder="Email Address">
      <button type="button" class="btn btn-danger">Sign Up</button>
    </form>
  </footer>

  </body>
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type = "text/javascript" src="jquerry/pagesScript.js"></script>