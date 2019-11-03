<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8" />
<jsp:include page="./Imports.jsp"></jsp:include>

<title>Restaurante</title>
</head>
<style>
.dj {
	display: -ms-grid;
	display: grid
}

.dk {
	grid-gap: 40px 24px
}

.dl {
	-ms-grid-columns: repeat(3, 1fr);
	grid-template-columns: repeat(3, 1fr)
}
ul {
	list-style-type:none;
}
</style>
<body>

	<div class="container-fluid">
		<jsp:include page="./HeaderLogged.jsp"></jsp:include>
		<ul class="list-inline">
   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="#">Tortas</a></li>
   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="#">Refrescos</a></li>
   <li class="list-inline-item"><a class="social-icon text-xs-center" target="_blank" href="#">Tostadas</a></li>
</ul>
		<ul><!-- GENERAL MENU DIV -->
			<li><!--  KIND OF MENU LI -->
				<h2>Tortas</h2>
				<ul class="dj dk dl "><!-- LIST OF THE SAME KIND -->
				<div class=" card mb-3 " style="max-width: 540px;"><!-- Menu card -->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Torta de Chorizo</h5>
								<p class="card-text">Chorizo, mayonesa, lechuga, cebolla y rajas entre dos panes tipo telera</p>
								<p class="card-text">
									<small class="text-muted">$56</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				<div class="card mb-3" style="max-width: 540px;"><!-- Menu card -->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Torta de Chorizo</h5>
								<p class="card-text">Chorizo, mayonesa, lechuga, cebolla y rajas entre dos panes tipo telera</p>
								<p class="card-text">
									<small class="text-muted">$56</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				<div class="card mb-3" style="max-width: 540px;"><!-- Menu card -->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Torta de Chorizo</h5>
								<p class="card-text">Chorizo, mayonesa, lechuga, cebolla y rajas entre dos panes tipo telera</p>
								<p class="card-text">
									<small class="text-muted">$56</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				<div class="card mb-3" style="max-width: 540px;"><!-- Menu card -->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Torta de Chorizo</h5>
								<p class="card-text">Chorizo, mayonesa, lechuga, cebolla y rajas entre dos panes tipo telera</p>
								<p class="card-text">
									<small class="text-muted">$56</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				<div class="card mb-3" style="max-width: 540px;"><!-- Menu card -->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Torta de Chorizo</h5>
								<p class="card-text">Chorizo, mayonesa, lechuga, cebolla y rajas entre dos panes tipo telera</p>
								<p class="card-text">
									<small class="text-muted">$56</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				<div class="card mb-3" style="max-width: 540px;"><!-- Menu card -->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Torta de Chorizo</h5>
								<p class="card-text">Chorizo, mayonesa, lechuga, cebolla y rajas entre dos panes tipo telera</p>
								<p class="card-text">
									<small class="text-muted">$56</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				</ul><!-- LIST OF THE SAME KIND -->
			</li><!-- KIND OF MENU LI -->
			<li><!--  KIND OF MENU LI 2-->
				<h2>Bebidas</h2>
				<ul class="dj dk dl "><!-- LIST OF THE SAME KIND 2-->
				<div class=" card mb-3 " style="max-width: 540px;"><!-- Menu card 2-->
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="https://d29nyx213so7hn.cloudfront.net/media/catalog/product/cache/e4d64343b1bc593f1c5348fe05efa4a6/1/6/161_coca-cola-355-ml-lata-aluminio.jpg" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Coca-Cola lata 355 ml</h5>
								<p class="card-text">Refresco sabor cola de 355ml</p>
								<p class="card-text">
									<small class="text-muted">$20</small>
									<button class="btn btn-primary float-right">Agregar al carrito <i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
								</p>
							</div>
						</div>
					</div>
				</div><!-- Menu card -->
				
				</ul><!-- LIST OF THE SAME KIND -->
			</li><!-- KIND OF MENU LI -->
		</ul><!-- GENERAL MENU DIV -->
		<jsp:include page="./Footer.jsp"></jsp:include>
	</div>
	<!-- Container -->

</body>
</html>
