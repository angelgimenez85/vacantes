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

public class VacanteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action){
            case "ver":
                this.verDetalle(request, response);
                break;
            case "lista":
                this.verTodas(request, response);
                break;
            case "enviarCV":
                this.enviarCv(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recibimos los parámetros
        String nombreParam = request.getParameter("nombre");
        String descripcionParam = request.getParameter("descripcion");
        String detalleParam = request.getParameter("detalle");

        Vacante vacante = new Vacante(0);
        vacante.setNombre(nombreParam);
        vacante.setDescripcion(descripcionParam);
        vacante.setDetalle(detalleParam);

        System.out.println(vacante);

        // Procesamos los datos a guardar
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        boolean status = vacanteDao.insert(vacante);

        // Preparamos un mensaje para el usuario
        String msg = "";
        if (status) {
            msg = "La vacante fue guardada correctamente";
        } else {
            msg = "Ocurrió un error. La vacante no fue guardada";
        }

        conn.disconnect();
        RequestDispatcher rd;
        // Compartimos la variable msg para poder accederla desde la vista con Expression Language
        request.setAttribute("message", msg);
        /*SimpleDateFormat format = new SimpleDateFormat("yyyy");
        request.setAttribute("year", format.format(new Date()));*/
        // Enviamos la respuesta y Renderizamos la vista mensaje.jsp
        rd = request.getRequestDispatcher("/mensaje.jsp");
        rd.forward(request, response);
    }

    protected void verDetalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recibimos el id de la vacante a consultar
        int idVacante = Integer.parseInt(request.getParameter("id"));
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        Vacante vacante = vacanteDao.getById(idVacante);
        conn.disconnect();

        // Compartimos la variable msg, para accederla desde la vista
        request.setAttribute("vacante", vacante);
        RequestDispatcher rd;

        // Enviamos la respuesta y renderizamos la vista detalle.jsp
        rd = request.getRequestDispatcher("/detalle.jsp");
        rd.forward(request, response);
    }
    
    protected void verTodas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        List<Vacante> lista = vacanteDao.getAll();
        conn.disconnect();

        // Compartimos la variable msg, para accederla desde la vista
        request.setAttribute("vacantes", lista);
        RequestDispatcher rd;

        // Enviamos la respuesta y renderizamos la vista detalle.jsp
        rd = request.getRequestDispatcher("/vacantes.jsp");
        rd.forward(request, response);
    }
    
    protected void enviarCv(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recibimos el id de la vacante
        int idVacante = Integer.parseInt(request.getParameter("id"));
        DbConnection conn = new DbConnection();
        VacanteDao vacanteDao = new VacanteDao(conn);
        Vacante vacante = vacanteDao.getById(idVacante);
        conn.disconnect();

        // Compartimos la variable msg, para accederla desde la vista
        request.setAttribute("vacante", vacante);
        RequestDispatcher rd;

        // Enviamos la respuesta y renderizamos la vista frmenviarcv.jsp
        rd = request.getRequestDispatcher("/frmenviarcv.jsp");
        rd.forward(request, response);
    }
}
