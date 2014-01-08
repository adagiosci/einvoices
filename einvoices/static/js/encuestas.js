$(document).ready(function(e){
        $("#uploadify_roster").uploadify({
                'swf'       : '/js/library/upload/uploadify.swf',
                'uploader'         : '/encuestas/subirroster/',
		'onUploadSuccess'     : function(file, data, response){
			$.post('/encuestas/rosters/',{listing:true},function(html){
				$('#listing_rosters').html(html);
			});
		}
        });
});