$(document).ready(function(e){
// 	$(".checksheet_table tr").live('click',function(){
// 			contextMenuCheeksheet();
// 	});
	$(".checksheet_table tr").mousedown(function(e){
		var object = $(this);
		switch(e.which){
			case 3:
				$(".contextMenu .see_FCS").children('a').attr("href","/capturas/capturar/id/" + object.attr("id") );
				break;
		}
	});
});
function contextMenuCheeksheet(){ //Esta funcion es llamada en /checksheets/listados.phtml
	$(".checksheet_table tr").contextMenu("myMenu1", {
		bindings: {
			"invoice_selected": function(t) {
				$("#form_action_cheecksheet").attr("action","/checksheets/invoice/");
				$("#form_action_cheecksheet").submit();
			},
			"checksheets_details_selected":function(t){
				var width = $(window).width() - 150;
				var height = $(window).height() - 80;
				$("#form_action_cheecksheet").attr("action","/checksheets/details/");
				$("#popup").css("display","table");
				$("#popup .content").css("max-width",width + "px")
				$("#popup .content").css("max-height",height + "px")
				$("#popup .content .html").html("");
				$("#popup .content .html").addClass("loader2");
				$.post("/checksheets/details/",$("#form_action_cheecksheet").serialize(),function(info){
					$("#popup .content .html").removeClass("loader2");
					$("#popup .content .html").html(info);
					height = height - 50;
					$("#popup .checksheets_details").css("width","100%");
					$("#popup .checksheets_details").css("height",height + "px");
					$("#popup .checksheets_details").jScrollPane();
				});
			
			},
			"checksheets_all_selected":function(t){
				$(".checksheet_table .checkbox").attr('checked','checked');
			},
			"checksheets_all_unselected":function(t){
				$(".checksheet_table .checkbox").attr('checked',false);
			}
		}
	});	
}