$(document).ready(function () {
	$("#invalidC").hide();
	var idS;
	var id;
    $.ajax({
        url : "SalleController",
        data:{op:"load"},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            remplirTable(data);
            
            }
       
    });
    $("#add").click(function () {
        var code = $("#code").val();
        var type = $("#type").val();
        if(id==null) {
        	$.ajax({
        		
        		 url: "SalleController",
                 data: {code:code,type:type},
                 type: 'POST',
                 success: function (data, textStatus, jqXHR) {
                	 if(data==true) {
                		 $("#invalidC").show();
                		 $("#code").css({'border' : '1px solid red'});
                	 }
                	 else {
                		 remplirTable(data);
                		 $("#code").val('');
                         $("#type").val('');
                	 }
                     
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                     console.log(textStatus);
                 }
             });
        }
           
       else {
    	   $.ajax({
               url: "SalleController",
               data: {id: id, code:code,type:type},
               type: 'POST',
               success: function (data, textStatus, jqXHR) {
            	   if(data==true) {
              		 $("#invalidC").show();
              		 $("#code").css({'border' : '1px solid red'});
              	 }
              	 else {
              		 remplirTable(data);
              		 $("#code").val('');
                       $("#type").val('');
                       $("#add").text("Ajouter");
              	 }
                   
               },
               error: function (jqXHR, textStatus, errorThrown) {
                   console.log(textStatus);
               }
           });
       }
     
    });
    
    $("#content ").on("click", ".delete",function () {
     idS=$(this).closest("tr").find(' td:eq(0)').text();
       
    });
    
    $("#supprimer").click(function(){
    	$.ajax({
            url: "SalleController",
            data: {op: "delete", id:idS},
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                remplirTable(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(textStatus);
            }
        });

    	});
    
    
    
    
    $("#content ").on("click", ".update",function () {
    	 id=$(this).closest("tr").find(' td:eq(0)').text();
    	var code=$(this).closest("tr").find(' td:eq(1)').text();
    	var type=$(this).closest("tr").find(' td:eq(2)').text();
    	 $("#code").val(code);
         $("#type").val(type);
         $("#add").text("Modifier");
    });
   
   
function remplirTable(data) {
    	 var ligne = "";
    	 for (var i = 0; i < data.length; i++) {
           ligne += "<tr>"
        		   +"<td class='id py-3'>" + data[i].id +"</td>"
        		   +"<td class='py-3'>" + data[i].code +"</td>"
        		   +"<td class='py-3'>" + data[i].type +"</td>"
        		   + '<td class="py-3">'
                   +'<div class="position-relative">'
                   +'<button  class="update link-dark d-inline-block border-0 bg-transparent" >'
                   +'<i class="gd-pencil icon-text"></i>'
                   +'</button>'
                   +'<button  class="delete link-dark d-inline-block border-0 bg-transparent" data-toggle="modal"  data-target="#myModal">'
                   +'<i class="gd-trash icon-text"></i>'
                   +'</button>'
                   +'</div> </td>'
    	           +"</tr>";
       }
    $("#content").html(ligne);
    }

$("div #search").click( function () {
	
    var value = $("#searchtxt").val().toLowerCase();
    console.log(value)
    $("table tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
});
$("#refresh").click( function () {
	 $.ajax({
	        url : "SalleController",
	        data:{op:"load"},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	            remplirTable(data);
	            
	            }
	       
	    });
  });

$("#code").click(function(){
	$("#invalidC").hide();
	$(this).css({'border' : '1px solid blue'});
	});
});
