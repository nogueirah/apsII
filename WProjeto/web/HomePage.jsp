
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1">
    <title>Office Park</title>
    <link rel="stylesheet" type="text/css" href="home.css">

</head>

<body>
    <header>
        <h1 id="homePage" class="float-l">OFFICE PARK</h1>
        <nav class="float-r">
            <ul class="list-auto">
                <li>
                    <a href="LoginCliente.jsp" title="Cliente">Cliente</a>
                </li>
                <li>
                    <a href="LoginAdm.jsp" title="Adm">Adm</a>
                </li>
            </ul>



        </nav>

    </header>
    <div class="slideshow-container">

  
  <div class="mySlides fade">
    <div class="numbertext">1 / 5</div>
    <img src="img1.png"style="width:100%; height: 100%;">
    <div class="text" >Espaço amplo.</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 5</div>
    <img src="img2.png" alt="" style="width: 100%"/>
    <div class="text">Espaço coberto.</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 5</div>
    <img src="img3.png" style="width:100%">
    <div class="text">Vagas exclusivas para PCD.</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">4 / 5</div>
    <img src="img4.png" style="width:100%">
    <div class="text">Monitoramento para garantir a preservação do seu veículo.</div>
  </div>

  

  
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>


<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
  <span class="dot" onclick="currentSlide(4)"></span>
  
</div>

    <footer>
        <p id="copy">&copy; 2019 - Office Park</p>
    </footer>
    <script>
    var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
 </script>
    
</body>
</html>