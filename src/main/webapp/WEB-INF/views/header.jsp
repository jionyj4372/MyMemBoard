<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

	<!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index" class="logo d-flex align-items-center">
        <img src="resources/assets/img/icia.png" alt="">
        <span class="d-none d-lg-block">ICIA</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        

        <!-- End Messages Dropdown Items -->
		<!-- End Messages Nav -->
		
		
		
		<c:choose>
		<c:when test="${loginId != null}">
        <li class="nav-item dropdown pe-3">
		  
		  
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <c:if test="${loginProfile == null}">
		  		<img src="resources/assets/img/noneProfile.png" alt="" class="rounded-circle">
		    </c:if>
		    <c:if test="${loginProfile != null}">
            	<img src="resources/profile/${loginProfile}" alt="profile" class="rounded-circle">
		    </c:if>
            <span class="d-none d-md-block dropdown-toggle ps-2">${loginId}</span>
          </a>

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${loginId}</h6>
              <span>로그인 된 아이디</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="mView?memId=${loginId}">
                <i class="bi bi-person"></i>
                <span>내 정보</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
			
			
			<c:if test="${loginId == 'admin'}">
            <li>
              <a class="dropdown-item d-flex align-items-center" href="mList">
                <i class="ri-file-list-2-line"></i>
                <span>회원 목록보기</span>
              </a>
            </li>
            </c:if>
            
            <li>
              <hr class="dropdown-divider">
            </li>
			
            <li>
              <a class="dropdown-item d-flex align-items-center" href="mLogout">
                <i class="ri-logout-box-line"></i>
                <span>로그아웃</span>
              </a>
            </li>

          </ul>
        </li>
		</c:when>
		
		
		
		
		
		
		
		<c:when test="${loginId == null}">
        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="${pageContext.request.contextPath}/resources/assets/img/noneProfile.png" alt="" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">로그인 후 사용가능</span>
          </a>

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <span>로그인 후 사용하세요</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-register">
                <i class="bi bi-person"></i>
                <span>회원가입</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-login">
                <i class="ri-login-box-line"></i>
                <span>로그인</span>
              </a>
            </li>
            
          </ul>
        </li>
		</c:when>
		</c:choose>
      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

</body>
</html>