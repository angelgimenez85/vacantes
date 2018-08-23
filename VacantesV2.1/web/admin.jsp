<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="header.jsp" />
        <title>Administración del Sistema</title>
    </head>

    <body>

        <div class="container">

            <jsp:include page="nav-admin.jsp" />
            <br>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Bienvenido ${usuario.nombre}</h3>          
                </div>
                <div class="panel-body">
                    <h2 class="panel-title"><b>Username</b><br> ${usuario.username}<br><br></h2>
                    <h2 class="panel-title"><b>Email</b><br> ${usuario.email}<br><br></h2>
                    <h2 class="panel-title"><b>Perfil</b><br> ${usuario.perfil}<br><br></h2>
                    <h2 class="panel-title"><b>Estatus</b><br> ${usuario.estatus}<br><br></h2>
                </div>
            </div>

        <jsp:include page="footer.jsp" />

        </div> <!-- /container -->

    </body>
</html>
