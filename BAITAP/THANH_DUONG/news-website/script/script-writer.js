$(document).ready(function () {
    var reg = /^([A-Za-z0-9\.])+@([A-Za-z\.]+)\.([A-Za-z]{3,4})/i;

    var title = $('input[name="title"]');
    var link = $('input[name="link"]');
    var content = $('textarea[name="content"]');
    var email = $('input[name="email"]');
    var tel = $('input[name="tel"]');
    var tag = $('input[name="tagName"]');

    title.change(function(){
        console.log(title.val());
        var conv = convert(title.val());
        // alert(this.val());
        console.log(conv);
        link.val(conv);
    });


    $('#form').submit(function (e) {
        e.preventDefault();
        if(title.val() == ""){
            alert("Bài viết phải có tiêu đề " );
            title.focus();
        }else if(content.val().length < 200){
            alert("Nội dung phải chứa ít nhất 200 kí tự " );    
            content.focus();
        }else{
            if(email.val() == "" || tel.val() == ""){
                alert("Hãy điền đầy đủ thông tin vào form bên phải");
            }else if(!reg.test(email.val())){
                alert("Định dạng email không đúng")
                email.focus();
            }else if(isNaN(tel.val())){
                alert("Số điện thoại không được nhập chữ");
                tel.focus();
            }else{
                // TODO
                
            }
        }
    });

    $('input[name="addTag"]').on('click',function(){
        var getTag = tag.val();
        var arrTag = getTag.split(",");
        var show ="";
        if(getTag != ""){
            for(var i=0;i<arrTag.length;i++){
                show += '<span class="elTag" style="margin-right:10px;"><b class="delTag"></b>'+arrTag[i].trim()+'</span>';
                
            }
        }
        
        $('#showTag').html($('#showTag').html()+show);
        tag.val("");
	
        // remove tag
        $('.delTag').on('click',function(){
            $(this).parent().remove();
        });
    });
    
    $('input[name="ld"]').on('click', function () {

        if($(this).val() == "1"){
            $('input[name="setTime"]').prop ('disabled', false);
        }else{
            $('input[name="setTime"]').prop ('disabled', true);
        }
        
    });
    $('#reset').on('click',function(){
        $('#showTag').html("");
    });
    
});

function convert(s){
    s = s.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/gi, 'a');
    s = s.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/gi,'e');
    s = s.replace(/(ì|í|ị|ỉ|ĩ)/gi,'i');
    s = s.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/gi,'o');
    s = s.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/gi,'u');
    s = s.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/gi,'y');
    s = s.replace(/(đ)/gi,'d');
    s = s.replace(/\ /g,"-");
    return s;
}
