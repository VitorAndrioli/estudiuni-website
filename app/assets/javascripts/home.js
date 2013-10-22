var HomePage = function() {
	var timer;
	var home_page = {
		init: function() {
			$("ul#showcase li:nth-child(1)").show().addClass("show");
			$("ul#gallery li:nth-child(1)").addClass("show");
			
			timer = setInterval(function() {
				home_page.change_image();
			}, 4000);
			
			$("ul#gallery li").click(function() {
				if (!$(this).hasClass("show"))
					home_page.change_clicking(this);
			});
			
		},
		
		change_clicking: function(item) {
			window.clearInterval(timer);
			
			var index = $(item).data("index");
			$("ul#gallery li.show").removeClass("show");
			$(item).addClass("show");
			
			$("ul#showcase li.show").removeClass("show").fadeOut(400, function() {
				$("ul#showcase li:nth-child(" + index + ")").addClass("show").fadeIn(400);
			});
			
			timer = setInterval(function() {
				home_page.change_image();
			}, 4000);
			
		},
		
		change_image: function() {
			
			var index = parseInt($("ul#gallery li.show").data("index")) + 1,
				total_images = $("ul#gallery li").length;
				
			if (index > total_images)
				index = 1;
			
			$("ul#gallery li.show").removeClass("show");
			
			$("ul#showcase li.show").removeClass("show").fadeOut(400, function() {
				$("ul#showcase li:nth-child(" + index + ")").addClass("show").fadeIn(400);
				$("ul#gallery li:nth-child(" + index + ")").addClass("show");
			});
		}
	};
	home_page.init();
} ;

$(document).ready(function() {
	var home_page = new HomePage();
});
