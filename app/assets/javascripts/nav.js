$(document).ready(function(event){
	$(".toggle-dropdown").on("click", function(){
		var $a = $(this);
		var $li = $a.closest(".has-dropdown");
		var $ul = $a.closest(".header-list");
		
		$ul.find(".show").toggleClass("show");
		
		$dropdown = $li.find(".dropdown");
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
});