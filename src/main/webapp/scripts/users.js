$(document).ready(function () {
	$("#emailF").hide();
	$("#passF").hide();
	$("#invalidE").hide();
	$("#invalidP").hide();
	$("#passI").hide();
	var id;
    var idU;
	 $.ajax({
	        url : "UsersController",
	        data:{op:"load"},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	            remplirTable(data);
	            
	            }
	       
	    });
	$("#connexion ").click(function () {
    	var email=$("#email").val();
    	var password=$("#password").val();
    	
       $.ajax({
            url: "UsersController",
            data: {op: "connexion", email:email, password:password},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                if(data[0]==true) {
                	
                	window.location.href = "dashboard.jsp";
                }
               
                
              if(data=='falseE') {
            	  $("#emailF").show();
            	  $('#email').css({'border' : '1px solid red'}); //this line is added before focus
            	  
              }
              if(data=='falseP' && data!="") {
            	  $("#passF").show();
            	  $('#password').css({'border' : '1px solid red'}); //this line is added before focus
           	 
              }

                	                
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });

    });
	
	
	$("#envoyer ").click(function () {
    	var email=$("#email").val();
    	var password=$("#password").val();
    	var passc=$("#password_confirm").val();
    	 if(password.length<8 && password!="") {
    		 $("#invalidP").show();
    		  $('#password').css({'border' : '1px solid red'});
          	  
    	 }
         if(passc!=password) {
        	 $("#passI").show();
        	 $('#password_confirm').css({'border' : '1px solid red'});
        	  
         }
         if(  password.length>=8  && passc==password) {
        	  
        	 $.ajax({
                 url: "UsersController",
                 data: {op: "recu", email:email, password:password},
                 type: 'POST',
                 success: function (data, textStatus, jqXHR) {
                     window.location.href = "login.jsp";
                     	                
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                     console.log(textStatus);
                 }
             });

         }
        	 
    });
	
	
	$("#create").click(function () {
    	var email=$("#email").val();
    	var password=$("#password").val();
    	var passc=$("#password_confirm").val();
    	var nom=$("#name").val();
    	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    	
    	  if(!emailReg.test(email) ) {
    		  console.log(email);
    		  $("#invalidE").show();
    		  $('#email').css({'border' : '1px solid red'}); //this line is added before focus
          	   
    	  }
    	 if(password.length<8 && password!="") {
    		 $("#invalidP").show();
    		  $('#password').css({'border' : '1px solid red'}); //this line is added before focus
          	  
    	 }
          if(passc!=password) {
        	  $("#passI").show();
        	  $('#password_confirm').css({'border' : '1px solid red'}); //this line is added before focus
          	  
          }
    		
          if(emailReg.test(email) &&  password.length>=8  && passc==password && nom!="") {
        	
        	  if(id==null )
        	  {
        		 
        		  
        			  $.ajax({
        			  
        			  url: "UsersController",
                      data: {op: "create", email:email, password:password,nom:nom},
                      type: 'POST',
                      success: function (data, textStatus, jqXHR) {
                    	  console.log(data);
                    	  if(data==true) {
                    		  $("#invalidE").show();
                    		  $('#email').css({'border' : '1px solid red'}); //this line is added before focus
                          	  
                    	  }
                    	  else {
                    		  remplirTable(data);
                    	    console.log(data);
                    	  $("#email").val('');
                    	  $("#password").val('');
                    	  $("#password_confirm").val('');
                    	  $("#name").val('');
                    	 }
                    	  
                      },
                      error: function (jqXHR, textStatus, errorThrown) {
                          console.log(textStatus);
                      }
                  });
        			  
        		  
        		 
        	  }
        	  else {
        		
        			  
        			  $.ajax({
            			  
            			  url: "UsersController",
                          data: {id:id, email:email, password:password,nom:nom},
                          type: 'POST',
                          success: function (data, textStatus, jqXHR) {
                        	  if(data==true) {
                        		  $("#invalidE").show();
                        		  $('#email').css({'border' : '1px solid red'}); //this line is added before focus
                              	  
                        	  }
                        	  else {
                        		  remplirTable(data);
                        	  
                        	  $("#email").val('');
                        	  $("#password").val('');
                        	  $("#password_confirm").val('');
                        	  $("#name").val('');
                        	  $("#create").text("Ajouter");
                        	  }
                        	  
                         
                        	  
                          },
                          error: function (jqXHR, textStatus, errorThrown) {
                              console.log(textStatus);
                          }
                      });
            		  
        		  
        		  
        		 
        		 
        		
        	  }
                 
          }
       
    	
		
    });
	 
	
	 $("#content ").on("click", ".update",function () {
    	 id=$(this).closest("tr").find(' td:eq(0)').text();
    	var nom=$(this).closest("tr").find(' td:eq(2)').text();
    	var email=$(this).closest("tr").find(' td:eq(1)').text();
    	console.log(nom);
    	 $("#email").val(email);
         $("#name").val(nom);
         $("#create").text("Modifier");
    });
	$("#content ").on("click", ".delete",function () {
     idU=$(this).closest("tr").find(' td:eq(0)').text();
       
    });
	
	$("#supprimer").click(function(){
		$.ajax({
            url: "UsersController",
            data: {op: "delete", id:idU},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                remplirTable(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });

		});
	
	function remplirTable(data) {
   	 var ligne = "";
      	 for (var i = 0; i < data.length; i++) {
          ligne += "<tr>"
       		   +"<td class='id py-3'>" + data[i].id +"</td>"
       		   +"<td class='py-3'>" + data[i].email +"</td>"
       		   +"<td class='py-3'>" + data[i].nom +"</td>"
       		   + '<td class="py-3">'
                  +'<div class="position-relative">'
                  +'<button  class="update link-dark d-inline-block border-0 bg-transparent" >'
                  +'<i class="gd-pencil icon-text"></i>'
                  +'</button>'
                  +'<button  class="delete link-dark d-inline-block border-0 bg-transparent" data-toggle="modal"  data-target="#myModal" >'
                  +'<i class="gd-trash icon-text"></i>'
                  +'</button>'
                  +'</div> </td>'
   	           +"</tr>";
      }
   $("#content").html(ligne);
   }
   
	$("#email").click(function(){
		$("#invalidE").hide();
		$("#emailF").hide();
		$('#email').css({'border' : '1px solid blue'});
		});
	$("#password").click(function(){
		$("#invalidP").hide();
		$("#passF").hide();
		$('#password').css({'border' : '1px solid blue'});
		});
	$("#password_confirm").click(function(){
		$("#passI").hide();
		$('#password_confirm').css({'border' : '1px solid blue'});
		});
	$("div #search").click( function () {
		
	    var value = $("#searchtxt").val().toLowerCase();
	    console.log(value)
	    $("table tr").filter(function () {
	        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	    $("#refresh").click( function () {
	   	 $.ajax({
	   	        url : "UsersController",
	   	        data:{op:"load"},
	   	        type: 'POST',
	   	        success: function (data, textStatus, jqXHR) {
	   	            remplirTable(data);
	   	            
	   	            }
	   	       
	   	    });
	     });
	});

});