<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="template/css.jsp"%>
</head>
<body>

<th class="font-weight-semi-bold border-top-0 py-2">#</th>
										<th class="font-weight-semi-bold border-top-0 py-2">email</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Nom
										</th>
										<th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
	<div class="modal fade" id="myModa">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5>Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>

	<a class="unfold-link d-flex align-items-center text-nowrap" href="#"
		data-toggle="modal" data-target="#myModa"> <span
		class="unfold-item-icon mr-3"> <i class="gd-power-off"></i>
	</span> Sign Out
	</a>
	<%@include file="template/js.jsp"%>

</body>
</html>