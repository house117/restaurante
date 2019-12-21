package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class LoginDAO {

	public LoginDAO() {
		// TODO Auto-generated constructor stub
	}

	public static synchronized int login(String correo_usuario, String clave) {
		Connection cn = null;
		ResultSet rs = null;
		Statement st = null;
		int hayUsuario = 0;
		try {
			cn = Conexion.getConexion();
			st = cn.createStatement();
			String sql = "select * from usuarios where correo_usuario = '"+ correo_usuario+"' and contrasena_usuario = '"+clave+"'";
			rs = st.executeQuery(sql);
			while (rs.next()) {
				hayUsuario++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				st.close();
				rs.close();
				Conexion.cerrarConexion(cn);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return hayUsuario;
	}
	
	public static synchronized String checkUserType(String correo_usuario, String contrasena_usuario) {
		Connection cn = null;
		ResultSet rs = null;
		Statement st = null;
		String tipoUsuario = "";
		try {
			cn = Conexion.getConexion();
			st = cn.createStatement();
			String sql = "select * from usuarios where correo_usuario = '"+ correo_usuario+"' and contrasena_usuario = '"+contrasena_usuario+"'";
			rs = st.executeQuery(sql);
			while (rs.next()) {
				tipoUsuario = rs.getString("tipo_usuario");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				st.close();
				rs.close();
				Conexion.cerrarConexion(cn);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return tipoUsuario;
	}
	
	
	
}
