<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrito de compras</title>
<jsp:include page="./Imports.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
<jsp:include page="./Header.jsp"></jsp:include>

<div class="px-4 px-lg-0">
  <!-- For demo purpose -->
    <h1 class="display-4">Carrito de compras</h1>
  <!-- End -->

  <div class="pb-5">
      <div class="row">
        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Producto</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Precio</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Cantidad</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Eliminar del carrito</div>
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row" class="border-0">
                    <div class="p-2">
                      <img src="http://static1.squarespace.com/static/530ba66ce4b0ce7206270234/538fbc3fe4b0ab70685f3e68/538fbca1e4b0ab70685f55cb/1517654514556/?format=1500w" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle">Torta de chorizo</a></h5><span class="text-muted font-weight-normal font-italic d-block">Categoría: Tortas</span>
                      </div>
                    </div>
                  </th>
                  <td class="border-0 align-middle"><strong>$79.00</strong></td>
                  <td class="border-0 align-middle"><strong>1</strong></td>
                  <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                </tr>
                <tr>
                  <th scope="row">
                    <div class="p-2">
                      <img src="https://d29nyx213so7hn.cloudfront.net/media/catalog/product/cache/e4d64343b1bc593f1c5348fe05efa4a6/1/6/161_coca-cola-355-ml-lata-aluminio.jpg" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"><a href="#" class="text-dark d-inline-block">Coca-cola lata 355ml</a></h5><span class="text-muted font-weight-normal font-italic">Categoría: Bebidas</span>
                      </div>
                    </div>
                  </th>
                  <td class="align-middle"><strong>$20.00</strong></td>
                  <td class="align-middle"><strong>1</strong></td>
                  <td class="align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

      <div class="row py-5 p-4 bg-white rounded shadow-sm">
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Código de cupón</div>
          <div class="p-4">
            <p class="font-italic mb-4">Si tienes un código de cupón, por favor ingrésalo ahora</p>
            <div class="input-group mb-4 border rounded-pill p-2">
              <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
              <div class="input-group-append border-0">
                <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Applicar cupón</button>
              </div>
            </div>
          </div>
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Detalles para el restaurante</div>
          <div class="p-4">
            <p class="font-italic mb-4">Detalles de tu pedido. Ej. "torta sin verdura" </p>
            <textarea name="" cols="30" rows="2" class="form-control"></textarea>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Resumen de la orden </div>
          <div class="p-4">
            <p class="font-italic mb-4">El IVA es calculado basado en todos los items del pedido, además del envío</p>
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total de la orden </strong><strong>$99.00</strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Costo de envío</strong><strong>$10.00</strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">IVA</strong><strong>$17.44</strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                <h5 class="font-weight-bold">$126.44</h5>
              </li>
            </ul><a href="./Checkout.jsp" class="btn btn-dark rounded-pill py-2 btn-block">Proceder al pago</a>
          </div>
        </div>
      </div>

    </div>
</div>

<jsp:include page="./Footer.jsp"></jsp:include>
</div>
</body>
</html>