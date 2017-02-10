
function check(){
		
	 var y = document.getElementById("Mobile_Number").value;
	 
	 if(isNaN(y)||y.indexOf(" ")!=-1)
     {
        alert("Enter numeric value for phone")
        return false; 
     }
     if (y.length>10)
     {
          alert("Enter 10 characters for phone");
          return false;
     }
     if (y.charAt(0)!="9")
     {
          alert("It should start with 9 for phone");
          return false
     }	 
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}


