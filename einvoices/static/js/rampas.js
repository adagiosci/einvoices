var base = 0;
var type_scroll;
$(document).ready(function(e){
	$(window).scroll(function(e){
		var scrollTop = $(window).scrollTop();
		type_scroll = (scrollTop >= base)?'down':'up';
		base = scrollTop;
		var menuTop = $("#flight_times_aux").offset().top;
		var menu = $("#flight_times");
		if((scrollTop > menuTop) && !menu.hasClass("flight_times-fixed")){
			menu.addClass("flight_times-fixed");
		}else if((scrollTop < menuTop) && menu.hasClass("flight_times-fixed")){
			menu.removeClass("flight_times-fixed");;
		}
	});
});