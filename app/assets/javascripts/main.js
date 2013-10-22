var Estudiuni = function() {
	var estudiuni = {
		init: function() {
			
			$("header ul#main-menu li ul.artists").each(function() {
				var margin = ($(this).parent().width() - $(this).width())/2;
				$(this).css("margin-left", margin);
			});
			
			$("ul#main-menu>li").mouseenter(function() {
				$(this).addClass("hover");
				var id = this.id;
				var margin = ($(this).width() - $("#" + id + " ul.artists").width())/2;
				$("#" + id + " ul").css("margin-left", margin);
			});
			
			$("ul#main-menu>li").mouseleave(function() {
				$(this).removeClass("hover");
			});
		}
	};
	estudiuni.init();
} ;

$(document).ready(function() {
	var main = new Estudiuni();
});
