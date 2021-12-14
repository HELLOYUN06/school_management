$(function(){
    $(".main_menu a:nth-child(2)").addClass("active");
    $("#add_department").click(function(){
        //alert("학과 추가 팝업")
        $(".popup_wrap").addClass("open");
        $("#add_dep").css("display", "inline-block");
        $("#modify_dep").css("display", "none");
        $(".popup .top_area h2").html("학과 추가");
        $(".popup .top_area p").html("학과 정보를 입력해주세요");
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
    let modify_data_seq = 0;

    $(".modify_btn").click(function(){
        //alert($(this).attr("data-seq"))
        modify_data_seq = $(this).attr("data-seq");
        $(".popup_wrap").addClass("open");
        $("#add_dep").css("display", "none");
        $("#modify_dep").css("display", "inline-block");
        $(".popup .top_area h2").html("학과 수정");
        $(".popup .top_area p").html("수정할 내용을 입력해주세요.");
        $.ajax({
            type:"get",
            url:"/department/get?seq="+$(this).attr("data-seq"),
            success:function(r){
                console.log(r);
                $("#dep_name").val(r.data.di_name);
                $("#dep_score").val(r.data.di_graduate_score);
                $("#dep_status").val(r.data.di_status).prop("selected", true);
            }
        })
    })
    $("#modify_dep").click(function(){
        //alert(modify_data_seq)
        if(confirm("수정하시겠습니까?") == false) return;

        let dep_name = $("#dep_name").val();
        let dep_score = $("#dep_score").val();
        let dep_status = $("#dep_status option:selected").val();

        let data = {
            di_seq:modify_data_seq,
            di_name:dep_name,
            di_graduate_score:dep_score,
            di_status:dep_status
        }
        $.ajax({
            type:"patch",
            url:"/department/update",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(r){
                alert(r.message);
                location.reload();
            }
        })
    })
    $("#search_btn").click(function(){
        location.href="/department?keyword="+$("#keyword").val();
    })
    $("#keyword").keydown(function(e){
        console.log(e.keyCode)
        if(e.keyCode == 13){
            $("#search_btn").trigger("click");
        }
    })
})