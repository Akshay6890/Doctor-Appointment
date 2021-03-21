function profile(){
	document.getElementById("profile").style.display="block";
	document.getElementById("patients").style.display="none";
	document.getElementById("doctors").style.display="none";
	document.getElementById("appointments").style.display="none";
}
function patients(){
	document.getElementById("profile").style.display="none";
	document.getElementById("patients").style.display="block";
	document.getElementById("doctors").style.display="none";
	document.getElementById("appointments").style.display="none";
}
function doctors(){
	document.getElementById("profile").style.display="none";
	document.getElementById("patients").style.display="none";
	document.getElementById("doctors").style.display="block";
	document.getElementById("appointments").style.display="none";
}
function appointments(){
	document.getElementById("profile").style.display="none";
	document.getElementById("patients").style.display="none";
	document.getElementById("doctors").style.display="none";
	document.getElementById("appointments").style.display="block";
}
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
document.addEventListener("contextmenu", function(e){
	e.preventDefault();
}, false);