package models;

public class SucursalModel {
	private int id_sucursal;
	private String nombre_sucursal;
	private String direccion_sucursal;
	private String telefono_sucursal;
	private String correo_sucursal;
	private Double latitud_sucursal;
	private Double longitud_sucursal;
	public SucursalModel() {
		// TODO Auto-generated constructor stub
	}
	
	public SucursalModel(String nombre_sucursal, String direccion_sucursal, String telefono_sucursal,
			String correo_sucursal, Double latitud_sucursal, Double longitud_sucursal) {
		super();
		this.nombre_sucursal = nombre_sucursal;
		this.direccion_sucursal = direccion_sucursal;
		this.telefono_sucursal = telefono_sucursal;
		this.correo_sucursal = correo_sucursal;
		this.latitud_sucursal = latitud_sucursal;
		this.longitud_sucursal = longitud_sucursal;
	}

	public SucursalModel(int id_sucursal, String nombre_sucursal, String direccion_sucursal, String telefono_sucursal,
			String correo_sucursal, Double latitud_sucursal, Double longitud_sucursal) {
		super();
		this.id_sucursal = id_sucursal;
		this.nombre_sucursal = nombre_sucursal;
		this.direccion_sucursal = direccion_sucursal;
		this.telefono_sucursal = telefono_sucursal;
		this.correo_sucursal = correo_sucursal;
		this.latitud_sucursal = latitud_sucursal;
		this.longitud_sucursal = longitud_sucursal;
	}

	public int getId_sucursal() {
		return id_sucursal;
	}
	public void setId_sucursal(int id_sucursal) {
		this.id_sucursal = id_sucursal;
	}
	public String getNombre_sucursal() {
		return nombre_sucursal;
	}
	public void setNombre_sucursal(String nombre_sucursal) {
		this.nombre_sucursal = nombre_sucursal;
	}
	public String getDireccion_sucursal() {
		return direccion_sucursal;
	}
	public void setDireccion_sucursal(String direccion_sucursal) {
		this.direccion_sucursal = direccion_sucursal;
	}
	public String getTelefono_sucursal() {
		return telefono_sucursal;
	}
	public void setTelefono_sucursal(String telefono_sucursal) {
		this.telefono_sucursal = telefono_sucursal;
	}
	public String getCorreo_sucursal() {
		return correo_sucursal;
	}
	public void setCorreo_sucursal(String correo_sucursal) {
		this.correo_sucursal = correo_sucursal;
	}
	public Double getLatitud_sucursal() {
		return latitud_sucursal;
	}
	public void setLatitud_sucursal(Double latitud_sucursal) {
		this.latitud_sucursal = latitud_sucursal;
	}
	public Double getLongitud_sucursal() {
		return longitud_sucursal;
	}
	public void setLongitud_sucursal(Double longitud_sucursal) {
		this.longitud_sucursal = longitud_sucursal;
	}
}
