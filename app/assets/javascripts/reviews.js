$(document).ready(function() {
	if ($('body').data("controller") == "reviews") {
		reviewModule.cleanForm();
	}
})

var reviewModule = (function() {
	var cleanForm = function() {
		$(document).ajaxSend(function() {
			$("form").find("input[type='text']").val("");
		})
	}

	return {
		cleanForm: cleanForm
	}
})();