package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.ProductoModel;
import models.UsuarioModel;

public class UsuarioDAO {

	public UsuarioDAO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public static List<UsuarioModel> getAllRecords() {
		List <UsuarioModel> lista = new ArrayList<UsuarioModel>();
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement("select * from usuarios");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				UsuarioModel usuario = new UsuarioModel();
				usuario.setId_usuario(rs.getInt("id_usuario"));
				usuario.setNombre_usuario(rs.getString("nombre_usuario"));
				usuario.setCorreo_usuario(rs.getString("correo_usuario"));
				usuario.setTelefono_usuario(rs.getString("telefono_usuario"));
				usuario.setTipo_usuario(rs.getString("tipo_usuario"));
				usuario.setUrlimagen_usuario(rs.getString("urlimagen_usuario"));
				usuario.setContrasena_usuario(rs.getString("contrasena_usuario"));
				lista.add(usuario);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	public static UsuarioModel getRecordById(int id) {
		UsuarioModel usuario = new UsuarioModel();
		Connection con = Conexion.getConexion();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from usuarios where id_usuario = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				usuario.setId_usuario(rs.getInt("id_usuario"));
				usuario.setNombre_usuario(rs.getString("nombre_usuario"));
				usuario.setCorreo_usuario(rs.getString("correo_usuario"));
				usuario.setTelefono_usuario(rs.getString("telefono_usuario"));
				usuario.setTipo_usuario(rs.getString("tipo_usuario"));
				usuario.setUrlimagen_usuario(rs.getString("urlimagen_usuario"));
				usuario.setContrasena_usuario(rs.getString("contrasena_usuario"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return usuario;
	}
	
	public static UsuarioModel getRecordByCorreo(String correo_usuario) {
		UsuarioModel usuario = new UsuarioModel();
		Connection con = Conexion.getConexion();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from usuarios where correo_usuario = ?");
			ps.setString(1, correo_usuario);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				usuario.setId_usuario(rs.getInt("id_usuario"));
				usuario.setNombre_usuario(rs.getString("nombre_usuario"));
				usuario.setCorreo_usuario(rs.getString("correo_usuario"));
				usuario.setTelefono_usuario(rs.getString("telefono_usuario"));
				usuario.setTipo_usuario(rs.getString("tipo_usuario"));
				usuario.setUrlimagen_usuario(rs.getString("urlimagen_usuario"));
				usuario.setContrasena_usuario(rs.getString("contrasena_usuario"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return usuario;
	}
	
	public static int agregar(UsuarioModel usuario) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement(" INSERT into usuarios (nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario) VALUES(?, ?, ?, ?, ?, ?)" );
			ps.setString(1, usuario.getNombre_usuario());
			ps.setString(2, usuario.getCorreo_usuario());
			ps.setString(3, usuario.getTelefono_usuario());
			ps.setString(4, usuario.getTipo_usuario());
			ps.setString(5, usuario.getUrlimagen_usuario());
			ps.setString(6, usuario.getContrasena_usuario());
			
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int actualizar(UsuarioModel usuario) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement(" update usuarios  set nombre_usuario=?, correo_usuario=?, telefono_usuario=?, tipo_usuario=?, urlimagen_usuario=?, contrasena_usuario=? where id_usuario=?");
			ps.setString(1, usuario.getNombre_usuario());
			ps.setString(2, usuario.getCorreo_usuario());
			ps.setString(3, usuario.getTelefono_usuario());
			ps.setString(4, usuario.getTipo_usuario());
			ps.setString(5, usuario.getUrlimagen_usuario());
			ps.setString(6, usuario.getContrasena_usuario());
			ps.setInt(7, usuario.getId_usuario());
			
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static int eliminar(int id) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement("delete from usuarios where id_usuario=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
