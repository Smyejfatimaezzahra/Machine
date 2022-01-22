$(document).ready(function () {
	
	$("#log").click( function () {
		console.log("hhh");
		$.ajax({
	        url : "LogoutController",
	        data:{op:"deco"},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	        	console.log(data);
	        	window.location.href = "login.jsp";
	            
	            }
	       
	    });
	    });
	
});