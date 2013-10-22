var WorkPage = function() {
	var timer;
	var work_page = {
		init: function() {
			$("div#showcase ul li:nth-child(1)").show().addClass("show");
			$("ul#gallery li:nth-child(1)").addClass("show");
			
			$("ul#gallery li").click(function() {
				if (!$(this).hasClass("show"))
					work_page.change_clicking(this);
			});
			
			$("div#showcase img").click(function() {
				var index = $("ul#gallery li.show").data("index");
				var item;
				if ($(this).hasClass("arrow-right") && index < $("div#showcase ul li").length) {
					item = $("ul#gallery li:nth-child(" + (index+1) + ")");
					work_page.change_clicking(item);
				} else {
					if ($(this).hasClass("arrow-left") && index > 1) {
						item = $("ul#gallery li:nth-child(" + (index-1) + ")");
						work_page.change_clicking(item);
					}
				}
			});
		},
		
		change_clicking: function(item) {
			
			var index = $(item).data("index");
			$("ul#gallery li.show").removeClass("show");
			$(item).addClass("show");
			
			$("div#showcase ul li.show").removeClass("show").fadeOut(400, function() {
				$("div#showcase ul li:nth-child(" + index + ")").addClass("show").fadeIn(400);
			});
		},
	};
	work_page.init();
} ;

$(document).ready(function() {
	var work_page = new WorkPage();
});
