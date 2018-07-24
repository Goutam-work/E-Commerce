
<head>
  <title>E-Commerce</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">


</head>

<body>

  <div class="jumbotron">
    <div class="container text-center">
      <h1>Online Store</h1>
      <p>Mission, Vission & Values</p>
    </div>
  </div>

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
          <li class="active">
            <a href="#">Home</a>
          </li>
          <li>
            <a href="#">Products</a>
          </li>
          <li>
            <a href="#">Deals</a>
          </li>
          <li>
            <a href="#">Stores</a>
          </li>
          <li>
            <a href="#">Contact</a>
          </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li>
            <a data-toggle="modal" href="#registration">
              <span class="glyphicon glyphicon-user" ></span>Register</a>
          </li>
          <li>
            <a data-toggle="modal" href="#login">
              <span class="glyphicon glyphicon-log-in" ></span> Login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<!-- registration Modal -->
<div id="registration" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Register</h4>
      </div>
      <div class="modal-body" id="scrollable">
        <cfinclude template="includes/registrationForm.cfm" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- login Modal -->
<div id="login" class="modal fade" role="dialog">
  <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body">
         <cfinclude template="includes/loginform.cfm" />
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a  data-toggle="modal" href="#registration" data-dismiss="modal">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>

  </div>
</div>

  <div class="container-fluid text-center">
    <div class="container">
      <br>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">

          <div class="item active">
            <img src="http://via.placeholder.com/350x150" alt="Chania" width="460" height="345">
            <div class="carousel-caption">
              <h3>Chania</h3>
              <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
            </div>
          </div>

          <div class="item">
            <img src="http://via.placeholder.com/350x150" alt="Chania" width="460" height="345">
            <div class="carousel-caption">
              <h3>Chania</h3>
              <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
            </div>
          </div>

          <div class="item">
            <img src="http://via.placeholder.com/350x150" alt="Flower" width="460" height="345">
            <div class="carousel-caption">
              <h3>Flowers</h3>
              <p>Beautiful flowers in Kolymbari, Crete.</p>
            </div>
          </div>

          <div class="item">
            <img src="http://via.placeholder.com/350x150" alt="Flower" width="460" height="345">
            <div class="carousel-caption">
              <h3>Flowers</h3>
              <p>Beautiful flowers in Kolymbari, Crete.</p>
            </div>
          </div>

        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
  </div>
  <br>
  <br>

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
  <script type = "text/javascript" src="jquerry/scripts.js"></script>