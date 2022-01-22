$(document).ready(function () {
	
	$("#invalidC").hide();
	  
	$("#envoye_code").click( function () {
		var code=$("#code").val();
		
		$.ajax({
	        url : "SendEmail",
	        data:{op:"v",code:code},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	        	console.log(data);
	        	if(data==true) window.location.href = "recupassword.jsp";
	        	else {
	        		$("#invalidC").show();
	        		$("#code").css({'border' : '1px solid red'});
	        	}
	            
	            }
	       
	    });
	    });
	$("#code").click(function(){
		$("#invalidC").hide();
		$(this).css({'border' : '1px solid blue'});
		});
	
	
});