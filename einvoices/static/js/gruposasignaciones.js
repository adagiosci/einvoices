$(document).ready(function(e){
	//Ajax de grupos en asignaciones
	$('.create_group').live('click',function(e){
		e.preventDefault();
		$("#empleado_agreado_rampas table").html("");
		$("#idempleado_rampas").val("");
		$(".group_name").html('');
		$('.popup_rampas').css('display','table');
		$.get('/rampas/newgroup/',function(data){
			$('.popup_rampas .grupoID').val(data.id);
			$('.popup_rampas .group_name').text('Grupo Num.' + data.group);
			$.post("/asignaciones/grupos/",{reload:true},function(html){
				$(".TblList").html(html);
			});
		},'json');
	});//edit_group
	$(".edit_group").live('click',function(e){
		e.preventDefault();
		var id = $(this).attr('href').split('#');
		var text = $(this).prev().html();
		$("#empleado_agreado_rampas").html("<div class='loader2'></div>");
		$("#idempleado_rampas").val("");
		$(".group_name").html(text);
		$('.popup_rampas').css('display','table');
		$('.grupoID').val(id[1]);
		$.post('/asignaciones/getgrupos/id/'+id[1],function(html){
			$("#empleado_agreado_rampas").html(html);
		});
	});
	$(".nuevogrupo a.delete2").live('click',function(e){
		e.preventDefault();
		var object = $(this);
		var url = $(this).attr('href');
		$.post(url,{redirect:true},function(info){
			object.parent().parent().remove();
			$.post("/asignaciones/grupos/",{reload:true},function(html){
				$(".TblList").html(html);
			});
		});
	});
	$(".empleados_rampas").autocomplete({
		source: function(request, response) {
			$.post("/asignaciones/empleadosautocomplete/?q=" + request.term, {idgrupo:$('.grupoID').val()},function(data) {
				//response(data.split("\n"));
				var array = new Array();
				if(data != null){
					for(var i=0;i<data.items.length;i++){
						var label =data.items[i].numero + ' ' +  data.items[i].Nombre;
						array[array.length] = {label:label,numero:data.items[i].numero,id:data.items[i].id}
					}
				}
				response(array);
			},'json');
		}
		,delay:500
		,select:function(event, ui){
			var item = ui.item;
			$.get("/asignaciones/addemployedgroup/?empleado="+item.id+'&grupo='+$('.grupoID').val(),function(data){
				$("#empleado_agreado_rampas table").append('<tr><td>' + ui.item.numero + '</td> <td>' + ui.item.label +'</td><td><a href="/asignaciones/deleteempleado/grupo/' + $('.grupoID').val() +'/empleado/' + item.id + '" class="delete2">Eliminar</a></td></tr>');
				$('.empleados_rampas').val('');
				$.post("/asignaciones/grupos/",{reload:true},function(html){
					$(".TblList").html(html);
				});
			},'json');
		}
	});
	$(".add_group_this_flight").click(function(e){
		e.preventDefault();
		$("#popup").css("display","table");
		$("#popup .content-popup").css("width","680px");
		var height = $(window).height() - 60;
		$("#popup .content-popup .html").css("height",height);
		
		$("#popup .content-popup .html").html("<div class='loader2'></div>");
		var href = $(this).attr('href');
		$.post(href,{idcaptura:$("#id_input").val()},function(data){
			$("#popup .content-popup .html").html(data);
		});
	});
	$("#popup .grupos .paginator a").live("click",function(e){
		e.preventDefault();
		var href = $(this).attr('href');
		$("#popup .content-popup .html").html("<div class='loader2'></div>");
		$.post(href,{idcaptura:$("#id_input").val()},function(data){
			$("#popup .content-popup .html").html(data);
		});
	});
	$("#popup .group_check").live("click",function(e){
		var object = $(this);
		var checked = object.attr('checked') == 'checked'?true:false;
		var idgrupo = object.val();
		var url = $('#urlAsignacionGrupos').val();
		object.next().addClass('loader2');
		object.addClass('hidden');
		$.post(url,{
			checked:checked
			,idgrupo:idgrupo
			,idcaptura : $("#id_input").val()
		},function(info){
			object.next().removeClass('loader2');
			object.removeClass('hidden');
			var html = '<table>';
			for(x in info.empleados){
				html = html + '<tr>';
				html = html + '<td>'+ info.empleados[x].numero +'</td>';
				html = html + '<td>'+ info.empleados[x].nombres  + ' ' +info.empleados[x].apellido_materno + ' '+ info.empleados[x].apellido_paterno +'</td>';
				html = html + '</tr>';
			}
			html = html + '</table>';
			$('#flight_groups').html(html);
		},'json');

	});
	$(".asignar_empleados").live("click",function(e){
		e.preventDefault();
		$("#popup").css("display","table");
		$("#popup .content-popup").css("width","680px");
		var height = $(window).height() - 60;
		var href = $(this).attr('href').split('#');
		var url = $('#urlGruposEmpleados').val();
		var idtareaAerolinea = href[2];
		var idtarea = href[1];
		$("#popup .content-popup .html").css("height",height);
		$("#popup .content-popup .html").html("<div class='loader2'></div>");
		$.post(url,{
			idcaptura:$("#id_input").val()
			,idtarea: idtarea
			,idtareaAerolinea:idtareaAerolinea
		},function(data){
			$("#popup .content-popup .html").html(data);
		});
	});
	$("#popup .asignar_empleado_grupo").live("click",function(e){
		var object = $(this);
		var checked = object.attr('checked') == 'checked'?true:false;
		var idcaptura  = $("#id_input").val();
		var idempleado  = object.val();
		var idtarea = $("#idtareaLive").val();
		var idtareaAerolinea = $("#idtareaAerolinea").val();
		
		object.next().addClass('loader2');
		object.addClass('hidden');
		$.post("/rampas/asignarempleado/",{
			idcaptura:idcaptura
			,idempleado:idempleado
			,idtarea:idtarea
			,idtareaAerolinea:idtareaAerolinea
			,checked:checked
		},function(data){
			object.next().removeClass('loader2');
			object.removeClass('hidden');
			if(data != 'false'){
				$("#actividad" + idtarea).html(data);
				$('#message_empleado_asignacion').html('Agregado correctamente').removeClass('error');
			}else{
				object.attr('checked',false);
				$('#message_empleado_asignacion').html('No se puede agregar. Revise que no haya pasado el maximo de personal').addClass('error');
			}
		});
	});
	$("#popup .asignacion-empleados .paginator a").live("click",function(e){
		e.preventDefault();
		var href = $(this).attr('href');
		var idactividad = $("#idactividadLive").val();
		$("#popup .content-popup .html").html("<div class='loader2'></div>");
		$.post(href,{idcaptura:$("#id_input").val(),idactividad:idactividad},function(data){
			$("#popup .content-popup .html").html(data);
		});
	});
});