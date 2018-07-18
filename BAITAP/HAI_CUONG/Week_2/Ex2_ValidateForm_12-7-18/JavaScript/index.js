// JavaScript Document
$(document).ready(function() {
    var data = [{ email: "haicuong0907@gmail.com", pass: "******" }, 
			    { email: "duong@gmail.com", pass: "******" }, 
			    { email: "thin@gmail.com", pass: "******" }, 
			    { email: "vo@gmail.com", pass: "******" }];
    var In = $("#Input");
    $("#Btn").click(function(e) {
        console.log(e);
        if (In.val() == "") {
            $("#Check").text("Hãy nhập email hoặc số điện thoại");
        } else if (In.val().indexOf("@") < 0) {
            $("#Check").text("Sai định dạng email! Bạn thiếu @");
        } else {
            for (var i = 0; i < data.length; i++) {
                if (In.val() == data[i].email) {
                    $("#Check").html("Đã tìm thấy:<span style='color:blue;'> " + data[i].email + "</span>. Xin chờ chuyển trang..!");
                    break;
                } else {
                    $("#Check").text("Không tìm thấy tài khoản..!");
                    break;
                }
            }
        }
    });
    /*$("#Input").focus(function(){
       $("#TextSlide").css("z-index",100);
		 $("#Input").css("z-index",1);
    });*/
    $("#TextSlide").click(function(){
        $(this).stop().animate({"top": "-100%", "font-size": "13px"}, 200, "linear").css({color: "#1D9CF3"});
        $("#Input").focus().css({"border-bottom": "5px #1D9CF3 solid", "transition": "all 1s 0s linear"})
    });

    $("#Input").blur(function(){
        if($("#Input").val() == ""){
         $("#TextSlide").stop().animate({"top": "0", "font-size": "18px"}, 200, "linear").css("color", "#857E7E");
         $("#Input").css({"border-bottom": "1px solid #857E7E"});
        }
    });

});