<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>내 정보</title>
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
      <h1>내 정보</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index">Home</a></li>
          <li class="breadcrumb-item">내 정보</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="resources/profile/${loginProfile}" alt="Profile" class="rounded-circle">
              <h2>${loginId}</h2>
              <h3>현재 로그인된 아이디</h3>
              <div class="social-links mt-2">
                <!--
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                -->
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">회원 정보</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">회원 정보수정</button>
                </li>

              </ul>
              
              
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  
                  <h5 class="card-title">상세 정보</h5>
					
				  <div class="row">
                    <div class="col-lg-3 col-md-4 label">프로필 사진</div>
                    <div class="col-lg-9 col-md-8"><img src="resources/profile/${member.memProfileName}" alt="Profile" class="rounded-circle" width="200px"/></div>
                  </div>
					
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">아이디</div>
                    <div class="col-lg-9 col-md-8">${member.memId}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이름</div>
                    <div class="col-lg-9 col-md-8">${member.memName}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">생년월일</div>
                    <div class="col-lg-9 col-md-8">${member.memBirth}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">성별</div>
                    <div class="col-lg-9 col-md-8">${member.memGender}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">${member.memEmail}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">연락처</div>
                    <div class="col-lg-9 col-md-8">${member.memPhone}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">주소</div>
                    <div class="col-lg-9 col-md-8">${member.memAddr}</div>
                  </div>
                  
                  <!-- 회원 탈퇴(회원, 관리자) -->
                  <c:choose>
                  <c:when test="${loginId != 'admin' && loginId != null}">
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                      <button class="btn btn-primary"  onclick="mDelete('${member.memId}')">회원 탈퇴</button>
                    </div>
                  </div>
                  </c:when>
                  
                  <c:when test="${loginId == 'admin'}">
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                      <button class="btn btn-primary" onclick="mDelete('${member.memId}')">회원 탈퇴</button>
                    </div>
                  </div>
                  </c:when>
                  </c:choose>
                </div>


				<!-- 회원 정보 수정 -->
                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <h5 class="card-title">회원 정보 수정</h5>
					
					
				  <form action="mModify" method="POST" name="modifyForm" enctype="multipart/form-data">
				  <input type="hidden" name="memId" value="${member.memId}"/>
				  <input type="hidden" name="memPreProfileName" value="${member.memProfileName}"/>
				  
                  
                  <div class="row mb-3">
                    <label for="memProfile" class="col-sm-2 col-form-label">프로필 사진</label>
                    <div class="col-lg-9 col-md-8"><img src="resources/profile/${member.memProfileName}" alt="Profile" class="rounded-circle" width="200px"/></div>
                    <div class="col-sm-10">
                      <input class="form-control" type="file" name="memProfile" id="memProfile">
                    </div>
                  </div>
					
				  <div class="row mb-3">
                    <label for="memPw" class="col-sm-2 col-form-label">비밀번호</label>
                    <div class="col-sm-10">
                      <input type="password" name="memPw" class="form-control" id="memPw" onkeyup="pwRegexp()" placeholder="영문, 숫자, 특수문자 혼합"/>
                      <span id="pwResult1"></span>
                    </div>
                  </div>
                  <div class="row mb-3">
                    <label for="checkPw" class="col-sm-2 col-form-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="checkPw" onkeyup="pwCheck()">
                      <span id="pwResult2"></span>
                    </div>
                  </div>
				  
				  <div class="row mb-3">
                    <label for="memEmail" class="col-sm-2 col-form-label">이메일</label>
                    <div class="col-sm-10">
                      <input type="email" name="memEmail" class="form-control" id="memEmail">
                      <span id="confEmail"><input type="button" value="인증번호 발송" onclick="checkEmail()"/></span>
                    </div>
                  </div>
                  
                  <div class="row mb-3">
                    <label for="memPhone" class="col-sm-2 col-form-label">연락처</label>
                    <div class="col-sm-10">
                      <input type="tel" name="memPhone" class="form-control" id="memPhone">
                    </div>
                  </div>
                  
                  <div class="row mb-3">
                    <label for="sample6_postcode" class="col-sm-2 col-form-label">주소</label>
                    <div class="col-sm-10">
                      <input type="text" 	 name="addr1"  id="sample6_postcode" placeholder="우편번호">
				  	  <input type="button" onclick="sample6_execDaumPostcode()"  value="우편번호 찾기"><br>
					  <input type="text"   name="addr2" class="form-control" size="40" id="sample6_address" placeholder="주소"><br>
					  <input type="text"   name="addr3" class="form-control" size="40" id="sample6_detailAddress" placeholder="상세주소">
                    </div>
                  </div>
                  
                  <div class="row mb-3">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                      <input type="button" class="btn btn-primary" onclick="checkConfirm()" value="수정하기"/>
                    </div>
                  </div>
                  
                  </form>

                </div>

              </div><!-- End Modify -->

              </div><!-- End Bordered Tabs -->

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

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
// 회원 탈퇴 여부
function mDelete(memId){
	
	let result = confirm('정말로 탈퇴 하시겠습니까?');
	
	if(result){
		location.href="madDelete?memId="+memId;
	} else{
		location.href="mView?memId="+memId;
	}
}


// 비밀번호 사용 가능 여부 확인
function pwRegexp(){
	let memPw = document.getElementById("memPw").value;
	let pwResult1 = document.getElementById("pwResult1");
	
	let num = memPw.search(/[0-9]/);
	let eng = memPw.search(/[a-z]/);
	let spe = memPw.search(/[`~!@#$%^&*|\\\'\":;\/?]/);
	let spc = memPw.search(/\s/);
	
	//console.log("num : " + num + " , eng : " + eng + " , spe : " + spe);
	
	if(memPw.length < 8 || memPw.length > 16){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 8자리에서 16자리 이내로 입력해주세요.";
		return false;
		
	} else if(spc >= 0){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "비밀번호는 공백없이 입력해주세요.";
		return false;
	
	} else if(num < 0 || eng < 0 || spe < 0){
		pwResult1.style.color = "#ff0000";
		pwResult1.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요.";
		return false;
	
	} else {
		pwResult1.style.color = "#0000ff";
		pwResult1.innerHTML = "사용가능한 비밀번호 입니다.";
		return true;
	}
}

// 비밀번호 확인 여부
function pwCheck(){
	
	let memPw = document.getElementById("memPw").value;
	let checkPw = document.getElementById("checkPw").value;
	let pwResult2 = document.getElementById("pwResult2");
	
	if(memPw == checkPw){
		pwResult2.style.color = "#0000ff";
		pwResult2.innerHTML = "비밀번호가 일치합니다.";
		return true;
	} else {
		pwResult2.style.color = "#ff0000";
		pwResult2.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	}
}

// 이메일 인증 번호 발송
function checkEmail(){
	
	let memEmail = $("#memEmail").val();
	
	$.ajax({
		type : "POST",
		url : "mCheckEmail",
		data : { "memEmail" : memEmail },
		dataType : "text",
		success : function(uuid){
			console.log("이메일 인증번호1 : " + uuid);
			$("#confEmail").html("<br/><input type='text' id='uuidCheck'/>"
					+" <input type='hidden' value='"+ uuid +"' id='uuid'/>"
					+" <input type='button' value='인증' onclick=\"checkEmail2()\"/>");
		},
		error : function(){
			alert('이메일 인증 통신 실패!');
		}
	});
}

// 이메일 인증 여부
let checkEmail2Bool = false;

function checkEmail2(){
	let uuid = $("#uuid").val();
	//console.log("이메일 인증번호2 : " + uuid);
	
	let uuidCheck = $("#uuidCheck").val();
	//console.log("입력한 인증번호 : " + uuidCheck);
	
	let boolUUID = false;
	
	if(uuidCheck==null || uuidCheck==""){
		
	}else if(uuid == uuidCheck){
		alert('인증성공!');
		checkEmail2Bool = true;
	} else {
		alert('인증실패!');
	}
	
	return checkEmail2Bool;
}

//회원 가입 버튼누를 경우 최종 확인
function checkConfirm(){
	
	let result = confirm('정말로 수정 하시겠습니까?');
	
	if((!pwRegexp() || !pwCheck()) && result){
		alert('비밀번호를 확인해주세요!.');
	} else if(!checkEmail2Bool && result){
		alert('이메일 인증을 진행해주세요.');
	} else if(!result){
		alert('정보 수정을 취소합니다.')
	} else if(pwRegexp() && pwCheck() && checkEmail2Bool && result){
		modifyForm.submit();
	} else {
		alert('다시 시도해주세요.');
	}
}

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 주소 api
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>



</html>