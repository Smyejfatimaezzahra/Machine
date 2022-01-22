$(document).ready(function () {
	var id;
    $.ajax({
        url : "ListeMSDController",
        data:{op:"load"},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
            remplirTable(data);
            
            }
       
    });
    $("#recherche").click(function () {
        var dateD =$("#dateD ").val();
        var dateF =$("#dateF ").val();
        	$.ajax({
        		
        		 url: "ListeMSDController",
                 data: {date1:dateD,date2:dateF},
                 type: 'POST',
                 success: function (data, textStatus, jqXHR) {
                	 remplirTable(data);
                    
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                	 
                    console.log(textStatus);
                    $("#dateD ").val('');
                    $("#dateD ").val('');
                     
                 }
             });
      
    });
       
   
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
	        url : "ListeMSDController",
	        data:{op:"load"},
	        type: 'POST',
	        success: function (data, textStatus, jqXHR) {
	            remplirTable(data);
	            
	            }
	       
	    });
    });

     

});
