<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sobre nosotros</title>
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
<body>
<jsp:include page="./Header.jsp"></jsp:include>
	<div class="bg-light">
		<div class="container py-5">
			<div class="row h-100 align-items-center py-5">
				<div class="col-lg-6">
					<h1 class="display-4">Mega Tortas</h1>
					<p class="lead text-muted mb-0">Somos los amos de la torta :3, a través de los años nos hemos preocupado por llevarle
					las mejores tortas hasta su mensa, desde 1834, MegaTortas ha complacido a toda las personas de la galaxia, haciéndose
					el puesto de tortas número uno a nivel universal, nuestras tortas no tienen igual.</p>
					<p class="lead text-muted">
						Creado por <a href="https://house-soft.000webhostapp.com/"
							class="text-muted"> <u>House-Soft</u></a>
					</p>
				</div>
				<div class="col-lg-6 d-none d-lg-block">
					<img
						src="https://d1nsq2txwd94q7.cloudfront.net/public/files/production/recipes/images/2426/fancy/r_2426_1550833501.jpg"
						alt="" class="rounded img-fluid">
				</div>
			</div>
		</div>
	</div>

	<div class="bg-white py-5">
		<div class="container py-5">
			<div class="row align-items-center mb-5">
				<div class="col-lg-6 order-2 order-lg-1">
					<i class="fa fa-handshake-o fa-2x mb-3 text-primary"></i>
					<h2 class="font-weight-light">Ponte en contacto con nosotros</h2>
					<p class="font-italic text-muted mb-4">A través de nuestras redes sociales, puedes interactuar con MegaTortas :)</p>
					<ul class="social mb-0 list-inline mt-3">
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-facebook-f"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					<!-- <a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Learn
						More</a> -->
				</div>
				<div class="col-lg-5 px-5 mx-auto order-1 order-lg-2">
					<img
						src="https://res.cloudinary.com/mhmd/image/upload/v1556834139/img-1_e25nvh.jpg"
						alt="" class="img-fluid mb-4 mb-lg-0">
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col-lg-5 px-5 mx-auto">
					<img
						src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/img-2_vdgqgn.jpg"
						alt="" class="img-fluid mb-4 mb-lg-0">
				</div>
				<div class="col-lg-6">
					<i class="fa  fa-bolt fa-2x mb-3 text-primary"></i>
					<h2 class="font-weight-light">Nuevo sistema de tienda online</h2>
					<p class="font-italic text-muted mb-4">Sólo haz tu pedido y la torta llega a tu mesa.</p>
					<a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Ordena AHORA</a>
				</div>
			</div>
		</div>
	</div>

	<div class="bg-light py-5">
		<div class="container py-5">
			<div class="row mb-4">
				<div class="col-lg-5">
					<h2 class="display-4 font-weight-light">Mega Tortas Team</h2>
					<p class="font-italic text-muted">Leyendas de la torta</p>
				</div>
			</div>

			<div class="row text-center">
				<!-- Team item-->
				<div class="col-xl-3 col-sm-6 mb-5">
					<div class="bg-white rounded shadow-sm py-5 px-4">
						<img
							src="https://res.cloudinary.com/mhmd/image/upload/v1556834132/avatar-4_ozhrib.png"
							alt="" width="100"
							class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
						<h5 class="mb-0">Ponciana Jiménez</h5>
						<span class="small text-uppercase text-muted">CEO - Founder</span>
						<ul class="social mb-0 list-inline mt-3">
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-facebook-f"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- End-->

				<!-- Team item-->
				<div class="col-xl-3 col-sm-6 mb-5">
					<div class="bg-white rounded shadow-sm py-5 px-4">
						<img
							src="https://res.cloudinary.com/mhmd/image/upload/v1556834130/avatar-3_hzlize.png"
							alt="" width="100"
							class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
						<h5 class="mb-0">Bill Gates</h5>
						<span class="small text-uppercase text-muted">CEO - Founder</span>
						<ul class="social mb-0 list-inline mt-3">
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-facebook-f"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- End-->

				<!-- Team item-->
				<div class="col-xl-3 col-sm-6 mb-5">
					<div class="bg-white rounded shadow-sm py-5 px-4">
						<img
							src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-2_f8dowd.png"
							alt="" width="100"
							class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
						<h5 class="mb-0">Zacarías Piedras del Río</h5>
						<span class="small text-uppercase text-muted">CEO - Founder</span>
						<ul class="social mb-0 list-inline mt-3">
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-facebook-f"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- End-->

				<!-- Team item-->
				<div class="col-xl-3 col-sm-6 mb-5">
					<div class="bg-white rounded shadow-sm py-5 px-4">
						<img
							src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-1_s02nlg.png"
							alt="" width="100"
							class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
						<h5 class="mb-0">Alan Brito</h5>
						<span class="small text-uppercase text-muted">CEO - Founder</span>
						<ul class="social mb-0 list-inline mt-3">
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-facebook-f"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-twitter"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item"><a href="#" class="social-link"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- End-->

			</div>
		</div>
	</div>
	<jsp:include page="./Footer.jsp"></jsp:include>
</body>
</html>