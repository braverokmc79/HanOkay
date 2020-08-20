<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.ana.domain.UserVO"%>
<!-- 세션에 user라는 키로 저장된 userVO 인스턴스를 가져온다 -->
<%
		UserVO user = (UserVO) session.getAttribute("user");
		String userLastName = "";
		String userFstName = "";
		String userPriv="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userLastName = user.getUserLastName();
			userFstName = user.getUserFstName();
			userPriv = user.getUserPriv();
			
		}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Han:ok- Make yourself at home in Korea</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
	<style>
		html,body{
			font-family:Verdana, sans-serif;
			background-color:white;
		}
		
		#logo{
			width:50px;
			height:20px;
		}
		
		.active{   
		  border-bottom: 5px solid #775062; 
		}
		
		.panel-heading {
			color: white !important;
			background-color: #775062 !important;
			border-radius: 0px !important;
			border-color: #ddd;
		}
	</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-top:20px;margin-bottom:0;background-color:white;">

            <div class="navbar-header" style="margin-bottom:15px;">
                
				<!-- 로고자리 -->
                <a class="navbar-brand" href="/admin/adminindex">Han:Ok for Admin</a>
            </div>
            <!-- /.navbar-header -->

			<!-- 왼쪽 nav -->
            <ul class="nav navbar-top-links navbar-left">
				<li class="nav-menu">
					<a href="/admin/adminlistings">숙소관리</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/userStat">회원관리</a>
				</li>
				<li class="nav-menu">
					<a href="#" >메시지</a>
				</li>
				<li class="nav-menu">
					<a href="/admin/stats/mapChart" class="active">매출관리</a>
				</li>
				
			</ul>
			
			
			<!-- 오른쪽 nav -->
            <ul class="nav navbar-top-links navbar-right">
           		<li class="nav-menu">
					<a href='/acm/list'>메인으로</a>
				</li>
				<li class="nav-menu">
					<a href='/hosting/listings'>호스트 모드 보기</a>
				</li>
				
					
            </ul>
        </nav>
        </div>

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	 $(document).ready(function() {
		  var user='<%=user%>';
		   if(user==null){
			   alert("회원만 접근할 수 있습니다");
			   location.href="/acm/list";
		   }
		   
		   
		  var priv ='<%=userPriv%>';
	      if(priv!="ADMIN"){
	    	  alert("관리자만 접속할수 있습니다");
	    	  location.href="/acm/list";
	      } 
	 });
</script>


	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<!-- 사업자 등록도 받을것 -->

			<ul class="nav" id="side-menu">
				<li>
					<a href="/admin/stats/statsChart"><i class="fa fa-camera fa-fw"></i> 한눈에 보기</a>
				</li>
				<li>
					<a href="/admin/stats/statsRank"><i class="fa fa-arrow-circle-up"></i> 숙소 랭킹</a>
				</li>
				<li>
					<a href="/admin/stats/stats"><i class="fa fa-krw fa-fw"></i> 매출 </a>
				</li>
				
			</ul>

		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
	<!-- nav-end -->
	<div id="page-wrapper" style="padding-bottom:50px;margin-left: 0px;">
		<div class=" containerMR">
			<br>
			<div style="margin-left:15%;margin-right:15%;">

				<!-- <div class="tab">
					<button class="tablinks active" onclick="openCity(event, 'London')">숙소별</button>
					<button class="tablinks" onclick="openCity(event, 'Paris')">숙소순위</button>
					<button class="tablinks" onclick="openCity(event, 'Tokyo')">기타</button>
				</div> -->
				<h3>상세매출</h3>
				<div id="optChoice">
					
					<label>숙소설정</label>
					<select id="acmList">
						<option value="all">전체보기</option>
					</select>
					<span class="form-label">기간설정</span>	<input type="text" placeholder="Start" id="in" name="in" value="${in}" onchange="">
					<input type = 'hidden' id = 'start'>
					<input type = 'hidden' id = 'end'>
					<button class="btn right" onclick="sendoption()">확인</button>
					
				</div>
				<div class = "containBody" style="  width: 120%;">
					<table class="table table-striped table-bordered table-hover salesList ">
						<thead>
							<tr class='fixed_top'>
								<th class='col1'>숙소이름</th>
								<th class='col2'>예약번호</th>
								<th class='col3'>결제수단</th>
								<th class='col3'>결제일</th>
								<th class='col4'>1박가격</th>
								<th class='col4'>숙박일수</th>
								<th class='col5'>부가세</th>
								<th class='col6'>쿠폰</th>
								<th class='col7'>마일리지</th>
								<th class='col8'>할인</th>
								<th class='col9'>결제가격</th>
							</tr>
						</thead>
					</table>
					<div class="tableArea" id="acm">
						<table class="table table-striped table-bordered table-hover salesList" id="salesList">

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../../includes/footer.jsp"%>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	sendoption();
	
	
	
var strAcmList = "";
<c:forEach items="${acmList }" var="acmList">
strAcmList +=("<option  value= '<c:out value="${acmList.acmNum }" />'><c:out value="${acmList.acmName }" /></option>");
</c:forEach>
$("#acmList").append(strAcmList);
$("#acmList").change(function () {
	sendoption();
})
})
function sendoption(){      
	
	var option = {
			acmNum   : $('#acmList').val(),
			start   : $('#start').val(),
			end   : $('#end').val(),
	}
	
	 $.ajax({
  	   type: 'POST',
  	   url: '/hosting/stats/chage1',
  	   dataType: 'json',
  	   data:option,
  	   success: function(result){
  		   updateList(result);
  	   },
  	   error: function(){
  		   console.log("실패...");
  	   }
  	 });
}
function updateList(result) {
	$("#salesList").empty();
	var updateListstr = "";
	
	
	$(result).each(function (i,obj) {
		
		updateListstr +=("<tr><td class= 'col1'>"+obj.acmName+"</td>");
		updateListstr +=("<td class= 'col2'>"+obj.bookNum+"</td>");
		
		var paymathod = ""
		if(obj.payMethod==	'PY_METHOD_CARD'){
			paymathod = "카드";		}
		else if(obj.payMethod==	'PY_METHOD_LATER'){
			paymathod = "현장";		}
		else if(obj.payMethod==	'PY_METHOD_PAYPAL'){
			paymathod = "페이팔";		}
		
		var time = obj.payTime;
		var date = new Date(time)
		var fdate = date.getFullYear() + '/' + ("0" + (date.getMonth() + 1)).slice(-2) + '/' + ("0" + date.getDate()).slice(-2);
		
		updateListstr +=("<td class= 'col3'>"+paymathod+"</td>");
		updateListstr +=("<td class= 'col4'>"+fdate+"</td>");
		updateListstr +=("<td class= 'col5'>"+numeral(obj.price).format('0,0')+"</td>");
		updateListstr +=("<td class= 'col3'>"+obj.staydays+"</td>");
		updateListstr +=("<td class= 'col6'>"+numeral(obj.vat).format('0,0')+"</td>");
		updateListstr +=("<td class= 'col7'>"+numeral(obj.coupon).format('0,0')+"</td>");
		updateListstr +=("<td class= 'col8'>"+numeral(obj.mileage).format('0,0')+"</td>");
		updateListstr +=("<td class= 'col9'>"+numeral(obj.discount).format('0,0')+"</td>");
		updateListstr +=("<td class= 'col9'>"+numeral(obj.total).format('0,0')+"</td>");
	});
	
	$("#salesList").append(updateListstr);
}
// 날짜 선택
var today = new Date();
$("#in").daterangepicker({
    "showDropdowns": true,
    "startDate":  new Date(today.getFullYear()-1, today.getMonth(), today.getDate()), 
    "endDate":  new Date(today.getFullYear(), today.getMonth(), today.getDate()), 
    "maxDate": new Date(today.getFullYear(), today.getMonth(), today.getDate()), 
}, function(start, end, label) {
	$('#start').val(start.format('YYYY-MM-DD'));
	$('#end').val(end.format('YYYY-MM-DD'));
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
</script>
