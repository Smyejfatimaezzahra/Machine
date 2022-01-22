<%@page import="beans.Salle"%>
<%@page import="service.SalleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des salles</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script src="scripts/salle.js" type="text/javascript"></script>
<%@include file="template/css.jsp"%>
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">
<%response.setHeader("cache-control", " no-cache,no-store,must-revalidate");
Users u = (Users) session.getAttribute("user");
	if(u==null){
	%>
	<jsp:forward page="login.jsp"/>
	 <% }else {  %>
	<!-- Header -->
	<%@include file="template/header.jsp"%>
	<main class="main">
		<!-- Sidebar Nav -->
		<%@include file="template/menu.jsp"%>
		<!-- End Sidebar Nav -->

		<div class="content">
			<div class="py-4 px-3 px-md-4">
				<div class="card mb-3 mb-md-4">

					<div class="card-body shadow">
						<!-- Breadcrumb -->
						<nav class="d-none d-md-block" aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Salles</a></li>
								<li class="breadcrumb-item active" aria-current="page">Ajouter
									une nouvelle salle</li>
							</ol>
						</nav>
						<!-- End Breadcrumb -->

						<div class="mb-3 mb-md-4 d-flex justify-content-between">
							<div class="h3 mb-0">Nouvelle Salle</div>
						</div>


						<!-- Form -->
						<div>

							<div class="form-row">
								<div class="form-group col-12 col-md-6">
									<label for="code">Code</label> <input type="text"
										class="form-control" value="" id="code" name="code"
										placeholder="Code">
										 <span  id="invalidC" class="error text-danger"> Code existe deja</span>
								</div>
								<div class="form-group col-12 col-md-6">
									<label for="typet">Type</label> <input type="text"
										class="form-control" value="" id="type" name="type"
										placeholder="Type">
								</div>
							</div>



							<button type="submit" id="add"
								class="btn btn-primary float-right">Ajouter</button>

						</div>
						<!-- End Form -->


					</div>
				</div>


			</div>
			<div class="row m-5">
			<input id="searchtxt" class="form-control w-50  " type="text"placeholder="Search" aria-label="Search">
			<button id=search class=" link-dark d-inline-block border-0 btn-primary p-1" style=";width: 5%; "><svg style="color:white" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
             <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg></button> 
				</div>
			<div class="py-4 px-3 px-md-4 5">
				<div class="card mb-3 mb-md-4">

					<div class="card-body shadow">
						<!-- Breadcrumb -->
						<nav class="d-none d-md-block" aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Salles</a></li>
								<li class="breadcrumb-item active" aria-current="page">Tous
									les salles</li>
							</ol>
							<ol class="breadcrumb float-right">
							<li class="breadcrumb-item active" aria-current="page">
								  <button id="refresh" class="delete link-dark d-inline-block border-0 bg-transparent ">
								  <i class="gd-reload"></i>
								  </button>
								</li>
							</ol>
						</nav>
						<!-- End Breadcrumb -->

						<div class="mb-3 mb-md-4 d-flex justify-content-between">
							<div class="h3 mb-0">Salles</div>
						</div>
						<div class="table-responsive-xl">
							<table class="table text-nowrap mb-0">
								<thead>
									<tr>
										<th class="font-weight-semi-bold border-top-0 py-2">#</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Code</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Type
										</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
									</tr>
								</thead>
								<tbody id="content">

								</tbody>
							</table>
						</div>


					</div>
				</div>
			</div>

			<!-- Footer -->
			<%@include file="template/footer.jsp"%>
			<!-- End Footer -->
		</div>
	</main>


	<script src="public/graindashboard/js/graindashboard.js"></script>
	<script src="public/graindashboard/js/graindashboard.vendor.js"></script>
<% }%>
</body>

</html>
