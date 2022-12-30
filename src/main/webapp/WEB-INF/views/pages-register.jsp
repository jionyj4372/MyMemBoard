<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Pages / Register - NiceAdmin Bootstrap Template</title>
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

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index" class="logo d-flex align-items-center w-auto">
                  <img src="resources/assets/img/icia.png" alt="">
                  <span class="d-none d-lg-block">ICIA</span>
                </a>
              </div><!-- End Logo -->





              <div class="card mb-12"><!-- Start 회원가입 form -->

			<div class="card-body">
              <h5 class="card-title">ICIA 회원가입</h5>

              <!-- General Form Elements -->
              <form action="mJoin" method="POST" name="joinForm" enctype="multipart/form-data">
                
                <div class="row mb-3">
                  <label for="memId" class="col-sm-2 col-form-label">아이디</label>
                  <div class="col-sm-10">
                    <input type="text" name="memId" class="form-control" id="memId" onkeyup="checkId()"/>
                    <span id="check1"></span>
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
                  <label for="memName" class="col-sm-2 col-form-label">이름</label>
                  <div class="col-sm-10">
                    <input type="text" name="memName" class="form-control" id="memName">
                  </div>
                </div>
                
                <div class="row mb-3">
                  <label for="memBirth" class="col-sm-2 col-form-label">생년월일</label>
                  <div class="col-sm-10">
                    <input type="date" name="memBirth" class="form-control" id="memBirth">
                  </div>
                </div>
                
                
                <fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0">성별</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="memGender" id="memGender" value="남" checked>
                      <label class="form-check-label" for="memGender">
                        남성
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="memGender" id="memGender" value="여">
                      <label class="form-check-label" for="memGender">
                        여성
                      </label>
                    </div>
                    
                  </div>
                </fieldset>
                
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
                  <label for="memProfile" class="col-sm-2 col-form-label">프로필 사진</label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" name="memProfile" id="memProfile">
                  </div>
                </div>
                
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <input type="button" class="form-control" onclick="checkConfirm()" value="가입" />
                  </div>
                </div>

              </form><!-- End 회원가입 Form Elements -->
                
              </div>

              

            </div>
          </div>
        </div>
		</div>
      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <!-- Template Main JS File -->
  

</body>

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script>
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

// 아이디 중복 체크
function checkId(){
	let memId = document.getElementById("memId").value;
	// location.href = "idCheck?memId=" + memId;
	
	let check1 = document.getElementById("check1");
	
	$.ajax({
		type : "POST",
		url : "idoverlap",
		data : {
			"memId" : memId
		}, 
		dataType : "text", 
		success : function(result){
			if(result=="OK"){
				// 사용할 수 있는 아이디일 경우 실행
				check1.innerHTML = memId + "는 사용가능한 아이디";
				check1.style.color = "#0000ff";
			} else {
				// 사용할 수 없는 아이디일 경우 실행
				check1.innerHTML = memId + "는 이미 사용중인 아이디";
				check1.style.color = "#ff0000";
			}
		},
		error : function(){
			alert("idoverlap함수 통신실패!");
		}
	});
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
	
	//let boolUUID = false;
	
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
	if(!pwRegexp() || !pwCheck()){
		alert('비밀번호를 확인해주세요!.');
	} else if(!checkEmail2Bool){
		alert('이메일 인증을 진행해주세요.');
	} else {
		joinForm.submit();
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