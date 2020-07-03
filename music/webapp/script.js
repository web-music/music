function myneidi()
{
	var all = document.getElementsByClassName("3a");
	
	var i;
	for (i = 0; i < 3; i++)
	{
		all[i].style.backgroundColor="white";
		all[i].style.color="black";
	}
	
	
	document.getElementById("neidi").style.color="gray";
	
	document.getElementById("myneidi").style.display="block";
	document.getElementById("mygangtai").style.display="none";
	document.getElementById("myoumei").style.display="none";
}
﻿function mygangtai()
{
	var all = document.getElementsByClassName("3a");
	
	var i;
	for (i = 0; i < 3; i++)
	{
		all[i].style.backgroundColor="white";
		all[i].style.color="black";
	}
	
	
	document.getElementById("gangtai").style.color="gray";
	
	document.getElementById("myneidi").style.display="none";
	document.getElementById("mygangtai").style.display="block";
	document.getElementById("myoumei").style.display="none";
}
﻿function myoumei()
{
	var all = document.getElementsByClassName("3a");
	
	var i;
	for (i = 0; i < 3; i++)
	{
		all[i].style.backgroundColor="white";
		all[i].style.color="black";
	}
	
	
	document.getElementById("oumei").style.color="gray";
	
	document.getElementById("myneidi").style.display="none";
	document.getElementById("mygangtai").style.display="none";
	document.getElementById("myoumei").style.display="block";
}

function mousedown(D)
{
  D.src="images/00011.png";
  D.style.color="rgba(51, 153, 255, 1)";
}
function echo(id,i)
{
  document.getElementById(id).style.display=i;
}
function change(i, n)
{
  i.src="images/camera"+n+".png";
}







