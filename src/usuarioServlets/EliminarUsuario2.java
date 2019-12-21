package usuarioServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductoDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class EliminarUsuario2
 */
@WebServlet("/EliminarUsuario2")
public class EliminarUsuario2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarUsuario2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
		System.out.println("id_producto P: "+request.getParameter("id_usuario"));
		int status = UsuarioDAO.eliminar(id_usuario);
		if(status == 1) {
			response.sendRedirect(request.getContextPath()+"/jsp/AdminUsuarios.jsp?activo=AdminUsuarios");
		}
		System.out.println("no se quien soy");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
