<%@page import="beans.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="scripts/users.js" type="text/javascript"></script>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
<%@include file="template/css.jsp"%>
</head>
<body >
<%System.out.println("log"+request.getRequestURI()); %>
 <% Users u=(Users)session.getAttribute("user");
 
 String path= request.getRequestURI();
 if(u!=null && ( path.equals("/GMachines1/login.jsp")|| path.equals("/GMachines1/") )) {
	 
	 
	 
 %>
  <jsp:forward page="dashboard.jsp"/>
 <%} %>
 
 <% Users user=(Users)session.getAttribute("user");
 String paths= request.getRequestURI();
 if(user==null && ( paths.equals("/GMachines1/login.jsp")|| paths.equals("/GMachines1/") )) {
	 
	 
	 
 %>
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
								<h4 class="card-title">Login</h4>
							
									<div class="form-group">
										<label for="email">E-Mail Addresse</label>
										<input id="email" type="email" class="form-control" name="email" required="required" >
										<span  id="emailF" class="error text-danger  "> email introuvable</span>
									</div>
									
									<div class="form-group">
										<label for="password">Mot de passe
										</label>
										<input id="password" type="password" class="form-control" name="password" required="">
										<span  id="passF" class="error text-danger "> mot de passe incorrecte</span>
										<div class="text-right">
											<a href="sendemail.jsp" class="small">
												Forgot Your Password?
											</a>
										</div>
									</div>
									

									<div class="form-group no-margin">
										<button id="connexion" class="btn  btn-primary btn-block">
											connexion
										</button>
									</div>
									
							
							</div>
							
						</div>
						<footer class="footer mt-3">
							<div class="container-fluid">
								<div class="footer-content text-center small">
									<span class="text-muted">&copy; By. Smyej</span>
								</div>
							</div>
						</footer>
					</div>
				</div>



			</div>

      </div>
    </main>
    <%@include file="template/js.jsp"%>
    <%} %>
</body>
</html>