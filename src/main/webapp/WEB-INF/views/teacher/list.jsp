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
    <link rel="stylesheet" href="/assets/css/teacher_list.css">
    <script src="/assets/js/teacher.js"></script>
</head>
<body>
    <main>
        <h1><i class="fas fa-user-tie"></i> 교직원관리</h1>
        <button id="add_department"><i class="fas fa-plus-circle"></i>교직원 추가</button>
        <div class="content_area">
            <div class="menu_area">
                <div class="search_box">
                    <input type="text" id="keyword" placeholder="이름 입력" value="${data.keyword}">
                    <button id="search_btn"><i class="fas fa-search"></i></button>
                </div>
                <button id="reset_btn">초기화</button>
            </div>
            <div class="table_area">
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>소속</th>
                            <th>교직원ID</th>
                            <th>이름</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>등록일</th>
                            <th>수정일</th>
                            <th>조작</th>
                        </tr>
                    </thead>
                        <tbody>
                            
                            <tr>
                                <td id="nodata" colspan="11">데이터가 없습니다.</td>
                            </tr>
                        
                            <tr>
                                <td>1</td>
                                <td>컴퓨터공학부</td>
                                <td>20211214001</td>
                                <td>교직원</td>
                                <td>1991-12-14</td>
                                <td>010-1234-5678</td>
                                <td>teacher1@school.ac.kr</td>
                                <td>2021-12-14 17:47:36</td>
                                <td>2021-12-14 17:47:36</td>
                                
                                <td>
                                    <button class="modify_btn" data-seq="${d.di_seq}"><i class="fas fa-pencil-alt"></i></button>
                                    <button class="delete_btn" data-seq="${d.di_seq}"><i class="fas fa-minus-circle"></i></button>
                                </td>
                            </tr>
                        
                        </tbody>
                </table>
            </div>
            <div class="pager_area">
                <button id="prev"><i class="fas fa-chevron-left"></i></button>
                <div class="pagers">
                    <c:forEach begin="1" end="${data.pageCnt}" var="i">
                        <a href="/department?offset=${(i-1)*10}&keyword=${data.keyword}">${i}</a>
                    </c:forEach>
                </div>
                <button id="next"><i class="fas fa-chevron-right"></i> </button>
            </div>
        </div>
    </main>
    <div class="popup_wrap" style="display: block;">
        <div class="popup" id="department_add">
            <div class="top_area">
                <div class="icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <h2>교직원 추가</h2>   
                <p>교직원 정보를 입력해주세요</p>
            </div>
            <div class="content_area">
                <input type="text" id="teacher_dep_name" placeholder="학과 명" disabled>
                <button id="search_dep">학과검색</button>
                <br>
                <input type="text" id="teacher_name" placeholder="교직원명">
                <input type="text" id="teacher_number" placeholder="교직원 번호(ID)">
                <input type="password" id="teacher_pwd" placeholder="비밀번호">
                <input type="password" id="teacher_pwd_confrim" placeholder="비밀번호 확인">
                <input type="text" id="teacher_birth" placeholder="생년월일(YYYMMDD)">
                <input type="text" id="teacher_phone" placeholder="전화번호(01012345678)">
                <input type="text" id="teacher_email" placeholder="이메일 (__@mail.com">

                <select id="teacher_status">
                    <option value="1">재직</option>
                    <option value="2">휴직</option>
                    <option value="3">휴가</option>
                    <option value="4">퇴임</option>
                </select>
            </div>
            <div class="btn_area">
                <button id="add_dep">등록하기</button>
                <button id="modify_dep">수정하기</button>
                <button id="cancel_dep">취소하기</button>
            </div>
        </div>
    </div>
</body>
</html>