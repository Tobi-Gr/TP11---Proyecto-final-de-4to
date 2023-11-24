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
                    let info =  "<h4>" + response.sinopsis + "</h4><br><h5><b>Año de lanzamiento:</b>" 
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