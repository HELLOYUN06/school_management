<%@page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                    <select id="search_type">
                        <option value="dept">학과</option>
                        <option value="name"
                            <c:if test="${data.type=='name'}">selected</c:if>
                        >이름</option>
                    </select>
                    <input type="text" id="keyword" placeholder="검색어 입력" value="${data.keyword}">
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
                            <th>상태</th>
                            <th>등록일</th>
                            <th>수정일</th>
                            <th>조작</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:if test="${data.list.size() == 0}">
                                <tr>
                                    <td id="nodata" colspan="11">데이터가 없습니다.</td>
                                </tr>
                            </c:if>
                            <c:forEach items="${data.list}" var="t">
                                <tr>
                                    <td>${t.ti_seq}</td>
                                    <td>${t.department_name}</td>
                                    <td>${t.ti_number}</td>
                                    <td>${t.ti_name}</td>
                                    <td>${t.ti_birth}</td>
                                    <td>${t.ti_phone_num}</td>
                                    <td>${t.ti_email}</td>
                                    <td class="teacher_status">
                                        <c:if test="${t.ti_status == 1}">
                                            <span style="background-color: rgb(17,226,27);">정상</span>
                                        </c:if>
                                        <c:if test="${t.ti_status == 2}">
                                            <span style="background-color: rgb(255,110,26);">휴직</span>
                                        </c:if>
                                        <c:if test="${t.ti_status == 3}">
                                            <span style="background-color: rgb(251,186,64);">휴가</span>
                                        </c:if>
                                        <c:if test="${t.ti_status == 4}">
                                            <span style="background-color: rgb(225,23,23);">퇴임</span>
                                        </c:if>
                                    </td>
                                    <td><fmt:formatDate value="${t.ti_reg_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><fmt:formatDate value="${t.ti_mod_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <button class="modify_btn" data-seq="${t.ti_seq}"><i class="fas fa-pencil-alt"></i></button>
                                        <button class="delete_btn" data-seq="${t.ti_seq}"><i class="fas fa-minus-circle"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                </table>
            </div>
            <div class="pager_area">
                <button id="prev"><i class="fas fa-chevron-left"></i></button>
                <div class="pagers">
                    <c:forEach begin="1" end="${data.pageCnt}" var="i">
                        <a href="/teacher?offset=${(i-1)*10}&type=${type}&keyword=${keyword}">${i}</a>
                    </c:forEach>
                </div>
                <button id="next"><i class="fas fa-chevron-right"></i> </button>
            </div>
        </div>
    </main>
    <div class="popup_wrap">
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
    <div class="department_search">
        <div class="dep_search_box">
        <input type="text" id="dep_keyword" placeholder="예) 컴퓨터, 컴퓨터공학, 공학">
        <button id="dep_search_btn"><i class="fas fa-search"></i></button>
        </div>
        <div class="search_result">
            <ul>
                    
            </ul>
        </div>
        <div class="dep_search_buttons">
            <button id="dep_search_close">닫기</button>
        </div>
    </div>
</body>
</html>