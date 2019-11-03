package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ProductoModel;

public class ProductoDAO {

	public ProductoDAO() {
		// TODO Auto-generated constructor stub
	}
	public static List<ProductoModel> getAllRecords() {
		List <ProductoModel> lista = new ArrayList<ProductoModel>();
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement("select * from productos");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ProductoModel producto = new ProductoModel();
				producto.setId_producto(rs.getInt("id_producto"));
				producto.setNombre_producto(rs.getString("nombre_producto"));
				producto.setCategoria_producto(rs.getString("categoria_producto"));
				producto.setUrlimagen_producto(rs.getString("urlimagen_producto"));
				producto.setCantidad_producto(rs.getInt("cantidad_producto"));
				lista.add(producto);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return lista;
	}
	public static ProductoModel getRecordById(int id) {
		ProductoModel producto = new ProductoModel();
		Connection con = Conexion.getConexion();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from productos where id_producto = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				producto.setId_producto(rs.getInt("id_producto"));
				producto.setDescripcion_producto(rs.getString("descripcion_producto"));
				producto.setNombre_producto(rs.getString("nombre_producto"));
				producto.setCategoria_producto(rs.getString("categoria_producto"));
				producto.setUrlimagen_producto(rs.getString("urlimagen_producto"));
				producto.setCantidad_producto(rs.getInt("cantidad_producto"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return producto;
	}
	public static int agregar(ProductoModel producto) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement(" INSERT into productos (nombre_producto, descripcion_producto, categoria_producto, urlimagen_producto, cantidad_producto) VALUES(?, ?, ?,?,?)" );
			ps.setString(1, producto.getNombre_producto());
			ps.setString(2, producto.getDescripcion_producto());
			ps.setString(3, producto.getCategoria_producto());
			ps.setString(4, producto.getUrlimagen_producto());
			ps.setInt(5, producto.getCantidad_producto());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int actualizar(ProductoModel producto) {
		int status = 0;
		try {
			Connection con = Conexion.getConexion();
			PreparedStatement ps = con.prepareStatement(" update productos  set nombre_producto=?, descripcion_producto=?, categoria_producto=?, urlimagen_producto=?, cantidad_producto=? where id_producto=?");
			ps.setString(1, producto.getNombre_producto());
			ps.setString(2, producto.getDescripcion_producto());
			ps.setString(3, producto.getCategoria_producto());
			ps.setString(4, producto.getUrlimagen_producto());
			ps.setInt(5, producto.getCantidad_producto());
			ps.setInt(6, producto.getId_producto());
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
			PreparedStatement ps = con.prepareStatement("delete from productos where id_producto=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
