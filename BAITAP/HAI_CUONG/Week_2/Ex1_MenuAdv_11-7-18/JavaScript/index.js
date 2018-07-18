$(document).ready(function(){
	$("li").hover(function(){$(this).find("ul:nth(0)").stop(false).slideDown(1000)},function(){$(this).find("ul:nth(0)").stop(false).slideUp(1000);});
});

/*$(document).ready(function(){
	$("li").hover(function(){
		$($(this).find("ul")[0]).stop(false).slideDown(1000)},
				  function(){$($(this).find("ul")[0]).stop(false).slideUp(1000)});
});*/

/*$(document).ready(function(){
	
	$(jQuery).keyup(function(){
		console.log("KeyDown");
		$(this).find("#MenuLv1 li").empty();
		$(this).find(" li > a").remove();
	});
	
	$(window).keydown(function(){
		console.log("Windows");
		$(this).find("ul").empty();
	});
	
});*/