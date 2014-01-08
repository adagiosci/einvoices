$(document).ready(function(e){
	$(".select_option").live("change",function(e){
		var object = $(this);
		var _option = $(this).val();
		$.post("/reportes/valueoption/",{option:_option},function(info){
			object.parent().after("<p>"+info.input +"</p>");
		},"json");
	});
	$(".new_filter_report").click(function(e){
		e.preventDefault();
		var filters = $("#filter_1");
		var object = $(this);
		object.before("<p><select name='filters[]' class='select_option'>"+filters.html()+"</select></p>");
	});
	$("#campos_reporte").submit(function(e){
		var status = $("#status_reporte").val();
		var _confirm;
		if(status == "new"){
			response = confirm("¿Desea guardar esta configuración?");
			if(response){
				$("#popup").css("display","table");
				$("#popup .content").css("width","400px");
				$("#popup .content .html").html("");
				$("#popup .content .html").html($("#save-box-reporte").html());
				e.preventDefault();
			}else{
				$("#status_reporte").val("not_saved");
				$("#generar_reporte").submit();
			}
		}
	});
	$(".form-reporte-guardar").live("submit",function(e){
		e.preventDefault();
		var action = $(this).attr("action");
		var form = $("#campos_reporte").serialize() + "&descripcion="+$("#descripcion-reporte").val();
		$("#submit-reporte").addClass("hidden");
		$("#loader-reporte").addClass("loader2");
		$.post(action,form,function(info){
			if(info.result){
					$("#loader-reporte").removeClass("loader2");
					$("#loader-reporte").html("<p>Reporte Guardado Satisfactoriamente.</p>");
					setTimeout(function(){
						$("#status_reporte").val("saved");
						$("#campos_reporte").submit();
					},1500);
			}else{
				$("#submit-reporte").removeClass("hidden");
				$("#loader-reporte").removeClass("loader2");
				$("#loader-reporte").html("<p>El reporte no se Guardo correctamente intente otra vez</p>");
			}
		},"json");
	});
	$("#insert_data").change(function(e){
		var value = $(this).val();
		$.post("/reportes/htmloperaciones",{option:value},function(html){
			$(".container .center").append(html);
			$("#insert_data").val("");
		});
	});
});
