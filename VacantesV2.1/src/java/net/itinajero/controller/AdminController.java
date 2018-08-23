package net.itinajero.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.itinajero.dao.DbConnection;
import net.itinajero.dao.UsuarioDao;
import net.itinajero.dao.VacanteDao;
import net.itinajero.model.Usuario;

public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibimos el parámetro action, el cual servirá para saber qué accion GET se ejecutará.
        String action = request.getParameter("action");

        // Recuperamos la sesión activa que viene junto con el request
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        String msg = "";

        switch (action) {
            case "login":
                // Aquí no existe todavía una sesión para el usuario, lo mandamos al form login
                if (session.getAttribute("usuario") == null) {
                    request.setAttribute("message", msg);
                    rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                } else {
                    // Ya está logueado, lo mandamos al index.jsp, pero de la administración
                    rd = request.getRequestDispatcher("/admin.jsp");
                    rd.forward(request, response);
                }
                break;
            /*
                Cuando es logout (GET), cerramos la sesión. Aquí se puede comprobar 
                en el administrador de aplicaciones de tomcat cómo la sesión es destruida.
             */
            case "logout":
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/homepage");
                break;

            case "crear":
                // Aquí no existe todavía una sesión para el usuario, lo mandamos al form login
                if (session.getAttribute("usuario") == null) {
                    msg = "Acceso denegado";
                    request.setAttribute("message", msg);
                    rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                } else {
                    // Ya está logueado, lo mandamos a frmvacante.jsp
                    rd = request.getRequestDispatcher("/frmvacante.jsp");
                    rd.forward(request, response);
                }
                break;

            case "eliminar":
                if (session.getAttribute("usuario") == null) {
                    msg = "Acceso denegado";
                    request.setAttribute("message", msg);
                    rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                } else {
                    this.eliminarVacante(request, response);
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibimos los parámetros del formulario de login
        String userParam = request.getParameter("user");
        String passParam = request.getParameter("pass");

        // Recuperamos una instancia del objeto HttpSession
        HttpSession session = request.getSession();

        DbConnection conn = new DbConnection();
        UsuarioDao usuarioDao = new UsuarioDao(conn);
        // Verificamos en la BD si es un usuario válido
        Usuario usuario = usuarioDao.login(userParam, passParam);
        conn.disconnect();

        RequestDispatcher rd;
        if (usuario.getId() > 0) {
            // Creamos una variable de sesión con el registro del usuario (bean)
            // verificamos en el administrador de aplicaciones de Tomcat.
            session.setAttribute("usuario", usuario);
            rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);
        } else {
            String msg = "Usuario y/o password incorrectos";
            request.setAttribute("message", msg);
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }
    
    protected void eliminarVacante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibimos el id de la vacante que vamos a eliminar
        int idVacanteParam = Integer.parseInt(request.getParameter("idVacante"));

        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        int respuesta = vacanteDao.delete(idVacanteParam);        
        String msg = "";        
        if (respuesta == 1) { // Si fue afectado un registro, significa que se borró
            msg = "La vacante fue eliminada correctamente";
        } else {
            msg = "Ocurrió un error. La vacante no fue eliminada";
        }
        conn.disconnect();
        request.setAttribute("message", msg);
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }
}
