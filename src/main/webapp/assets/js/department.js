$(function(){
    $(".main_menu a:nth-child(2)").addClass("active");
    $("#add_department").click(function(){
        //alert("학과 추가 팝업")
        $(".popup_wrap").addClass("open");
    })
    $("#add_dep").click(function(){
        if(confirm("학과를 등록하시겠습니까?") == false) return;
        let dep_name = $("#dep_name").val();
        let dep_score = $("#dep_score").val();
        let dep_status = $("#dep_status option:selected").val();

        let data = {
            di_name:dep_name,
            di_graduate_score:dep_score,
            di_status:dep_status
        }
        $.ajax({
            type:"post",
            url:"/department/add",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(r){
                alert(r.message);
                if(r.status)
                    location.reload();
            }
        })
    })
    $("#cancel_dep").click(function(){
        if(confirm("취소하시겠습니까?\n(입력된 정보는 저장되지 않습니다.)") == false) return;
        
        $("#dep_name").val("");
        $("#dep_score").val("");
        $("#dep_status").val("1").prop("selected", true);
        
        $(".popup_wrap").removeClass("open");
    })

    $(".delete_btn").click(function(){
        if(confirm("학과를 삭제하시겠습니까?\n(이 동작은 되돌릴 수 없습니다.)")==false) return;

        
        let seq = $(this).attr("data-seq");

        $.ajax({
            type:"delete",
            url:"/department/delete?seq="+seq,
            success:function(r){
                alert(r.message);
                location.reload();
            }
        })
    });
})