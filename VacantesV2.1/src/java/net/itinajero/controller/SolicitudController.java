package net.itinajero.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.itinajero.dao.DbConnection;
import net.itinajero.dao.SolicitudDao;
import net.itinajero.dao.VacanteDao;
import net.itinajero.model.Solicitud;
import net.itinajero.model.Vacante;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

public class SolicitudController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // validar que exista una sesión de administrador
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        if (session.getAttribute("usuario") == null) {
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        } else {
            String action = request.getParameter("action");
            switch (action) {
                case "solicitudes":
                    this.verTodas(request, response);
                    break;
                case "responder":
                    this.responder(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Creamos el objeto solicitud que va a guardar los datos.
            Solicitud solicitud = new Solicitud(0);

            DbConnection conn = new DbConnection();

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            RequestDispatcher rd;
            String extension = "";
            String fileName = "";
            String msg = "";
            FileItem uploaded = null;

            // Los items obtenidos serán cada uno de los campos del formulario,
            // tanto campos normales como ficheros subidos.
            List items = upload.parseRequest(request);

            // Se recorren todos los items, que son de tipo FileItem
            for (Object item : items) {
                uploaded = (FileItem) item;

                // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                // subido donde nos interese
                if (!uploaded.isFormField()) {

                    // asignamos la fecha al nombre del archivo
                    SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
                    Date Ahora = new Date();

                    // Obtenemos la extensión del archivo
                    extension = FilenameUtils.getExtension(uploaded.getName());

                    fileName = format.format(Ahora) + "." + extension;

                } else {
                    // es un campo de formulario, podemos obtener clave y valor
                    String key = uploaded.getFieldName();
                    String valor = uploaded.getString();

                    switch (key) {
                        case "nombre":
                            solicitud.setNombre(valor);
                            break;
                        case "email":
                            solicitud.setEmail(valor);
                            break;
                        case "telefono":
                            solicitud.setTelefono(valor);
                            break;
                        case "direccion":
                            solicitud.setDireccion(valor);
                            break;
                        case "idVacante":
                            VacanteDao vacanteDao = new VacanteDao(conn);
                            solicitud.setVacante(vacanteDao.getById(Integer.parseInt(valor)));
                            break;
                    }
                }
            }

            // Validamos la extensión del archivo
            extension = extension.toLowerCase();
            switch (extension) {
                case "pdf":
                    break;
                case "doc":
                    break;
                case "docx":
                    break;
                default:
                    msg = "Solo se permiten archivos de tipo PDF, DOC y DOCX";
                    Vacante vacante = new Vacante(solicitud.getVacante().getId());
                    request.setAttribute("message", msg);
                    request.setAttribute("solicitud", solicitud);
                    request.setAttribute("vacante", vacante);
                    // Enviamos la respuesta y Renderizamos la vista mensaje.jsp
                    rd = request.getRequestDispatcher("/frmenviarcv.jsp");
                    rd.forward(request, response);
                    return;
            }

            // Guardamos el fichero en algún sitio
            ServletContext context = request.getServletContext();
            File fichero = new File(context.getRealPath("/") + "uploads/" + fileName);
            // Asignamos el nombre del archivo subido en la BD
            solicitud.setCurriculum(fileName);
            try {
                uploaded.write(fichero);
            } catch (Exception ex) {
                Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            // Procesamos los datos a guardar
            SolicitudDao solicitudDao = new SolicitudDao(conn);
            boolean status = solicitudDao.insert(solicitud);

            // Preparamos un mensaje para el usuario
            if (status) {
                msg = "La solicitud fue guardada correctamente";
            } else {
                msg = "Ocurrió un error. La solicitud no fue guardada";
            }

            conn.disconnect();
            //RequestDispatcher rd;
            // Compartimos la variable msg para poder accederla desde la vista con Expression Language
            request.setAttribute("message", msg);
            // Enviamos la respuesta y Renderizamos la vista mensaje.jsp
            rd = request.getRequestDispatcher("/mensaje.jsp");
            rd.forward(request, response);

        } catch (FileUploadException ex) {
            Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void verTodas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DbConnection conn = new DbConnection();
        SolicitudDao solicitudDao = new SolicitudDao(conn);
        List<Solicitud> lista = solicitudDao.getAll();
        conn.disconnect();

        // Compartimos la variable msg, para accederla desde la vista
        request.setAttribute("solicitudes", lista);
        RequestDispatcher rd;

        // Enviamos la respuesta y renderizamos la vista detalle.jsp
        rd = request.getRequestDispatcher("/solicitudes.jsp");
        rd.forward(request, response);
    }

    protected void responder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        // Compartimos la variable msg, para accederla desde la vista
        request.setAttribute("email", email);
        RequestDispatcher rd;

        // Enviamos la respuesta y renderizamos la vista detalle.jsp
        rd = request.getRequestDispatcher("/frmcorreo.jsp");
        rd.forward(request, response);
    }
}
