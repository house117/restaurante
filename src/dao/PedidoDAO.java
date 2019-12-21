package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import models.PedidoModel;

public class PedidoDAO {

	public PedidoDAO() {
		// TODO Auto-generated constructor stub
	}
	public static List<PedidoModel> getTodayRecords() {
		List <PedidoModel> lista = new ArrayList<PedidoModel>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement("select * from pedidos where DATE(fecha_pedido) >= CURRENT_DATE AND DATE(fecha_pedido) < CURRENT_DATE + INTERVAL '1 DAY'");
			 rs = ps.executeQuery();
			while(rs.next()) {
				PedidoModel pedido = new PedidoModel();
				pedido.setId_pedido(rs.getInt("id_pedido"));
				pedido.setProductosycant_pedido(rs.getString("productosycant_pedido"));
				pedido.setDetalles_pedido(rs.getString("detalles_pedido"));
				pedido.setFecha_pedido(rs.getTimestamp("fecha_pedido"));
				pedido.setUsuario_pedido(rs.getString("usuario_pedido"));
				pedido.setEstado_pedido(rs.getString("estado_pedido"));
				pedido.setDir1_pedido(rs.getString("dir1_pedido"));
				pedido.setDir2_pedido(rs.getString("dir2_pedido"));
				pedido.setZipcode_pedido(rs.getString("zipcode_pedido"));
				pedido.setTotal_pedido(rs.getDouble("total_pedido"));
				pedido.setIva_pedido(rs.getDouble("iva_pedido"));
				lista.add(pedido);
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
	public static List<PedidoModel> getBetweenTwoDates(Date date1, Date date2) {
		List <PedidoModel> lista = new ArrayList<PedidoModel>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement("select * from pedidos where fecha_pedido between ? and ?");
			 ps.setDate(1, new java.sql.Date(date1.getTime()));
			 ps.setDate(2, new java.sql.Date(date2.getTime()));
			 rs = ps.executeQuery();
			while(rs.next()) {
				PedidoModel pedido = new PedidoModel();
				pedido.setId_pedido(rs.getInt("id_pedido"));
				pedido.setProductosycant_pedido(rs.getString("productosycant_pedido"));
				pedido.setDetalles_pedido(rs.getString("detalles_pedido"));
				pedido.setFecha_pedido(rs.getTimestamp("fecha_pedido"));
				pedido.setUsuario_pedido(rs.getString("usuario_pedido"));
				pedido.setEstado_pedido(rs.getString("estado_pedido"));
				pedido.setDir1_pedido(rs.getString("dir1_pedido"));
				pedido.setDir2_pedido(rs.getString("dir2_pedido"));
				pedido.setZipcode_pedido(rs.getString("zipcode_pedido"));
				pedido.setTotal_pedido(rs.getDouble("total_pedido"));
				pedido.setIva_pedido(rs.getDouble("iva_pedido"));
				lista.add(pedido);
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
	public static List<PedidoModel> getAllRecords() {
		List <PedidoModel> lista = new ArrayList<PedidoModel>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement("select * from pedidos");
			 rs = ps.executeQuery();
			while(rs.next()) {
				PedidoModel pedido = new PedidoModel();
				pedido.setId_pedido(rs.getInt("id_pedido"));
				pedido.setProductosycant_pedido(rs.getString("productosycant_pedido"));
				pedido.setDetalles_pedido(rs.getString("nombre_empresa"));
				pedido.setFecha_pedido(rs.getTimestamp("detalles_pedido"));
				pedido.setUsuario_pedido(rs.getString("usuario_pedido"));
				pedido.setEstado_pedido(rs.getString("estado_pedido"));
				pedido.setDir1_pedido(rs.getString("dir1_pedido"));
				pedido.setDir2_pedido(rs.getString("dir2_pedido"));
				pedido.setZipcode_pedido(rs.getString("zipcode_pedido"));
				pedido.setTotal_pedido(rs.getDouble("total_pedido"));
				pedido.setIva_pedido(rs.getDouble("iva_pedido"));
				lista.add(pedido);
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
	
	
	public static int agregar(PedidoModel pedido) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement(
					" INSERT into pedidos ( productosycant_pedido, detalles_pedido, fecha_pedido, usuario_pedido, estado_pedido, dir1_pedido, dir2_pedido, zipcode_pedido, total_pedido, iva_pedido) VALUES(?, ?, ?, ?, ?, ?,?,?,?,?)");
			
		
			ps.setString(1, pedido.getProductosycant_pedido());
			ps.setString(2, pedido.getDetalles_pedido());
			ps.setTimestamp(3, pedido.getFecha_pedido());
			ps.setString(4, pedido.getUsuario_pedido());
			ps.setString(5, pedido.getEstado_pedido());
			ps.setString(6, pedido.getDir1_pedido());
			ps.setString(7, pedido.getDir2_pedido());
			ps.setString(8, pedido.getZipcode_pedido());
			ps.setDouble(9, pedido.getTotal_pedido());
			ps.setDouble(10, pedido.getIva_pedido());
			
			
			
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
	
	
	public static PedidoModel getRecordById(int id) {
		PedidoModel pedido = new PedidoModel();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("select * from pedidos where id_pedido = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				pedido.setId_pedido(rs.getInt("id_pedido"));
				pedido.setProductosycant_pedido(rs.getString("productosycant_pedido"));
				pedido.setDetalles_pedido(rs.getString("detalles_pedido"));
				pedido.setFecha_pedido(rs.getTimestamp("fecha_pedido"));
				pedido.setUsuario_pedido(rs.getString("usuario_pedido"));
				pedido.setEstado_pedido(rs.getString("estado_pedido"));
				pedido.setDir1_pedido(rs.getString("dir1_pedido"));
				pedido.setDir2_pedido(rs.getString("dir2_pedido"));
				pedido.setZipcode_pedido(rs.getString("zipcode_pedido"));
				pedido.setTotal_pedido(rs.getDouble("total_pedido"));
				pedido.setIva_pedido(rs.getDouble("iva_pedido"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			try {
				ps.close();
				con.close();
				rs.close();
				Conexion.cerrarConexion(con);
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return pedido;
	}
	public static int actualizarEstado(String estado, int id) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement(
					" update pedidos  set estado_pedido=? where id_pedido=?");
			ps.setString(1, estado);
			ps.setInt(2, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
	public static int eliminar(int id) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("delete from pedidos where id_pedido=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
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
