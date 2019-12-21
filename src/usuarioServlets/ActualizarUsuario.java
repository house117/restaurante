package usuarioServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductoDAO;
import dao.UsuarioDAO;
import models.ProductoModel;
import models.UsuarioModel;

/**
 * Servlet implementation class ActualizarUsuario
 */
@WebServlet("/ActualizarUsuario")
public class ActualizarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarUsuario() {
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
		int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
		String nombre_usuario = request.getParameter("nombre_usuario");
		String correo_usuario = request.getParameter("correo_usuario");
		String telefono_usuario = request.getParameter("telefono_usuario");
		String tipo_usuario = request.getParameter("tipo_usuario");
		String urlimagen_usuario = request.getParameter("urlimagen_usuario");
		String contrasena_usuario = request.getParameter("contrasena_usuario");
		System.out.println("id _usuario P: "+request.getParameter("id_usuario"));
		System.out.println("nombre _usuario P: "+request.getParameter("nombre_usuario"));
		System.out.println("correo_usuario P: "+request.getParameter("correo_usuario"));
		System.out.println("telefono_usuario P: "+request.getParameter("telefono_usuario"));
		System.out.println("tipo_usuario P: "+request.getParameter("tipo_usuario"));
		System.out.println("urlimagen_usuario P: "+request.getParameter("urlimagen_usuario"));
		UsuarioModel usuario = new UsuarioModel(id_usuario, nombre_usuario, correo_usuario, telefono_usuario, tipo_usuario, urlimagen_usuario, contrasena_usuario);
		int status = UsuarioDAO.actualizar(usuario);
		if(status == 1) {
			response.sendRedirect(request.getContextPath()+"/jsp/AdminProductosEditar.jsp?producto_seleccionado="+usuario.getId_usuario()+"&item_actualizado=success&activo=AdminProductos");
		}
	}

}
