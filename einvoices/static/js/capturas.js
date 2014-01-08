var peso_max_despegue_value_default;
$(document).ready(function(e){
	captura_left();
	captura_right();
	$("a.subir").click(function(e){
		e.preventDefault();
		var x = e.pageX + 44;
		var y = e.pageY-50;
		var id = $(this).attr("href").split('#');
		$("#popup").show();
		$("#popup").css("height",$("#wrap").height());
		$("#popup").css("width",window.innerWidth);
		$("#form-popup #id_captura").val(id[1]);
		$("#form-popup #fcs_number").val(id[2]);
		$("#popup-content2").show();
		$("#popup-content2").css("left",x+"px");
		$("#popup-content2").css("top",y+"px");
	});
	$("#popup-content2 .close a").live("click",function(e){
		e.preventDefault();
		$("#popup").hide();
		$("#popup-content2").hide();
		$(".qq-upload-list").html("");
	});
	$("#popup-piloto").live("submit",function(e){
		e.preventDefault();
		$("#popup-piloto .submit").addClass("hidden");
		$("#popup-piloto .message").html("");
		$("#popup-piloto .message").addClass("loader2");
		var tipo_tripulacion = $("#tipo_tripulacion").val();
		$.post("/pilotos/insertar/",{
			Nombre:$("#Nombre").val()
			,apellido:$("#apellido").val()
			,Licencia:$("#Licencia").val()
			,Cargo:$("#Cargo").val()
			,objeto_piloto:$("#objeto_piloto").val()
			,objeto_licencia: $("#objeto_licencia").val()
			,nolayout:true
		},function(data){
			$("#popup-piloto .message").removeClass("loader2");
			$("#popup-piloto .submit").removeClass("hidden");
			if(!data.error){
				value1 = $("#apellido").val() + " " + $("#Nombre").val();
				value2 = $("#Licencia").val();
				
				if(tipo_tripulacion == "llega"){
					$("#" + data.objeto_piloto + "_llega_fake").val(value1);
					$("#" + data.objeto_licencia + "_llega_fake").val(value2);
					$("#" + data.objeto_piloto + "_sale_fake").val(value1);
					$("#" + data.objeto_licencia + "_sale_fake").val(value2);
					$("#" + data.objeto_piloto + "_llega").val(data.id);
					$("#" + data.objeto_piloto + "_llega").next().addClass("acceped");
					$("#" + data.objeto_piloto + "_sale").val(data.id);
					$("#" + data.objeto_piloto + "_sale").next().addClass("acceped");
				}
				if(tipo_tripulacion == "sale"){
					$("#" + data.objeto_piloto + "_sale_fake").val(value1);
					$("#" + data.objeto_licencia + "_sale_fake").val(value2);
					$("#" + data.objeto_piloto + "_sale").val(data.id);
					$("#" + data.objeto_piloto + "_sale").next().addClass("acceped");
				}
				$("#popup").hide();
				$("#popup-piloto").hide();
				$("#popup-piloto").html("");
			}else{
				$("#popup-piloto .message").html("<p class='error'>" + data.message + "</p>");
			}
		},"json");
	});
	
	//Menus capturas
	$(".menu-tab-option").click(function(e){
// 		e.preventDefault();
		var href = $(this).attr("href").split('#');
		var tab = href[1];
		$("#current_tab").val(tab);
	});
	$(".SalidaTabs .tabs a").click(function(e){
		e.preventDefault();
		var index = $(this).parent().index();
		var IndexSelected = $(".SalidaTabs .tabs a.selected").index();
		var href = $(this).attr("href").split('#');
		var tab = href[1];
		$(".SalidaTabs .tabs a.selected").removeClass("selected");
		$(this).addClass("selected");
		$(".SalidaTabs .content-tabs.on").removeClass("on");
		$(".SalidaTabs .content-tabs").eq(index).addClass("on");
		$("#current_tab").val(tab);
	});
	$(".ServiciosTabs .tabs a").click(function(e){
		e.preventDefault();
		var index = $(this).parent().index();
		var IndexSelected = $(".ServiciosTabs .tabs a.selected").index();
		$(".ServiciosTabs .tabs a.selected").removeClass("selected");
		$(this).addClass("selected");
		$(".ServiciosTabs .content-tabs.on").removeClass("on");
		$(".ServiciosTabs .content-tabs").eq(index).addClass("on");

	});
	$(".LineaNegociosTabs .tabs a").click(function(e){
		e.preventDefault();
		var index = $(this).parent().index();
		var IndexSelected = $(".LineaNegociosTabs .tabs a.selected").index();
		$(".LineaNegociosTabs .tabs a.selected").removeClass("selected");
		$(this).addClass("selected");
		$(".LineaNegociosTabs .content-tabs.on").removeClass("on");
		$(".LineaNegociosTabs .content-tabs").eq(index).addClass("on");

	});
	$("#save_demora_llega").click(function(e){
		e.preventDefault();
		save_demora_llega();
	});
	$("#save_demora_sale").click(function(e){
		e.preventDefault();
		save_demora_sale();
	});
	$("#save_servicio").click(function(e){
		e.preventDefault();
		save_servicio();
	});
	$("#cantidad").live("keypress",function(e){
		if(e.keyCode == 13 || e.keyCode == 10){
			e.preventDefault();
			save_servicio();
		}
	});
	$(".demora-sale-enter").live("keypress",function(e){
		if(e.keyCode == 13 || e.keyCode == 10){
			e.preventDefault();
			save_demora_sale();
		}
	});
	$(".demora-llega-enter").live("keypress",function(e){
		if(e.keyCode == 13 || e.keyCode == 10){
			e.preventDefault();
			save_demora_llega();
		}
	});
	$(".eliminar-demora-llega").live("click",function(e){
		e.preventDefault();
		var url = $(this).attr('href');
		$("#tbl_demoras_llega").html("");
		$("#tbl_demoras_llega").addClass("loader3");
		$.post(url,{
			layout:"false"
		       ,tipo:"llega"
		},function(data){
			$("#tbl_demoras_llega").removeClass("loader3");
			$("#tbl_demoras_llega").html(data.code);			
			total = parseInt($(".LlegadaTabs .tiempo-total span").html());
			$(".LlegadaTabs .tiempo-total span").html(total + parseInt(data.tiempo));
		},"json");
	});
	$(".eliminar-demora-sale").live("click",function(e){
		e.preventDefault();
		var url = $(this).attr('href');
		$("#tbl_demoras_sale").html("");
		$("#tbl_demoras_sale").addClass("loader3");
		$.post(url,{
			layout:"false"
		       ,tipo:"sale"
		},function(data){
			$("#tbl_demoras_sale").removeClass("loader3");
			$("#tbl_demoras_sale").html(data.code);
			$("#total_demora_sale").val(data.total);
			total = parseInt($(".SalidaTabs .tiempo-total span").html());
			$(".SalidaTabs .tiempo-total span").html(total + parseInt(data.tiempo));
		},"json");
	});
	$(".eliminar-servicio").live("click",function(e){
		e.preventDefault();
		var url = $(this).attr('href');
		$("#tbl_servicios").html("")
		$("#tbl_servicios").addClass("loader3");
		$.post(url,{
			layout:"false"
		},function(data){
			$("#tbl_servicios").removeClass("loader3");
			$("#tbl_servicios").html(data.code);
		},"json");
	});
	$(".kilos").keyup(function(e){
		var libras = $(this).val() * 2.20462262;
		$(this).parent().parent().find('.libras').val(libras);
	});
	$(".libras").keyup(function(e){
		var kilos = $(this).val() * 0.45359237;
		$(this).parent().parent().find('.kilos').val(kilos);
	});
	$("#combustible_gal").keyup(function(e){
		var litros = $(this).val() * 3.7854118;
		$("#combustible_lit").val(litros);
	});
	$("#combustible_lit").keyup(function(e){
		var galones = $(this).val() * 0.264172051;
		$("#combustible_gal").val(galones);
	});
	$('#peso_despegue_unit').change(function(e){
		var unit = $(this).val();
		var peso_despegue = $('#peso_despegue').val();
		var peso_max = $('#peso_max_despegue').val();
		var margen_seguridad = $('#margen_seguridad').val();
		
		if(unit == 'LBS'){
			$('#peso_despegue').val((peso_despegue * 2.20462262));
			$('#peso_max_despegue').val((peso_max * 2.20462262));
		}else if(unit == 'KGS'){
			$('#peso_despegue').val((peso_despegue / 2.20462262));
			$('#peso_max_despegue').val((peso_max / 2.20462262));			
		}
		margen_seguridad = $('#peso_max_despegue').val() - $('#peso_despegue').val();
		$('#margen_seguridad').val(margen_seguridad);
		$('#peso_max_despegue_unit').val(unit);
		$('#margen_seguridad_unit').val(unit);
	});
	$("#popup-matricula").live("submit",function(e){
		e.preventDefault();
		$("#popup-matricula .submit").addClass("hidden");
		$("#popup-matricula .message").html("");
		$("#popup-matricula .message").addClass("loader2");
		tipo = $("#agregar_matricula").val();
		$.post("/aeronaves/insertar/",{
			Matricula:$.trim($("#Matricula").val())
			,peso_operacion:$.trim($("#peso_operacion").val())
			,peso_despegue:$.trim($("#peso_despegue").val())
			,peso_max_despegue:$.trim($("#peso_max_despegue").val())
			,Equipo_de_Vlo:$.trim($("#Equipo_de_Vlo").val())
			,idaerolinea:$.trim($("#idaereolinea_matricula").val())
			,margen_seguridad:$.trim($("#margen_seguridad").val())
			,nolayout:true
		},function(data){
			$("#popup-matricula .message").removeClass("loader2");
			$("#popup-matricula .submit").removeClass("hidden");
			if(!data.error){
				value = "<option value='"+data.id+"'>" + $("#Matricula").val() + "</option>";
				if(tipo == "llega"){
					$("#matricula_llega").append(value);
					$("#matricula_llega").val(data.id);	
				}
				$("#matricula_sale").append(value);
				$("#matricula_sale").val(data.id);
				
				$("#popup").hide();
				$("#popup-matricula").hide();
				$("#popup-matricula").html("");
				$("#message").html("<a href='#'>X</a><p class='success'>" + data.message + "</p>");
			}else{
				$("#popup-matricula .message").html("<p class='error'>" + data.message + "</p>");
			}
		},"json");
	});
	$("#matricula_llega_nuevo").click(function(e){
		e.preventDefault();
		mostrarPopupMatricula("llega");
	});
	$("#matricula_sale_nuevo").click(function(e){
		e.preventDefault();
		mostrarPopupMatricula("sale");

	});
	$("#content .captura .subservicio").click(function(e){
		var subservicio = $(this);
		subservicio.addClass("hidden");
		$("#content .captura .subservice-loader").addClass("loader2");
		if($(this).hasClass('true')){
			$.post("/aeronaves/fetchmatriaerolineas/",{
				id:$("#idaerolinea").val()
			},function(data){
				$("#matricula_llega").html("");
				$("#matricula_llega").append(data);
				$("#matricula_sale").html("");
				$("#matricula_sale").append(data);
				$("#content .captura .subservice-loader").removeClass("loader2");
				subservicio.removeClass("hidden");
				subservicio.removeClass("true");
			});

		}else{
			$.post("/aeronaves/fetchmatriculas/",function(data){
				$("#matricula_llega").html("");
				$("#matricula_llega").append(data);
				$("#matricula_sale").html("");
				$("#matricula_sale").append(data);
				$("#content .captura .subservice-loader").removeClass("loader2");
				subservicio.removeClass("hidden");
				subservicio.addClass("true")
			});
		}
	});
	$("#matricula_llega").change(function(e){
		var value = $(this).val();
		$("#matricula_sale").val(value);
	});
	$("#matricula_sale").change(function(e){
		var value = $(this).val();
		$.post("/aeronaves/getpesos/",{id:value},
			function(data){
// 				$("#peso_de_operacion").val(data.peso_operacion);
// 				$("#peso_despegue").val(data.peso_despegue);
				$("#peso_max_despegue").val(data.peso_max_despegue);
				if($.trim($("#peso_despegue").val()) != ""){
					var val = $("#peso_max_despegue").val() - $("#peso_despegue").val();
					$("#margen_seguridad").val(val);
				}
// 				$("#margen_seguridad").val(data.margen_seguridad);
		},"json");
	});
	$(".pax_llega_suma").keyup(function(e){
		var size = $(".pax_llega_suma").size();
		var total = 0;
		for(i=0;i<size;i++){
			var val = $(".pax_llega_suma").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total + parseInt(val);
		}
		$("#pax_llega_total").val(total);
	});
	$("#comandante_sale_nuevo").click(function(e){
		var value = $(this).val();
		agregar_piloto(value,"Comandante","comandante","licencia0","sale");
		return false;
	});
	$("#oficial1_sale_nuevo").click(function(e){
		e.preventDefault();
		var value = $(this).val();
		agregar_piloto(value,"Primer oficial","oficial1","licencia1","sale");
	});
	$("#oficial2_sale_nuevo").click(function(e){
		e.preventDefault();
		var value = $(this).val();
		agregar_piloto(value,"Segundo oficial","oficial2","licencia2","sale");
	});
	$("#oficial3_sale_nuevo").click(function(e){
		e.preventDefault();
		var value = $(this).val();
		agregar_piloto(value,"Tercer oficial","oficial3","licencia3","sale");
	});
	
	$("#comandante_llega_nuevo").click(function(e){
		var value = $(this).val();
		agregar_piloto(value,"Comandante","comandante","licencia0","llega");
		return false;
	});
	$("#oficial1_llega_nuevo").click(function(e){
		e.preventDefault();
		var value = $(this).val();
		agregar_piloto(value,"Primer oficial","oficial1","licencia1","llega");
	});
	$("#oficial2_llega_nuevo").click(function(e){
		e.preventDefault();
		var value = $(this).val();
		agregar_piloto(value,"Segundo oficial","oficial2","licencia2","llega");
	});
	$("#oficial3_llega_nuevo").click(function(e){
		e.preventDefault();
		var value = $(this).val();
		agregar_piloto(value,"Tercer oficial","oficial3","licencia3","llega");
	});
	$(".estacion_a_a").keyup(function(e){
		var size = $(".estacion_a_a").size();
		var total = 0;
		for(i=0;i<size;i++){
			var val = $(".estacion_a_a").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total  + parseInt(val);
		}
		$("#estacion_a_a_total").val(total);
		total = total + parseInt($("#estacion_a_m_total").val());
		$("#internacionales").val(total);
	});
	$(".estacion_a_m").keyup(function(e){
		var size = $(".estacion_a_m").size();
		var total = 0;
		for(i=0;i<size;i++){
			val = $(".estacion_a_m").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total  + parseInt(val);
		}
		$("#estacion_a_m_total").val(total);
		total = total + parseInt($("#estacion_a_a_total").val());
		$("#internacionales").val(total);
	});
	$(".estacion_a_i").keyup(function(e){
		var size = $(".estacion_a_i").size();
		var total = 0;
		for(i=0;i<size;i++){
			val = $(".estacion_a_i").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total  + parseInt(val);
		}
		$("#estacion_a_i_total").val(total);
		$("#infantes").val(total);
	});
	$(".estacion_a_xq").keyup(function(e){
		var size = $(".estacion_a_xq").size();
		var total = 0;
		for(i=0;i<size;i++){
			val = $(".estacion_a_xq").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total  + parseInt(val);
		}
		$("#estacion_a_xq_total").val(total);
	});
	$(".estacion_a_cgo").keyup(function(e){
		var size = $(".estacion_a_cgo").size();
		var total = 0;
		for(i=0;i<size;i++){
			val = $(".estacion_a_cgo").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total  + parseInt(val);
		}
		$("#estacion_a_cgo_total").val(total);
	});
	$(".estacion_a_mail").keyup(function(e){
		var size = $(".estacion_a_mail").size();
		var total = 0;
		for(i=0;i<size;i++){
			val = $(".estacion_a_mail").eq(i).val();
			if($.trim(val) == "")
				val = '0';
			total = total  + parseInt(val);
		}
		$("#estacion_a_mail_total").val(total);
	});

	var uploader1 = new qq.FileUploader({
		element: document.getElementById('file_llega')
		,action: '/capturas/subirfcsllegada/'
		,multiple:false
		,onSubmit:function(id, fileName){
			uploader1.setParams({
				FCS: $("#fcs_number").val()
				,id:$("#id_captura").val()
			});
		}
	});
 	var uploader2 = new qq.FileUploader({
 		element: document.getElementById('file_sale')
 		,action: '/capturas/subirfcssalida/'
 		,multiple:false
 		,onSubmit:function(id, fileName){
			uploader2.setParams({
				FCS: $("#fcs_number").val()
				,id:$("#id_captura").val()
			});
		}
 	});
	$("#pax_clave_anotaciones").click(function(e){
		var check = $(this).attr("checked");
		if(check){
			$("#tbl_pax_pagados").slideDown("fast").removeClass("hidden");
		}else{
			$("#tbl_pax_pagados").slideUp("fast").addClass("hidden");
		}
	});
	$("#peso_balance_llega").change(function(e){
		var value = $(this).val();
		$("#autorizo_llega").val(value);
	});
	$("#estadoCaptura2").change(function(e){
		var value = $(this).val();
		if(value == "Cancelado"){
			var response = confirm("¿Esta seguro de Cancelar esta vuelo?");
			if(!response){
				$(this).val($("#estadoCaptura").val());
				$("#cargarImporte").val('no');
			}else{
				var response2 = confirm("¿Desea Agregarle un cargo al vuelo?");
				if(response2){
					$("#cargarImporte").val('yes');
				}else{
					$("#cargarImporte").val('no');
				}				
			}
		}else{
			$("#cargarImporte").val('no');
		}	
	});
	/*AUTOCOMPLETS PILOTOS*/
	
	
	/*autocomplete comandantes*/
	$(".comandante_autocomplete").bind(($.browser.opera ? "keypress" : "keydown") , function(e){
		object_key_press = $(this);
		if(e.keyCode != KEY.ENTER && e.keyCode != KEY.RETURN && e.keyCode != KEY.UP && e.keyCode != KEY.DOWN && e.keyCode != KEY.PAGEUP && e.keyCode != KEY.PAGEDOWN && e.keyCode != KEY.TAB){
			var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
			$("#comandante_" + sheet).next().removeClass("acceped");
			$("#comandante_" + sheet).val("");
		}
	});	
	$(".comandante_autocomplete").autocomplete({
		source: function(request, response) {
			var type = object_key_press.hasClass('nombre') ?  'comandante_nombre' : 'comandante_licencia';
			$.get("/pilotos/autocomplete/?q=" + request.term+"&type=" + type, function(data){
				var array = new Array();
				if(data != null){
					for(var i=0;i<data.items.length;i++){
						if(type == 'comandante_nombre'){
							html =  data.items[i].apellido + " "+ data.items[i].Nombre;
							cod = data.items[i].apellido + " "+ data.items[i].Nombre;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,Licencia:data.items[i].Licencia}
						}else{
							html =  data.items[i].Licencia;
							cod = data.items[i].Licencia;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,nombre:data.items[i].apellido + " "+ data.items[i].Nombre}
						}
					}
				}
				response(array);
			},"json");
		},delay:500
		,select:function(event, ui){
			var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
			var type = object_key_press.hasClass('nombre') ?  'comandante_nombre' : 'comandante_licencia';
			
			$("#comandante_" + sheet).next().addClass("acceped");
			$("#comandante_" + sheet).val(ui.item.idpiloto);
			
			if(type == 'comandante_nombre'){
				$("#licencia0_" + sheet + "_fake").val(ui.item.Licencia);
			}else{
				$("#comandante_" + sheet + "_fake").val(ui.item.nombre);
			}
		}
	});

	/*autocomplete primer oficial*/
	$(".primer_oficial_autocomplete").bind(($.browser.opera ? "keypress" : "keydown") , function(e){
		object_key_press = $(this);
		if(e.keyCode != KEY.ENTER && e.keyCode != KEY.RETURN && e.keyCode != KEY.UP && e.keyCode != KEY.DOWN && e.keyCode != KEY.PAGEUP && e.keyCode != KEY.PAGEDOWN && e.keyCode != KEY.TAB){
			var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
			$("#licencia1_" + sheet).next().removeClass("acceped");
 			$("#licencia1_" + sheet).val("");
		}
	});	
	$(".primer_oficial_autocomplete").autocomplete({
		source: function(request, response) {
			var type = object_key_press.hasClass('nombre') ?  'primer_oficial_nombre' : 'primer_oficial_licencia';
			$.get("/pilotos/autocomplete/?q=" + request.term+"&type=" + type, function(data){
				var array = new Array();
				if(data != null){
					for(var i=0;i<data.items.length;i++){
						if(type == 'primer_oficial_nombre'){
							html =  data.items[i].apellido + " "+ data.items[i].Nombre;
							cod = data.items[i].apellido + " "+ data.items[i].Nombre;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,Licencia:data.items[i].Licencia}
						}else{
							html =  data.items[i].Licencia;
							cod = data.items[i].Licencia;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,nombre:data.items[i].apellido + " "+ data.items[i].Nombre}
						}
					}
				}
				response(array);
			},"json");
		},delay:500
		,select:function(event, ui){
			var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
			var type = object_key_press.hasClass('nombre') ?  'primer_oficial_nombre' : 'primer_oficial_licencia';
			
			$("#licencia1_" + sheet).next().addClass("acceped");
			$("#oficial1_" + sheet).val(ui.item.idpiloto);
			
			if(type == 'primer_oficial_nombre'){
				$("#licencia1_" + sheet + "_fake").val(ui.item.Licencia);
			}else{
				$("#oficial1_" + sheet + "_fake").val(ui.item.nombre);
			}
			$("#licencia1_" + sheet + "_fake").val(ui.item.Licencia);
		}
	});	

	/*autocomplete segundo oficial*/
	$(".segundo_oficial_autocomplete").bind(($.browser.opera ? "keypress" : "keydown") , function(e){
		object_key_press = $(this);
		var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
		if(e.keyCode != KEY.ENTER && e.keyCode != KEY.RETURN && e.keyCode != KEY.UP && e.keyCode != KEY.DOWN && e.keyCode != KEY.PAGEUP && e.keyCode != KEY.PAGEDOWN && e.keyCode != KEY.TAB){
			$("#oficial2_" + sheet).next().removeClass("acceped");
 			$("#oficial2_" + sheet).val("");
		}
	});	
	$(".segundo_oficial_autocomplete").autocomplete({
		source: function(request, response) {
			var type = object_key_press.hasClass('nombre') ?  'segundo_oficial_nombre' : 'segundo_oficial_licencia';
			$.get("/pilotos/autocomplete/?q=" + request.term+"&type=" + type, function(data){
				var array = new Array();
				if(data != null){
					for(var i=0;i<data.items.length;i++){
						if(type == 'segundo_oficial_nombre'){
							html =  data.items[i].apellido + " "+ data.items[i].Nombre;
							cod = data.items[i].apellido + " "+ data.items[i].Nombre;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,Licencia:data.items[i].Licencia}
						}else{
							html =  data.items[i].Licencia;
							cod = data.items[i].Licencia;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,nombre:data.items[i].apellido + " "+ data.items[i].Nombre}
						}
					}
				}
				response(array);
			},"json");
		},delay:500
		,select:function(event, ui){
			var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
			var type = object_key_press.hasClass('nombre') ?  'segundo_oficial_nombre' : 'segundo_oficial_licencia';
			$("#oficial2_" + sheet).next().addClass("acceped");
			$("#oficial2_" + sheet).val(ui.item.idpiloto);
			if(type == 'segundo_oficial_nombre'){
				$("#licencia2_" + sheet + "_fake").val(ui.item.Licencia);
			}else{
				$("#oficial2_" + sheet + "_fake").val(ui.item.nombre);
			}
			$("#licencia2_" + sheet + "_fake").val(ui.item.Licencia);
		}
	});
		
	/*autocomplete tercer oficial*/
	$(".tercer_oficial_autocomplete").bind(($.browser.opera ? "keypress" : "keydown") , function(e){
		object_key_press = $(this);
		var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
		if(e.keyCode != KEY.ENTER && e.keyCode != KEY.RETURN && e.keyCode != KEY.UP && e.keyCode != KEY.DOWN && e.keyCode != KEY.PAGEUP && e.keyCode != KEY.PAGEDOWN && e.keyCode != KEY.TAB){
			$("#oficial3_" + sheet).next().removeClass("acceped");
 			$("#oficial3_" + sheet).val("");
		}
	});	
	$(".tercer_oficial_autocomplete").autocomplete({
		source: function(request, response) {
			var type = object_key_press.hasClass('nombre') ?  'tercer_oficial_nombre' : 'tercet_oficial_licencia';
			$.get("/pilotos/autocomplete/?q=" + request.term+"&type=" + type, function(data){
				var array = new Array();
				if(data != null){
					for(var i=0;i<data.items.length;i++){
						if(type == 'tercer_oficial_nombre'){
							html =  data.items[i].apellido + " "+ data.items[i].Nombre;
							cod = data.items[i].apellido + " "+ data.items[i].Nombre;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,Licencia:data.items[i].Licencia}
						}else{
							html =  data.items[i].Licencia;
							cod = data.items[i].Licencia;
							array[array.length] = {label:html,value:cod,idpiloto:data.items[i].idpiloto,nombre:data.items[i].apellido + " "+ data.items[i].Nombre}
						}
					}
				}
				response(array);
			},"json");
		},delay:500
		,select:function(event, ui){
			var sheet = object_key_press.hasClass('llega') ? 'llega' : 'sale';
			var type = object_key_press.hasClass('nombre') ?  'tercer_oficial_nombre' : 'tercer_oficial_licencia';
			
			$("#oficial3_" + sheet).next().addClass("acceped");
			$("#oficial3_" + sheet).val(ui.item.idpiloto);
			if(type == 'tercer_oficial_nombre'){
				$("#licencia3_" +sheet + "_fake").val(ui.item.Licencia);
			}else{
				$("#oficial3_" + sheet + "_fake").val(ui.item.nombre);
			}
			$("#licencia3_"+ sheet +"_fake").val(ui.item.Licencia);
		}
	});
		
});
function mostrarPopupMatricula(tipo){
	$("#popup").css("display","table");
	$("#popup .content-popup .html").html("<div class='loader2'></div>");
	var content = $("#popup-load1").html();
	$("#popup .content-popup .html").html(content);
	$("#popup .content-popup").css("width","210px");
	$("#agregar_matricula").val(tipo);
}
function agregar_piloto(value,tipo,pilto_object,licencia_object,tipo_tripulacion){
	var content = $("#popup-load2").html();
	$("#popup .html").html(content);
	$("#popup").css("display","table");
	$("#popup").css("height",$("#wrap").height());
	$("#popup").css("width",window.innerWidth);
	$("#popup .cell .content-popup").css("width","208px");
	$("#popup-content").show();
	$("#Cargo").val(tipo);
	$("#objeto_piloto").val(pilto_object);
	$("#objeto_licencia").val(licencia_object);
	$("#tipo_tripulacion").val(tipo_tripulacion);
}
function captura_left(){
	$("#comandante_llega").change(function(e){
		$("#licencia0_llega").val($(this).val());
		$("#comandante_sale").val($(this).val());
		$("#licencia0_sale").val($(this).val());
	});
	$("#oficial1_llega").change(function(e){
		$("#licencia1_llega").val($(this).val());
		$("#oficial1_sale").val($(this).val());
		$("#licencia1_sale").val($(this).val());
	});

	$("#licencia1_llega").change(function(e){
		$("#oficial1_llega").val($(this).val());
		$("#oficial1_sale").val($(this).val());
		$("#licencia1_sale").val($(this).val());
	});

	$("#oficial2_llega").change(function(e){
		$("#licencia2_llega").val($(this).val());
		$("#oficial2_sale").val($(this).val());
		$("#licencia2_sale").val($(this).val());
	});

	$("#licencia2_llega").change(function(e){
		$("#oficial2_llega").val($(this).val());
		$("#oficial2_sale").val($(this).val());
		$("#licencia2_sale").val($(this).val());
	});

	$("#oficial3_llega").change(function(e){
		$("#licencia3_llega").val($(this).val());
		$("#oficial3_sale").val($(this).val());
		$("#licencia3_sale").val($(this).val());
	});

	$("#licencia3_llega").change(function(e){
		$("#oficial3_llega").val($(this).val());
		$("#oficial3_sale").val($(this).val());
		$("#licencia3_sale").val($(this).val());
	});
}
function captura_right(){
	$("#comandante_sale").change(function(e){
		$("#licencia0_sale").val($(this).val());
	});
	$("#oficial1_sale").change(function(e){
		$("#licencia1_sale").val($(this).val());
	});
	$("#licencia1_sale").change(function(e){
		$("#oficial1_sale").val($(this).val());
	});

	$("#oficial2_sale").change(function(e){
		$("#licencia2_sale").val($(this).val());
	});
	$("#licencia2_sale").change(function(e){
		$("#oficial2_sale").val($(this).val());
	});

	$("#oficial3_sale").change(function(e){
		$("#licencia3_sale").val($(this).val());
	});
	$("#licencia3_sale").change(function(e){
		$("#oficial3_sale").val($(this).val());
	});
}
function save_demora_llega(){
	$("#tbl_demoras_llega").html("");
	$("#tbl_demoras_llega").addClass("loader3");
	var demora_llega = $("#demora_llega").val();
	var tiempo_llega = $("#tiempo_llega").val();
	$.post("/capturas/insertardemora/"
	,{
		idcaptura : $("#idcaptura").val()
		,idcapturaLlega: $("#idcapturaLlega").val()
		,demora_llega: demora_llega
		,tiempo_llega: tiempo_llega
		,causa_llega:  $("#causa_llega").val()
		,tipo:"llega"
	}
	,function(data){
		$("#tbl_demoras_llega").removeClass("loader3");
		$("#tbl_demoras_llega").html(data.code);
		$("#total_demora_llega").val(data.total);
		$("#msj_demora_llega_captura").html(data.message);
		if(!data.error){
			$("#demora_llega").val("");
			$("#tiempo_llega").val("");
			total = parseInt($(".LlegadaTabs .tiempo-total span").html());
			$(".LlegadaTabs .tiempo-total span").html(total-tiempo_llega);
		}
	},"json");
}
function save_demora_sale(){
	$("#tbl_demoras_sale").html("");
	$("#tbl_demoras_sale").addClass("loader3");
	var demora_sale = $("#demora_sale").val();
	var tiempo_sale = $("#tiempo_sale").val();
	if($("#asp_demora").attr("checked")){
		var asp_value = $("#asp_demora").val();
	}else{
		var asp_value  = "no";
	}
		
	$.post("/capturas/insertardemora/"
	,{
		idcaptura : $("#idcaptura").val()
		,idcapturaSale: $("#idcapturaSale").val()
		,demora_sale: demora_sale
		,tiempo_sale: tiempo_sale
		,causa_sale:  $("#causa_sale").val()
		,asp:asp_value
		,tipo:"sale"
	}
	,function(data){
		$("#asp_demora").attr("checked",false);
		$("#tbl_demoras_sale").removeClass("loader3");
		$("#tbl_demoras_sale").html(data.code);
		$("#total_demora_sale").val(data.total);
		$("#msj_demora_sale_captura").html(data.message);
		if(!data.error){
			$("#demora_sale").val("");
			$("#tiempo_sale").val("");
			total = parseInt($(".SalidaTabs .tiempo-total span").html());
			$(".SalidaTabs .tiempo-total span").html(total-tiempo_sale);
		}
	},"json");
}
function save_servicio(){
	$("#tbl_servicios").html("");
	$("#tbl_servicios").addClass("loader3");
	$.post("/capturas/insertarservicio/"
	,{
		idservicio: $("#idservicio2").val()
		,idaerolinea: $("#idaerolinea").val()
		,id: $("#id_input").val()
		,cantidad: $("#cantidad").val()
	}
	,function(info){
		$("#tbl_servicios").removeClass("loader3");
		$("#tbl_servicios").html(info.code);
		if(!info.result){
			$("#msj-servicio-captura").html(info.message);
		}else{
			$("#idservicio2").val("");
			$("#cantidad").val("");
			$("#msj-servicio-captura").html("");
		}
	},"json");
}