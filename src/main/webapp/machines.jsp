<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des machines</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script src="scripts/machine.js" type="text/javascript"></script>
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
								<li class="breadcrumb-item"><a href="#">Machines</a></li>
								<li class="breadcrumb-item active" aria-current="page">Ajouter
									une nouvelle machine</li>
							</ol>
						</nav>
						<!-- End Breadcrumb -->

						<div class="mb-3 mb-md-4 d-flex justify-content-between">
							<div class="h3 mb-0">Nouvelle Machine</div>
						</div>


						<!-- Form -->
						<div class="">

							<div class="form-row">
								<div class="form-group col-12 col-md-6">
									<label for="reference">Reference</label> <input type="text"
										class="form-control" value="" id="reference" name="reference"
										placeholder="Reference">
										 <span  id="invalidR" class="error text-danger"> Reférence existe déja</span>
								</div>
								<div class="form-group col-12 col-md-6">
									<label for="date">Date Achat</label> <input type="date"
										class="form-control" value="" id="date" name="date"
										placeholder="Date d'achat" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-12 col-md-6">
									<label for="prix">Prix</label> <input type="text"
										class="form-control" value="" id="prix" name="prix"
										placeholder="Prix">
								</div>
								<div class="form-group col-12 col-md-6">
									<label for="salle">Salle</label> <select class="form-control"
										id="salle" name="salle">
									</select>
								</div>
							</div>

                                <div class="form-row">
								<div class="form-group col-12 col-md-6">
									<label for="prix">Marque</label> <input type="text"
										class="form-control" value="" id="marque" name="marque"
										placeholder="Marque">
								</div>
								<div class="form-group col-12 col-md-6">
									
								</div>
								
							</div>
                               <button type="submit" id="add"
								class="btn btn-primary float-right">Ajouter</button>
							
						</div>
						<!-- End Form -->


					</div>
				</div>


			</div>
			<!-- Search form -->
			<div class="row m-5 ">
			<input id="searchtxt" class="form-control w-50   " type="text"placeholder="Search" aria-label="Search">
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
								<li class="breadcrumb-item"><a href="#">Machines</a></li>
								<li class="breadcrumb-item active" aria-current="page">Tous
									les machines</li>
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
							<div class="h3 mb-0">Machines</div>
						</div>
						<div class="table-responsive-xl">
							<table class="table text-nowrap mb-0">
								<thead>
									<tr>
										<th class="font-weight-semi-bold border-top-0 py-2">#</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Référence</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Date
											d'achat</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Marque</th>
											<th class="font-weight-semi-bold border-top-0 py-2">Prix</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Salle</th>
										<th  hidden>ID</th>
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

	
<% }%>

<script src="public/graindashboard/js/graindashboard.js"></script>
	<script src="public/graindashboard/js/graindashboard.vendor.js"></script>
</body>

</html>
