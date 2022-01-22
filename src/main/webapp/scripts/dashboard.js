$(document).ready(function () {
	
	console.log(sessionStorage);
    $.ajax({
        url : "DashboardController",
        data:{op:"load"},
        type: 'POST',
        success: function (data, textStatus, jqXHR) {
        	 remplirBar(data[1]);
        	 console.log(data[1]);
            remplir(data[1]);
            remplirGraph1(data[4]);
            
           $(".ts").text(data[0][0].count);
           $(".tm").text(data[2][0].count);
           $(".depense").text(data[3]+" "+"DH");
            }
       
    });
   
   
    function remplirBar(data) {
    	
    	var data1=[];
    	var data2=[];
    	for (var i = 0; i < data.length; i++) {
    		data1[i]=data[i].salle.code;
    		data2[i]=data[i].count;
    	}
    	 new Chartist.Bar("#bar", {
             labels: data1,
             series:[data2] 
            }, {
           	  low: 0,
           	  showPoint: false,
           	  fullWidth: true,
           	}
         );
    }
  function  remplirGraph1(data){
	  new Chartist.Line("#graph1", {
          series:[data] 
         }, {
        	 showArea: true,
        	 
        	 }
      );
  }
    function remplir(data) {
    	var data1=[];
    	var data2=[];
    	for (var i = 0; i < data.length; i++) {
    		data1[i]=data[i].salle.code;
    		data2[i]=data[i].count;
    	}
    	
    	
    	 new Chartist.Line("#graph", {
              labels: data1,
              series:[data2] 
             }, {
            	  low: 0,
            	  showArea: true,
            	  showPoint: false,
            	  fullWidth: true,
            	}
          );
      
    	
     
    }
    
    
     

});
