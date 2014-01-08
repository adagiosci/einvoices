$(document).ready(function(e){
	$('#linea_negocio_select').change(function(e){
		var negocio = $(this).val();
		$('#tarea_select').next().addClass('loader2');
		$.post('/tareas/gettareas/',{negocio:negocio},function(info){
			$('#tblEquipos select').val('0');
			$('#tblEquipos select').attr('disabled',true);
			$('#tarea_select').html('');
			$('#tarea_select').append("<option value=''></option>");
			for(x in info){
				$('#tarea_select').append("<option value='"+info[x].idtarea+"'>"+info[x].nombre +"</option>");
			}
			$('#tarea_select').next().removeClass('loader2');
		},'json');
	});
	$('#tarea_select').change(function(e){
		var tarea = $(this).val();
		$('#tarea_select').next().addClass('loader2');
		$.post('/tareas/setequipos/',{tarea:tarea},function(info){
			for(x in info){
				var equipo = info[x].Equipo_de_Vlo.replace(' ','_');//The names of the Equipement can't have spaces, so i replace it
				$('#requeridos_' + equipo).val(info[x].requeridos);
				$('#hora_prevuelo_' + equipo).val(info[x].hora_prevuelo);
				$('#minuto_prevuelo_' + equipo).val(info[x].minuto_prevuelo);
				$('#hora_postvuelo_' + equipo).val(info[x].hora_postvuelo);
				$('#minuto_postvuelo_' + equipo).val(info[x].minuto_postvuelo);
			}
			$('#tarea_select').next().removeClass('loader2');
			$('#tblEquipos select').attr('disabled',false);
		},'json');
	});
	$(".popup_equipos_tares_aerolinea").live('click',function(e){
		e.preventDefault();
		var href = $(this).attr('href');
		var checked = '';
		$('#popup').css('display','table');
		$('#popup .html').html("<div class='loader2'></div>");
		$('#popup .content-popup').width(250);
		$.post(href,function(info){
			var html = "<form action='/aerolineas/tareas/id/" + info.idaerolinea +"/?inst=updateGrupo' method='post' accept-charset='utf-8' enctype='multipart/form-data'>";
			for(x in info.equipos){
				if(typeof info.equiposGrupos[info.equipos[x].Equipo_de_Vlo] == 'undefined'){
					html =  html + "<p><input type='checkbox' class='checkbox' name='equipos[]' value='" + info.equipos[x].Equipo_de_Vlo + "'/> "+ info.equipos[x].Equipo_de_Vlo +"</p>";
				}else if(info.equiposGrupos[info.equipos[x].Equipo_de_Vlo] == info.idgrupo){
					html =  html + "<p><input type='checkbox' checked='checked' class='checkbox' name='equipos[]' value='" + info.equipos[x].Equipo_de_Vlo + "'/> "+ info.equipos[x].Equipo_de_Vlo +"</p>";
				}
				
			}
			html = html + "<p><input type='hidden' name='idgrupo' id='idgrupo_equipos_tares_aerolineas' value='" + info.idgrupo + "'/></p>";
			html = html + "<p><input type='submit' class='submit' name='guardar' value='Guardar' class='save_equipos_tares_default'/></p>";
			html = html + '</form>';
			$('#popup .html').html(html);
		},'json');
			
	});
});