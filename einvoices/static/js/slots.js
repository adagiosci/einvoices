$(document).ready(function(e){
	/*
		Por el momentos las lineas siguientes quedan comentadadas, esto es porque
		la base de datos de aeronaves no es lo suficientemente grande, entonces puede que algunas
		aerolineas no tengan relacionado algun tipo de equipo.
		cuando tengamos mas datos quizas sea mas conveniente desconetar estas lineas.
	*/
	/*$("#idAerolinea").change(function(e){
		var aerolinea = $(this).val();
		var object = $(this);
		if(aerolinea != ""){
			$(".loader-equipo").addClass("loader2");
			$.post("/aeronaves/fetchequiposporaerolinea/",{idaerolinea:aerolinea},function(info){
				$("#Equipo_de_Vlo").html("");
				$("#Equipo_de_Vlo").append(info);
				$(".loader-equipo").removeClass("loader2");
			});
		}else{
			$("#Equipo_de_Vlo").html("");
		}
	});*/
});