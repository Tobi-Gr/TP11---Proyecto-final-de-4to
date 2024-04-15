// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function openPage(pageName, elmnt, color) {
    // Hide all elements with class="tabcontent" by default */
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
  
    // Remove the background color of all tablinks/buttons
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].style.backgroundColor = "";
    }
  
    // Show the specific tab content
    document.getElementById(pageName).style.display = "block";
  
    // Add the specific color to the button used to open the tab content
    elmnt.style.backgroundColor = color;
  }
  
  // Get the element with id="defaultOpen" and click on it
  document.getElementById("defaultOpen").click();

  function MostrarInfo(id)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/VerPeliculaAjax',
            data: {idPeli : id},
            success:
                function(response)
                {
                    $("#titulo").html(response.titulo);
                    let info =  "<h4>" + response.sinopsis + "</h4><br><h5><b>Año de lanzamiento: </b>" 
                        + response.anioLanzamiento+ "</h5>";
                    $("#infoPeli").html(info);
                    $("#portada-info").attr("src", response.foto);
                }
        }
    )
}


function ModelEliminarPeli(id)
{
    let idUsuario = $("#user").data("idusuario");
    
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/VerPeliculaAjax',
            data: {idPeli : id},
            success:
                function(response)
                {
                    let prompt =  "<h4>¿Querés eliminar '" + response.titulo + "' de tu lista?</h4>";
                    $("#prompt").html(prompt);
                    $("#portada-eliminar").attr("src", response.foto);
                    $("#borrar").attr("onclick", "EliminarPeli("+ response.idPelicula + "," + idUsuario + ")");
                }
        }
    )
}

function EliminarPeli(idPeli, idUser)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/EliminarPeliAjax',
            data: {idPelicula: idPeli, idUsuario:idUser},
            success:
                function()
                {
                    location.reload();
                }
        }
    )
}

function CambiarEstadoPeli(idPeli, idUser)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/CambiarEstadoPeliAjax',
            data: {idPelicula: idPeli, idUsuario:idUser},
            success:
                function()
                {
                    setTimeout(() => { location.reload(); }, 1500);                    
                }
        }
    )
}

function Enlistar(idPeli, idUser)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/EnlistarAjax',
            data: {idPelicula: idPeli, idUsuario:idUser}
        }
    )
}

function ModalOpinion(idPeli, idUser)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/ModalOpinionAjax',
            data: {idPelicula: idPeli, idUsuario:idUser},
            success:
                function(response)
                {
                    let peli = response.pelicula;
                    let rating = response.rating;
                    $("#titulo-op").html(peli.titulo);
                    $("#portada-op").attr("src", peli.foto);
                    $("#paraPasarIdPeli").attr("value", peli.idPelicula);
                    if(rating == null){                     
                        $("#opinionTexto").val("");
                        const defaultRadios = document.querySelectorAll('input[name="calificacion"]');
                        defaultRadios.forEach(radio => {
                            radio.checked = false;
                        });
                    }
                    else{
                        $("#opinionTexto").val(rating.opinion);
                        const defaultRadio = document.querySelector(`input[value="${rating.calificacion}"][name="calificacion"]`);
                        defaultRadio.checked = true;
                        const fecha = new Date(rating.fecha);
                        $("#fecha").html("Opinión del " + fecha.toLocaleDateString('es-ES'));
                    }
                }
        }
    )
}

function CerrarModal()
{
    let fecha = document.getElementById("fecha");
    fecha.innerHTML = "";
}

function GuardarRating(opi, cali, idPeli, idUser)
{
    $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Home/GuardarRatingAjax',
            data: {opinion:opi, calificacion:cali, idPelicula:idPeli, idUsuario:idUser},
            success:
                function(response){
                    let fecha = document.getElementById("fecha");
                    fecha.innerHTML = "";
                    let peli = response.pelicula;
                    let rating = response.rating; 
                    let estrellas ="";
                    for(let i=rating.calificacion;i<5; i++)
                    {   
                        estrellas+='<label for="star" id="star" class="unchecked"></label> ';
                    }
                    for(let i=1;i<=rating.calificacion; i++)
                    {   
                        estrellas+='<label for="star" id="star"></label> ';
                    }
                    const stars = document.getElementById("rating-card_"+peli.idPelicula);
                    stars.innerHTML = estrellas;                    
                }
        }
    )
}