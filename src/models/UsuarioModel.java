package models;

public class UsuarioModel {
	private int id_usuario;
	private String nombre_usuario;
	private String correo_usuario;
	private String telefono_usuario;
	private String tipo_usuario;
	private String urlimagen_usuario;
	private String contrasena_usuario;
	public UsuarioModel() {
		// TODO Auto-generated constructor stub
	}
	
	
	public UsuarioModel(String nombre_usuario, String correo_usuario, String telefono_usuario, String tipo_usuario,
			String urlimagen_usuario, String contrasena_usuario) {
		super();
		this.nombre_usuario = nombre_usuario;
		this.correo_usuario = correo_usuario;
		this.telefono_usuario = telefono_usuario;
		this.tipo_usuario = tipo_usuario;
		this.urlimagen_usuario = urlimagen_usuario;
		this.contrasena_usuario = contrasena_usuario;
	}


	public UsuarioModel(int id_usuario, String nombre_usuario, String correo_usuario, String telefono_usuario,
			String tipo_usuario, String urlimagen_usuario, String contrasena_usuario) {
		super();
		this.id_usuario = id_usuario;
		this.nombre_usuario = nombre_usuario;
		this.correo_usuario = correo_usuario;
		this.telefono_usuario = telefono_usuario;
		this.tipo_usuario = tipo_usuario;
		this.urlimagen_usuario = urlimagen_usuario;
		this.contrasena_usuario = contrasena_usuario;
	}


	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	public String getCorreo_usuario() {
		return correo_usuario;
	}
	public void setCorreo_usuario(String correo_usuario) {
		this.correo_usuario = correo_usuario;
	}
	public String getTelefono_usuario() {
		return telefono_usuario;
	}
	public void setTelefono_usuario(String telefono_usuario) {
		this.telefono_usuario = telefono_usuario;
	}
	public String getTipo_usuario() {
		return tipo_usuario;
	}
	public void setTipo_usuario(String tipo_usuario) {
		this.tipo_usuario = tipo_usuario;
	}
	public String getUrlimagen_usuario() {
		return urlimagen_usuario;
	}
	public void setUrlimagen_usuario(String urlimagen_usuario) {
		this.urlimagen_usuario = urlimagen_usuario;
	}
	public String getContrasena_usuario() {
		return contrasena_usuario;
	}
	public void setContrasena_usuario(String contrasena_usuario) {
		this.contrasena_usuario = contrasena_usuario;
	}
	
	
	
	
}
