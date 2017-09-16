<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel Tutorials</title>
    
    <%@ include file="header.jsp" %>
    <!-- Styles -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>

<style>
    .loading {
        background: lightgoldenrodyellow url('{{asset('images/processing.gif')}}') no-repeat center 65%;
        height: 80px;
        width: 100px;
        position: fixed;
        border-radius: 4px;
        left: 50%;
        top: 50%;
        margin: -40px 0 0 -50px;
        z-index: 2000;
        display: none;
    }
</style>
<div class="container-fluid">
    <div class="row"></div>
    <div class="row">
       <!--  <div class="col-md-3"></div> -->
        <div class="col-md-12">
          
          <%@include file="menu.jsp" %>
            
            <div id="content">
            
            
                <div class="container">

        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive img-rounded" src="http://i.imgur.com/usrVyHp.jpg" alt="">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-4">
                <h1>TOP OF TALES</h1>
                <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
                <a class="btn btn-success btn-lg" href="#">Call to Action!</a>
            </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    This is a well that is a great spot for a business tagline or phone number for easy access!
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4">
                <h2>Action (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Drama  (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Horror  (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            
<!--                 <div class="row">
            <div class="col-md-4">
                <h2>Action (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            /.col-md-4
            <div class="col-md-4">
                <h2>Drama  (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            /.col-md-4
            <div class="col-md-4">
                <h2>Horror  (HOT)</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            /.col-md-4 -->
             <div class="row">
            <div class="col-md-4">
                <h2>Action</h2>                
                <li><a name="1" href="javascript:ajaxLoad('#')">Action1</a></li>
                <li><a name="2" href="javascript:ajaxLoad('#')">Action2</a></li>
                <li><a name="3"  href="javascript:ajaxLoad('#')">Action3</a></li>
                <li><a name="4" href="javascript:ajaxLoad('#')">Action4</a></li>
                <li><a name="5" href="javascript:ajaxLoad('#')">Action5</a></li>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Drama</h2>             
                <li><a href="javascript:ajaxLoad('#')">Drama1</a></li>
                <li><a href="javascript:ajaxLoad('#')">Drama2</a></li>
                <li><a href="javascript:ajaxLoad('#')">Drama3</a></li>
                <li><a href="javascript:ajaxLoad('#')">Drama4</a></li>
                <li><a href="javascript:ajaxLoad('#')">Drama5</a></li>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Horror</h2>
                <li><a href="javascript:ajaxLoad('#')">Horror1</a></li>
                <li><a href="javascript:ajaxLoad('#')">Horror2</a></li>
                <li><a href="javascript:ajaxLoad('#')">Horror3</a></li>
                <li><a href="javascript:ajaxLoad('#')">Horror4</a></li>
                <li><a href="javascript:ajaxLoad('#')">Horror5</a></li>
                <a class="btn btn-default" href="#">More Info</a>
            </div>           
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
  <!--   <script src="bootstrap/js/jquery-1.11.3.min.js"></script> -->

    <!-- Bootstrap Core JavaScript -->
  <!--   <script src="bootstrap/js/bootstrap.min.js"></script> -->
            
            
            
            </div>
            <div class="loading"></div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<!-- JavaScripts -->
 	<!-- <script src="http://www.tutorialspoint.com/bootstrap/scripts/jquery.min.js">
        </script>
 	 <script src="http://www.tutorialspoint.com/bootstrap/js/bootstrap.min.js"></script> -->
<script>
    function ajaxLoad(filename, content) {
        content = typeof content !== 'undefined' ? content : 'content';
     //   $('.loading').show();
        $.ajax({
            type: "GET",
            url: filename,
          //  contentType: false,
            success: function (data) {
                $("#content" ).html(data);
               
               
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
        
    }
</script>
</body>
</html>