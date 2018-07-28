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
	
	/*
	* slide show 
	*
	*/
	var run = setInterval(slide,3000);

	var size = $('.slide-show ul li').length;
	var n = "", count = 0;
	for(var i=0;i<size;i++){
		n += '<span style="color:#fff;padding:0px 3px 0px 3px; cursor:pointer;">▪</span>';
	}
	$('.dotteds').html(n);
	var dotChild = $('.dotteds span');
		// dat mau mac dinh cho span[0]
	$(dotChild[0]).css({
		color:'#ba0017'
	});

		// -----------
	$('.slide-show').hover(function(){
		clearInterval(run);
	},function(){
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
				// ckeck count = size-1 thi reset mau span[0]
			if(count == size-1){
				$(dotChild[0]).css({
					color:'#fff'
				});
			}
				// reset mau span[count+1] khi span[count] doi mau
			$(dotChild[count+1]).css({
				color:'#fff'
			});
		});
			// check count = 0 thi count = size-1 
			// thuc hien viec giam di mot don vi
		if(count <= 0){
			count = size-1;
		}else{
			count --;
		}

		console.log(count);
			// doi mau span[count]
		$(dotChild[count]).css({
			color:'#ba0017'
		});
		
	});
	/*
	* slide show ef
	*/
	function slide(){
		$('.slide-show ul').stop(true, true).animate({
			marginLeft:-980*2
		},500,function(){
			$($(this).find('li')[0]).appendTo($(this))
			
			$(this).css({
				marginLeft:'-980px'
			});
				// reset mau cho span[count-1] khi span[count] doi mau
			$(dotChild[count-1]).css({
				color:'#fff'
			});
		});
			// cai dat bien dem cho count
		if(count == size-1){
			count = 0;
		}else{
			count ++;
		}
		console.log(count);
			// thuc hien doi mau cho span[count]
		$(dotChild[count]).css({
			color:'#ba0017'
		});
			// reset mau cho span[size-1] khi count = 0
		if(count == 0){
			$(dotChild[size-1]).css({
				color:'#fff'
			});
		}
	}
	/*
	* end slide-show
	*/
});
