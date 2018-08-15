$(document).ready(function(){
    var title = $("input[name='title']");
    var link = $("textarea[name='link']");
    var content = $("textarea[name='content']");
    var radio = $("input[name='radio']");
    var date = $("input[name='dateTime']");
    var email = $("input[name='eContact']");
    var phone = $("input[name='iPhone']");
    var tag = $("input[name='iTag']");

    var regEx = /^([A-Za-z0-9\.])+@([A-Za-z\.]+)\.([A-Za-z]{3,4})/i;

    function convert(cv){
        cv = cv.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/gi, 'a');
        cv = cv.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/gi,'e');
        cv = cv.replace(/(ì|í|ị|ỉ|ĩ)/gi,'i');
        cv = cv.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/gi,'o');
        cv = cv.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/gi,'u');
        cv = cv.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/gi,'y');
        cv = cv.replace(/(đ)/gi,'d');
        cv = cv.replace(/\ /g,"-");
        return cv;
    };

    title.change(function(){
        var cvs = convert(title.val());
        link.val(location.href + "/" + cvs);
    });

    $("#container").submit(function(e){
        e.preventDefault();
        if(title.val() == ""){
            alert("Tiêu đề không được để trống");
            title.focus();
        }
        else if(content.val().length < 200){
            alert("Nội dung phải có ít nhất 200 ký tự");
            title.focus();
        }
        else {
            if(email.val() == "" || phone.val() == ""){
                alert("Hãy nhập thông tin bổ sung");
            }
            else if(!regEx.test(email.val())){
                alert("Sai định dạng email");
                email.focus();
            }
            else if(isNaN(phone.val())){
                alert("Số điện thoại phải là số");
                phone.focus();
            }
            else{
                alert("Đăng bài thành công!!!");
            }
        }
        
    });



});