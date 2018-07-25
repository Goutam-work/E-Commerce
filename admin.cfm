<cfif NOT isUserLoggedIn() OR NOT isUserInRole('admin') >
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
          <li><a  data-toggle="modal" href="#addProduct">Products</a></li>
          <li><a  data-toggle="modal" href="#addCategory">Category</a></li>
          <li><a  data-toggle="modal" href="#addSubCategory">Subcategory</a></li>
          <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" >Delete
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">category</a></li>
		          <li><a href="#">sub category</a></li>
		        </ul>
		   </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#" id="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>
<!-- add product Modal -->
<div id="addProduct" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Product</h4>
      </div>
      <div class="modal-body" id="scrollable">
        <cfinclude template="includes/addProductForm.cfm" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- add category Modal -->
<div id="addCategory" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add category</h4>
      </div>
      <div class="modal-body" id="scrollable">
        <cfinclude template="includes/addCategoryForm.cfm" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- add sub-category Modal -->
<div id="addSubCategory" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add category</h4>
      </div>
      <div class="modal-body" id="scrollable">
        <cfinclude template="includes/addSubCategoryForm.cfm" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

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