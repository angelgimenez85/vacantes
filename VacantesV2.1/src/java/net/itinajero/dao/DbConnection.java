package net.itinajero.dao;

import java.sql.*;

public class DbConnection {

    static String db = "sistemadb";
    static String login = "";
    static String password = "";
    static String url = "jdbc:mysql://localhost/" + db;
    Connection conn = null;

    public DbConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, login, password);
            if (conn != null) {
                System.out.println("Connecting database[" + conn + "] OK");
            }
        } catch (SQLException e) {
            System.out.println("Exception connection: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Exception driver: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public void disconnect() {
        System.out.println("Closing database [" + conn + "] OK");
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
}
