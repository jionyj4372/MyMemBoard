<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ICIA 커뮤니티 게시글</title>
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
      <h1>ICIA 커뮤니티 게시글</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">ICIA Home</a></li>
          <li class="breadcrumb-item">커뮤니티</li>
          <li class="breadcrumb-item active">${view.boTitle}</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">ICIA 커뮤니티 게시글</h5>

              	<!-- 게시글 상세보기 -->
              	<div class="row mb-3">
                  <label for="boNum" class="col-sm-2 col-form-label">게시글 번호</label>
                  <div class="col-sm-10">${view.boNum}
                  </div>
                </div>
              	
              	<hr/>
              	
                <div class="row mb-3">
                  <label for="boWriter" class="col-sm-2 col-form-label">작성자</label>
                  <div class="col-sm-10">${view.boWriter}
                  </div>
                </div>
                
                <hr/>
                
                <div class="row mb-3">
                  <label for="boTitle" class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">${view.boTitle}
                  </div>
                </div>
                
                <hr/>
                
                <div class="row mb-3">
                  <label for="boContent" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">${view.boContent}
                  </div>
                </div>
                
                <hr/>
                
                <div class="row mb-3">
                  <label for="boDate" class="col-sm-2 col-form-label">작성일</label>
                  <div class="col-sm-10">${view.boDate}
                  </div>
                </div>
                
                <hr/>
                
                <div class="row mb-3">
                  <label for="boHit" class="col-sm-2 col-form-label">조회수</label>
                  <div class="col-sm-10">${view.boHit}
                  </div>
                </div>
                
                <hr/>
                
                <div class="row mb-3">
                  <label for="boFile" class="col-sm-2 col-form-label">게시물 파일</label>
                  <div class="col-sm-10"><img src="resources/fileUpload/${view.boFileName}" width="200px"/>
                  </div>
                </div>
                
                
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    
                    <c:if test="${loginId eq view.boWriter || loginId eq 'admin'}">
						
						<input type="button" class="btn btn-primary" value="수정" 
							onclick="location.href='bModifyForm?boNum=${view.boNum}'"/>
				
						<input type="button" class="btn btn-primary" value="삭제" 
							onclick="location.href='bDelete?boNum=${view.boNum}'"/>
					</c:if>
                    
                  </div>
                </div>
                
                <hr/>
				
				<div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
					
					<input type="hidden" value="${view.boNum}" id="cbNum"/>
					<input type="hidden" value="${loginId}" id="cmtWriter"/>
					<textArea rows="2" cols="50" id="cmtContent" class="form-control"
							onclick="checkLogin()"></textArea>
					<button onclick="cmtWrite()" class="btn btn-primary">댓글 작성</button>
					
				  </div>
				  
				  <div id="cmtArea"></div>
				  
                </div>
				
              <!-- End General Form Elements -->

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

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
</script>

<script>
//댓글 입력시 로그인 여부확인 함수
function checkLogin(){
	
	if(${loginId eq null}){
		//$("#cmtContent").blur();
		alert('로그인 후 사용해 주세요.');
		location.href = "pages-login";
	}
}

let cbNum = ${view.boNum};

$.ajax({
	type : "GET",
	url : "comment/commentList",
	data : {
		"cbNum" : cbNum
	},
	dataType : "json",
	success : function(list){
		commentList(list);
	},
	error : function(){
		alert("댓글 불러오기 통신 실패 ㅠㅠ");
	}
});

//댓글 불러오기 함수
function commentList(list){
	let output = "";
	
	output += "<div class='card'>";
	output += "<div class='card-body'>";
	output += "<h5 class='card-title'>댓글 목록</h5>";
	
	output += "<table class='table'>";
	
	output += "<thead>";
	output += "<tr>";
	output += "<th scope='col'>#</th>";
	output += "<th scope='col'>작성자</th>";
	output += "<th scope='col'>내용</th>";
	output += "<th scope='col'>작성일</th>";
	output += "<th scope='col'>삭제</th>";
	output += "<th scope='col'>수정</th>";
	output += "</tr>";
	output += "</thead>";
	
	output += "<tbody>";
	for(let i in list){
		output += "<tr>";
		output += "<th scope='row'>"+(parseInt(i)+1)+"</th>";
		
		output += "<td>"+ list[i].cmtWriter +"</td>";
		output += "<td><span id='cmtModiContent"+list[i].cmtNum+"'>"
						+ list[i].cmtContent +"</span></td>";
		output += "<td>"+ list[i].cmtDate +"</td>";
		
		if('${loginId}' == list[i].cmtWriter || '${loginId}' == 'admin') {
			output += "<td><button onclick='cmtCon("
				+ list[i].cmtNum +", "+ list[i].cbNum 
				+")'>수정</button></td>";
			output += "<td><button onclick='cmtDelete("
					+ list[i].cmtNum +", "+ list[i].cbNum 
					+")'>삭제</button></td>";
		} else{
			output += "<td></td><td></td>"
		}
		
		output += "</tr>";
	}
	output += "</tbody>";
	output += "</table>";
	output += "</div>";
	output += "</div>";
	
	document.getElementById("cmtArea").innerHTML = output;
}


//댓글 작성 함수
function cmtWrite(){
	let cmtWriter = document.getElementById("cmtWriter").value;
	let cmtContent = $("#cmtContent").val();	// 위와 같은 사용법
	let cbNum = $("#cbNum").val();
	
	/* console.log("cmtWriter : "+cmtWriter);
	console.log("cmtContent : "+cmtContent);
	console.log("cbNum : "+cbNum); */
	
	let yesNo = confirm('댓글을 작성 하시겠습니까?');
	
	if(yesNo){
		$.ajax({
			type : "POST",
			url : "comment/cmtWrite",
			data : {
				"cbNum" : cbNum,
				"cmtWriter" : cmtWriter,
				"cmtContent" : cmtContent
			},
			dataType : "json",
			success : function(list) {
				commentList(list);
				$("#cmtContent").val("");
			},
			error : function() {
				alert('댓글 작성 통신 실패ㅜㅠ');
			}
		});
	} else{
		alert('댓글 작성이 취소되었습니다.');
	}
	
}

//댓글 삭제 함수
function cmtDelete(cmtNum, cbNum){
	//console.log("cmtNum : "+cmtNum+", cbNum : "+cbNum);
	
	$.ajax({
		type : "POST",
		url : "comment/cmtDelete",
		data : {
			"cbNum" : cbNum,
			"cmtNum" : cmtNum
		},
		dataType : "json",
		success : function(list){
			commentList(list);
		},
		error : function(){
			alert("댓글 삭제 통신 실패 ㅠㅠ");
		}
	});
}

//수정 버튼을 눌렀을 때
function cmtCon(cmtNum, cbNum){
	$("#cmtModiContent"+cmtNum).html("<input type='text' id='cContent'/>"
		+ " <input type='button' value='확인' onclick='cmtModify("
		+ cmtNum +", "+ cbNum +")'/>");
}


// 수정댓글 내용 작성 후 확인버튼 눌렀을 때 함수
function cmtModify(cmtNum, cbNum){
	
	let cmtContent = $("#cContent").val();
	
	$.ajax({
		type : "POST",
		url : "comment/cmtModify",
		data : {
			"cbNum" : cbNum,
			"cmtNum" : cmtNum,
			"cmtContent" : cmtContent
		},
		dataType : "json",
		success : function(list){
			commentList(list);
		},
		error : function(){
			alert("댓글 수정 통신 실패 ㅠㅠ");
		}
	});
}


</script>





</html>