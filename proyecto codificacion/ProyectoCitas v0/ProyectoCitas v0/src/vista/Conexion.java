package vista;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private static Connection conn;

    public static Connection getConexion() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BaseDatoCitas", "root", "123456");
        } catch (Exception e) {
            System.out.println(e.toString());
            conn = null;
        }
        return conn;
    }
}
