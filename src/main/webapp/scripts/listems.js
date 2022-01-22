$(document).ready(function () {
	
    $.ajax({
        url : "ListeMSController",
        data:{op:"load"},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            remplir(data[0]);
            remplirTable(data[1]);
            
            }
       
    });
    $("#recherche").click(function () {
        var salle =$("#salle ").val();
        
        	$.ajax({
        		
        		 url: "ListeMSController",
                 data: {salle:salle},
                 type: 'POST',
                 success: function (data, textStatus, jqXHR) {
                	 remplirTable(data);
                    
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                	 
                    console.log(textStatus);
                     
                 }
             });
      
    });
       
     
 
  
     function remplir(data) {
    	 
    	 var ligne = "";
    	 for (var i = 0; i < data.length; i++) {
           ligne += "<option value= '"+data[i].id +"'>" + data[i].code +"</option>";
       }
    $("#salle").html(ligne);
    }
function remplirTable(data) {
    	 var ligne = "";
    	 for (var i = 0; i < data.length; i++) {
           ligne += "<tr>"
        		   +"<td class='id py-3'>" + data[i].id +"</td>"
        		   +"<td class='py-3'>" + data[i].reference +"</td>"
        		   +"<td class='py-3'>" + data[i].dateAchat +"</td>"
        		   +"<td class='py-3'>" + data[i].prix +"</td>"
        		   +"<td class='py-3'>" + data[i].salle.code +"</td>"
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
	        url : "ListeMSController",
	        data:{op:"load"},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	            remplirTable(data[1]);
	            
	            }
	       
	    });
   });

});
