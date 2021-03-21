function profile(){
				document.getElementById("profile").style.display="block";
				document.getElementById("list").style.display="none";
				document.getElementById("history").style.display="none";
			}
			function list(){
				document.getElementById("profile").style.display="none";
				document.getElementById("list").style.display="block";
				document.getElementById("history").style.display="none";
			}
			function history(){
				document.getElementById("profile").style.display="none";
				document.getElementById("list").style.display="none";
				document.getElementById("history").style.display="block";
			}
		      document.addEventListener("contextmenu", function(e){
		          e.preventDefault();
		        }, false);
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});