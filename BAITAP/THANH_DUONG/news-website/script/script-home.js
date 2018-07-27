jQuery(document).ready(function($) {
	var week = ["Chủ nhật","Thứ 2","Thứ 3","Thứ 4","Thứ 5","Thứ 6","Thứ 7"];
	var date = new Date();
	var month = "";
	if(date.getMonth() < 9){
		month = "0"+(date.getMonth()+1);
	}else{
		month = date.getMonth()+1;
	}
	var covrt = week[date.getDay()]+", ngày "+date.getDate()+"-"+month+"-"+date.getFullYear();
	$('#show-date').text(covrt);
	// slide-show function
	function slide(){
		$('.slide-show ul').stop(true, true).animate({
			marginLeft:-980*2
		},500,function(){
			$($(this).find('li')[0]).appendTo($(this))
			
			$(this).css({
				marginLeft:'-980px'
			});
			
		});
	}
	// .slide-show
	//var run = setInterval(slide,3000);
			
	$('.slide-show').hover(function(){
		clearInterval(run);
		console.log("1");
	},function(){
		console.log("0");
		
		run = setInterval(slide,3000);
	});

	$('#next').on('click', function(){
		slide();
	});

	$('#priv').on('click', function(){
	
		$('.slide-show ul').stop(true,true).animate({
			marginLeft:'0'
		},500,function(){
			$('.slide-show ul').css({
				marginLeft:'-980px'
			});
			$('.slide-show ul').prepend($('.slide-show ul li:last'));
		});
	});
	// /.slide-show
});
