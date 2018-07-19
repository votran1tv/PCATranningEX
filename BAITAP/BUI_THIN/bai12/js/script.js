jQuery(document).ready(function($) {

	$("li").hover(function() {
		/* Stuff to do when the mouse enters the element */
		// $('.drop').slideDown(200);/*Lấy phần tử có class là drop và nằm ở vị trí đầu tiên*/
		$(this).find("ul").stop().slideDown(200);
	}, function() {
		/* Stuff to do when the mouse leaves the element */
		$(this).find("ul").stop().slideUp(0);
	});
});