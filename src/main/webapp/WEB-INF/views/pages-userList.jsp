<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>회원 목록</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <!-- Google Fonts -->
  <!-- Vendor CSS Files -->
  <!-- Template Main CSS File -->
  <%@ include file="/WEB-INF/views/setting.jsp" %>
  
  
  <!-- =======================================================
  * Template Name: NiceAdmin - v2.4.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@ include file="/WEB-INF/views/sidebar.jsp" %>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>회원 목록</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index">Home</a></li>
          <li class="breadcrumb-item active">회원 목록</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">ICIA 회원 목록</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">아이디</th>
                    <th scope="col">이름</th>
                    <th scope="col">생년월일</th>
                    <th scope="col">성별</th>
                  </tr>
                </thead>
                
                
                <tbody>
                  <c:forEach var="list" items="${pagingList}" varStatus="status">
                    <tr>
                      <th scope="row"><c:out value="${status.count}"/></th>
                      <td><a href="mView?memId=${list.memId}">${list.memId}</a></td>
                      <td>${list.memName}</td>
                      <td>${list.memBirth}</td>
                      <td>${list.memGender}</td>
                    </tr>
                  </c:forEach>
                </tbody>
                
                
                <tfoot>
                  <tr>
					<td colspan="5" class="limitr">
					  <select onchange="changeLimit(this.value)">
						<option>--회원 수--</option>
						<option value=5>5</option>
						<option value=10>10</option>
						<option value=20>20</option>
					  </select>
					</td>
				  </tr>
				  
				  <!-- 페이징 처리 영역 -->
				  <tr>
				  	
					<td colspan="5">
				
					<!-- [이전]페이지에 대한 처리 --> 
					<c:if test="${paging.page <= 1}">[이전]&nbsp;
					</c:if> 
					<c:if test="${paging.page > 1}">
						<a href="mList?page=${paging.page - 1}&limit=${paging.limit}">[이전]</a>&nbsp;
					</c:if>
					&nbsp;
					
					<!-- [페이지번호]페이지에 대한 처리 --> 
					<c:forEach var="i" begin="${paging.startPage}" 
									end="${paging.endPage}">
					  <c:choose>
						<c:when test="${paging.page == i}">
							[${i}] 
						</c:when>
						
						<c:otherwise>
							<a href="mList?page=${i}&limit=${paging.limit}">${i}</a> 
						</c:otherwise>
					  </c:choose>
					</c:forEach>
					
					<!-- [다음]페이지에 대한 처리 -->
					&nbsp;
					<c:if test="${paging.page >= paging.maxPage}">[다음]</c:if> 
					<c:if test="${paging.page < paging.maxPage}">
						<a href="mList?page=${paging.page + 1}&limit=${paging.limit}">[다음]</a>
					</c:if>
					</td>
				  </tr>
                </tfoot>
                
                
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <!-- Template Main JS File -->
  
  
</body>

<script>
	function changeLimit(limit){
		location.href = "mList?limit="+limit;
	}
</script>



</html>