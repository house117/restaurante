package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
//conexion restaurante
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
			System.out.println("Conexion exitosa");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	public static synchronized void cerrarCall(CallableStatement cl) {
		try {
			cl.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//Método utilizado para cerrar el resulset de datos
	public static synchronized void cerrarConexion(ResultSet rs) {
		try {
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//Método utilizado para cerrar la conexion
	public static synchronized void cerrarConexion(Connection cn) {
		try {
			cn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//Metodo utilizado para deshacer los cmabios en la base da dtos
	public static synchronized void deshacerCambios (Connection cn ) {
		try {
			cn.rollback();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
