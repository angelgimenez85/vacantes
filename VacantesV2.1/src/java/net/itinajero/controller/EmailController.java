package net.itinajero.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EmailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // validar que exista una sesión de administrador
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        if (session.getAttribute("usuario") == null) {
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        } else {
            // Obtenemos los datos enviados desde el formulario
            String destino = request.getParameter("destino");
            String asunto = request.getParameter("asunto");
            String mensaje = request.getParameter("mensaje");
            String origen = "testcount210518@gmail.com";
            String pass = "XkkjwfgeEeMOh5wX";
            String msg;

            if (this.enviarCorreo(origen, pass, destino, mensaje, asunto)) {
                msg = "El correo electrónico fue enviado correctamente.";
            } else {
                msg = "Ocurrió un error al enviar el correo electrónico";
            }
            // Compartimos la variable msg, para accederla desde la vista
            request.setAttribute("message", msg);
            //RequestDispatcher rd;

            // Enviamos la respuesta y renderizamos la vista detalle.jsp
            rd = request.getRequestDispatcher("/mensaje.jsp");
            rd.forward(request, response);
        }
    }

    public boolean enviarCorreo(String de, String clave, String para, String mensaje, String asunto) {
        boolean enviado = false;

        try {
            String host = "smtp.gmail.com";
            Properties prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", true);

            Session sesion = Session.getDefaultInstance(prop, null);
            MimeMessage message = new MimeMessage(sesion);

            message.setFrom(new InternetAddress(de));
            /*
            Nota: para enviar correos masivos.
            InternetAddress[] direcciones = new InterntAddress(para.length);
            for(int i=0; i < para.length; i++){
                direcciones[i] = new InternetAddress(para[i]);
            }

            for(int i=0; i < direcciones.length; i++){
                message.addRecipient(Message.RecipientType.TO, direcciones[i]);
            }
             */

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));
            message.setSubject(asunto);
            message.setText(mensaje);
            Transport transport = sesion.getTransport("smtp");
            transport.connect(host, de, clave);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            enviado = true;

        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
        }
        return enviado;
    }
}
