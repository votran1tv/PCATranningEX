$(document).ready(function(){
    $("#khung").validate({
        rules: {
            inputtde: "required",
            noidung:{
                required: true,
                minlength:200
            },
            txtEmail:{
                required:true,
                email:true,
                
            },
            sđt:{
                required:true,
                digits:true,
                maxlength: 20  
                
                // phoneUS:true  
            },
          
        },
        messages:{
            inputtde:"Vui lòng nhập tiêu đề",
            noidung:{
                required:"Vui lòng nhập nội dung",
                minlength:"Vui lòng nhập ít nhất 200 ký tự",
                
            },
            txtEmail:{
                required:"Vui lòng nhập email",
                email:"Vui lòng nhập đúng email",
            },
            sđt:{
                required:"Vui lòng nhập số điện thoại",
                digits:"Vui lòng nhập đúng định dạng"
            }
        }
    })

    $("input[name='lichdang']").click(function(){
        if($("#dangngay").prop('checked')){
            $("#datetime").prop('disabled',true);
        }
        if($("#datlich").prop('checked')){
            $('#datetime').prop('disabled',false);
        }
    })

    $("input[name='inputtde']").blur(function(){
        var a= $(this).val();
        a = a.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/g, 'a');
        a = a.replace(/(đ)/g,'d');
        a = a.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/i,'e');
        a = a.replace(/(ì|í|ị|ỉ|ĩ)/i,'i');
        a = a.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,'o');
        a = a.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g,'u');
        a = a.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/g,'y');
        a = a.replace(/\ /g,"-");
        $("a[target!='_blank']").show();
    })


    $("button[name=btnthem]").click(function(){
        $(".div1").html( function(i,origText){
            return "" + origText + $("#nhapthe").val() +" ";
        });
    });
 });