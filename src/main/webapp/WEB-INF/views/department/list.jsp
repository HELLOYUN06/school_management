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
    <script src="/assets/js/department.js"></script>
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
                            <c:if test="${data.total == 0}">
                                <tr>
                                    <td id="nodata" colspan="6">데이터가 없습니다.</td>
                                </tr>
                            </c:if>
                            <c:forEach items="${data.list}" var="d">
                                <tr>
                                    <td>${d.di_seq}</td>
                                    <td>${d.di_name} 공학과</td>
                                    <td>${d.di_graduate_score}</td>
                                    <td>${d.di_reg_dt}</td>
                                    <td>${d.di_mod_dt}</td>
                                    <td>
                                        <button class="modify_btn" data-seq="${d.di_seq}"><i class="fas fa-pencil-alt"></i></button>
                                        <button class="delete_btn" data-seq="${d.di_seq}"><i class="fas fa-minus-circle"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!--
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
                            -->
                        </tbody>
                </table>
            </div>
            <div class="pager_area">
                <button id="prev"><i class="fas fa-chevron-left"></i></button>
                <div class="pagers">
                    <c:forEach begin="1" end="${data.pageCnt}" var="i">
                        <a href="/department?offset=${(i-1)*10}">${i}</a>
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
                    <i class="fas fa-school"></i>
                </div>
                <h2>학과 추가</h2>   
                <p>학과 정보를 입력해주세요</p>
            </div>
            <div class="content_area">
                <input type="text" id="dep_name" placeholder="학과 명"><br>
                <input type="number" id="dep_score" placeholder="졸업 학점">
                <select id="dep_status">
                    <option value="1">운영중</option>
                    <option value="2">보류</option>
                    <option value="3">폐지예정</option>
                </select>
            </div>
            <div class="btn_area">
                <button id="add_dep">등록하기</button>
                <button id="cancel_dep">취소하기</button>
            </div>
        </div>
    </div>
</body>
</html>