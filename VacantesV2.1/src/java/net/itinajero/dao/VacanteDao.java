package net.itinajero.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import net.itinajero.model.Vacante;

public class VacanteDao {

    DbConnection conn;

    public VacanteDao(DbConnection conn) {
        this.conn = conn;
    }

    public boolean insert(Vacante vacante) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "insert into Vacante values (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, vacante.getId());
            ps.setString(2, format.format(vacante.getFechaPublicacion()));
            ps.setString(3, vacante.getNombre());
            ps.setString(4, vacante.getDescripcion());
            ps.setString(5, vacante.getDetalle());
            ps.executeUpdate();

            return true;
        } catch (SQLException ex) {
            return false;
        }
    }

    public List<Vacante> getUltimas() {
        try {
            String sql = "select * from Vacante order by id desc limit 3";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Vacante> list = new LinkedList<>();
            Vacante vacante;
            while (rs.next()) {
                vacante = new Vacante(rs.getInt("id"));
                vacante.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                vacante.setNombre(rs.getString("nombre"));
                vacante.setDescripcion(rs.getString("descripcion"));
                vacante.setDetalle(rs.getString("detalle"));
                // Add vacante object to the list
                list.add(vacante);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Error. VacanteDao.getUltimas: " + e.getMessage());
            return null;
        }
    }

    public Vacante getById(int idVacante) {
        try {
            String sql = "select * from Vacante where id=? limit 1";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, idVacante); // set idVacante
            ResultSet rs = ps.executeQuery();
            Vacante vacante = new Vacante(0);
            while (rs.next()) {
                // Create an object for the movie
                vacante.setId(rs.getInt("id"));
                vacante.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                vacante.setNombre(rs.getString("nombre"));
                vacante.setDescripcion(rs.getString("descripcion"));
                vacante.setDetalle(rs.getString("detalle"));
            }
            return vacante;
        } catch (SQLException e) {
            System.out.println("Error VacanteDao.getById " + e.getMessage());
            return null;
        }
    }

    public List<Vacante> getAll() {
        try {
            String sql = "select * from Vacante order by id desc";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Vacante> list = new LinkedList<>();
            Vacante vacante;
            while (rs.next()) {
                vacante = new Vacante(rs.getInt("id"));
                vacante.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                vacante.setNombre(rs.getString("nombre"));
                vacante.setDescripcion(rs.getString("descripcion"));
                vacante.setDetalle(rs.getString("detalle"));
                // Add vacante object to the list
                list.add(vacante);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Error. VacanteDao.getAll: " + e.getMessage());
            return null;
        }
    }

    public List<Vacante> getByQuery(String query) {
        try {
            String sql = "select * from Vacante where (descripcion like ? or nombre like ?) order by id desc";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, "%" + query + "%");
            ps.setString(2, "%" + query + "%");
            ResultSet rs = ps.executeQuery();
            List<Vacante> list = new LinkedList<>();
            Vacante vacante;
            while (rs.next()) {
                vacante = new Vacante(rs.getInt("id"));
                vacante.setFechaPublicacion(rs.getDate("fechaPublicacion"));
                vacante.setNombre(rs.getString("nombre"));
                vacante.setDescripcion(rs.getString("descripcion"));
                vacante.setDetalle(rs.getString("detalle"));
                // Add vacante object to the list
                list.add(vacante);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Error. VacanteDao.getByQuery: " + e.getMessage());
            return null;
        }
    }

    public int delete(int idVacante) {
        try {
            String sql = "delete from Vacante where id=?";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setInt(1, idVacante);
            int rows = ps.executeUpdate();
            return rows;

        } catch (SQLException e) {
            System.out.println("Error VacanteDao.eliminar: " + e.getMessage());
            return 0;
        }
    }
}
