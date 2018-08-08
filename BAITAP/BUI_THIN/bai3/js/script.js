jQuery(document).ready(function($){
    $(".dangbai").click(function(){
        if($(".iptitle").val() == ""){
            alert("Tiêu đề bài viết không được để trống!");
        }
        
        else 
        if($(".ipcontent").val().length <= 200){
            alert("Nội dung bài viết phải chứa ít nhất 200 ký tự");
        }
        
        else 
        if($(".ipemail").val()== "")
        {
            alert("Email không được để trống!");
        }
        else
        {
            var email = $(".ipemail").val();
            var filter = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/; /*Tìm kiếm igm = Tìm kiếm không phân biệt hoa thường + Toàn cục + Tìm đa dòng*/ 
            if(!filter.test(email)){
            alert("Địa chỉ email không hợp lệ!");
            }
            else if($(".ipsdt").val() == ""){
                alert("Số điện thoại không được để trống!");
            }
            else
            {
                var sdt = $(".ipsdt").val();
                var filtersdt = /^\+?\d{1,2}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/;
                if(!filtersdt.test(sdt)){
                    alert("Số điện thoại không hợp lệ!");
                }
            } 
        }
    })


/*Reset*/
    $(".reset").click(function(){
        $(".iptitle").val("");
        $(".alink").text("");
        $(".ipcontent").val("");
        $(".ipemail").val("");
        $(".ipsdt").val("");
    })


/*Mã hóa link ở tiêu đề bài viết*/
$(".iptitle").blur(function(){
    if($(".iptitle").val() == ""){
            alert("Tiêu đề bài viết không được để trống!");
        }
    else
    {
    var str = $(".iptitle").val();
    str = str.replace(/à|á|ả|ã|ạ|ă|ằ|ắ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/igm, "a");
    str = str.replace(/đ/igm, "d");
    str = str.replace(/è|é|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/igm, "e");
    str = str.replace(/ì|í|ỉ|ĩ|ị/igm, "i");
    str = str.replace(/ò|ó|ỏ|õ|ọ|ô|ồ|ố|ổ|ỗ|ộ|ơ|ờ|ớ|ở|ỡ|ợ/igm, "o");
    str = str.replace(/ù|ú|ủ|ũ|ụ|ư|ừ|ứ|ử|ữ|ự/igm,"u")
    str = str.replace(/\ /igm, "-");
    $(".alink").text("http://localhost/" + str);
    }
})

// $(".ipcontent").blur(function(){
//     if($(".ipcontent").val().length <= 200){
//         alert("Nội dung bài viết phải chứa ít nhất 200 ký tự");
//     }
// })

// $(".ipemail").blur(function (){
//     if($(".ipemail").val()== "")
//         {
//             alert("Email không được để trống!");
//         }
//     else
//     {
//         var email = $(".ipemail").val();
//         var filter = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/; /*Tìm kiếm igm = Tìm kiếm không phân biệt hoa thường + Toàn cục + Tìm đa dòng*/ 
//         if(!filter.test(email)){
//         alert("Địa chỉ email không hợp lệ!");
//         }
//     }
// })

// $(".ipsdt").blur(function(){
//     if($(".ipsdt").val() == ""){
//         alert("Số điện thoại không được để trống!");
//     }
//     // else
//     // {
//     //     var sdt = $(".ipsdt").val();
//     //     var filtersdt = /^\+?\d{1,2}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/;
//     //     if(!filtersdt.test(sdt)){
//     //         alert("Số điện thoại không hợp lệ!");
//     //     }
//     // }
// })









/*Lịch đăng*/
    $("input[name = 'lich'").click(function(){
        if($(".dangngay").prop("checked"))
        // if($(".datlich:checked")){
        //     $(".datetime").attr("disabled", false); /*attr hoặc prop*/
        //     alert("Nhập ngày đặt lịch");
        // }
        // else
        {
            var d = new Date();
            var day = d.getDate();
            var month = d.getMonth() + 1;
            var year = d.getFullYear();
            var output = (month<10 ?'0': '') + month + "/" + (day<10?'0': '') + day + "/" + year;
            $(".datetime").val("");
            $(".datetime").attr("disabled", true);
            // alert("Lịch đăng bài là: " + output);
        }
        if($(".datlich").prop("checked"))
        {
            $(".datetime").attr("disabled", false);
        }
    })
        
    // })
})