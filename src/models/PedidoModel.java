package models;

import java.sql.Timestamp;


public class PedidoModel {
	private int id_pedido;
	private String productosycant_pedido;
	private String detalles_pedido;
	private Timestamp fecha_pedido;
	private String usuario_pedido;
	private String estado_pedido;
	private String dir1_pedido;
	private String dir2_pedido;
	private String zipcode_pedido;
	private double total_pedido;
	private double iva_pedido;
	public PedidoModel() {
		// TODO Auto-generated constructor stub
	}

	
	
	public PedidoModel(String productosycant_pedido, String detalles_pedido, Timestamp fecha_pedido,
			String usuario_pedido, String estado_pedido, String dir1_pedido, String dir2_pedido,
			String zipcode_pedido) {
		super();
		this.productosycant_pedido = productosycant_pedido;
		this.detalles_pedido = detalles_pedido;
		this.fecha_pedido = fecha_pedido;
		this.usuario_pedido = usuario_pedido;
		this.estado_pedido = estado_pedido;
		this.dir1_pedido = dir1_pedido;
		this.dir2_pedido = dir2_pedido;
		this.zipcode_pedido = zipcode_pedido;
	}


 

	public PedidoModel(String productosycant_pedido, String detalles_pedido, Timestamp fecha_pedido,
			String usuario_pedido, String estado_pedido, String dir1_pedido, String dir2_pedido, String zipcode_pedido,
			double total_pedido, double iva_pedido) {
		super();
		this.productosycant_pedido = productosycant_pedido;
		this.detalles_pedido = detalles_pedido;
		this.fecha_pedido = fecha_pedido;
		this.usuario_pedido = usuario_pedido;
		this.estado_pedido = estado_pedido;
		this.dir1_pedido = dir1_pedido;
		this.dir2_pedido = dir2_pedido;
		this.zipcode_pedido = zipcode_pedido;
		this.total_pedido = total_pedido;
		this.iva_pedido = iva_pedido;
	}



	public PedidoModel(int id_pedido, String productosycant_pedido, String detalles_pedido, Timestamp fecha_pedido,
			String usuario_pedido, String estado_pedido, String dir1_pedido, String dir2_pedido, String zipcode_pedido,
			double total_pedido, double iva_pedido) {
		super();
		this.id_pedido = id_pedido;
		this.productosycant_pedido = productosycant_pedido;
		this.detalles_pedido = detalles_pedido;
		this.fecha_pedido = fecha_pedido;
		this.usuario_pedido = usuario_pedido;
		this.estado_pedido = estado_pedido;
		this.dir1_pedido = dir1_pedido;
		this.dir2_pedido = dir2_pedido;
		this.zipcode_pedido = zipcode_pedido;
		this.total_pedido = total_pedido;
		this.iva_pedido = iva_pedido;
	}



	public double getTotal_pedido() {
		return total_pedido;
	}



	public void setTotal_pedido(double total_pedido) {
		this.total_pedido = total_pedido;
	}



	public double getIva_pedido() {
		return iva_pedido;
	}



	public void setIva_pedido(double iva_pedido) {
		this.iva_pedido = iva_pedido;
	}



	public int getId_pedido() {
		return id_pedido;
	}

	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}

	public String getProductosycant_pedido() {
		return productosycant_pedido;
	}

	public void setProductosycant_pedido(String productosycant_pedido) {
		this.productosycant_pedido = productosycant_pedido;
	}

	public String getDetalles_pedido() {
		return detalles_pedido;
	}

	public void setDetalles_pedido(String detalles_pedido) {
		this.detalles_pedido = detalles_pedido;
	}

	public Timestamp getFecha_pedido() {
		return fecha_pedido;
	}

	public void setFecha_pedido(Timestamp fecha_pedido) {
		this.fecha_pedido = fecha_pedido;
	}

	public String getUsuario_pedido() {
		return usuario_pedido;
	}

	public void setUsuario_pedido(String usuario_pedido) {
		this.usuario_pedido = usuario_pedido;
	}

	public String getEstado_pedido() {
		return estado_pedido;
	}

	public void setEstado_pedido(String estado_pedido) {
		this.estado_pedido = estado_pedido;
	}

	public String getDir1_pedido() {
		return dir1_pedido;
	}

	public void setDir1_pedido(String dir1_pedido) {
		this.dir1_pedido = dir1_pedido;
	}

	public String getDir2_pedido() {
		return dir2_pedido;
	}

	public void setDir2_pedido(String dir2_pedido) {
		this.dir2_pedido = dir2_pedido;
	}

	public String getZipcode_pedido() {
		return zipcode_pedido;
	}

	public void setZipcode_pedido(String zipcode_pedido) {
		this.zipcode_pedido = zipcode_pedido;
	}
	
	
}
