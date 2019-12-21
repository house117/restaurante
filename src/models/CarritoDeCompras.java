package models;

import java.util.ArrayList;

public class CarritoDeCompras {
	private ArrayList<ListaProductos> listaProductos = new ArrayList<ListaProductos>();
	public CarritoDeCompras() {
		// TODO Auto-generated constructor stub
	}
	public Boolean agregar(ProductoModel producto) {
		Boolean encontrado = false;
		for (int i = 0; i < listaProductos.size(); i++) {
			if(listaProductos.get(i).getProducto().getNombre_producto().equals(producto.getNombre_producto())) {
				if(listaProductos.get(i).getProducto().getCantidad_producto() <= 0) {
					return false;
				}else {
					listaProductos.get(i).setCantidad(listaProductos.get(i).getCantidad()+1);
					listaProductos.get(i).getProducto().setCantidad_producto(listaProductos.get(i).getProducto().getCantidad_producto()-1);
					return true;
				}
			}
		}
		if(!encontrado) {
			if(producto.getCantidad_producto() > 0) {
				System.out.println("Cantidad producto: "+producto.getCantidad_producto());
				producto.setCantidad_producto(producto.getCantidad_producto()-1);
				listaProductos.add(new ListaProductos(producto, 1));
				//listaProductos.get(i).getProducto().setCantidad_producto(listaProductos.get(i).getProducto().getCantidad_producto()-1);
				return true;
			}else {
				return false;
			}
			
		}
		System.out.println("No deberías llegar aquí nunca papá.");
		return false;
	}
	public Boolean remover(ProductoModel producto) {
		for (int i = 0; i < listaProductos.size(); i++) {
			if(listaProductos.get(i).getProducto().getNombre_producto().equals(producto.getNombre_producto())) {
				if(listaProductos.get(i).getCantidad() == 1) {
					listaProductos.remove(i);
					return true; //No debería poder llegar aquí jejejjejjje
				}else {
					listaProductos.get(i).setCantidad(listaProductos.get(i).getCantidad()-1);
					listaProductos.get(i).getProducto().setCantidad_producto(listaProductos.get(i).getProducto().getCantidad_producto()+1);
					return true;
				}
			}
		}
		System.out.println("No deberías llegar aquí nunca papá.");
		return false;
	}
	public double getTotal() {
		double total = 0;
		for (int i = 0; i< listaProductos.size(); i++) {
			total += (this.listaProductos.get(i).getCantidad()*this.listaProductos.get(i).getProducto().getPrecio_producto());
		}
		return total;
	}
	public double getIva() {
		double total = 0;
		for (int i = 0; i< listaProductos.size(); i++) {
			total += (this.listaProductos.get(i).getCantidad()*this.listaProductos.get(i).getProducto().getPrecio_producto());
		}
		return total*0.16;
	}
	public double getTotalPlusIva() {
		double total = 0;
		for (int i = 0; i< listaProductos.size(); i++) {
			total += (this.listaProductos.get(i).getCantidad()*this.listaProductos.get(i).getProducto().getPrecio_producto());
		}
		return total+(total*0.16);
	}
	public double getCostoEnvio() {
		if(getTotal() > 150.0) {
			return 0.0;
		}else {
			return 40;
		}
	}
	public void limpiar() {
		listaProductos = new ArrayList<ListaProductos>();
	}
	public ArrayList<ListaProductos> getListaProductos() {
		return listaProductos;
	}
	public void setListaProductos(ArrayList<ListaProductos> listaProductos) {
		this.listaProductos = listaProductos;
	}
	public CarritoDeCompras(ArrayList<ListaProductos> listaProductos) {
		super();
		this.listaProductos = listaProductos;
	}
	
	
	
}
