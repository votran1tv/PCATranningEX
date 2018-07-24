$(document).ready(function () {

    var title = $('input[name="title"]');
    var link = $('input[name="link"]');
    var content = $('input[name="content"]');

    $('#form').submit(function (e) {
        e.preventDefault();
        if(title.val() == "" || link.val() == "" || content.val() == ""){
            alert("Hãy điền dầy đủ thông tin");
        }
    });

    $('input[name="ld"]').on('click', function () {

        if($(this).val() == "1"){
            $('input[name="setTime"]').prop ('disabled', false);
        }else{
            $('input[name="setTime"]').prop ('disabled', true);
        }
        
    });
    
});