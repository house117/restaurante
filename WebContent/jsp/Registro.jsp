<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        <title>Registro</title>
        <jsp:include page="./Imports.jsp"></jsp:include>
    </head>
    <style>
        .social-link {
            width: 30px;
            height: 30px;
            border: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #666;
            border-radius: 50%;
            transition: all 0.3s;
            font-size: 0.9rem;
        }

        .social-link:hover,
        .social-link:focus {
            background: #ddd;
            text-decoration: none;
            color: #555;
        }
    </style>

    <% 
    //allow access only if session exists 
    String user = null; 
    if
    (session.getAttribute("normalUser") == null) { } 
    else{
    response.sendRedirect(request.getContextPath()+"/jsp/Landing.jsp?activo=Inicio");
    user = (String) session.getAttribute("normalUser"); 
    } %>

    <body>
        <jsp:include page="./Header.jsp"></jsp:include>
        <!-- Page content holder -->
        <div class="page-content p-5" id="content">
            <!-- Demo content -->

            <div class=" cointainer p-3 mb-2 bg-light text-dark">
                <!-- MODAL UPDATED -->
                <div id="createdModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button
                                    type="button"
                                    class="close"
                                    data-dismiss="modal"
                                    aria-hidden="true"
                                >
                                    &times;
                                </button>
                                <h4 class="modal-title">BIENVENID@</h4>
                            </div>
                            <div class="modal-body">
                                <p>
                                    ¡Felicidades! Tu cuenta se ha creado con
                                    éxito, gracias por unirte a nuestra página
                                </p>
                                <p class="text-warning">
                                    <small
                                        >¿Tienes hambre? ¡Inicia sesión y
                                        empieza a realizar pedidos!</small
                                    >
                                </p>
                            </div>
                            <div class="modal-footer">
                                <a
                                    class="btn btn-primary"
                                    href="./Landing.jsp?activo=Inicio"
                                    role="button"
                                    >Ir a inicio</a
                                >
                            </div>
                        </div>
                    </div>
                </div>

                <!-- MODAL -->
                <h1>Registro</h1>
                <form
                    onSubmit="return checkPassword(this)"
                    action="<%=request.getContextPath()%>/AgregarUsuario2"
                    method="POST">
                    <div class="form-group">
                        <label for="nombreProducto">Tu nombre</label>
                        <input
                            type="text"
                            class="form-control"
                            id="nombreProducto"
                            name="nombre_usuario"
                            placeholder="Escribe tu nombre completo"
                        />
                    </div>
                    <div class="form-group">
                        <label for="email">Tu correo electr&oacute;nico</label>
                        <input
                            type="email"
                            class="form-control"
                            id="email"
                            placeholder="ejemplo@ejemplo.com"
                            name="correo_usuario"
                        />
                    </div>
                    <div class="form-group">
                        <label for="cantidad"
                            >Tu tel&eacute;fono (en caso de tener que
                            contactarte)</label
                        >
                        <input
                            type="tel"
                            class="form-control"
                            id="cantidad"
                            name="telefono_usuario"
                            placeholder="Ej. 9511997104"
                        />
                    </div>
                    <input
                        type="hidden"
                        id="custId"
                        name="tipo_usuario"
                        value="Usuario"
                    />
                    <input
                        type="hidden"
                        id="custId"
                        name="tipoUsuario"
                        value="Usuario"
                    />
                    <div class="form-group">
                        <label for="email"
                            >URL Imagen de usuario (personaliza tu
                            perfil)</label
                        >
                        <input
                            type="url"
                            class="form-control"
                            id="email"
                            placeholder="www.imagenes.com/imagen"
                            name="urlimagen_usuario"
                        />
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Contrase&ntilde;a</label>
                        <input
                            type="password"
                            class="form-control"
                            id="contrasena"
                            name="contrasena_usuario"
                            placeholder="Contrase&ntilde;a"
                        />
                    </div>
                    <div class="form-group">
                        <label for="contrasena">Confirmar contrase&ntilde;a</label>
                        <input
                            type="password"
                            class="form-control"
                            id="contrasena2"
                            name="contrasena_usuario2"
                            placeholder="Contrase&ntilde;a"
                        />
                    </div>

                    <p align="right">
                        <button
                            class="btn btn-primary agregar"
                            type="submit"
                            id="agregar-btn"
                        >
                            Registrarse
                        </button>
                    </p>
                </form>
            </div>
        </div>
        <jsp:include page="./Footer.jsp"></jsp:include>
    </body>

    <script>
        var success = false;
        $(document).ready(function() {
            var url_string = window.location.href;
            var url = new URL(url_string);
            var c = url.searchParams.get("usuario_creado");
            console.log(c);
            if (c == "success") {
                console.log("it worked");
                $("#createdModal").modal();
            }
        });
        // Function to check Whether both passwords
        // is same or not.
        function checkPassword(form) {
            password1 = form.contrasena_usuario.value;
            password2 = form.contrasena_usuario2.value;

            // If password not entered
            if (password1 == "") {
                alert("Por favor introduzca la contrasena");
                return false;
            }

            // If confirm password not entered
            else if (password2 == "") {
                alert("Por favor confirme la contraseï¿½a");
                return false;
            }

            // If Not same return False.
            else if (password1 != password2) {
                alert("\nLas contraseï¿½as no coinciden, intente de nuevo");
                return false;
            }

            // If same return True.
            else {
                //alert("Password Match: Welcome to GeeksforGeeks!")
                return true;
            }
        }
    </script>
</html>
