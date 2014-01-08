var _timefilters_;
var KEY = {
	UP: 38,
	DOWN: 40,
	DEL: 46,
	TAB: 9,
	RETURN: 13,
	ENTER: 10,
	ESC: 27,
	COMMA: 188,
	PAGEUP: 33,
	PAGEDOWN: 34,
	BACKSPACE: 8
};
var object_programation;
var object_key_press;
$(document).ready(function(e){

	/*Manejo de Grupos en rampas*/

	
	$(".menu-tab-option").click(function(e){
		e.preventDefault();
		var index = $(this).index();
		var before = $(".menu-tab-option.on").index();
		$(".menu-tab-option.on").removeClass('on').addClass('hidden');
		$(".menu-tab-option").eq(index).removeClass('hidden').addClass('on');

		if(index != before){
			$(".info-menu-tab").eq(index).removeClass('hidden');
			$(".info-menu-tab").eq(before).addClass('hidden');
		}
	});
	$(".TabsOption1 .tabs a").click(function(e){
		e.preventDefault();
		var index = $(this).parent().index();
		var IndexSelected = $(".TabsOption1 .tabs a.selected").index();
		var href = $(this).attr("href").split('#');
		var tab = href[1];
		$(".TabsOption1 .tabs a.selected").removeClass("selected");
		$(this).addClass("selected");
		$(".TabsOption1 .content-tabs.on").removeClass("on");
		$(".TabsOption1 .content-tabs").eq(index).addClass("on");
		$("#current_tab").val(tab);

	});
	$(".permisos .form ul li .checkbox").click(function(e){
		var li = $(this).next().next().children('li');
		var checked = $(this).attr('checked');
		if(!checked){
			li.children(".checkbox").removeAttr("checked");
		}else{
			li.children(".checkbox").attr("checked", true);
		}
	});
	$(".checkbox-encuesta").live("click",function(){
		var object = $(this);
		object.hide();
		object.next().addClass("loader2");
		
		var add_empleado = $("#add_empleado_qms").val();
		var remove_empleado = $("#remove_empleado_qms").val();
		
		if ($(this).hasClass('true')){
			var _ideu = $(this).attr('name');
			var _usuario = $(this).val();
			$.post(remove_empleado,{
				ideu:_ideu,
				usuario:_usuario
			},function(data){
				$(data.row).removeClass("true");
				$(data.row).addClass("false");
				object.next().removeClass("loader2");
				object.show();
				object.attr("name",$("#id_encuesta").val());
			},"json");
		}else{
			var _encuesta = $(this).attr('name');
			var _usuario = $(this).val();
			$.post(add_empleado,{
				encuesta:_encuesta,
				usuario:_usuario
			},function(data){
				$(data.row).removeClass("false");
				$(data.row).addClass("true");
				object.next().removeClass("loader2");
				object.attr("name",data.id);
				object.show();
			},"json");
		}
	});

	$("#contrato").click(function(e){
		if($("#contrato").val()=='si'){
			$("#contrato").val('no');
			$("#vigencia_inicia_fake").attr("disabled", true).addClass("disabled").removeClass("required").val("");
			$("#vigencia_finaliza_fake").attr("disabled", true).addClass("disabled").removeClass("required").val("");
			$("#vigencia_inicia").removeClass("required").val("");
			$("#vigencia_finaliza").removeClass("required").val("");
		}else{
			if($("#contrato").val()=='no'){
				$("#contrato").val('si');
				$("#vigencia_inicia_fake").removeAttr("disabled").removeClass("disabled");
				$("#vigencia_finaliza_fake").removeAttr("disabled").removeClass("disabled");
				$("#vigencia_inicia").addClass("required");
				$("#vigencia_finaliza").addClass("required");
			}
		}
	});
	$("#UTC_sale_hora").change(function(e){
		var checked = $("#horario_checked").attr("checked");
		var shora = parseInt($("#UTC_sale_hora").val());
		var lhora = parseInt($("#UTC_llega_hora").val());
		if( shora <  lhora && !checked){
			$("#UTC_sale_hora").val("")
			$("#UTC_sale_minuto").val("");
			
			alert("El tiempo de salida debe ser mayor");
		}else
			$("#UTC_sale_minuto").removeAttr("disabled");
	});
	$("#UTC_sale_minuto").change(function(e){
		var checked = $("#horario_checked").attr("checked");
		var shora = parseInt($("#UTC_sale_hora").val());
		var lhora = parseInt($("#UTC_llega_hora").val());
		var sminuto = parseInt($("#UTC_sale_minuto").val());
		var lminuto = parseInt($("#UTC_llega_minuto").val());
		
		if(shora == lhora){
			if( sminuto <= lminuto && !checked){
				$("#UTC_sale_minuto").val("");
				alert("El tiempo de salida debe ser mayor");
			}
		}else if (shora < lhora){
			if(!checked){
				$("#UTC_sale_minuto").val("");
				alert("El tiempo de salida debe ser mayor");
			}
		}else{

		}
	});
	$("#popup .click").click(function(e){
		$("#popup").hide();
		$("#popup-content").hide();
		$("#popup-content2").hide();
		$(".qq-upload-list").html("");
		$("#popup-content").html("");	
	});
	$("#popup a.close,.popup_rampas a.close,#popup .html .close").click(function(e){
		e.preventDefault();
		$("#popup,.popup_rampas").hide();
	});
	$("#idservicio").change(function(e){
		$.post("/servicios/getprice/id/" + $(this).val(),function(data){
			$("#precio").val(data);
		});
	});
	$("#programacion .crear").live("click",function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		var crear = $(this);
		crear.html("");
		crear.addClass("loader2");
		var ros = $(this).parent().prev().children('a');
		$.post(href,{layout:false},function(data){
			crear.attr("href",data.url);
			crear.removeClass('crear');
			crear.html(data.hoja);
			crear.removeClass("loader2");
			ros.attr("href","#" + data.idcaptura);
		},"json");
	});
	$(".add-info-programacion").live("click",function(e){
		e.preventDefault();
		var object = $(this);
		object_programation = object;
		var idcaptura = object.attr("href").split("#");
		idcaptura = idcaptura[1];
		var height_window = $(window).height();
		$("#popup").css("display","table");
		$("#popup .content-popup").css("width","260px");
		if(idcaptura != ""){
			$("#popup .content-popup .html").html("");
			$("#popup .content-popup .html").addClass("loader2");
			$.post("/programaciones/getros/"
			       ,{idcaptura:idcaptura}
			       ,function(info){
					$("#popup .content-popup .html").removeClass("loader2");
					$("#popup .content-popup .html").html($("#add-info").html());
					$("#popup .content-popup .html").css("max-height",(height_window-100));
					$("#idsupervisor").val(info.s_id);
					$("#idpeso").val(info.p_id);
					$("#posicion_llega").val(info.posicion);
					$("#matricula_llega").append(info.matriculas);
					$("#matricula_llega").val(info.idaeronave);
					$("#aereocar_llega").val(info.aerocar);
					$("#pasillo_llega").val(info.pasillo);
					$("#No_FCS").val(info.No_FCS);
					$("#hbs").val(info.hbs);
					$("#banda_belt").val(info.banda_belt);
					$("#pax_out").val(info.pax_out);
					$("#pax_in").val(info.pax_in);
					$("#ETA_llega_hora").val(info.ETA_hora);
					$("#ETA_llega_minuto").val(info.ETA_minuto);
					$("#popup .content-popup .html .form").append("<p><input type='hidden' name='action' value='update'  id='action' /></p>");
					$("#popup .content-popup .html .form").append("<p><input type='hidden' value='"+  idcaptura +"' name='idcaptura' id='idcaptura'></p>");
					$("#popup .content-popup .html .form").append("<p><input type='hidden' value='" + object.attr("title") + "' name='idprogramacion' id='idprogramacion'></p>");
			},"json");
		}else{
			$("#popup .content-popup .html").html("");
			$("#popup .content-popup .html").addClass("loader2");
			$.post("/programaciones/getros/",{idprogramacion:object.attr("title")},
				function(info){
					$("#popup .content-popup .html").removeClass("loader2");
					$("#popup .content-popup .html").html($("#add-info").html());
					$("#popup .content-popup .html .form").append("<p><input type='hidden' name='action' value='create'  id='action' /></p>");
					$("#popup .content-popup .html .form").append("<p><input type='hidden' value='' name='idcaptura' id='idcaptura'></p>");
					$("#popup .content-popup .html .form").append("<p><input type='hidden' value='"+ object.attr("title") +"' name='idprogramacion' id='idprogramacion'></p>");
					$("#matricula_llega").append(info.matriculas);       
			},"json");
		}
	});
	$(".form-info-programacion").live("submit",function(e){
		e.preventDefault();
		var action = $("#action").val();
		var object = $(this);
		$("#popup .content-popup .loader-info-programacion").addClass("loader2");
		if(action == "create"){
			//object_programation is a global var
			object_programation.parent().next().children("a").addClass("loader2").html("");
		}
		$.post("/capturas/agregarros/",{
			No_FCS:$("#No_FCS").val()
			,idpeso:$("#idpeso").val()
			,idsupervisor:$("#idsupervisor").val()
			,action2:action
			,idcaptura:$("#idcaptura").val()
			,idprogramacion:$("#idprogramacion").val()
			,posicion_llega:$("#posicion_llega").val()
			,matricula_llega:$("#matricula_llega").val()
			,aereocar_llega:$("#aereocar_llega").val()
			,pasillo_llega:$("#pasillo_llega").val()
			,banda_belt:$("#banda_belt").val()
			,hbs:$("#hbs").val()
			,pax_out:$("#pax_out").val()
			,pax_in:$("#pax_in").val()
			,ETA_llega_hora:$("#ETA_llega_hora").val()
			,ETA_llega_minuto:$("#ETA_llega_minuto").val()
		},function(info){
			$("#popup .content-popup .loader-info-programacion").removeClass("loader2");
			if(info.result){
				if(action == "create"){
					object_programation.parent().next().children("a").removeClass("loader2").html("capturar");
					object_programation.parent().next().children("a").attr("href",info.url).addClass("creada").removeClass("crear");
					object_programation.attr("href","#" + info.idcaptura);
					$("#action").val("update");
					$("#idcaptura").val(info.idcaptura);
				}
				object_programation.parent().prev().html( info.s_numero + " / " + info.p_numero );
				object_programation.parent().parent().children().eq(1).html($("#No_FCS").val());
				object_programation.parent().parent().children().eq(8).html($("#ETA_llega_hora").val()+":"+$("#ETA_llega_minuto").val());
				object_programation.parent().parent().children().eq(12).html($("#posicion_llega").val() );
				object_programation.parent().parent().children().eq(13).html($("#matricula_llega>option:selected").text());
				object_programation.parent().parent().children().eq(14).html($("#banda_belt").val());
				object_programation.parent().parent().children().eq(15).html($("#hbs").val());
				object_programation.parent().parent().children().eq(16).html($("#pax_in").val());
				object_programation.parent().parent().children().eq(17).html($("#pax_out").val());
				
				$("#popup .content-popup .loader-info-programacion").html("<p>Registros Guardados Exitosamente</p>");
			}else{
				if(action == "create"){
					object_programation.parent().next().children("a").removeClass("loader2").html("crear");
				}
				$("#popup .content-popup .loader-info-programacion").html("<p>Ha ocurrido un error</p>");
			}
		},"json");
	});
	$(".Activo").live("click",function(e){//Esta funcion desactiva un registro
		e.preventDefault();
		var response  = confirm("¿Realmente deseas Desactivar este registro?");
		if(response){
			var href = $(this).attr("href");
			var Inactivar = $(this);
			Inactivar.html("");
			Inactivar.addClass("loader2");
			$.post(href,{layout:false},function(data){
				if(data.result){
					Inactivar.attr("href",data.url);
					Inactivar.html(data.result);
					Inactivar.removeClass("loader2");
					Inactivar.removeClass("Activo").addClass("Inactivo");
				}else{
					Inactivar.html("Activo");
					Inactivar.removeClass("loader2");
				}
// 			Activo.removeClass(data.cls).addClass(data.ncls);
			},"json");
		}
	});
	$(".Inactivo").live("click",function(e){//Esta funcion inactiva un registro
		e.preventDefault();
		var response  = confirm("¿Realmente deseas Activar este registro?");
		if(response){
			var href = $(this).attr("href");
			var Activar = $(this);
			Activar.html("");
			Activar.addClass("loader2");
			$.post(href,{layout:false},function(data){
				if(data.result){
					Activar.attr("href",data.url);
					Activar.html(data.result);
					Activar.removeClass("loader2");
					Activar.removeClass("Inactivo").addClass("Activo");
				}else{
					Activar.html("Inactivo");
					Activar.removeClass("loader2");
				}
// 			Inactivo.removeClass(data.cls).addClass(data.ncls);
			},"json");
		}
	});
	$("#header .options a").click(function(e){
		e.preventDefault();
		$("#header .options a.on").removeClass("on");
		$("#header .submenu.on").removeClass("on");
		$("#header .submenu").eq($(this).index()).addClass("on");
		$(this).addClass("on");
	});
	$("#header .menu a").click(function(e){
		e.preventDefault();
		$("#header .menu a.on").removeClass("on");
		$("#header .submenu.on").removeClass("on");
		$("#header .submenu").eq($(this).index()).addClass("on");
		$(this).addClass("on");
	});
	$("#menssage_day a").live('click',function(e){
		e.preventDefault();
		$("#menssage_day").html("");
	});
	$(".equipo_autocomplete").autocomplete({
		source: function(request, response) {
			$.get("/aeronaves/equipoautocomplete/?q=" + request.term, function(data) {
				response(data.split("\n"));
			});
		}
		,delay:500
	});
	$(".country_autocomplete").autocomplete({
		source: function(request, response) {
			$.get("/aeropuertos/autocompletecountry/?q=" + request.term, function(data) {
				response(data.split("\n"));
			});
		}
		,delay:500
	});
	$(".city_autocomplete").autocomplete({
		source: function(request, response) {
			$.get("/aeropuertos/autocompletecity/?q=" + request.term, function(data) {
				response(data.split("\n"));
			});
		}
		,delay:500
	});
	$(".aeropuerto_autocomplete").bind(($.browser.opera ? "keypress" : "keydown") , function(e){
		if(e.keyCode != KEY.ENTER && e.keyCode != KEY.RETURN && e.keyCode != KEY.UP && e.keyCode != KEY.DOWN && e.keyCode != KEY.PAGEUP && e.keyCode != KEY.PAGEDOWN && e.keyCode != KEY.TAB){
			 $(this).next().removeClass("acceped");
 			$(this).next().next().val("");
		}
	});	
	$(".aeropuerto_autocomplete").autocomplete({
		source: function(request, response) {
			$.get("/aeropuertos/autocomplete/?q=" + request.term, function(data) {
				var array = new Array();
				if(data != null){
					for(var i=0;i<data.items.length;i++){
						if(data.items[i].Cod_Apto != "N/A"){
							html =  data.items[i].Nombre + " (" + data.items[i].Cod_Apto + ")";
							cod = data.items[i].Cod_Apto;
						}else{
							html =  data.items[i].Nombre + " (" + data.items[i].cod_oaci + ")";
							cod = data.items[i].cod_oaci;
						}
						array[array.length] = {label:html,value:cod,id:data.items[i].id}
					}
				}
				response(array);
			},"json");
		}
		,delay:500
		,select:function(event, ui){
			var item = ui.item.id;
			$(this).next().addClass("acceped");
			$(this).next().next().val(item);
			$(this).next().next().removeClass("error");
			$(this).parent().children("label").remove();			
		}
	});
	
	$.validator.setDefaults({ ignore: [] });
	$(".form").validate({
		event: "blur",
		rules:{'required': "required", 'email' : { required: true, email: true }},
		debug: false,
		errorElement: "label",
		errorContainer: $("#errores")
	});  
	$("#message a").live("click",function(e){
		e.preventDefault();
		$("#message").html("");
	});
	$("input").focus(function(e){
		$(this).css("border-color","#858585");
	}).focusout(function(e){
		$(this).css("border-color","#D3D3D3");
	});
	$("select").focus(function(e){
		$(this).css("border-color","#858585");
	}).focusout(function(e){
		$(this).css("border-color","#D3D3D3");
	});
	$(".TblList table td a.edit").click(function(e){
		e.preventDefault();
		var i;
		var object = $(this).parent().parent().children();
		var p = $(this).parent().position();
		$(".EditInputs").removeClass("hidden");
		$("#id_input").val($(this).attr("href"));
		$(".EditInputs").css("top",p.top-6);
		for(i=0;i<$(".EditInputs .edit").size();i++){
			$(".EditInputs .edit").eq(i).val(object.eq(i).children('span').html());
		}
		$(".EditInputs .save").val("Guardar");
	});
// 	$(".Vigencia_UTC_llegada").datepicker({minDate: new Date()});
// 	$(".Vigencia_UTC_salida").datepicker({minDate: new Date()});

	$(".Vigencia_UTC_llegada_fake").datepicker({altField :".Vigencia_UTC_llegada",dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});
	$(".Vigencia_UTC_salida_fake").datepicker({altField :".Vigencia_UTC_salida",dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});

	$(".date_start_fake").datepicker({altField:".date_start" ,dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});
	$(".date_end_fake").datepicker({altField:".date_end",dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});
	$(".next_evaluation_fake").datepicker({altField:".next_evaluation",dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});
	
	$(".inicio_periodo_fake").datepicker({altField:".inicio_periodo" ,dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});
	$(".fin_periodo_fake").datepicker({altField:".fin_periodo" ,dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true});
	
	$("#fecha_slot_new").datepicker({minDate: new Date()});
	$("#fecha_slot_edit").datepicker({minDate: new Date()});

	$("#SlcFiltro1").change(function(e){
		var value = $(this).val();
		var controller = $("#controller").val();
		if(value == "all" || value == "today" || value == "month"){
			$("#TxtFiltro1").attr("disabled", true);
			_filter();
		}else{
			$("#TxtFiltro1").removeAttr("disabled");
		}
	});

	$(".filters").keyup(function(e){
		e.preventDefault();
		_filter();
	});

	$("#estado").change(function(e){
		filter();
	});
	/*$(".demora_llega").keyup(function(e){

		var size = $(".demora_llega").size();
		var total = 0;
		for(i=0;i<size;i++){
			 total = total + parseInt($(".demora_llega").eq(i).val());
		}
		$("#total_demora_llega").val(total);
	});
	$(".demora_salida").keyup(function(e){

		var size = $(".demora_salida").size();
		var total = 0;
		for(i=0;i<size;i++){
			 total = total + parseInt($(".demora_salida").eq(i).val());
		}
		$("#total_demora_sale").val(total);
	});*/
	$("#peso_max_despegue,#peso_despegue").live("keyup",function(e){
		var min = $.trim($("#peso_despegue").val());
		var max = $.trim($("#peso_max_despegue").val());
		if(min != "" && max != ""){
			$("#margen_seguridad").val(max-min);
		}
	});
	$(".agregar").toggle(function(e){
		e.preventDefault();
		$(".NewInputs").slideDown('fast',function(){
			$(".NewInputs").removeClass('hidden');
		});001
	},function(e){
		e.preventDefault();
		$(".NewInputs").slideUp('fast',function(){
			$(".NewInputs").addClass("hidden");
		});
	});
	$(".filtrar").toggle(function(e){
		e.preventDefault();
		$(".InputsFind").slideDown('fast',function(){
			$(".InputsFind").removeClass('hidden');
		});
	},function(e){
		e.preventDefault();
		$(".InputsFind").slideUp('fast',function(){
			$(".InputsFind").addClass("hidden");
		});
	});
	$("#ue_filtro1").change(function(e){
		var value = $(this).val();
		$("#ue_data1").html("");
		if(value != ""){
			$("#ue_data").hide();
			$(".InputsFind .message").addClass('loader2');
			$.post("/encuestas/fusuarios/",{
				ue_filtro1:$("#ue_filtro1").val()
			},function(data){
				$("#ue_data1").append(data);
				$(".InputsFind .message").removeClass('loader2');
				$("#ue_data1").show();
			});
		}
	});
	$("#filtrar_por").change(function(e){
		var value = $(this).val();
		$("#datas").html("");
		if(value != ""){
			$("#datas").hide();
			$(".options .message").addClass('loader2');
			$.post("/" + value + "/fetchall/", function(data){
				$("#datas").append(data);
				$(".options .message").removeClass('loader2');
				$("#datas").show();
			});
		}
	});
	$("#ue_data1").change(function(e){
		filter_ue();
	});
	$("#form_filtro").submit(function(e){
		e.preventDefault();
		_filter();
	});
	$("#modulo").change(function(e){
		var value = $(this).val();
		if(value != ""){
			var selectedIndex = $("#modulo option").index($("#modulo option:selected"));
			var controller = $(this).val();
			$(".export .options").html("");
			$(".export .options").addClass("loader2");
			$.post("/" + controller + "/optionsexport",function(data){
				$(".export .options").html(data);
				$(".export .options").removeClass("loader2");
			});
			$(".fields.on").hide();
			$(".fields.on").removeClass('on');	
			$(".fields").eq(selectedIndex).addClass('on');
			$(".fields").eq(selectedIndex).show();
		}
	});
	$("#grafica").change(function(e){
		var value = $(this).val();
		if(value != ""){
			var selectedIndex = $("#grafica option").index($("#grafica option:selected"));
			var controller = $(this).val();
			$(".graph .options").html("");
			$(".graph .options").addClass("loader2");
			$.post("/" + controller + "/optionsgraph",function(data){
				$(".graph .options").html(data);
				$(".graph .options").removeClass("loader2");
			});
			$(".fields.on").hide();
			$(".fields.on").removeClass('on');
			$(".fields").eq(selectedIndex).addClass('on');
			$(".fields").eq(selectedIndex).show();
		}
	});
	$(".form.graph").submit(function(e){
		e.preventDefault();
		var controller = $("#grafica").val();
		if(controller != ""){
			var width = $("#content .center").width();
			var height = $("#height").val();
			$(".graph .result").html("");
			$(".graph .result").width(16);
			$(".graph .result").height(16);
			$(".graph .result").addClass("loader2");
			$.post("/" + controller + "/graph",{
				desde: $("#desde").val()
				,hasta: $("#hasta").val()
				,aerolinea: $("#aerolinea").val()
				,equipo: $("#Equipo_de_Vlo").val()
				,width: $("#width").val()
				,height: $("#height").val()
				,frecuencia: $("#frecuencia").val()
				,estado: $("#estado").val()
			},function(data){
				$(".graph .result").width(width);
				$(".graph .result").height("");
				height = parseInt(height) + 10;
				$(".graph .result").css("height",height + "px");
				$(".graph .result").html(data);
				$(".graph .result").removeClass("loader2");
			});
		}
	});
	$("#usuario").change(function(e){
		var val = $(this).val();
		if(val=='si'){
			$("#rol_label").html("Rol*");
			$("#password_label").html("Contraseña*");
			$("#contrasena").addClass("required").removeClass("disabled").removeAttr("disabled");
			$("#rol").addClass("required").removeClass("disabled").removeAttr("disabled");
			$("#email_input").addClass("requiredaereocar_llega").removeClass("disabled").removeAttr("disabled");
		}else{
			$("#rol_label").html("Rol");
			$("#password_label").html("Contraseña");
			$("#contrasena").removeClass("required").addClass("disabled").attr("disabled", true);;
			$("#rol").removeClass("required").addClass("disabled").attr("disabled", true);
			$("#email_input").removeClass("required").addClass("disabled").attr("disabled", true);
		}
	});

	$("#desde_fake").live("click",function(e){
		e.preventDefault();
		$(".date_start_fake").datepicker({showOn:'focus',altField:".date_start" ,dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true}).focus();;
	});
	$("#hasta_fake").live("click",function(e){
		e.preventDefault();
		$(".date_end_fake").datepicker({showOn:'focus',altField:".date_end",dateFormat: 'dd/mm/yy', altFormat : "yy-mm-dd",changeYear: true,changeMonth: true}).focus();;
	});

	$("#num_records").live("change",function(e){
		var controller = $("#controller").val();
		$(".TblList").addClass("loader1");
		$(".TblList").html("");
		 filter();
	});
	$(".detalles-slot").live("click",function(e){
		e.preventDefault();
		var href = $(this).attr("href");
		$("#popup").css("display","table");
		$("#popup l .html").html("<div class='loader2'></div>");
		$("#popup .content-popup").css("width","520px");
		$.post(href,{layout:'disable'},function(html){
			$("#popup .content-popup .html").html(html);
		});
	});
	$("#popup .cell .content-popup").click(function(e){
// 		e.stopPropagation(); //esto no permite que se ejecuten los live 
	});
	
	$("#tipo-slot").change(function(e){
		var tipo = $(this).val();
		if(tipo == "Regular"){
			$("#frecuencia-slot").attr("disabled",true).addClass("disabled");
			$("#base-slot").attr("disabled",true).addClass("disabled");
		}else{
			var date = $("#Vigencia_UTC_llegada").val();
			date = new Date(date);
			var day = date.getDay();
			for(i = 1;i<8;i++){
				$("#dia_" + i).attr("checked",false);
			}
			if(day < 7){
				day = day + 1;
				$("#dia_" + day).attr("checked",true);
			}else{
				$("#dia_1").attr("checked",true);
			}
			$("#frecuencia-slot").attr("disabled",false).removeClass("disabled");
			$("#base-slot").attr("disabled",false).removeClass("disabled");
		}
	});
	$(".days_selected").click(function(e){
		var tipo = $("#tipo-slot").val();
		if(tipo == "Irregular"){
			for(i = 1;i<8;i++){
				$("#dia_" + i).attr("checked",false);
			}
			$(this).attr("checked",true);
		}
	});
	$("#action_cheecksheet").change(function(e){
		var action = $(this).val();
		if(action != ""){
				$("#form_action_cheecksheet").attr("action","/checksheets/" + action  + "/");
				$("#form_action_cheecksheet").submit();
		}
	});
	$(".checksheets_details").click(function(e){
		e.preventDefault();
		var aerolinea = $(this).attr("id");
		var value= $("#capturas_" + aerolinea).val();
		var object  = $(this);
		$.post("/checksheets/details/",{capturas:value},function(info){
			object.next().html(info);
		});
		
	});
	$("#posicion_llega").live("change",function(e){
		var posicion = $(this).val();
		var oaci = $("#cod_oaci").val();
		$("#posicion_sale").val(posicion);
		
		result =  setAerocar(oaci,posicion);
		$("#aereocar_llega").val(result);
		$("#aereocar_sale").val(result); //Se copian los valores de la hoja de captura
		
		result = setPasillo(oaci,posicion);
		$("#pasillo_llega").val(result);
		$("#pasillo_sale").val(result); //Se copan los valorea de la hoja de captura
	});
	$("#posicion_sale").live("change",function(e){
		var posicion = $(this).val();
		var oaci = $("#cod_oaci").val();
		
		result =  setAerocar(oaci,posicion);
		$("#aereocar_sale").val(result);

		result = setPasillo(oaci,posicion);
		$("#pasillo_sale").val(result);
	});
	$(".submit_close_checksheet").click(function(e){
			e.preventDefault();
			var index = $(this).index();
			var response = confirm("¿Estas seguro qué desea cerrar estos FCS?");
			if(response){
				$(".close_checksheet").eq(index).submit();
			}
	});
	$("a.title_tabs_campos").click(function(e){
		e.preventDefault();
		var on = $("a.title_tabs_campos.on").index('a.title_tabs_campos');
		var index = $(this).index('a.title_tabs_campos');
		$("a.title_tabs_campos").removeClass('on');
		$(this).addClass('on');
		$('.tab_campos').eq(on).addClass('hidden');
		$('.tab_campos').eq(index).removeClass('hidden');
	});
	
	/*Mostrar detalles de asignaciones*/
	$('.lista_asignaciones_vuelos .add').live('click',function(e){
		e.preventDefault();
		var object = $(this);
		var href = object.attr('href');
		object.removeClass('add').addClass('minus');
		object.parent().parent().after("<span class='loader2'></span>");
		var object2 = object.parent().parent().next();
		$.post(href,function(data){
			object2.remove();
			object.parent().parent().after(data);
		});
	});
	$('.lista_asignaciones_vuelos .minus').live('click',function(e){
		e.preventDefault();
		var object = $(this);
		var object2 = object.parent().parent().next();
		$(this).removeClass('minus').addClass('add');
		object2.remove();
	});
	
// 	$("#form_import .import").uploadify({
// 		height:30,
// 		width:120,
// 		swf : '/js/upload/uploadify.swf',
// 		uploader   : '/empleados/importcsv/'
// 	});
        $("#uploadify_empleado").uploadify({
                'swf'       : '/js/library/upload/uploadify.swf',
                'uploader'         : '/empleados/uploadfile/',
                'onUploadSuccess'     : function(file, data, response){
			$("#message_upload").html("Insertando datos.");
			$.post('/empleados/importcsv/',{filename:data},function(object){
				var message = "Inserción finalizada. Exitosos: <span class='bold'>" + object.success + "</span>";
				message = message + ", Erroneos: <span class='bold'>" +object.errors + "</span>";
				$("#message_upload").html(message);
			},'json');
                }
        }); 	
	$('.custom_hour_employer').live('click',function(e){
		e.preventDefault();
		var href = $(this).attr('href').split('#');
		var date = href[1];
		var idempleado = href[2];
		var objectIn = $('#' + date + '-' + idempleado + '-in');
		var objectOut = $('#' + date + '-' + idempleado + '-out');
		var entrada = objectIn.html().split(':');
		var salida = objectOut.html().split(':');
	
		$("#popup").css("display","table");
		$("#popup .content-popup").css("width","260px");
		html = $("#custom_hora").html();
		$("#popup .content-popup .html").html(html);
		for(i = 0; i < $("#popup .content-popup .html select").size();i++){
			var name = $("#popup .content-popup .html select").eq(i).attr('name');
			 $("#popup .content-popup .html select").eq(i).attr('id',name);
		}
		for(i = 0; i < $("#popup .content-popup .html input").size();i++){
			var name = $("#popup .content-popup .html input").eq(i).attr('name');
			 $("#popup .content-popup .html input").eq(i).attr('id',name);
		}
		$('#hora_entradaHora').val(entrada[0]);
		$('#minuto_entradaHora').val(entrada[1]);
		
		$('#hora_salidaHora').val(salida[0]);
		$('#minuto_salidaHora').val(salida[1]);
		$("#idempleadoHora").val(idempleado);
		$("#dateHora").val(date);
		
		var link = $('#resetEmpleadoHour').attr('href');
		link = link + 'date/' + date + '/idempleado/' + idempleado;
		$('#resetEmpleadoHour').attr('href',link);
	});
	$('#formEmpleadoHoraPersonalizada').live('submit',function(e){
		e.preventDefault();
		var action = $(this).attr('action');
		$.post(action,{
			hora_entradaHora :$('#hora_entradaHora').val()
			,minuto_entradaHora : $('#minuto_entradaHora').val()
			,hora_salidaHora : $('#hora_salidaHora').val()
			,minuto_salidaHora : $('#minuto_salidaHora').val()
			,idempleadoHora : $('#idempleadoHora').val()
			,dateHora : $('#dateHora').val()
		},function(data){
			
		});
	});
});
function setAerocar(oaci,posicion){
	if(oaci == "RCQ" || oaci == "TSU"){
		return "no";
	}else{
		if(posicion > 31 || (posicion > 13 && posicion < 23)){
			return "no";
		}else{
			return "si";
		}
	}
}
function setPasillo(oaci,posicion){
	if(oaci == "RCQ" || oaci == "TSU"){
		return "no";
	}else{
		if(posicion < 14 || (posicion > 22 && posicion < 32)){
			return "no";
		}else{
			return "si";
		}
	}
}
function selectItem(data){
// 	if( li == null ) return alert("No match!");
// 	if( !!li.extra ) var sValue = li.extra[0];
// 	else var sValue = li.selectValue;
// 	alert(sValue);
	alert("Hello world");
}
function _filter(){
	 clearTimeout(_timefilters_);
	_timefilters_ = setTimeout("filter()",500);
}
function setFiltersExport(){
	$("#export_SlcFiltro1").val($("#SlcFiltro1").val());
	$("#export_TxtFiltro1").val($("#TxtFiltro1").val());
	$("#export_SlcFiltro2").val($("#SlcFiltro2").val());
	$("#export_TxtFiltro2").val($("#TxtFiltro2").val());
	$("#export_SlcFiltro3").val($("#SlcFiltro3").val());
	$("#export_TxtFiltro3").val($("#TxtFiltro3").val());
	$("#export_desde").val($(".InputsFind .desde").val());
	$("#export_hasta").val($(".InputsFind .hasta").val());
	$("#export_estado").val($("#estado").val());
}
function filter(){
	var controller = $("#controller").val();
	$(".TblList").addClass("loader1");
	$(".TblList").html("");
	setFiltersExport();
	$.post("/"+controller+"/filtrar/",{
		SlcFiltro1:$("#SlcFiltro1").val()
		,TxtFiltro1:$("#TxtFiltro1").val()
		,SlcFiltro2:$("#SlcFiltro2").val()
		,TxtFiltro2:$("#TxtFiltro2").val()
		,SlcFiltro3:$("#SlcFiltro3").val()
		,TxtFiltro3:$("#TxtFiltro3").val()
		,desde:$(".InputsFind .desde").val()
	        ,hasta:$(".InputsFind .hasta").val()
		,estado:$("#estado").val()
	        ,num_records: $("#num_records").val()
	},function(data){
		$(".TblList").removeClass("loader1");
		$(".TblList").html(data);
	});
}
function filter_ue(){
	$(".TblList").addClass("loader1");
	$(".TblList").html("");
	var href = $("#url_filtro_empleados_qms").val();
	$.post(href,{
		ue_filtro1:$("#ue_filtro1").val()
		,ue_data1:$("#ue_data1").val()
		,id_encuesta:$("#id_encuesta").val()
	},function(data){
		$(".TblList").removeClass("loader1");
		$(".TblList").html(data);
	});
}
function WithInputNew(){
	var ThWidth = 0;
	var i=0;
	var acum = 0;
	var size = $(".NewInputs .new").size();
	for(i=0;i<size;i++){
		ThWidth = $(".border th").eq(i).width();
		acum = acum + ThWidth;
		$(".NewInputs .new").eq(i).width(ThWidth + 6);
	}
	$(".NewInputs").width($(".TblList table").width());
}
function WithInputEdit(){
	var ThWidth = 0;
	var i=0;
	var acum = 0;
	var size = $(".EditInputs .edit").size();
	for(i=0;i<size;i++){
		ThWidth = $(".border th").eq(i).width();
		acum = acum + ThWidth;
		$(".EditInputs .edit").eq(i).width(ThWidth + 6);
	}
	$(".EditInputs").width($(".TblList table").width());
}