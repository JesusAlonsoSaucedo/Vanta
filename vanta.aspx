<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sitio con Efecto de Niebla</title>
  <!-- Bibliotecas y estilos CSS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r121/three.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vanta@latest/dist/vanta.fog.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <style>
    /* Estilos adicionales */
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: "Poppins", sans-serif; /* Aplicación de la tipografía */
    }
    .s-page-1 {
      /* Estilos para la página */
      position: relative; /* Asegura que el contenido y el canvas respeten el espacio */
      overflow: hidden; /* Oculta cualquier desbordamiento que pueda ocurrir */
      height: 100%; /* 100% del viewport height */
      display: flex;
      justify-content: center;
      align-items: center;
    }
    #your-element-selector {
      position: fixed;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      z-index: -1; /* Coloca el canvas detrás de todo el contenido */
    }
    .content {
      /* Estilos para el contenido */
      z-index: 1; /* Asegura que el contenido esté sobre el canvas */
      text-align: center; /* Alinea el contenido al centro */
      color: #fff; /* Color del texto */
      font-family: "Poppins", sans-serif; /* Aplicación de la tipografía */
    }
    h1 {
      font-size: 5rem; /* Tamaño grande para el título */
      margin-bottom: 0.5rem; /* Espacio inferior ajustado */
      font-family: "Poppins", sans-serif; /* Aplicación de la tipografía */
      font-weight: 900;
      font-style: italic;
      color: #fff;
      text-transform: uppercase;
    }
    h3 {
      font-family: "Poppins", sans-serif; /* Aplicación de la tipografía */
      font-size: 1.5rem;
      font-weight: 700;
      font-style: italic;
      color: #fff;
      text-transform: uppercase;
    }
    /* Estilos adicionales */
    .text-container {
      color: white;
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
      font-family: "Poppins", sans-serif; /* Aplicación de la tipografía */
      margin-bottom: 20px; /* Margen inferior */
      text-align: center;
    }
    .conteo {
      /* Estilos para los conteos */
      text-align: center;
      margin-top: 20px; /* Margen superior */
    }
    .conteo div {
      text-align: center;
      border: 2px solid rgba(255, 255, 255, 0.8);
      border-radius: 8px;
      margin: 10px;
      width: 100px;
      padding: 10px;
      display: inline-block; /* Para que los elementos estén en línea */
      font-family: "Poppins", sans-serif; /* Aplicación de la tipografía */
    }
    .conteo h3, .conteo h4 {
      margin: 0;
    }
    .text-center.hr {
      /* Estilos para la línea hr con clase text-center */
      border-color: white; /* Color blanco para la línea */
      border-width: 1px; /* Grosor de 1px */
      margin: 20px auto; /* Margen superior e inferior de 20px y centrado horizontal */
      width: 50%; /* Ancho del 50% */
    }
    /* Estilos para los enlaces de redes sociales */
    .text-container a {
      display: inline-block;
      width: 50px;
      height: 50px;
      border: 1px solid #fff;
      border-radius: 50%;
      color: white;
      transition: 0.5s;
      margin: 10px;
      text-align: center;
      line-height: 50px; /* Para alinear verticalmente */
    }

    .text-container a i {
      font-size: 1.5rem; /* Tamaño del ícono */
    }
  </style>
</head>
<body>

<!-- Canvas para el efecto de niebla -->
<div id="your-element-selector"></div>

<div class="s-page-1">
  <!-- Contenido agregado -->
  <div class="container-fluid text-container">
    <div class="row justify-content-center align-items-center">
      <div class="col text-center">
        <h3>ERSO APP: Mi aplicación web</h3>
        <h1 id="proximamente">#Próximamente</h1>
        <div class="conteo d-flex justify-content-center" id="countdown">
          <div>
            <h3 class="dia">-</h3>
            <h4>Días</h4>
          </div>
          <div>
            <h3 class="hora">-</h3>
            <h4>Horas</h4>
          </div>
          <div>
            <h3 class="min">-</h3>
            <h4>Min</h4>
          </div>
          <div>
            <h3 class="seg">-</h3>
            <h4>Seg</h4>
          </div>
        </div>
        <hr class="text-center hr">
        <div class="text-center mt-3">
          <a href="https://www.facebook.com/jesusalonso.aragon/" target="_blank" class="btn me-2" id="fb"><i class="fab fa-facebook-f"></i></a>
          <a href="https://www.instagram.com/" target="_blank" class="btn me-2" id="ig"><i class="fab fa-instagram"></i></a>
          <a href="https://web.whatsapp.com/;text=Hola,%20papi" target="_blank" class="btn me-2" id="wp"><i class="fab fa-whatsapp"></i></a>
          <a href="https://x.com/" target="_blank" class="btn me-2" id="tw"><i class="fab fa-twitter"></i></a>
          <a href="https://play.google.com/store/apps" target="_blank" class="btn me-2" id="gp"><i class="fab fa-google-play"></i></a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Script para inicializar Vanta.js -->
<script>
    var setVanta = () => {
        if (window.VANTA) {
            window.VANTA.FOG({
                el: "#your-element-selector", // Selector para el canvas
                mouseControls: true,
                touchControls: true,
                gyroControls: false,
                minHeight: 200.00,
                minWidth: 200.00,
                highlightColor: 0x86cad1,
                midtoneColor: 0x6ba2c2,
                lowlightColor: 0x113140,
                baseColor: 0x8aaab1
            });
        }
    };

    // Función para actualizar los contadores regresivos
    var updateCountdown = () => {
        var currentDate = new Date();
        var futureDate = new Date(currentDate);
        futureDate.setMonth(currentDate.getMonth() + 2); // Sumar 2 meses
        futureDate.setHours(1460); // Establecer 1460 horas
        futureDate.setMinutes(60); // Establecer 60 minutos
        futureDate.setSeconds(60); // Establecer 60 segundos

        var countdownDate = futureDate.getTime(); // Fecha de finalización del contador
        var now = new Date().getTime(); // Fecha actual
        var distance = countdownDate - now;

        if (distance < 0) {
            clearInterval(countdownInterval);
            document.getElementById("proximamente").innerHTML = "¡Ya está aquí!";
            document.getElementById("countdown").style.display = "none";
            return;
        }

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Actualizar elementos HTML con los valores calculados
        document.querySelector(".dia").textContent = days;
        document.querySelector(".hora").textContent = hours;
        document.querySelector(".min").textContent = minutes;
        document.querySelector(".seg").textContent = seconds;
    };

    // Ejecutar setVanta al cargar la página y antes de transiciones
    document.addEventListener("DOMContentLoaded", function () {
        setVanta();
        // Iniciar el contador y actualizar cada segundo
        updateCountdown();
        var countdownInterval = setInterval(updateCountdown, 1000);
        // También asegurarse de ejecutar setVanta antes de cada nueva carga de página o transición
        window.edit_page.Event.subscribe("Page.beforeNewOneFadeIn", setVanta);
    });
</script>
</body>
</html>