$(function(){
    $(".main_menu a:nth-child(3)").addClass("active");
    $("#search_dep").click(function(){
        $(".department_search").css("display", "block");
    });
    $("#dep_search_close").click(function(){
        $(".department_search").css("display", "");
    });
    $("#dep_keyword").keyup(function(e){
        if(e.keyCode == 13) $("#dep_search_btn").trigger("click");
    });
    $("#dep_search_btn").click(function(){
        $.ajax({
            url:"/department/keyword?keyword="+$("#dep_keyword").val(),
            type:"get",
            success:function(r){
                console.log(r);
                $(".search_result ul").html("");
                for(let i=0; i<r.list.length; i++){
                    let str_status ="";
                    if(r.list[i].di_status == 1 ) str_status = "운영중"
                    if(r.list[i].di_status == 2 ) str_status = "통합예정"
                    if(r.list[i].di_status == 3 ) str_status = "폐지예정"
                    if(r.list[i].di_status == 4 ) str_status = "폐지"

                    let tag=
                        '<li>'+
                            '<a href="#" data-dep-seq="'+r.list[i].di_seq+'">'+r.list[i].di_name+'</a>'+
                            '<span class="status'+r.list[i].di_status+'">'+str_status+'</span>'+
                        '</li>';
                    $(".search_result ul").append(tag);
                }

                $(".search_result ul a").click(function(e){
                    e.preventDefault(); //a태그의 링크 기능제거
                    let seq = $(this).attr("data-dep-seq");
                    let name = $(this).html();

                    $("#teacher_dep_name").attr("data-dep-seq", seq);
                    $("#teacher_dep_name").val(name);

                    $(".search_result ul").html("");
                    $("#dep_keyword").val("");
                    $(".department_search").css("display", "");
                })
            }
        })
    })

    $("#add_dep").click(function(){
        let teacher_dep_name = $("#teacher_dep_name").attr("data-dep-seq");
        let teacher_name = $("#teacher_name").val();
        let teacher_number = $("#teacher_number").val();
        let teacher_pwd = $("#teacher_pwd").val();
        let teacher_birth = $("#teacher_birth").val();
        let teacher_phone = $("#teacher_phone").val();
        let teacher_email = $("#teacher_email").val();
        let teacher_status = $("#teacher_status option:selected").val();
        
        let teacher_pwd_confirm =$("#teacher_pwd_confrim").val();
        

        if(teacher_dep_name == undefined){
            alert("학과를 입력해주세요");
            return;
        }
        if(teacher_pwd == ''){
            alert("비밀번호를 입력해주세요");
            return;
        }
        if(teacher_pwd != teacher_pwd_confirm){
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }

        let data = {
            ti_di_seq:teacher_dep_name,
            ti_name:teacher_name,
            ti_number:teacher_number,
            ti_pwd:teacher_pwd,
            ti_birth:teacher_birth,
            ti_phone_num:teacher_phone,
            ti_email:teacher_email,
            ti_status:teacher_status,
        }
        $.ajax({
            url:"/teacher/add",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(e){
                alert(e.message);
                if(e.status)
                location.reload();
            }
        })
    })
    $("#add_department").click(function(){
        $(".popup_wrap").css("display", "block");
        $("#add_dep").css("display", "inline-block");
        $("#modify_dep").css("display", "none");
        $("#cancel_dep").css("display", "inline-block");
        $(".popup .top_area h2").html("교직원 추가");
        $(".popup .top_area p").html("교직원 정보를 입력해주세요.");

    })
    $("#cancel_dep").click(function(){
        if(confirm("취소하시겠습니까? \n(입력된 내용은 저장되지 않습니다)") == false) return;

        $("#teacher_dep_name").attr("data-dep-seq", "");
        $("#teacher_dep_name").val("");
        $("#teacher_name").val("");
        $("#teacher_number").val("");
        $("#teacher_pwd").val("");
        $("#teacher_pwd_confrim").val("");
        $("#teacher_birth").val("");
        $("#teacher_phone").val("");
        $("#teacher_email").val("");
        $("#teacher_status").val("1").prop("selected", true);

        $(".popup_wrap").css("display", "")
    })
    $("#search_btn").click(function(){
        let type = $("#search_type option:selected").val();
        let keyword = $("#keyword").val();

        location.href = "/teacher?type="+type+"&keyword="+keyword;
    });

    $(".delete_btn").click(function(){
        if(!confirm("삭제하시겠습니까?")) return
        // if(confirm("삭제하시겠습니까?") == false) return
        let seq = $(this).attr("data-seq");
        $.ajax({
            url:"/teacher/delete?seq="+9999,
            type:"delete",
            success:function(r){
                // 100~300번대
                alert(r.message)
                if(r.status) // 삭제에 성공시 (r.status의 값이 true일때)
                    location.reload(); // 페이지 새로고침
            },
            error:function(r){
                // 400~500번대에 걸리면 여기서 처리
                console.log(r)
                alert(r.responseJSON.message);
            }
        })
    })
    
    let modify_seq = 0;
    $(".modify_btn").click(function(){
        let seq = $(this).attr("data-seq");
        modify_seq = seq;
        $.ajax({
            url:"/teacher/get?seq="+seq,
            type:"get",
            // success:(r) => {
            //     console.log(r)
            success:function(r){
                $(".popup_wrap").css("display", "block");
                $("#add_dep").css("display", "none");
                $("#modify_dep").css("display", "inline-block");
                $("#cancel_dep").css("display", "inline-block");
                $(".popup .top_area h2").html("교직원 수정");
                $(".popup .top_area p").html("수정할 정보를 입력하세요");

                $("#teacher_dep_name").attr("data-dep-seq", r.ti_di_seq);
                $("#teacher_dep_name").val(r.department_name);
                $("#teacher_name").val(r.ti_name);
                $("#teacher_number").val(r.ti_number);
                $("#teacher_pwd").val("**********").prop("disabled", true);
                $("#teacher_pwd_confrim").val("**********").prop("disabled", true);
                $("#teacher_birth").val(r.ti_birth);
                $("#teacher_phone").val(r.ti_phone_num);
                $("#teacher_email").val(r.ti_email);
                $("#teacher_status").val(r.ti_status).prop("selected", true);
            }
        })
    })

    $("#modify_dep").click(function(){
        if(!confirm("수정하시겠습니까?")) return;
        let data ={
            ti_seq:modify_seq,
            ti_di_seq :$("#teacher_dep_name").attr("data-dep-seq"),
            ti_name :$("#teacher_name").val(),
            ti_number :$("#teacher_number").val(),
            ti_birth :$("#teacher_birth").val(),
            ti_phone_num :$("#teacher_phone").val(),
            ti_email :$("#teacher_email").val(),
            ti_status :$("#teacher_status option:selected").val()
        }
        $.ajax({
            url:"/teacher/modify",
            type:"patch",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(r){
                alert(r.message)
                if(r.status)
                    location.reload();
            }
        })
    })
})