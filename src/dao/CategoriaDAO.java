package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.CategoriasModel;

public class CategoriaDAO {

	public CategoriaDAO() {
		// TODO Auto-generated constructor stub
	}
	public static List<CategoriasModel> getAllRecords() {
		List <CategoriasModel> lista = new ArrayList<CategoriasModel>();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			 con = Conexion.getConexion();
			 ps = con.prepareStatement("select * from categorias");
			 rs = ps.executeQuery();
			while(rs.next()) {
				CategoriasModel categoria = new CategoriasModel();
				categoria.setId_categoria(rs.getInt("id_categoria"));
				categoria.setNombre_categoria(rs.getString("nombre_categoria"));
				
				lista.add(categoria);
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
	
	
}
