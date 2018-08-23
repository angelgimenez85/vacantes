<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- The justified navigation menu is meant for single line per list item.
                 Multiple lines will require custom code not provided by Bootstrap. -->
            <div class="masthead">
                <h3 class="text-muted">My Company - Administración</h3>
                <nav>
                    <ul class="nav nav-justified">
                        <li><a href="admin?action=crear">Crear Vacante</a></li>            
                        <li><a href="vacante?action=lista">Vacantes</a></li>
                            <c:if test="${usuario.id > 0}">
                            <li><a href="solicitud?action=solicitudes">Solicitudes</a></li>
                            <li><a href="admin?action=logout">Salir</a></li> 
                            </c:if>
                    </ul>
                </nav>
            </div>
