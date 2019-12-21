package models;

public class ListaProductos {
	private ProductoModel producto;
	private int cantidad;
	public ListaProductos() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ListaProductos(ProductoModel producto, int cantidad) {
		super();
		this.producto = producto;
		this.cantidad = cantidad;
	}



	public ProductoModel getProducto() {
		return producto;
	}
	public void setProducto(ProductoModel producto) {
		this.producto = producto;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	
	
	
}
