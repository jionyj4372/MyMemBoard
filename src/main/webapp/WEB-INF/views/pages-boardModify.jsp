<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ICIA 커뮤니티</title>
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
	
	<c:choose>
		<c:when test="${loginId eq null}">
			<script>
				alert('로그인 후에 사용해주세요.');
				location.href="pages-login";
			</script>
		</c:when>
	</c:choose>

  <!-- ======= Header ======= -->
  <%@ include file="/WEB-INF/views/header.jsp" %>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@ include file="/WEB-INF/views/sidebar.jsp" %>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>커뮤니티 글 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index">ICIA Home</a></li>
          <li class="breadcrumb-item">커뮤니티</li>
          <li class="breadcrumb-item active">커뮤니티 글 수정</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">ICIA 커뮤니티 글 수정</h5>

              <!-- 게시글 작성 Form Elements -->
              <form action="bModify" method="POST" enctype="multipart/form-data">
              	<input type="hidden" name="boNum" value="${modify.boNum}"/>
              	<input type="hidden" name="boPrefileName" value="${modify.boFileName}"/>
              	
                <div class="row mb-3">
                  <label for="boWriter" class="col-sm-2 col-form-label">작성자</label>
                  <div class="col-sm-10">${modify.boWriter}
                    <input type="hidden" name="boWriter" value="${modify.boWriter}"/>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="boTitle" class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" name="boTitle" class="form-control" id="boTitle">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="boContent" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" name="boContent" style="height: 100px"></textarea>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="boFile" class="col-sm-2 col-form-label">파일 업로드</label>
                  <div class="col-sm-10">
                    <input type="file" name="boFile" class="form-control" id="boFile">
                  </div>
                </div>
                
                

                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <input type="submit" class="btn btn-primary" value="수정" />
                    <input type="reset" class="btn btn-primary" value="다시쓰기" />
                  </div>
                </div>

              </form><!-- End General Form Elements -->

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



</html>