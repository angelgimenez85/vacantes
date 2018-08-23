package net.itinajero.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import net.itinajero.model.Solicitud;

public class SolicitudDao {

    DbConnection conn;

    public SolicitudDao(DbConnection conn) {
        this.conn = conn;
    }

    public boolean insert(Solicitud solicitud) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "insert into Solicitud values (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, solicitud.getId());
            ps.setString(2, format.format(solicitud.getFecha()));
            ps.setString(3, solicitud.getNombre());
            ps.setString(4, solicitud.getEmail());
            ps.setString(5, solicitud.getTelefono());
            ps.setString(6, solicitud.getDireccion());
            ps.setInt(7, solicitud.getVacante().getId());
            ps.setString(8, solicitud.getCurriculum());
            ps.executeUpdate();

            return true;
        } catch (SQLException ex) {
            return false;
        }
    }
    
    public List<Solicitud> getAll() {
        try {
            String sql = "select * from Solicitud order by id desc";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Solicitud> list = new LinkedList<>();
            Solicitud solicitud;
            while (rs.next()) {
                solicitud = new Solicitud(rs.getInt("id"));
                solicitud.setFecha(rs.getDate("fecha"));
                solicitud.setNombre(rs.getString("nombre"));
                solicitud.setEmail(rs.getString("email"));
                solicitud.setTelefono(rs.getString("telefono"));
                solicitud.setDireccion(rs.getString("direccion"));
                
                DbConnection conn = new DbConnection();
                VacanteDao vacanteDao = new VacanteDao(conn);
                solicitud.setVacante(vacanteDao.getById(rs.getInt("vacante")));
                
                solicitud.setCurriculum(rs.getString("curriculum"));
                // Add solicitud object to the list
                list.add(solicitud);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Error. VacanteDao.getAll: " + e.getMessage());
            return null;
        }
    }
}
