<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reccuperation mot de passe</title>
    <%@include file="template/css.jsp"%>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="scripts/users.js" type="text/javascript"></script>
</head>

<body class="">
<% System.out.println(request.getHeader("Referer"));
  String path="http://localhost:8080/GMachines1/validate.jsp";
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
								<h4 class="card-title">Reset Password</h4>
								
									<div class="form-group">
										<label for="email">Address E-Mail </label>
										<input id="email" type="email" class="form-control" name="email" required="" autofocus="">
									</div>

									<div class="form-group">
										<label for="password">Mot De Passe
										</label>
										<input id="password" type="password" class="form-control" name="password" required="">
								        <span  id="invalidP" class="error text-danger "> mot de passe incorrecte</span>	
									</div>
									
									<div class="form-group">
										<label for="password-confirm">Confirmer Mot De Passe
										</label>
										<input id="password_confirm" type="password" class="form-control" name="password_confirmation" required="">
									    <span  id="passI" class="error text-danger "> Les mots de passe ne se correspondent pas</span>
									</div>

									<div class="form-group no-margin">
										<button  id="envoyer" class="btn btn-primary btn-block">
										Envoyer
										</button>
									</div>
								
							</div>
						</div>
						<footer class="footer mt-3">
							<div class="container-fluid">
								<div class="footer-content text-center small">
									<span class="text-muted">© 2019 Graindashboard. All Rights Reserved.</span>
								</div>
							</div>
						</footer>
					</div>
				</div>



			</div>

      </div>
    </main>


	    <%@include file="template/js.jsp"%>
  <%}  %>
</body>
</html>