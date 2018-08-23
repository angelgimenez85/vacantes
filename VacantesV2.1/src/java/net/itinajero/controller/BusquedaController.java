package net.itinajero.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.itinajero.dao.DbConnection;
import net.itinajero.dao.VacanteDao;
import net.itinajero.model.Vacante;

public class BusquedaController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recibimos la cadena de búsqueda del usuario
        String q = request.getParameter("query");
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        List<Vacante> lista = vacanteDao.getByQuery(q);
        conn.disconnect();

        // Compartimos la variable msg, para accederla desde la vista
        request.setAttribute("vacantes", lista);
        RequestDispatcher rd;

        // Enviamos la respuesta y renderizamos la vista detalle.jsp
        rd = request.getRequestDispatcher("/vacantes.jsp");
        rd.forward(request, response);
    }
}
