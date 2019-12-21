package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.EmpresaModel;
import models.ProductoModel;
import models.UsuarioModel;

public class EmpresaDAO {

	public EmpresaDAO() {
		// TODO Auto-generated constructor stub
	}

	
	public static List<EmpresaModel> getAllRecords() {
		List <EmpresaModel> lista = new ArrayList<EmpresaModel>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement("select * from empresa");
			 rs = ps.executeQuery();
			while(rs.next()) {
				EmpresaModel empresa = new EmpresaModel();
				empresa.setId_empresa(rs.getInt("id_empresa"));
				empresa.setNombre_empresa(rs.getString("nombre_empresa"));
				empresa.setDireccion1_empresa(rs.getString("direccionl1_empresa"));
				empresa.setDireccion2_empresa(rs.getString("direccionl2_empresa"));
				empresa.setUrlimagen_empresa(rs.getString("urlimagen_empresa"));
				empresa.setCorreo_empresa(rs.getString("correo_empresa"));
				empresa.setTelefono1_empresa(rs.getString("telefono1_empresa"));
				empresa.setTelefono2_empresa(rs.getString("telefono2_empresa"));
				empresa.setFacebook_empresa(rs.getString("facebook_empresa"));
				empresa.setTwitter_empresa(rs.getString("twitter_empresa"));
				empresa.setInstagram_empresa(rs.getString("instagram_empresa"));
				empresa.setLinkedin_empresa(rs.getString("linkedin_empresa"));
				
				lista.add(empresa);
			}
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			try {
				ps.close();
				con.close();
				rs.close();
				Conexion.cerrarConexion(con);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return lista;
	}
	public static EmpresaModel getEmpresa() {
		EmpresaModel empresa = new EmpresaModel();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement("select * from empresa");
			 rs = ps.executeQuery();
			while(rs.next()) {
				empresa.setId_empresa(rs.getInt("id_empresa"));
				empresa.setNombre_empresa(rs.getString("nombre_empresa"));
				empresa.setDireccion1_empresa(rs.getString("direccionl1_empresa"));
				empresa.setDireccion2_empresa(rs.getString("direccionl2_empresa"));
				empresa.setUrlimagen_empresa(rs.getString("urlimagen_empresa"));
				empresa.setCorreo_empresa(rs.getString("correo_empresa"));
				empresa.setTelefono1_empresa(rs.getString("telefono1_empresa"));
				empresa.setTelefono2_empresa(rs.getString("telefono2_empresa"));
				empresa.setFacebook_empresa(rs.getString("facebook_empresa"));
				empresa.setTwitter_empresa(rs.getString("twitter_empresa"));
				empresa.setInstagram_empresa(rs.getString("instagram_empresa"));
				empresa.setLinkedin_empresa(rs.getString("linkedin_empresa"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}finally {
			try {
				ps.close();
				con.close();
				rs.close();
				Conexion.cerrarConexion(con);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return empresa;
	}
	public static int actualizar(EmpresaModel empresa) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement(" update empresa set nombre_empresa=?, direccionl1_empresa=?, direccionl2_empresa=?, urlimagen_empresa=?,"
					+ "correo_empresa=?, telefono1_empresa=?, telefono2_empresa=?, facebook_empresa=?, twitter_empresa=?, instagram_empresa=?,linkedin_empresa=?"
					+ "where id_empresa=?");
			ps.setString(1, empresa.getNombre_empresa());
			ps.setString(2, empresa.getDireccion1_empresa());
			ps.setString(3, empresa.getDireccion2_empresa());
			ps.setString(4, empresa.getUrlimagen_empresa());
			ps.setString(5, empresa.getCorreo_empresa());
			ps.setString(6, empresa.getTelefono1_empresa());
			ps.setString(7, empresa.getTelefono2_empresa());
			ps.setString(8, empresa.getFacebook_empresa());
			ps.setString(9, empresa.getTwitter_empresa());
			ps.setString(10, empresa.getInstagram_empresa());
			ps.setString(11, empresa.getInstagram_empresa());
			ps.setInt(12, empresa.getId_empresa());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			try {
				ps.close();
				con.close();
				Conexion.cerrarConexion(con);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return status;
	}
	
	
	
}
