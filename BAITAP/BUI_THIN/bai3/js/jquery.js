$(document).ready(function(){
    
 /*Xử lý các lỗi phát sinh trong Validate Form*/   
    $("#form").validate({
        rules:{
            tieude: "required",
            noidung: {
                required: true,
                minlength: 200
            },
            email: {
                required: true,
                email: true
            },
            sdt: {
                required: true,
                minlength: 6,
                maxlength: 15,
                digits: true
            }
        },
        messages:{
            tieude: "Vui lòng nhập tiêu đề!",
            noidung: {
                required: "Vui lòng nhập nội dung bài viết!",
                minlength: "Nội dung bài viết chứa ít nhất 200 ký tự!"
            },
            email: {
                required: "Vui lòng nhập địa chỉ email!",
                email: "Định dạng email không đúng!"
            },
            sdt:{
                required: "Vui lòng nhập số điện thoại!",
                minlength: "Số điện thoại đã nhập không đúng!",
                maxlength: "Số điện thoại đã nhập không đúng!",
                digits: "Số điện thoại chỉ bao gồm các số nguyên dương từ 0 đến 9"
            }
        }
    });


/*Khi đưa con trỏ chuột ra khỏi ô ipTieuDe thì mã hóa các ký tự tiếng Việt có dấu (sử dụng biểu thức chính quy) và đưa chúng vào .linklienket*/    
    // $(".ipTieuDe").blur(function(){
    //     var a = $(this).val();
    //     a = a.replace(/à|á|ả|ã|ạ|ă|ằ|ắ|ẳ|ẵ|ặ|â|ầ|ấ|ẩ|ẫ|ậ/igm,"a");
    //     a = a.replace(/đ/igm, "d");
    //     a = a.replace(/è|é|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/igm, "e");
    //     a = a.replace(/ì|í|ỉ|ĩ|ị/igm,"i");
    //     a = a.replace(/ò|ó|ỏ|õ|ọ|ô|ồ|ố|ổ|ỗ|ộ|ơ|ờ|ớ|ở|ỡ|ợ/igm, "o");
    //     a = a.replace(/ù|ú|ủ|ũ|ụ|ư|ừ|ứ|ử|ữ|ự/igm,"u");
    //     a = a.replace(/\ /igm,"-");
    //     $(".linklienket").text("http://pca.net.vn/" + a);
    // })

/*Test KeyUp*/
    $(".ipTieuDe").keyup(function(q){
        if(q.keyCode == 8){
            var a = $(this).val();
            a = a.replace(/à|á|ả|ã|ạ|ă|ằ|ắ|ẳ|ẵ|ặ|â|ầ|ấ|ẩ|ẫ|ậ/igm,"a");
            a = a.replace(/đ/igm, "d");
            a = a.replace(/è|é|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/igm, "e");
            a = a.replace(/ì|í|ỉ|ĩ|ị/igm,"i");
            a = a.replace(/ò|ó|ỏ|õ|ọ|ô|ồ|ố|ổ|ỗ|ộ|ơ|ờ|ớ|ở|ỡ|ợ/igm, "o");
            a = a.replace(/ù|ú|ủ|ũ|ụ|ư|ừ|ứ|ử|ữ|ự/igm,"u");
            a = a.replace(/\ /igm,"-");
            $(".linklienket").text("http://pca.net.vn/" + a);   

        }
        else
        {
        var a = $(this).val();
        a = a.replace(/à|á|ả|ã|ạ|ă|ằ|ắ|ẳ|ẵ|ặ|â|ầ|ấ|ẩ|ẫ|ậ/igm,"a");
        a = a.replace(/đ/igm, "d");
        a = a.replace(/è|é|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/igm, "e");
        a = a.replace(/ì|í|ỉ|ĩ|ị/igm,"i");
        a = a.replace(/ò|ó|ỏ|õ|ọ|ô|ồ|ố|ổ|ỗ|ộ|ơ|ờ|ớ|ở|ỡ|ợ/igm, "o");
        a = a.replace(/ù|ú|ủ|ũ|ụ|ư|ừ|ứ|ử|ữ|ự/igm,"u");
        a = a.replace(/\ /igm,"-");
        $(".linklienket").text("http://pca.net.vn/" + a);
        }
    })









/*Kiểm tra nếu radio dangNgay được check thì vô hiệu hóa trường .time*/
    if($(".dangNgay").prop("checked")){
        $(".time").prop("disabled", true);
        var d = new Date();
        var day = d.getDate();
        var month = d.getMonth() + 1;
        var year = d.getFullYear();
        var output = (month<10 ?'0': '') + month + "/" + (day<10?'0': '') + day + "/" + year;
        $(".time").val("");
    }


    /*Sự kiện click vào radio*/ 
    $("input[name='lich']").click(function(){
        if($(".dangNgay").prop("checked")){
            $(".time").prop("disabled", true);
            var d = new Date();
            var day = d.getDate();
            var month = d.getMonth() + 1;
            var year = d.getFullYear();
            var output = (month<10 ?'0': '') + month + "/" + (day<10?'0': '') + day + "/" + year;
            $(".time").val("");
        }

        if($(".lenLich").prop("checked")){
            $(".time").prop("disabled", false);
            $(".time").val("");
        }
    })



   
    // $(".btnThem").click(function(){
    //     var tList = $(".theDanhDau").val();
    //     if(tList != ""){
    //     var test =  $(".tagList").text($(".tagList").text()+tList + " ");
    //     }
    //     $(".theDanhDau").val("");

    // })


$(".btnThem").click(function(){
    var tTag = $(".theDanhDau").val();
    var array = tTag.split(", ");
    var list = "";
    if (tTag != ""){
        for (var i = 0; i<array.length; i++){
            list+= '<span class = "getTagList" style= "margin-right: 10px;"><b class="delTag"></b>' + array[i].trim() + '</span>';
        }
    }

    $(".tagList").html($(".tagList").html()+list);
    $(".theDanhDau").val("");


    $(".delTag").click(function(){
        $(this).parent().remove();
    })
})




/*Reset Liên kết + Thẻ*/
    $(".btnReset").click(function(){
        $(".linklienket").text("http://pca.net.vn/");
        $(".tagList").text("");
    })
    var danhsach = [""];
    // $(".btnThem").click(function(){
        
        
    //     danhsach.push($(".theDanhDau").val());
    //     $(".tagList").text(danhsach);
    // })





});