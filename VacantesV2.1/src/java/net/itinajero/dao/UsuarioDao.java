package net.itinajero.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.itinajero.model.Usuario;

public class UsuarioDao {

    DbConnection conn;

    public UsuarioDao(DbConnection conn) {
        this.conn = conn;
    }

    public Usuario login(String user, String pass) {
        try {
            String sql = "select * from Usuario where username=? and password=md5(?) and estatus='activo' limit 1";
            PreparedStatement ps = conn.getConnection().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            Usuario usuario = new Usuario(0);
            while (rs.next()) {
                // Create an object for the movie
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPassword(rs.getString("password"));
                usuario.setPerfil(rs.getString("perfil"));
                usuario.setEstatus(rs.getString("estatus"));
            }
            return usuario;
        } catch (SQLException e) {
            System.out.println("Error UsuarioDao.login " + e.getMessage());
            return null;
        }
    }
}
