package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import dao.UsuarioDAO;
import models.UsuarioModel;

/**
 * Servlet implementation class LoginController2
 */
@WebServlet("/LoginController2")
public class LoginController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String correo_usuario = request.getParameter("correo_usuario");
		String contrasena_usuario = request.getParameter("contrasena_usuario");
		System.out.println("Usuario: "+correo_usuario+" | Clave: "+contrasena_usuario);
		
		if(LoginDAO.login(correo_usuario,contrasena_usuario) == 1) {
			if(LoginDAO.checkUserType(correo_usuario, contrasena_usuario).equals("Administrador")){
				HttpSession sesion = request.getSession();
				UsuarioModel usuario = UsuarioDAO.getRecordByCorreo(correo_usuario);
				//sesion.setAttribute("normalUser", correo_usuario);
				sesion.setAttribute("usuarioProfPic", usuario.getUrlimagen_usuario());
				sesion.setAttribute("usuarioNombre", usuario.getNombre_usuario());
				sesion.setAttribute("tipoUsuario", usuario.getTipo_usuario());
				sesion.setAttribute("user", correo_usuario);
				//setting session to expire in 1 hr
				sesion.setMaxInactiveInterval(60*60);
				Cookie userName = new Cookie("user", correo_usuario);
				userName.setMaxAge(60*60);
				response.addCookie(userName);
				response.sendRedirect(request.getContextPath()+"/jsp/AdminPedidos.jsp?activo=AdminPedidos");
				System.out.println("Inicio de sesión como admin Exitoso");
			}else if(LoginDAO.checkUserType(correo_usuario, contrasena_usuario).equals("Usuario")) {
				HttpSession sesion = request.getSession();
				UsuarioModel usuario = UsuarioDAO.getRecordByCorreo(correo_usuario);
				sesion.setAttribute("normalUser", correo_usuario);
				sesion.setAttribute("usuarioProfPic", usuario.getUrlimagen_usuario());
				sesion.setAttribute("usuarioNombre", usuario.getNombre_usuario());
				sesion.setAttribute("tipoUsuario", usuario.getTipo_usuario());
				//setting session to expire in 1 hr
				sesion.setMaxInactiveInterval(60*60);
				Cookie userName = new Cookie("normalUser", correo_usuario);
				
				userName.setMaxAge(60*60);
				response.addCookie(userName);
				response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?activo=AdminPedidos");
				System.out.println("Inicio de sesión como user exitoso");
			}
			
		} else {

			if(request.getParameter("proveniente").equals("Administrador")){
				System.out.println("Inicio de sesión fallido");
				response.sendRedirect(request.getContextPath()+"/jsp/AdminLogin.jsp?loginError=true");
			}else if(request.getParameter("proveniente").equals("Usuario")) {
				System.out.println("Inicio de sesión fallido");
				response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?loginError=true&activo=Inicio");
			}
			
		}
	}

}
