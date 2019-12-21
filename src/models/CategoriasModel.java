package models;

public class CategoriasModel {
	private int id_categoria;
	private String nombre_categoria;
	public CategoriasModel() {
		// TODO Auto-generated constructor stub
	}
	
	
	public CategoriasModel(String nombre_categoria) {
		super();
		this.nombre_categoria = nombre_categoria;
	}


	public CategoriasModel(int id_categoria, String nombre_categoria) {
		super();
		this.id_categoria = id_categoria;
		this.nombre_categoria = nombre_categoria;
	}


	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getNombre_categoria() {
		return nombre_categoria;
	}
	public void setNombre_categoria(String nombre_categoria) {
		this.nombre_categoria = nombre_categoria;
	}
	

}