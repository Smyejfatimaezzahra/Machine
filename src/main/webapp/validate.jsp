<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Code Validation</title>


    <!-- DEMO CHARTS -->
    <link rel="stylesheet" href="public/demo/chartist.css">
    <link rel="stylesheet" href="public/demo/chartist-plugin-tooltip.css">
  
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <!-- Template -->
    <link rel="stylesheet" href="public/graindashboard/css/graindashboard.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="scripts/validate.js" type="text/javascript"></script>
</head>
<body >

   <% System.out.println(request.getHeader("Referer"));
  String path="http://localhost:8080/GMachines1/sendemail.jsp";
if( !path.equals(request.getHeader("Referer"))) { %>
 <jsp:forward page="sendemail.jsp"/>
 <%} else{ %>
 
    <main class="main">
           
      <div class="content">
        
			<div class="container-fluid pb-5">

				<div class="row justify-content-md-center">
					<div class="card-wrapper col-12 col-md-4 mt-5">
						<div class="brand text-center mb-3">
							<a href="/"><img src="public/img/images.png"></a>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 id="t" class="card-title"></h4>
								
									<div class="form-group">
										<label>Numero</label>
										<input id="code" type="text" class="form-control" >
										<span  id="invalidC" class="error text-danger">Num�ro invalid</span>
									</div>

									<div class="form-group no-margin">
										<a id="envoye_code" class="btn btn-primary btn-block">
											envoyer
										</a>
									</div>
									
							</div>
						</div>
						<footer class="footer mt-3">
							<div class="container-fluid">
								<div class="footer-content text-center small">
									<span class="text-muted">� 2019 Graindashboard. All Rights Reserved.</span>
								</div>
							</div>
						</footer>
					</div>
				</div>



			</div>

      </div>
    </main>
<%} %>

	<script src="public/graindashboard/js/graindashboard.js"></script>
    <script src="public/graindashboard/js/graindashboard.vendor.js"></script>
  
</body>
</html>