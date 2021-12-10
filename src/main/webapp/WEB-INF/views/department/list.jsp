<%@page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="/WEB-INF/includes/header.jsp"%>
    <link rel="stylesheet" href="/assets/css/department_list.css">
    <script>
        $(function(){
            $(".main_menu a:nth-child(2)").addClass("active")
        })
    </script>
</head>
<body>
    <main>
        <h1><i class="fas fa-school"></i> 학과관리</h1>
        <button id="add_department"><i class="fas fa-plus-circle"></i>학과 추가</button>
        <div class="content_area">
            <div class="menu_area">
                <div class="search_box">
                    <input type="text" id="keyword" placeholder="검색어 입력">
                    <button id="search_btn"><i class="fas fa-search"></i></button>
                </div>
                <button id="reset_btn">초기화</button>
            </div>
            <div class="table_area">
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>학과명</th>
                            <th>졸업학점</th>
                            <th>등록일</th>
                            <th>수정일</th>
                            <th>조작</th>
                        </tr>
                    </thead>
                        <tbody>
                            <tr>
                                <td>1234</td>
                                <td>컴퓨터 공학과</td>
                                <td>120</td>
                                <td>2021-12-10 11:11:11</td>
                                <td>2021-12-10 11:11:11</td>
                                <td>
                                    <button class="modify_btn"><i class="fas fa-pencil-alt"></i></button>
                                    <button class="delete_btn"><i class="fas fa-minus-circle"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>1234</td>
                                <td>컴퓨터 공학과</td>
                                <td>120</td>
                                <td>2021-12-10 11:11:11</td>
                                <td>2021-12-10 11:11:11</td>
                                <td>
                                    <button class="modify_btn"><i class="fas fa-pencil-alt"></i></button>
                                    <button class="delete_btn"><i class="fas fa-minus-circle"></i></button>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="pager_area">
                <button id="prev"><i class="fas fa-chevron-left"></i></button>
                <div class="pagers"> 
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                </div>
                <button id="next"><i class="fas fa-chevron-right"></i> </button>
            </div>
        </div>
    </main>
</body>
</html>