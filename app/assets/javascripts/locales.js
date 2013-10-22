var LocaleManager = function () {
	var localeManager = {
		init: function () {
			$("#english").click(function () {
				localeManager.setLocale("en");
			});
			$("#portuguese").click(function () {
				localeManager.setLocale("pt");
			});
		},
		setLocale: function (locale) {
			$.get("/locales/" + locale, function () {
				window.location.reload(true);
			});
		}
	};
	localeManager.init();
	return localeManager;
};

var localeManager;
$(document).ready(function () {
	localeManager = new LocaleManager();
});