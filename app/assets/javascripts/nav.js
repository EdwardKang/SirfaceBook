$(document).ready(function(event){
	$(".toggle-dropdown").on("click", function(){
		var $a = $(this);
		var $li = $a.closest(".has-dropdown");
		var $ul = $a.closest(".header-list");
		
		var $div = $ul.find(".show");
		var $dropdown = $li.find(".dropdown");
		
		if ($div[0] !== $dropdown[0]) {
			$div.toggleClass("show");
		}
		
		$dropdown.toggleClass("show");
	});
	
	$("body").on("click", function(){
		var $body = $(this);
		
		$dropdown = $body.find(".dropdown");
		$dropdown.removeClass("show");
	});
	
	$("body").on("click", '.has-dropdown', function(e){
		e.stopPropagation();
	});
	
	$(".index-right").on("ajax:success", ".unfriend-button", function(event, data){
		$button = $(this);
		
		$article = $button.closest(".user-index-short");
		$article.remove();
	});
	
	$(".index-right").on("ajax:success", ".accept-friend-form", function(event, data){
		$form = $(this);
		
		$article = $form.closest(".user-index-short");
		$article.remove();
	});
});