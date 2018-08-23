<!DOCTYPE html>
<html lang="en">
  <head>
    <jsp:include page="header.jsp" />
    <title>Ingresar como Administrador</title>
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">
        <center>
          <img src="images/lock.png"><br>
          <h2 class="form-signin-heading">Ingreso al sistema</h2>     
        </center>        
        <form class="form-signin" method="post" action="admin">
        
        <label for="user" class="sr-only">Nombre de usuario</label>
        <input type="text" id="user" name="user" class="form-control" placeholder="Escriba nombre de usuario" required autofocus>
        <label for="pass" class="sr-only">Password</label>
        <input type="password" id="pass" name="pass" class="form-control" placeholder="Escriba su password" required>       
        <p class="text-danger">${message}</p>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      </form>
        <center>
        <jsp:include page="footer.jsp" />
        </center>
    </div> <!-- /container -->

  </body>
</html>

