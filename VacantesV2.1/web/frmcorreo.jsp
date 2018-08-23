<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="header.jsp" />
        <title>Departamento de Recursos Humanos - My Company</title>    
    </head>

    <body>

        <div class="container">

            <jsp:include page="nav-admin.jsp" />

            <br>    
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Responder vía email</h3>
                </div>
                <div class="panel-body">

                    <p class="text-danger"></p>    

                    <form action="email" method="post">
                        <div class="form-group">
                            <label for="destino">Destinatario</label>
                            <input type="text" class="form-control" name="destino" readonly id="destino" value="${email}" >
                        </div>                                     
                        <div class="form-group">
                            <label for="asunto">Asunto</label>
                            <input type="text" class="form-control" name="asunto" required id="asunto" placeholder="Asunto del Email" autofocus="">
                        </div>                   
                        <div class="form-group">
                            <label for="mensaje">Mensaje</label>
                            <textarea class="form-control" name="mensaje" id="mensaje" required rows="3" placeholder="Escribe el mensaje del correo electrónico"></textarea>
                        </div>        
                        <button type="submit" class="btn btn-default" >Enviar correo</button>
                    </form>
                </div>
            </div>

            <jsp:include page="footer.jsp" />

        </div> <!-- /container -->

    </body>
</html>

