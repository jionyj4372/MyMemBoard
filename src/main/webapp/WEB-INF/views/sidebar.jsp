<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
</head>
<body>

	<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index">
          <i class="bi bi-grid"></i>
          <span>ICIA 홈</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <!-- End Icons Nav -->

      <li class="nav-heading">Pages</li>
	  
	  <c:if test="${loginId != null}">
      <li class="nav-item">
        <a class="nav-link collapsed" href="mView?memId=${loginId}">
          <i class="bi bi-person"></i>
          <span>내 정보</span>
        </a>
      </li>
      </c:if>
      <!-- End Profile Page Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="bList">
          <i class="ri-artboard-line"></i>
          <span>ICIA 커뮤니티</span>
        </a>
      </li>
      
      <c:if test="${loginId == 'admin'}">
      <li class="nav-item">
        <a class="nav-link collapsed" href="mList">
          <i class="ri-file-list-2-line"></i>
          <span>회원 목록</span>
        </a>
      </li>
	  </c:if><!-- End Blank Page Nav -->
      
      
	  <c:if test="${loginId == null}">
      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-register">
          <i class="bi bi-card-list"></i>
          <span>회원가입</span>
        </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>로그인</span>
        </a>
      </li>
      </c:if><!-- End Login Page Nav -->


	  <c:if test="${loginId != null}">
	  <li class="nav-item">
        <a class="nav-link collapsed" href="mLogout">
          <i class="ri-logout-box-line"></i>
          <span>로그아웃</span>
        </a>
      </li>
      </c:if>
      <!-- End Contact Page Nav -->

    </ul>

  </aside>

</body>
</html>