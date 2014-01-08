$(document).ready(function(e){
	$('.editTareaEquipoClasificacion').click(function(e){
		e.preventDefault();
		$("#popup").css("display","table");
		$("#popup .content-popup").css("width","700px");
		var height = $(window).height() - 60;
		$("#popup .content-popup .html").css("height",height);
		$("#popup .content-popup .html").html("<div class='loader2'></div>");
		var href = $(this).attr('href');
		$.post(href,function(data){
			$("#popup .content-popup .html").html(data);
		});
	});
	$(".popup_equipos_tares_default").live('click',function(e){
		e.preventDefault();
		var id = $(this).attr('href').split('#');
		var idgrupo = id[1];
		var html = "<form action='/tareas/updategroup/' method='post' accept-charset='utf-8' enctype='multipart/form-data'>";
		var checked = '';
		$('#popup').css('display','table');
		$('#popup .html').html("<div class='loader2'></div>");
		$('#popup .content-popup').width(250);
		$.post('/tareas/getequiposgrupos/id/' + idgrupo,function(info){
			for(x in info.equipos){
				if(typeof info.equiposGrupos[info.equipos[x].Equipo_de_Vlo] == 'undefined'){
					html =  html + "<p><input type='checkbox' class='checkbox' name='equipos[]' value='" + info.equipos[x].Equipo_de_Vlo + "'/> "+ info.equipos[x].Equipo_de_Vlo +"</p>";
				}else if(info.equiposGrupos[info.equipos[x].Equipo_de_Vlo] == idgrupo){
					html =  html + "<p><input type='checkbox' checked='checked' class='checkbox' name='equipos[]' value='" + info.equipos[x].Equipo_de_Vlo + "'/> "+ info.equipos[x].Equipo_de_Vlo +"</p>";
				}
			}
			html = html + "<p><input type='hidden' name='idgrupo' id='idgrupo_equipos_tares_default' value='" + idgrupo + "'/></p>";
			html = html + "<p><input type='submit' class='submit' name='guardar' value='Guardar' class='save_equipos_tares_default'/></p>";
			html = html + '</form>';
			$('#popup .html').html(html);
		},'json');
	});
});