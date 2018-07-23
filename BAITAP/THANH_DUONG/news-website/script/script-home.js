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
});