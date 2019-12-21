package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.SucursalModel;

public class SucursalDAO {

	public SucursalDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static List<SucursalModel> getAllRecords() {
		List <SucursalModel> lista = new ArrayList<SucursalModel>();
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement("select * from sucursales");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				SucursalModel sucursal = new SucursalModel();
				sucursal.setId_sucursal((rs.getInt("id_sucursal")));
				sucursal.setNombre_sucursal(rs.getString("nombre_sucursal"));
				sucursal.setDireccion_sucursal(rs.getString("direccion_sucursal"));
				sucursal.setTelefono_sucursal(rs.getString("telefono_sucursal"));
				sucursal.setCorreo_sucursal(rs.getString("correo_sucursal"));
				sucursal.setLatitud_sucursal(rs.getDouble("latitud_sucursal"));
				sucursal.setLongitud_sucursal(rs.getDouble("longitud_sucursal"));
				lista.add(sucursal);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	public static SucursalModel getRecordById(int id) {
		SucursalModel sucursal = new SucursalModel();
		Connection con = Conexion.getConexion();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from sucursales where id_sucursal = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sucursal.setId_sucursal((rs.getInt("id_sucursal")));
				sucursal.setNombre_sucursal(rs.getString("nombre_sucursal"));
				sucursal.setDireccion_sucursal(rs.getString("direccion_sucursal"));
				sucursal.setTelefono_sucursal(rs.getString("telefono_sucursal"));
				sucursal.setCorreo_sucursal(rs.getString("correo_sucursal"));
				sucursal.setLatitud_sucursal(rs.getDouble("latitud_sucursal"));
				sucursal.setLongitud_sucursal(rs.getDouble("longitud_sucursal"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return sucursal;
	}
	public static int agregar(SucursalModel sucursal) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement(" INSERT into sucursales (nombre_sucursal, direccion_sucursal, telefono_sucursal, correo_sucursal, latitud_sucursal, longitud_sucursal) VALUES(?, ?, ?, ?, ?, ?)" );
			ps.setString(1, sucursal.getNombre_sucursal());
			ps.setString(2, sucursal.getDireccion_sucursal());
			ps.setString(3, sucursal.getTelefono_sucursal());
			ps.setString(4, sucursal.getCorreo_sucursal());
			ps.setDouble(5, sucursal.getLatitud_sucursal());
			ps.setDouble(6, sucursal.getLongitud_sucursal());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int actualizar(SucursalModel sucursal) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement(" update sucursales  set nombre_sucursal=?, direccion_sucursal=?, telefono_sucursal=?, correo_sucursal=?, latitud_sucursal=?, longitud_sucursal=? where id_sucursal=?");
			ps.setString(1, sucursal.getNombre_sucursal());
			ps.setString(2, sucursal.getDireccion_sucursal());
			ps.setString(3, sucursal.getTelefono_sucursal());
			ps.setString(4, sucursal.getCorreo_sucursal());
			ps.setDouble(5, sucursal.getLatitud_sucursal());
			ps.setDouble(6, sucursal.getLongitud_sucursal());
			ps.setInt(7, sucursal.getId_sucursal());
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
			PreparedStatement ps = con.prepareStatement("delete from sucursales where id_sucursal=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
