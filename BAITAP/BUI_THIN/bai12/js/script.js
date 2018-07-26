jQuery(document).ready(function($) {

	$("li").hover(function() {
		/* Stuff to do when the mouse enters the element */
		// $('.drop').slideDown(200);/*Lấy phần tử có class là drop và nằm ở vị trí đầu tiên*/
		$(this).find("ul").stop().slideDown(200);
	}, function() {
		/* Stuff to do when the mouse leaves the element */
		$(this).find("ul").stop().slideUp(0);
	});

/*Test Sticky JS*/	
	const nav = document.querySelector('#menu');
	// const nav1 = document.querySelector('#active');
	const navTop = nav.offsetTop;
	// const navTop1 = nav1.offsetTop;
	function stickyNavigation() {
	// console.log('navTop = ' + navTop);
	// console.log('scrollY = ' + window.scrollY);

	if ((window.scrollY >= navTop) && (window.scrollY >= navTop)) {
		// nav offsetHeight = height of nav
		document.body.style.paddingTop = nav.offsetHeight + 'px';
		document.body.classList.add('fixed-nav');
	} else
		{
		document.body.style.paddingTop = 0;
		document.body.classList.remove('fixed-nav');
		}
	}
	window.addEventListener('scroll', stickyNavigation); 
});

