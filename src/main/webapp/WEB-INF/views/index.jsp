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
    <link rel="stylesheet" href="/assets/css/index.css">
    <script>
        $(function(){
            $(".main_menu a:nth-child(1)").addClass("active")
        })
    </script>
</head>
<body>
    <main>
        <%--
        <fmt:formatNumber value="${value}" type="currency"/>
        <fmt:formatNumber value="${value}" pattern="0,000.0"/>
        <fmt:formatNumber value="${value2}" pattern="0,000원"/>
        <fmt:formatNumber value="${value2}" pattern="#,###.00개"/>
        <fmt:formatNumber value="${value2}" pattern="#,###.##개"/>
        ${value}
        --%>
        <h1>학사관리 대시보드 (School management dashboard)</h1>
        <div class="content_area">
            <div class="department_info">
                <h2><i class="fas fa-school"></i> 학과 정보</h2>
                <p>총 등록 학과 : <span>${cnt.department[0]}건</span></p>
                <p>운영 중 학과 : <span>${cnt.department[1]}건</span></p>
                <p>폐지 예정 : <span>${cnt.department[2]}건</span></p>
                <p><i class="far fa-clock"></i> 업데이트 날짜 : <span><fmt:formatDate value="${update.department}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
            </div>
            <div class="teacher_info">
                <h2><i class="fas fa-user-tie"> </i>교직원 정보</h2>
                <p>총 등록 교직원 : <span>${cnt.teacher[0]}명</span></p>
                <p>재직 중 교직원 : <span>${cnt.teacher[1]}명</span></p>
                <p>휴직 중 교직원 : <span>${cnt.teacher[2]}명</span></p>
                <p><i class="far fa-clock"></i> 업데이트 날짜 : <span><fmt:formatDate value="${update.teacher}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
            </div>
            <div class="student_info">
                <h2><i class="fas fa-user-graduate"></i> 학생 정보</h2>
                <p>총 등록 학생 : <span>${cnt.student[0]}명</span></p>
                <p>재직 중 학생 : <span>${cnt.student[1]}명</span></p>
                <p>휴직 중 학생 : <span>${cnt.student[2]}명</span></p>
                <p>자퇴/퇴학 예정 학생 : <span>${cnt.student[3]}명</span></p>
                <p><i class="far fa-clock"></i> 업데이트 날짜 : <span>2021-12-09 12:00:00</span></p>
            </div>
            <div class="subject_info">
                <h2><i class="fas fa-chalkboard-teacher"></i> 강의 정보</h2>
                <p>총 등록 강의 : <span>${cnt.subject[0]}건</span></p>
                <p>개강 : <span>${cnt.subject[1]}건</span></p>
                <p>폐강 : <span>${cnt.subject[2]}건</span></p>
                <p>종강 : <span>${cnt.subject[3]}건</span></p>
                <p><i class="far fa-clock"></i> 업데이트 날짜 : <span>2021-12-09 12:00:00</span></p>
            </div>
        </div>
    </main>
</body>
</html>