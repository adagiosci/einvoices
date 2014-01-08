$(document).ready(function(e){
 	$("#form_captura input").keyup(function(e){
		message_completado();
 	});

 	$("#form_captura select").change(function(e){
		message_completado();
 	});

	 $("#form_captura textarea").keyup(function(e){
		message_completado();
 	});
});
function message_completado(){
	if(check_completado()){
 		var message = "<p class='error'> La hoja ya puede ser guardada como completada</p>";
 		$("#message").html(message);
 		$("#estadoCaptura").val("Completado");
	}else{
		$("#message").html("");
		$("#estadoCaptura").val("Pendiente");
	}
}
function check_completado(){
	var Llega = check_Llega();
	var Sale = check_Sale();
	if(Llega && Sale)
		return true;
	else
		return false;
}
function check_Llega(){
	var informacionLllegada = check_informacionLlegada();
	var tiemposLlega = check_tiemposLlegada();
	var crewLlega = check_crewLlegada();
 	var carga = pasajerosCargaLlegada();
	var operacion = operacionLlegada();
	var staff = staffLlega();
	var xqs = xqsLlega();
	if(informacionLllegada && tiemposLlega && crewLlega && carga && operacion && staff && xqs)
		return true;
	else
		return false;
}
function check_informacionLlegada(){
	var fcs = $.trim($("#no_fcs").val());
	var matricula = $.trim($("#matricula_llega").val());
	var posicion = $.trim($("#posicion_llega").val());
	if(fcs != "" && matricula != "" && posicion != "")
		return true;
	else
		return false;
}
function check_tiemposLlegada(){
	var ETAHora = $("#ETA_llega_hora").val();
	var ETAMinuto = $("#ETA_llega_minuto").val();
	var ATAHora = $("#ATA_llega_hora").val();
	var ATAMinuto = $("#ATA_llega_minuto").val();
	if(ETAHora != "" && ETAMinuto != "" && ATAHora != "" && ATAMinuto != "")
		return true;
	else
		return false;
	
}
function check_crewLlegada(){
	var comandante = $.trim($("#comandante_llega").val());
	var sobrecargos = $.trim($("#sobrecargos_llega").val());
	if(comandante && sobrecargos)
		return true;
	else
		return false;
}
function pasajerosCargaLlegada(){
	var a = $.trim($("#pax_llega_a").val());
 	var m = $.trim($("#pax_llega_m").val());
 	var i = $.trim($("#pax_llega_i").val());
	var xq = $.trim($("#xq_llega").val());
	var xq_kilos = $.trim($("#xq_kilos_llega").val());
	var xq_libras = $.trim($("#xq_libras_llega").val());
 	var cgo = $.trim($("#cgo_llega").val());
 	var cgo_kilos = $.trim($("#cgo_kilos_llega").val());
 	var cgo_libras = $.trim($("#cgo_libras_llega").val());
 	var mail = $.trim($("#mail_llega").val());
 	var mail_kilos = $.trim($("#mail_kilos_llega").val());
 	var mail_libras = $.trim($("#mail_libras_llega").val());
	if(a != "" && m != "" && i != "" && xq != "" && xq_kilos != "" && xq_libras != "" && cgo != "" && cgo_kilos != "" && cgo_libras != "" && mail != "" && mail_kilos != "" && mail_libras != "")
		return true;
	else
		return false;
	
}
function operacionLlegada(){
	var aerocar = $("#aereocar_llega").val();
	var pasillo = $("#pasillo_llega").val();
	var anotaciones = $("#clave_anotaciones_llega").val();
	if(aerocar != "" && pasillo != "" && anotaciones != "" )
		return true;
	else
		return false;
}
function staffLlega(){
	var supervisor = $("#supervidor_vuelo_llega").val();
	var peso = $("#peso_balance_llega").val();
	var coordinador = $("#coordinador_llega").val();
	var operador = $("#operador_llega").val();
	var formulo = $("#formulo_llega").val();
	var autorizo = $("#autorizo_llega").val();
	var etg = $.trim($("#etg").val());
	var cle = $.trim($("#cle").val());
	
	if(supervisor != "" && peso != "" && coordinador != "" && operador != "" && formulo != "" && autorizo != "" && etg != "" && cle != "")
		return true;
	else
		return false;
}
function xqsLlega(){
	var trafico = $.trim($("#trafico_llega").val());
	var estiba = $.trim($("#estiba_llega").val());
	var ac = $.trim($("#a_c_llega").val());
	var obs = $.trim($("#observaciones_llega").val());
	if(trafico != "" && estiba != "" && ac != "" && obs != "")
		return true;
	else
		return false;
}
function check_Sale(){
	var informacion = check_informacionSale();
	var tiempos = check_tiemposSale();
	var crew = check_crewSale();
  	var carga = pasajerosCargaSale();
	var operacion = operacionSale();
	var staff = staffSale();
	if(informacion && tiempos && crew && staff && operacion && carga)
		return true;
	else
		return false;
}
function check_informacionSale(){
	var matricula = $.trim($("#matricula_sale").val());
	var posicion = $.trim($("#posicion_sale").val());
	if(matricula != "" && posicion != "")
		return true;
	else
		return false;
}
function check_tiemposSale(){
	var ETDHora = $("#ETD_hora").val();
	var ETDMinuto = $("#ETD_minuto").val();
	var ATDHora = $("#ATD_hora").val();
	var ATDMinuto = $("#ATD_minuto").val();
	if(ETDHora != "" && ETDMinuto != "" && ATDHora != "" && ATDMinuto != "")
		return true;
	else
		return false;
}
function check_crewSale(){
	var comandante = $.trim($("#comandante_sale").val());
	var sobrecargos = $.trim($("#sobrecargos_sale").val());
	if(comandante && sobrecargos)
		return true;
	else
		return false;
}
function pasajerosCargaSale(){
	var estacion1 = $("#estacion1").val();
	var a_a1 = $("#estacion_a_a1").val();
	var a_m1 = $("#estacion_a_m1").val();
	var a_i1 = $("#estacion_a_i1").val();
	var a_xq1 = $("#estacion_a_xq1").val();
	var a_cgo1 = $("#estacion_a_cgo1").val();
	var a_mail1 = $("#estacion_a_mail1").val();

	var estacion2 = $("#estacion2").val();
	var a_a2 = $("#estacion_a_a2").val();
	var a_m2 = $("#estacion_a_m2").val();
	var a_i2 = $("#estacion_a_i2").val();
	var a_xq2 = $("#estacion_a_xq2").val();
	var a_cgo2 = $("#estacion_a_cgo2").val();
	var a_mail2 = $("#estacion_a_mail2").val();

	var estacion3 = $("#estacion3").val();
	var a_a3 = $("#estacion_a_a3").val();
	var a_m3 = $("#estacion_a_m3").val();
	var a_i3 = $("#estacion_a_i3").val();
	var a_xq3 = $("#estacion_a_xq3").val();
	var a_cgo3 = $("#estacion_a_cgo3").val();
	var a_mail3 = $("#estacion_a_mail3").val();

	var tramo = $("#tramo_inferior").val();
	var ex_nacionales = $("#excentos_nacionales").val();
	var internacionales = $("#internacionales").val();
	var ex_internacionales = $("#excentos_internacionales").val();
	var infantes = $("#infantes").val();
	var transitos = $("#transitos").val();

	var fme = $("#fme").val();
	var fme2 = $("#fme2").val();
	var fme3 = $("#fme3").val();


	if(estacion1 != "" && a_a1 != "" && a_m1 != "" && a_i1 != "" && a_xq1 != "" && a_cgo1 != "" && a_mail1 != ""){
// 		if(estacion2 != "" && a_a2 != "" && a_m2 != "" && a_i2 != "" && a_xq2 != "" && a_cgo2 != "" && a_mail2 != ""){
// 			if(estacion3 != "" && a_a3 != "" && a_m3 != "" && a_i3 != "" && a_xq3 != "" && a_cgo3 != "" && a_mail3 != ""){
				if(tramo != "" && ex_nacionales != "" && internacionales != "" && ex_internacionales != "" && infantes != "" && transitos != ""){
					if(fme != "" && fme2 != "" && fme3 != "" ){
						return true;
					}else{
						return false;
					}
				}else{
					return false;
				}
// 			}else{
// 				return false;
// 			}
			
// 		}else{
// 			return false;
// 		}
	}else{
		return false;
	}
}
function operacionSale(){
	var aerocar = $("#aereocar_sale").val();
	var pasillo = $("#pasillo_sale").val();
	var com_gal = $("#combustible_gal").val();
	var com_lit = $("#combustible_lit").val();
	if(aerocar != "" && pasillo != "" && com_gal != "" && com_lit != "")
		return true;
	else
		return false;
}
function staffSale(){
	var formulo = $("#formulo_sale").val();
	var autorizo = $("#autorizo_sale").val();
	if(formulo != "" && autorizo != "")
		return true;
	else
		return false;
}