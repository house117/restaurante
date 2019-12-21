package models;

public class EmpresaModel {
	private int id_empresa;
	private String nombre_empresa;
	private String direccion1_empresa;
	private String direccion2_empresa;
	private String urlimagen_empresa;
	private String correo_empresa;
	private String telefono1_empresa;
	private String telefono2_empresa;
	private String facebook_empresa;
	private String twitter_empresa;
	private String instagram_empresa;
	private String linkedin_empresa;
	public EmpresaModel() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public EmpresaModel(String nombre_empresa, String direccion1_empresa, String direccion2_empresa,
			String urlimagen_empresa, String correo_empresa, String telefono1_empresa, String telefono2_empresa,
			String facebook_empresa, String twitter_empresa, String instagram_empresa, String linkedin_empresa) {
		super();
		this.nombre_empresa = nombre_empresa;
		this.direccion1_empresa = direccion1_empresa;
		this.direccion2_empresa = direccion2_empresa;
		this.urlimagen_empresa = urlimagen_empresa;
		this.correo_empresa = correo_empresa;
		this.telefono1_empresa = telefono1_empresa;
		this.telefono2_empresa = telefono2_empresa;
		this.facebook_empresa = facebook_empresa;
		this.twitter_empresa = twitter_empresa;
		this.instagram_empresa = instagram_empresa;
		this.linkedin_empresa = linkedin_empresa;
	}



	public EmpresaModel(int id_empresa, String nombre_empresa, String direccion1_empresa, String direccion2_empresa,
			String urlimagen_empresa, String correo_empresa, String telefono1_empresa, String telefono2_empresa,
			String facebook_empresa, String twitter_empresa, String instagram_empresa, String linkedin_empresa) {
		super();
		this.id_empresa = id_empresa;
		this.nombre_empresa = nombre_empresa;
		this.direccion1_empresa = direccion1_empresa;
		this.direccion2_empresa = direccion2_empresa;
		this.urlimagen_empresa = urlimagen_empresa;
		this.correo_empresa = correo_empresa;
		this.telefono1_empresa = telefono1_empresa;
		this.telefono2_empresa = telefono2_empresa;
		this.facebook_empresa = facebook_empresa;
		this.twitter_empresa = twitter_empresa;
		this.instagram_empresa = instagram_empresa;
		this.linkedin_empresa = linkedin_empresa;
	}



	public int getId_empresa() {
		return id_empresa;
	}
	public void setId_empresa(int id_empresa) {
		this.id_empresa = id_empresa;
	}
	public String getNombre_empresa() {
		return nombre_empresa;
	}
	public void setNombre_empresa(String nombre_empresa) {
		this.nombre_empresa = nombre_empresa;
	}
	public String getDireccion1_empresa() {
		return direccion1_empresa;
	}
	public void setDireccion1_empresa(String direccion1_empresa) {
		this.direccion1_empresa = direccion1_empresa;
	}
	public String getDireccion2_empresa() {
		return direccion2_empresa;
	}
	public void setDireccion2_empresa(String direccion2_empresa) {
		this.direccion2_empresa = direccion2_empresa;
	}
	public String getUrlimagen_empresa() {
		return urlimagen_empresa;
	}
	public void setUrlimagen_empresa(String urlimagen_empresa) {
		this.urlimagen_empresa = urlimagen_empresa;
	}
	public String getCorreo_empresa() {
		return correo_empresa;
	}
	public void setCorreo_empresa(String correo_empresa) {
		this.correo_empresa = correo_empresa;
	}
	public String getTelefono1_empresa() {
		return telefono1_empresa;
	}
	public void setTelefono1_empresa(String telefono1_empresa) {
		this.telefono1_empresa = telefono1_empresa;
	}
	public String getTelefono2_empresa() {
		return telefono2_empresa;
	}
	public void setTelefono2_empresa(String telefono2_empresa) {
		this.telefono2_empresa = telefono2_empresa;
	}
	public String getFacebook_empresa() {
		return facebook_empresa;
	}
	public void setFacebook_empresa(String facebook_empresa) {
		this.facebook_empresa = facebook_empresa;
	}
	public String getTwitter_empresa() {
		return twitter_empresa;
	}
	public void setTwitter_empresa(String twitter_empresa) {
		this.twitter_empresa = twitter_empresa;
	}
	public String getInstagram_empresa() {
		return instagram_empresa;
	}
	public void setInstagram_empresa(String instagram_empresa) {
		this.instagram_empresa = instagram_empresa;
	}
	public String getLinkedin_empresa() {
		return linkedin_empresa;
	}
	public void setLinkedin_empresa(String linkedin_empresa) {
		this.linkedin_empresa = linkedin_empresa;
	}
	
	

}
