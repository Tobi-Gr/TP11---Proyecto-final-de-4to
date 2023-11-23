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
                    $("#portada").attr("src", response.foto);
                }
        }
    )
}


function ModelEliminarPeli(id)
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
                    let prompt =  "<h4>Confirma que queres eliminar " + response.titulo + " de tu lista de películas para ver";
                    $("#promt").html(prompt);
                    $("#portada").attr("src", response.foto);
                }
        }
    )
}
  