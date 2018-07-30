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
$('#weather_location').change(function(){
	// $('#show').text($(this).find(":selected").text()); /*Lấy text của Option được chọn trong thẻ Select*/
	if($(this).val() === 'tphochiminh'){
		$(".nhietdo").text("30°");
		$(".temp").text("29° - 35°");
		$(".info").text("Có nắng nhẹ");
		$(".img_info").attr('src', 'images/img_info.png');
		$("#test").attr('src', '\images/img_weather2.png');
	}
	else if($(this).val() === 'danang'){
		$(".nhietdo").text("26°");
		$(".temp").text("24° - 29°");
		$(".info").text("Mưa rải rác");
		$(".img_info").attr('src', 'images/img_info3.png');
		$("#test").attr('src', 'images/img_weather3.png');
	}
	else
	{
		$(".nhietdo").text("27°");
		$(".temp").text("25° - 32°");
		$(".info").text("Mây mù");
		$(".img_info").attr('src', 'images/img_info2.png');
		$("#test").attr('src', '\images/img_weather.png');
	}
});
function locationChange(obj){
	var message = document.getElementById('show');
    var value = obj.value;
	if (value === 'nam'){
        message.innerHTML = "Bạn đã chọn giới tính nam";
    }
    else if (value === 'nu'){
        message.innerHTML = "Bạn đã chọn giới tính nữ";
    }
});
// function a(){
// 	var x = document.getElementById('weather_location').value;
// 	document.getElementById("show").innerHTML = x;
// }
