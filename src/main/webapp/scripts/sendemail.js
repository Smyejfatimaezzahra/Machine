$(document).ready(function () {
	
	$("#send").click( function () {
		var email=$("#email").val();
		console.log("hhh");
		if(email!=" ") {
			$.ajax({
		        url : "SendEmail",
		        data:{email:email},
		        type: 'POST',
		        success: function (data, textStatus, jqXHR) {
		        	console.log(data);
		        	
		            
		            } 
		        });
		}
		
	       
	   
	    });
	
	$("#envc").click( function () {
		var code=$("#code").val();
		$.ajax({
	        url : "SendEmail",
	        data:{op:"v",code:code},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	        	if(data==true) window.location.href = "dashboard.jsp";
	        	else $("").show();
	            
	            }
	       
	    });
	    });
	
	
});