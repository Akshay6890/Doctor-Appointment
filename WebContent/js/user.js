function profile(){
	document.getElementById("profile").style.display="block";
	document.getElementById("appointment").style.display="none";
	document.getElementById("list").style.display="none";
	document.getElementById("history").style.display="none";
}
function appointment(){
	document.getElementById("profile").style.display="none";
	document.getElementById("appointment").style.display="block";
	document.getElementById("list").style.display="none";
	document.getElementById("history").style.display="none";
}
function list(){
	document.getElementById("profile").style.display="none";
	document.getElementById("appointment").style.display="none";
	document.getElementById("list").style.display="block";
	document.getElementById("history").style.display="none";
}
function history(){
	document.getElementById("profile").style.display="none";
	document.getElementById("appointment").style.display="none";
	document.getElementById("list").style.display="none";
	document.getElementById("history").style.display="block";
}
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});

function dat()
{
var tod=new Date();
var first=tod.getDate()+'/'+(tod.getMonth()+1);
tod.setDate(tod.getDate()+1)
var sec=tod.getDate()+'/'+(tod.getMonth()+1);
tod.setDate(tod.getDate()+1)
var third=tod.getDate()+'/'+(tod.getMonth()+1);
var dateList=document.getElementById("dates");
while (dateList.options.length) {
    dateList.remove(0);
  }
var temp=new Option(first,first);
 dateList.options.add(temp);
temp=new Option(sec,sec);
 dateList.options.add(temp);
temp=new Option(third,third);
 dateList.options.add(temp);
//calling time slot updation
 tim();
}
function tim()
{
	var temp;
	var c=0;
	var timList=document.getElementById("times");
	for(i=10;i<17;i++){
	var x=i+':00 - '+i+':30';
	var y=i+':30 - '+(i+1)+':00';
	if(i<12){
		x=x+' am';
		y=y+' am';
	}
	else{
		x=x+' pm';
		y=y+' pm';
	}
	temp=new Option(x,c);
	timList.options.add(temp);
	c++;
	temp=new Option(y,c);
	timList.options.add(temp);
	c++;
	}
}
/*document.addEventListener("contextmenu", function(e){
	e.preventDefault();
}, false);*/