/*--------------------------------------Register toggle button------------------------*/

function signin() {
  var x = document.getElementById("signin");
  var y = document.getElementById("signup");
  var z = document.getElementById("btn");

  x.style.left = "-400px";
  y.style.left = "50px";
  z.style.left = "110px";
}

function signup() {
  var x = document.getElementById("signin");
  var y = document.getElementById("signup");
  var z = document.getElementById("btn");
  x.style.left = "50px";
  y.style.left = "450px";
  z.style.left = "0";
}

function onOkButtonClick() {
	window.location.href = "registeredUsers.jsp";
}

/*-----------------------------------------Banner slider--------------------------*/

var i = 1;

function slider() {
  var banner = document.getElementById("banner");

  var len = 4;

  if (i > len - 1) {
    i = 1;
  }

  var className = "banner-img" + i;
  $("#banner").removeClass($("#banner").attr("class"));
  $("#banner").addClass("banner " + className);

  i++;
  setTimeout("slider()", 3000);
}