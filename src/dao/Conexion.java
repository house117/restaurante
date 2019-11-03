package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	private static String url = "jdbc:postgresql://localhost:5432/db_restaurante";
	private static String user = "postgres";
	private static String password = "system";
	public Conexion() {
		// TODO Auto-generated constructor stub
	}
	public static Connection getConexion() {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, user, password);
			System.out.println("Conexión exitosa");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
