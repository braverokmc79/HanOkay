<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String location = (String) session.getAttribute("location");
%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<head>

<link href="${request.contextPath}/resources/css/t-datepicker-blue.css" rel="stylesheet" type="text/css">

<style>
.wishModals{
    width: 100% !important;
}
#modalCloseBtn{
margin-right: 127px;
}
input:invalid {
  border-color: red;
}
/* 요금 검색  */
#slider-range{
    margin-bottom: 20px;
}
.priceModalDiv{
margin: 0 0 15px;
}
#priceModal{
display: none;
    overflow: hidden;
}
/* .modal-content{
    
    height: 150px;
} */
/* 요금검색 끝 */
.map_section>div>div>div>div:nth-child(3)>div:last-child>div>div {
	visibility: visible !important;
	
}
.modal-content1 {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 100% display: flex;
	flex-direction: column;
	pointer-events: auto;
}
.modal-content2 {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}
.modal {
	z-index: 12000;
}
/* 확대/축소 등 구글 지도의 기본 UI 감추기 
.gmnoprint, .gm-control-active.gm-fullscreen-control {
	display: none;
}*/
.modal-content1{
    border-radius: 12px !important;
}
.modal-body{
	height: 120px;
}
.modal-footer{
  
}
.h1Name{
		font-size: 14px;
    font-weight: 800;
    padding-top: 5px;
    text-align: center !important;
    margin: 0 auto;
    padding-left: 20px;
}
.closeBtn{
        float: right;
    font-size: 1.5rem;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: .5;
        padding: 0;
    background: 0 0;
    border: 0;
}
.move{
background-color: red;
}
.resultModal{
    -webkit-box-align: center !important;
    padding: 30px 20px 80px 20px !important;
    position: fixed !important;
        top: 10%;
    right: 25%;
    bottom: 10%;
    left: 25%;
    border-radius: 20px;
}
.filterText{
   
    position: relative;
    margin: 0 auto;
    -webkit-box-pack: center !important;
    padding-top: 24px !important;
    /* padding-bottom: 16px !important; */
    padding-left: 24px !important;
    padding-right: 24px !important;
    color: rgb(34, 34, 34) !important;
    font-size: 18px !important;
    line-height: 24px !important;
    font-weight: 600 !important;
    display: flex !important;
    /* justify-content: center !important; */
    flex-shrink: 0 !important;
}
.filterText>h1{
    font-size: 22px;
    margin-bottom: 13px;
}
/* .filterText>.close{
    border: 1px solid red;
    position: absolute;
    top: 20p;
    left: -360px;
    top: 0px;
} */
/* The Modal (background) */
.priceModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
.resultModal>form{
padding-top: 8px !important;
    padding-bottom: 8px !important;
    padding-left: 48px !important;
    padding-right: 48px !important;
    height: 100% !important;
    width: 100%;
    overflow: auto !important;
    border-top: 1px solid rgb(235, 235, 235);
}
.checkDiv{
	
	display: flex !important;
    flex-direction: row !important;
    flex-wrap: wrap !important;
    width: 100% !important;
    padding-top: 28px !important;
    padding-bottom: 28px !important;
    border-bottom: 1px solid rgb(235, 235, 235) !important;
}
.checkTitle{
	
}
.checkTitle>p{
color: inherit !important;
    font-size: 21px;
    font-weight: 800;
    line-height: inherit !important;
    margin-bottom: 10px;
   
}
.checkSub{
	-webkit-box-direction: normal !important;
    -webkit-box-orient: horizontal !important;
    display: flex !important;
    flex-direction: row !important;
    flex-wrap: wrap !important;
    width: 100% !important;
}
.checkSub>.container{
     display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    /* cursor: pointer; */
    font-size: 15px;
    line-height: 26px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.checkSub> .container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
      cursor: pointer;
    border-radius: 3px;
    border: 1px solid #ccc;
  
}
/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}
/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #61dafb;
    border: 1px solid transparent;
}
/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}
/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}
/* Style the checkmark/indicator */
.container .checkmark:after {
     left: 8px;
    top: 4px;
    width: 9px;
    height: 14px;
    border: solid white;
    /* border-radius: 12px; */
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
.checkSub>label{
    flex-basis: 50%;
}
.labelLast{
    flex-basis: 100% !important;
}
.btn-sky{
    float: left;
    padding: 12px;
    border: 0;
    background-color: #61dafb;
    border-radius: 10px;
    color: #fff;
        cursor: pointer;
    font-weight: 600;
    
    margin-right: 9px;
}
.btnDiv{
   
    left: 50%;
       margin-left: -219px;
position: fixed;
    bottom: 114px;
    width: 100%;
 
}
.btn-filter{
    float: left;
    padding: 12px;
    border: 0;
  
    border-radius: 10px;
    color: #fff;
    cursor: pointer;
    font-weight: 600;
}
/*가격 슬라이더 시작*/
.price-slider {
    
    width: 300px;
}
/*
input, label {
    font-family: fantasy !important;
  }*/
.btn-pink{
	        width: 127px;
	        margin-right: 16px;
    background-color: #f9b6bb;
	    
}
.btn-sky{
margin-right: 16px;
width: 127px;
background-color: #a7e0f4;
}
.btn-gray{
    width: 127px;
background-color: #ccc;
}
  .custom-slider {
    height: 5px !important;
  }
  .custom-handle {
    background: #fff !important;
    border-color: #54a0c1 !important;
    border-radius: 10px;
    height: 20px !important;
    width: 20px !important;
    top: -0.6em !important;
    box-shadow: 0px 0px 3px #3c6d59;
  }
  .custom-range {
    background: #54a0c1;
  }
  button.apply {
    margin-top: 2rem;
  }
  
  
  .formLayout1{
      padding: 10px 10px !important;
  }
  
  
   .formLayout1:nth-child(1){
         padding-left: 83px !important;
  }
  
    .formLayout1:nth-child(4){
         padding-right: 41px !important;
  }
  
  .formLayout5{
      padding-right: 41px !important;
  }
  
  

  .top-bar{
  box-shadow: 0 4px 10px 0 #bec2c9;
  }
  
  
  
/*가격 슬라이더 끝*/
</style>
<!-- 가격 슬라이더 시작-->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 가격 슬라이더 끝-->
<link rel="stylesheet" type="text/css"
	href="${request.contextPath}/resources/css/result.css">
	
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Booking Form HTML Template</title>


</head>

<body class="body">


	<div id="wrap">
		<div class="container1 container2">
			<section class="search_section search2">
				<div class="row1">
					<div class="booking-container">
						<form class="booking-form1" action="/acm/result" method='get'
							onsubmit="return checkValidation()">
							<div class="result-container">
								<div>
									<div class="no-margin1">
										<div class="formLayout1">
											<div class="form-group1">
												<div id="pac-container">
													<span>Location</span> <input class="form-control2"
														id="pac-input" type="text" name="keyword"
														value='<c:out value="${pageMaker.cri.keyword}"/>'
														placeholder="Enter a location">
												</div>
												<input type="hidden" value="A" id="type" name="type">


											</div>

										</div>

										<div class="formLayout1">
											<div class="form-group1">
												<span>Check In</span>
												<div class="ui calendar" id="rangestart">
													<div class="ui input left icon width400">
														<i class="calendar icon"></i> <input type="text"
															placeholder="Start" id="in" name="in"
															value="<c:out value="${pageMaker.cri.in}"/>">
													</div>
												</div>
											</div>
										</div>

										<div class="formLayout1">
											<div class="form-group1">
												<span>Check out</span>
												<div class="ui calendar" id="rangeend">
													<div class="ui input left icon width400">
														<i class="calendar icon"></i> <input type="text"
															placeholder="End" id="out" name="out"
															value="<c:out value="${pageMaker.cri.out}"/>">
													</div>
												</div>
											</div>
										</div>
										<div class="formLayout1">
											<div class="form-group1">
												<span>Guests</span> <select class="form-control1"
													id="person" name="person">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
												</select> <span class="select-arrow"></span>
											</div>
										</div>

									</div>
								</div>
								<div class="formLayout5">
									<div class="form-btn1">

										<button
											class="submit-btn btn btn-primary btn btn-search text-uppercase"
											id="submitBtn" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- end of row -->


			</section>
		</div>
		<!-- end container -->

		<div class="container-1">

			<!-- start : gallery_section -->
			<section class="gallery_section">

				<!-- start : main_text -->
				<div class="main_text">
					<p>${pageMaker.total} 개의 숙소</p>
					<h1 class="banner-title">${pageMaker.cri.keyword} 의 숙소</h1>
					<ul>
					
						<li><input type="button" id="priceBtn" name="filterAjax"
							value="요금"></li>
					
						<li><input type="button" id="myBtn" name="filterAjax"
							value="필터 추가하기"></li>
					</ul>
					
					<p class="toyou"><span class="alarm"></span>고객님만을 위해 엄선한 숙소 목록입니다. <span class="letgo"> 여기 이 숙소는 어떠신가요? 지금 확인해 보세요!</span></p>
					
				</div>
				<!-- end : main_text -->

				<div id="priceModal" >
					<div class="modal-content priceModalDiv">
    					<!-- <span class="closePrice">&times;</span> -->
    					<form method="GET" action="/acm/result">
							    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'><input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
							    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
							    <input type='hidden' name='person' value='<c:out value="${pageMaker.cri.person}"/>'>
							    <input type='hidden' name='in' value='<c:out value="${pageMaker.cri.in}"/>'>
							    <input type='hidden' name='out' value='<c:out value="${pageMaker.cri.out}"/>'>
    							<input type='hidden' name='acmOpt' value='<c:out value="${pageMaker.cri.acmOpt}"/>'>
  
						<div class="price-slider">
    						<p>
					    	 <label for="amount">Price range:</label>
					    	 <input type="text" id="amount" readonly style="border:0;">
					   		</p>

					    	<div id="slider-range" class="custom-slider" name="filterAjax"></div>
					    	<input type='hidden' id='min' name='minPrice' >
					    	<input type='hidden' id='max' name='maxPrice' >
					    	<!--  <button class="apply" onclick="getSliderValues()">apply</button>-->
					    	<input id="priceTotal" class="btn-sky" type="submit" value="개의 숙소보기" />
					    <!-- 	<input id="priceTotal" class="btn-sky closePrice" type="submit" value="close" /> -->
					    	<button type="button" class="closePrice btn-filter btn-gray" >close</button>
			    	   </div>
			    	   </form>
			       </div>
			   </div>

				<!-- 필터버튼 추가 -->
				<!-- The Modal -->
				<div id="filterModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content resultModal">
					
					<div class="modal-header filterText">
						<h1 class="h1Name">당신의 필터를 골라주세요</h1>
						

					</div>
							<form method="GET" action="/acm/result">
							    <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'><input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
							    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
							    <input type='hidden' name='person' value='<c:out value="${pageMaker.cri.person}"/>'>
							    <input type='hidden' name='in' value='<c:out value="${pageMaker.cri.in}"/>'>
							    <input type='hidden' name='out' value='<c:out value="${pageMaker.cri.out}"/>'>
							    <input type='hidden' name='minPrice' value='<c:out value="${pageMaker.cri.minPrice}"/>'>
								<input type='hidden' name='maxPrice' value='<c:out value="${pageMaker.cri.maxPrice}"/>'>
					
					<div class="checkDiv">	
						<div class="checkTitle">
							<p>편의시설</p>
						</div>
						
						<div class="checkSub">
							<label class="container">수영장
								<input class="checkbox" type="checkbox" name="filterAjax" value="1" /> 
								<span class="checkmark"></span>
							</label>
							
								<label class="container">주차장
								<input type="checkbox" name="filterAjax" value="2" />
								<span class="checkmark"></span>
							</label>
							<label class="container">공항 이동 교통편 서비스
								<input class="checkbox" type="checkbox" name="filterAjax" value="4" /> 
								<span class="checkmark"></span>
							</label>
							
								<label class="container">체육관/피트니스
								<input class="checkbox" type="checkbox" name="filterAjax" value="8" /> 
								<span class="checkmark"></span>
							</label>
								<label class="container">24시간 프런트 데스크
								<input class="checkbox" type="checkbox" name="filterAjax" value="16" /> 
								<span class="checkmark"></span>
							</label>
							<label class="container"> 가족/아동 여행객 친화형 시설
								<input class="checkbox" type="checkbox" name="filterAjax" value="32" /> 
								<span class="checkmark"></span>
							</label>
							<label class="container labelLast"> 금연
								<input class="checkbox" type="checkbox" name="filterAjax" value="64" /> 
								<span class="checkmark"></span>
							</label>
							
								
							
							
							
						</div>
					</div>
					
					<div class="checkDiv">	
						<div class="checkTitle">
							<p>시설</p>
						</div>
						
						<div class="checkSub">
						<label class="container">스파/사우나
								<input class="checkbox" type="checkbox" name="filterAjax" value="128" /> 
								<span class="checkmark"></span>
							</label>
							
								<label class="container">레스토랑
								<input class="checkbox" type="checkbox" name="filterAjax" value="256" /> 
								<span class="checkmark"></span>
							</label>
							
							<label class="container">흡연 구역
								<input class="checkbox" type="checkbox" name="filterAjax" value="512" /> 
								<span class="checkmark"></span>
							</label>
						
							<label class="container">반려동물 동반 가능
								<input class="checkbox" type="checkbox" name="filterAjax" value="1024" /> 
								<span class="checkmark"></span>
							</label>
						
								
						
						
						</div>
					</div>
					
					
					<div class="checkDiv">	
						<div class="checkTitle">
							<p>숙소이용규칙</p>
						</div>
						
						<div class="checkSub">
						<label class="container"> 장애인용 편의 시설/서비스
								<input class="checkbox" type="checkbox" name="filterAjax" value="2048" /> 
								<span class="checkmark"></span>
							</label>
							<label class="container"> 비즈니스 관련 편의 시설
								<input class="checkbox" type="checkbox" name="filterAjax" value="4096" /> 
								<span class="checkmark"></span>
							</label>
								
									
						
						</div>
					</div>
					
					<div class="checkDiv">	
						<div class="checkTitle">
							<p>서비스</p>
						</div>
						
						<div class="checkSub">
						
											
												<label class="container">인터넷
								<input class="checkbox" type="checkbox" name="filterAjax" value="8192" /> 
								<span class="checkmark"></span>
							</label>
												<label class="container">조식
								<input class="checkbox" type="checkbox" name="filterAjax" value="16384" /> 
								<span class="checkmark"></span>
							</label>
												<label class="container labelLast">석식
								<input class="checkbox" type="checkbox" name="filterAjax" value="32768" /> 
								<span class="checkmark"></span>
							</label>					
					
						</div>
					</div>
					
					
						
		
							    <div class="btnDiv">

							    <input id="total_sum" name="acmOpt" type="hidden" size="20" value='<c:out value="${pageMaker.cri.acmOpt}"/>' readonly /> 
							    <input id="total" class="btn-filter btn-sky" type="submit" value="개의 숙소보기" />

							  
							   <button type="button" id="reset" class="btn-filter btn-pink">reset</button>
							   <button type="button" class="close2 btn-filter btn-gray" >close</button>
							  
							<!--   <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->
							    
							    </div>
							   
							</form>
					</div>
				</div>
				<!-- 필터버튼 끝 -->


				<!-- start : gallery_list -->
				<div id="myTable" class="gallery_list">

					<div>
						<c:forEach items="${list}" var="acm">

							<div class='room room1 move'

								href='<c:out value="${acm.acmNum}"/>' style="cursor: pointer;">

								<input type="hidden" id="acmTest"
									value='<c:out value="${acm.acmNum}" />'>



								<div class="room-images">


									<a href="#">
										<figure>
											<img alt='객실사진'
												src='/display?fileName=<c:out value="${acm.acmPurl}" /><c:out value="${acm.acmPname}" />' />
										</figure>
									</a>
								</div>


								<div class="room-details">


									<h2 class="title">
										<a href="#"><c:out value="${acm.acmName}" /></a>
										</h1>
										<p class="address">
											<c:out value="${acm.acmCity }" />
											<c:out value="${acm.acmDistr }" />
											<c:out value="${acm.acmDetailaddr }" />
										</p>
										<p>
											<c:out value="${acm.acmDesc }" />
										</p>
										<div class="container-option" id="option">
											<label class="sub-title">OPTION</label>
											<div id='<c:out value="${acm.acmNum}" />'></div>
										</div>
										<!-- <div class="room-services">
											<div class="room-service-item">
												<i class="fa fa-wifi"></i>
											</div>
										</div>
										<div class="room-services">
											<div class="room-service-item">
												<i class="fa fa-bath"></i>
											</div>
										</div> -->
								</div>

								<div class="room-ect" value='<c:out value="${acm.acmNum}" />'>
									<button id="wishButton" class="wishButton" value='<c:out value="${acm.acmNum}" />'>
										<i></i>
									</button>
									<p>
										<span> ₩ ${acm.acmPrice} / 1박</span> 
									</p>
								</div>


								<input type="hidden" id="latitude"
									value='<c:out value="${acm.latitude }" />'> <input
									type="hidden" id="longitude"
									value='<c:out value="${acm.longitude }" />'>

							</div>
						</c:forEach>
					</div>
					<!-- 테이블 대신 -->


					<!-- end of myTable -->




					<div class='pull-right'>
						<ul class="pagination">


					
						

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} "><a
									href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
						</ul>
					</div>

					<form id='actionForm' action="/acm/result" method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'> <input
							type='hidden' name='type'
							value='<c:out value="${pageMaker.cri.type}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword}"/>'> <input
							type='hidden' name='person'
							value='<c:out value="${pageMaker.cri.person}"/>'> <input
							type='hidden' name='in'
							value='<c:out value="${pageMaker.cri.in}"/>'> <input
							type='hidden' name='out'
							value='<c:out value="${pageMaker.cri.out}"/>'>
							<input
							type='hidden' name='acmOpt'
							value='<c:out value="${pageMaker.cri.acmOpt}"/>'>
							<input
							type='hidden' name='minPrice'
							value='<c:out value="${pageMaker.cri.minPrice}"/>'>
							<input
							type='hidden' name='maxPrice'
							value='<c:out value="${pageMaker.cri.maxPrice}"/>'>
							
					</form>


				</div>

				<!-- <div class="pac-card" id="pac-card">
					<div>
						<div id="title">Autocomplete search</div>
						<div id="type-selector" class="pac-controls">
							<input type="radio" name="type" id="changetype-all"
								checked="checked"> <label for="changetype-all">All</label>
							<input type="radio" name="type" id="changetype-establishment">
							<label for="changetype-establishment">Establishments</label> <input
								type="radio" name="type" id="changetype-address"> <label
								for="changetype-address">Addresses</label> <input type="radio"
								name="type" id="changetype-geocode"> <label
								for="changetype-geocode">Geocodes</label>
						</div>
						<div id="strict-bounds-selector" class="pac-controls">
							<input type="checkbox" id="use-strict-bounds" value=""> <label
								for="use-strict-bounds">Strict Bounds</label>
						</div>
					</div>
					<div id="pac-container">
						<input id="pac-input" type="text" placeholder="Enter a location">
					</div>
				</div> -->

			</section>

			<section class="map_section" id="map">
				<div id="infowindow-content" class="container">
					<img src="" width="16" height="16" id="place-icon"> <span
						id="place-name" class="title"></span><br> <span
						id="place-address"></span>
				</div>
			</section>


		</div>

		<!-- wishList 모달창 -->

		<!-- Modal -->

		<div class="modal fade wishmodal" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content1">
					<div class="modal-header">
						<h1 class="h1Name">당신의 여행을 찜하세요</h1>
						<!-- <button type="button" class="closeBtn" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->

					</div>

					<div class="modal-body">				
						<div class="form-group info-group sr-only">
							<label>#유저번호</label> <input class="form-control" name='userNum'
								value='<%=userNum%>' readonly="readonly">
						</div>
						
						<div class="form-group info-group sr-only">
							<label>#숙소번호</label> <input class="form-control acmNum"  name='acmNum' readonly="readonly" > 					
 							<%-- <label>#숙소번호</label> <input class="form-control" name='acmNum' value='<c:out value="${acmNum}" />' readonly="readonly" >  --%>					
						</div>
						<div class="form-group info-group wishModals">
							<label>목록</label> 
							<!-- <input class="form-control" name='listTitle' value='' > -->
							<select class="form-control" name='listTitle' value=''>
							    <option value="분류없음" hidden>분류선택</option>
							    <option value="관광">관광</option>
							    <option value="휴식">휴식</option>
							    <option value="쇼핑">쇼핑</option>
							</select>
								
								
								

						</div>
						<div class="form-group info-group wishModals">
							<label>메모</label>
								 <input class="form-control" name='listContent' value=''/>
						</div>


					</div>
					<div class="modal-footer">
					
				
						<button id='modalRegisterBtn'
							class="btn btn-primary" type="submit">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
					
			
					</div>
					
					
					
				</div>

				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<!-- /.modal -->

	</div>
	<!-- end : wrap -->
</body>

<script>
/* var hidenBtn = document.getElementsByClassName("hidenBtn").value; */
</script>
<script src="https://kit.fontawesome.com/48e68a7030.js" crossorigin="anonymous"></script>

<script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
      function initMap() {
    	  var acmNum = "${acmNum}";
			//console.log(acmNum);
			var latitude =37.5703306;
			var longitude =126.9850353;
			if(document.getElementById("latitude")!=null){
				latitude = document.getElementById("latitude").value;
				longitude = document.getElementById("longitude").value;
			}
			var arrOpt = new Array();
			var acmNumArr = new Array();
			//숙소번호로 해당 위도,경도 값 가져옴
			let i=0;
			<c:forEach items="${list }" var="acm">
			
			if("${acm.acmNum}"===acmNum){
				latitude = ${acm.latitude};
				longitude = ${acm.longitude};
			}
			acmNumArr[i]='${acm.acmNum}';
			arrOpt[i]=${acm.acmOptcode};
				i++;
			</c:forEach>
			
			
			
			
			getAcmOpt2(arrOpt,acmNumArr);
			
			
			var latVal = parseFloat(latitude);
			var lngVal = parseFloat(longitude);
    	  	var mapLocation = {
  				lat : latVal,
  				lng : lngVal
  			};
    	  
        var map = new google.maps.Map(document.getElementById('map'), {
          center: mapLocation,
          zoom: 15
        });
        
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var types = document.getElementById('type-selector');
        var strictBounds = document.getElementById('strict-bounds-selector');
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);
        var autocomplete = new google.maps.places.Autocomplete(input);
        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);
        // Set the data fields to return when the user selects a place.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);
        var infoWindow = new google.maps.InfoWindow();
        /* var infowindowContent = document.getElementById('infowindow-content');
        infoWindow.setContent(infowindowContent); */
        
        var size_x = 70; // 마커로 사용할 이미지의 가로 크기
		var size_y = 30;
        var image = new google.maps.MarkerImage(
        		'${request.contextPath}/resources/img/marker5.png',
				null,
				null,
				null,
				new google.maps.Size(size_x, size_y));
        
        var markers = new Array(10); 
        let j=0;
        var contentString= new Array(10);
      
        var list = new Array();
        <c:forEach items="${list}" var="acm">
        list[j] = {
        		"acmName" : '${acm.acmName}',
        		"latitude" :${acm.latitude},
        		"longitude" :${acm.longitude},
        		"acmPrice" :${acm.acmPrice},
        		"contentString" :
        			'<a href="/acm/detail?pageNum=1&amount=10&type=A&keyword=&person=${pageMaker.cri.person}&in=${pageMaker.cri.in}&out=${pageMaker.cri.out}&acmNum=<c:out value="${acm.acmNum}"/>" >'
        		    +'<div  id="mira"' 
        			+"href='<c:out value="${acm.acmNum}"/>' style='text-align: center;  width: 120px; cursor: pointer;color: black;'>"+
					'<div style=" height: 90px;overflow: hidden;"><img src="/display?fileName=<c:out value="${acm.acmPurl}" />s/<c:out value="${acm.acmPname}" />" style = "width: 100%;"/></div>'
					+ '${acm.acmName}' + '</div></a>' ,
                 }
        j++;
        </c:forEach>
     
        
            
        
       
        
        for(let k=0;k<list.length;k++){
        var latLng = {lat:parseFloat(list[k].latitude), lng:parseFloat(list[k].longitude)};
		//var marker;
		markers[k] = new google.maps.Marker({
			position : latLng, // 마커가 위치할 위도와 경도(변수)
			map : map,
			label:{
					text: '￦' + list[k].acmPrice,
					color:'white',
				  },
			icon : image, // 마커로 사용할 이미지(변수)
			//title : list[k].acmName, // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
			num : j
		});
		
		 
		
		      
		markers[k].addListener('click', function(){
			//중심 위치를 클릭된 마커의 위치로 변경
            //map.setCenter(this.getPosition());

            //마커 클릭 시의 줌 변화
            map.setZoom(16);
			infoWindow.setContent(list[k].contentString);
			infoWindow.open(map,markers[k]);
			
		});
		
        }
        
        
    
        
        
      /*  
        var latLng = {lat:parseFloat(${acm.latitude}), lng:parseFloat(${acm.longitude})};
		//var marker;
		markers[j] = new google.maps.Marker({
			position : latLng, // 마커가 위치할 위도와 경도(변수)
			map : map,
			label:{
					text: '￦' + "20000",
					color:'white',
				  },
			icon : image, // 마커로 사용할 이미지(변수)
			title : "${acm.acmName}", // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
			num : j
		});
		
		/* var contentString2 =
			'<div style="width:200px;height:200px;"><a href="#" name="detail_go"><input type="hidden" value="'
			+'<br /><h4>' + markers[j].title + '</h4>' + '</div>';  */
		/*
		contentString[j] =	
					'<img src="/display?fileName=<c:out value="${acm.acmPurl}" />s/<c:out value="${acm.acmPname}" />" width="50" height="50"/>'
							+'<br /><h6>' + '${acm.acmName}' + '</h6>' ;
		      
		markers[j].addListener('click', function(){
			alert('${acm.acmName} clicked');
			alert('j:' + j);
			alert('contentString[j]:' + contentString[j-1]);
			infoWindow.setContent(contentString[j]);
			infoWindow.open(map,markers[j]);
			
		});
		j++; */
		
		/*
		var content = "${acm.acmName}" ; // 말풍선 안에 들어갈 내용
		// 마커를 클릭했을 때의 이벤트. 말풍선
		var infowindow = new google.maps.InfoWindow({
			content : content
		});
		google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map, marker);
		});
		*/
		//참고
		/* var image = new google.maps.MarkerImage(app.img()+'/booking/icon3.png',null,null,null,new google.maps.Size())
		var markers = new Array(data.list.length);
		var infoWindow = new google.maps.InfoWindow();
		$.each(data.list, function(i,item){
			var latlng={lat: parseFloat(item.latitude),lng:parseFloat(item.longitude)};
			markers[i] = new google.maps.Marker({
				position: latlng,
				map:map,
				label:{
					text: '\' + item.price,
					color:'white',
				},
				icon:image,
			});
			var contentString =
				'<div style="width:200px;height:200px;"><a href="#" name="detail_go"><input type="hidden" value="'
				+'<br /><h4>' + item.title + '</h4>' + '</div>';
			markers[i].addListener('click', function(){
				infoWindow.setContent(contentString);
				infoWindow.open(map,markers[i]);
			});
		}); */
		//참고 끝
		
       /*  var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        }); */
        
        /* autocomplete.addListener('place_changed', function() {
          infoWindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }
          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);
          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }
          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          infoWindow.open(map, marker);
        }); */
        
        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        /* function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        } 
        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);
        document.getElementById('use-strict-bounds')
            .addEventListener('click', function() {
              console.log('Checkbox clicked! New state=' + this.checked);
              autocomplete.setOptions({strictBounds: this.checked});
            });*/
      }
    </script>
<!--
                    아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
                    key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
                 -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCfPvjuhr6JlAFHlbwqn_I5VfzqglJ7iSo&libraries=places&callback=initMap"
	async defer></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$("#pac-input").keypress(function(e){
	if(event.keyCode == '13'){
		e.preventDefault();
		$('.t-date-check-in').trigger('click');
	}
});
//필터 모달창
$(function () { //=$(document).ready(function(){
var maxPriceRange= ${pageMaker.cri.maxPrice};
if(maxPriceRange>500000){
	maxPriceRange=500000;
}
	$( "#slider-range" ).slider({
	      range: true,
	      min: 0,
	      max: 500000,
	      step: 100,
	      classes: {
	        "ui-slider": "custom-slider",
	        "ui-slider-handle": "custom-handle",
	        "ui-slider-range": "custom-range"
	      },
	      values: [ ${pageMaker.cri.minPrice}, maxPriceRange ],
	      slide: function( event, ui ) {
	    	  
	        $( "#amount" ).val( "￦" + ui.values[ 0 ] + " - ￦" + ui.values[ 1 ] );
	        $('#min').val(ui.values[ 0 ]);
	    	$('#max').val(ui.values[ 1 ]);
	    	if($('#max').val()==500000){
	    		  $( "#amount" ).val( "￦" + ui.values[ 0 ] + " - ￦" + ui.values[ 1 ] +"+");
	    	}
	      }
	    });
	$('#min').val($( "#slider-range" ).slider( "values", 0));
	$('#max').val($( "#slider-range" ).slider( "values", 1));
	    
	if($('#max').val()==500000){
		$( "#amount" ).val( "￦" + $( "#slider-range" ).slider( "values", 0) +
                " - ￦" + $( "#slider-range" ).slider( "values", 1 ) +"+");
	  }else{
	    $( "#amount" ).val( "￦" + $( "#slider-range" ).slider( "values", 0) +
	                       " - ￦" + $( "#slider-range" ).slider( "values", 1 ) );	
	  }
	    $('#slider-range').on('mouseup', function(){ // 이벤트 
	    	var keyword = $("#pac-input").val();
	        var type = $("#type").val();
	        var cin = $("#in").val();
	        var out = $("#out").val();
	        var person = $("#person").val();
	        var acmOpt = $("#total_sum").val();
	        var minPrice = $("#min").val();
	        var maxPrice = $("#max").val();
	       
	       var allData = {
	    			"keyword": keyword, "type": type, "in": cin,
	    			"out": out, "person": person, "acmOpt": acmOpt, "minPrice": minPrice, "maxPrice": maxPrice
	    	 }
	       console.log("acmOpt: "+acmOpt);
	       console.log("minPrice: "+minPrice);
	       console.log("maxPrice: "+maxPrice);
	       console.log(allData);
	    	$.ajax({
	     	   type: 'POST',
	     	   url: '/acm/filter',
	     	   dataType: 'json',
	     	   data: allData,
	     	   //async: false,
	     	   success: function(data){
	     		   //console.log(data);
	     		  //chkbizused=document.getElementById("chkbizused");
	     		 
	     		   $('#priceTotal').val(data.total+"개의 숙소보기");
	     		
	 	    	/* if(chkbizused==null){//없으면 추가시켜주고
	     	    	formObj.append("<input type='hidden' id='chkbizused' name='chkbizused' value='"+data.msg2+"'>");
	     	    	
	 	    	} else chkbizused.value=data.msg2;//이미 있으면 바꿔치기 */
	     	   },
	     	   error: function(data){
	     		  window.location.href ="../error/error";
	     	   }
	     	 });
	    	
	    });
	    	
	    
	 // Get the modal
	    var priceModal = document.getElementById("priceModal");
	    
	   
	    // Get the button that opens the modal
	    var priceBtn = document.getElementById("priceBtn");
	    // Get the <span> element that closes the modal
	    var spanPrice = document.getElementsByClassName("closePrice")[0];
	    
	
	    // When the user clicks the button, open the modal
	    priceBtn.onclick = function () {
	    	priceModal.style.display = "block";
	  	
	    };
	    // When the user clicks on <span> (x), close the modal
	    spanPrice.onclick = function () {
	    	priceModal.style.display = "none";
	    };
	    
	   
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function (event) {
	      if (event.target == priceModal) {
	    	  priceModal.style.display = "none";
	      }
	    };
	$("#reset").click(function(){
		var chkbox = $('input[type="checkbox"]');
		for(let i=0; i<chkbox.length; i++){
				chkbox[i].checked = false;
		}
		$("#total_sum").val(0);
		
		var keyword = $("#pac-input").val();
	      var type = $("#type").val();
	      var cin = $("#in").val();
	      var out = $("#out").val();
	      var person = $("#person").val();
	      var acmOpt = $("#total_sum").val();
	      var minPrice = $("#min").val();
	      var maxPrice = $("#max").val();
	      
	      var allData = {
	  			"keyword": keyword, "type": type, "in": cin,
	  			"out": out, "person": person, "acmOpt": acmOpt, "minPrice": minPrice, "maxPrice": maxPrice
	  	 }
		
		$.ajax({
	    	   type: 'POST',
	    	   url: '/acm/filter',
	    	   dataType: 'json',
	    	   data: allData,
	    	   //async: false,
	    	   success: function(data){
	    		   //console.log(data);
	    		  //chkbizused=document.getElementById("chkbizused");
	    		 
	    		   $('#total').val(data.total+"개의 숙소보기");
	    		
		    	/* if(chkbizused==null){//없으면 추가시켜주고
	    	    	formObj.append("<input type='hidden' id='chkbizused' name='chkbizused' value='"+data.msg2+"'>");
	    	    	
		    	} else chkbizused.value=data.msg2;//이미 있으면 바꿔치기 */
	    	   },
	    	   error: function(data){
	    		  window.location.href ="../error/error";
	    	   }
	    	 });
		
		});
	
	
    $('input[name="filterAjax"]').click(function () {
      let sum = 0;
      $('input[name="filterAjax"]:checked').each(function (index, item) {
        sum += parseInt($(this).val());
      });
      
      $("#total_sum").val(sum);
      
      var keyword = $("#pac-input").val();
      var type = $("#type").val();
      var cin = $("#in").val();
      var out = $("#out").val();
      var person = $("#person").val();
      var acmOpt = $("#total_sum").val();
      var minPrice = $("#min").val();
      var maxPrice = $("#max").val();
      console.log("acmOpt: "+acmOpt);
     console.log("minPrice: "+minPrice);
     console.log("maxPrice: "+maxPrice);
      
      var allData = {
  			"keyword": keyword, "type": type, "in": cin,
  			"out": out, "person": person, "acmOpt": acmOpt, "minPrice": minPrice, "maxPrice": maxPrice
  	 }
      
      //console.log(allData);
      $.ajax({
    	   type: 'POST',
    	   url: '/acm/filter',
    	   dataType: 'json',
    	   data: allData,
    	   //async: false,
    	   success: function(data){
    		   //console.log(data);
    		  //chkbizused=document.getElementById("chkbizused");
    		 
    		   $('#total').val(data.total+"개의 숙소보기");
    		   $('#priceTotal').val(data.total+"개의 숙소보기");
    		
	    	/* if(chkbizused==null){//없으면 추가시켜주고
    	    	formObj.append("<input type='hidden' id='chkbizused' name='chkbizused' value='"+data.msg2+"'>");
    	    	
	    	} else chkbizused.value=data.msg2;//이미 있으면 바꿔치기 */
    	   },
    	   error: function(data){
    		  window.location.href ="../error/error";
    	   }
    	 });
    });
    getAcmOpt();
   
  });
function dec2bin(codeNum){
	return (codeNum >>> 0).toString(2); 
}
function pad(code) {
	return code.length >= 16? code : new Array(16 - code.length+1).join('0') + code;
}
function getAcmOpt() {
	let option;
	var acmOpt = $("#total_sum").val();
	
	option= pad(dec2bin(acmOpt));//10진수 옵션코드를 16자리 2진수로 변환한다(110101010..like this)
	
	var chkbox = $('input[type="checkbox"]');
	for(let i=0; i<option.length; i++){
		if(option.charAt(i) == 1){
			chkbox[15-i].checked = true;
		}
	}
}
//숙소 옵션
function getAcmOpt2(arrOpt,acmNumArr) {
	let iconArr = new Array(); 
	let codeArr = new Array(); 
	let nameArr = new Array();
	
	let acmOpt2 = new Array(arrOpt.length);
	let opt = new Array();
	for(let i=0;i<arrOpt.length;i++){
		//console.log(arrOpt[i]);
		acmOpt2[i] = pad(dec2bin(arrOpt[i]));
		//console.log("2:"+ acmOpt2[i]);
		opt[i]= document.getElementById(acmNumArr[i]);
		//console.log("3:"+opt[i]);
	}
	
	
	
	
	let j = 0;
	<c:forEach items="${acmCode}" var="acmCode">
		iconArr[j] = '<c:out value="${acmCode.codeIcon}" />';
		codeArr[j] = 'acm' + '<c:out value="${acmCode.codeFull}" />';
		nameArr[j] = '<c:out value="${acmCode.codeCont}" />';
		j++;
	</c:forEach>
	
	for(let h=0;h<acmOpt2.length;h++){
		for(let k=0; k<acmOpt2[h].length; k++){
			if(acmOpt2[h].charAt(acmOpt2[h].length-1-k) == 1){
				opt[h].innerHTML += '<span id="'+ codeArr[k] +'"><i class="fa '+iconArr[k]+'" aria-hidden="true">&nbsp</i>'+'</span>';
			}
		}
		opt[h].innerHTML += '<br>';
	}
}
  // Get the modal
  var filterModal = document.getElementById("filterModal");
  
  var body = document.getElementsByTagName("body");
  // Get the button that opens the modal
  var btn = document.getElementById("myBtn");
  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close2")[0];
  
  var base = $('.body');
  // When the user clicks the button, open the modal
  btn.onclick = function () {
	  filterModal.style.display = "block";
	
	  base.addClass('modal-open');
  };
  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
	  filterModal.style.display = "none";
	  base.removeClass('modal-open');
  };
  
  var modal = $(".modal");
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == filterModal) {
    	filterModal.style.display = "none";
    }
  };
//필터 모달 끝
    
		// 날짜 선택
		var today = new Date();
		$("#out").datepicker({
			minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()+1),
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()),
			numberOfMonths: 1,
			dateFormat: 'yy-mm-dd'
		});
		$("#in").datepicker({
			minDate: 0,
			maxDate: new Date(today.getFullYear()+1, today.getMonth(), today.getDate()-1),
			numberOfMonths: 1,
			dateFormat: 'yy-mm-dd',
			onSelect: function(selectedDate) {
				var nextDay = new Date(selectedDate);
				nextDay.setDate(nextDay.getDate() + 1);
			  $("#out").datepicker("option","minDate", nextDay);
				var nextMonth = new Date(selectedDate);
				nextMonth.setDate(nextMonth.getDate() + 90);
			  $("#out").datepicker("option","maxDate", nextMonth);
			  $("#out").datepicker("open");
			}
		});
		
	</script>



<script type="text/javascript">
		$("#person").val('<c:out value="${pageMaker.cri.person}"/>');
	
		$(document)
				.ready(
						function() {
							history.replaceState({}, null, null);
							var actionForm = $("#actionForm");
							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										//console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});
							 $(".move").on("click",function(e) {
												e.preventDefault();
												actionForm.append("<input type='hidden' name='acmNum' value='"
																+ $(this).attr("href")
																+ "'>");
												actionForm.attr("action","/acm/detail");
												actionForm.submit();
											}); 
							 
							 
		});
		
		
		
		
		
	</script>

<script type="text/javascript" src="/resources/js/wishlist.js"></script>
<script>
$(document).ready(function(){	
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■찜하면 하트에 불이 들어오게끔 하는 코드를 적용한다. ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	
	var wishBtn = $(".wishButton"); //배열 	
	var i = 0;
	
				
	<c:forEach items="${drawValue}" var="drawValue">		
		wishBtn[i].childNodes[1].setAttribute("class","<c:out value="${drawValue}" />");
		wishBtn[i].childNodes[1].setAttribute("id","heart");
		i++;		
	</c:forEach>
	
	
	
	
	/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/	
	
	
	var modal = $(".wishmodal");
	var modalRegisterBtn = $("#modalRegisterBtn");	
	var modalInputuserNum = modal.find("input[name='userNum']").val();		
	var modalInputacmNum = $("#acmTest").val();		
	//var modalInputlistTitle = modal.find("select[name='listTitle']").val();
	var modalInputlistTitle = $("select[name='listTitle']").val();
	var modalInputlistContent = modal.find("input[name='listContent']").val();
	
	
	//클로즈 버튼 클릭시 모달창을 숨긴다.
	$("#modalCloseBtn").on("click", function(e){	    	
	    	modal.modal('hide');      	      		      		
	});
	
	
	
/* 	찜버튼 클릭하면 이벤트 발생 (이때 class로 받아와야 for문이 된다,,,) */
	var btn = document.getElementsByClassName("wishButton");
	for(var i=0; i<btn.length; i++){btn[i].onclick=function(e){
		var modalInputuserNum = modal.find("input[name='userNum']").val();
		var modalInputacmNum = $("#acmTest").val();	
		
		var heartbtn = $(".fa-heart");
		var thisbtn = this;
		 e.stopImmediatePropagation();
		
		if($(this).length>0){
			var val1 = $(this).attr('value');
			//console.log("당신이 클릭한 숙소의 번호는 "+val1);					
			var acmNum = $(".acmNum");
			acmNum.val(val1);	
			
		}					
		if(modalInputuserNum == ""){								
 			alert("로그인이 필요합니다.")
 			}else{
 				
				alert("하트를 눌렀습니다!"); 																						
					if($(this).children(0).hasClass("fa-heart")==1){
						alert("이미 추가한 숙소입니다.");
											
						}else{
							/* alert("찜합니다."); */
							 $(this).children().attr('class','fa fa-heart fa-2x');  
							$(".wishmodal").modal("show"); 
		 					modal.addClass("show") ;
							
						}
 				}  									
			}		
	}
	
 
	/* btn의 자식인 i클래스의 .attr('class','fa fa-heart fa-2x');의 상태라면 */
			
	 modalRegisterBtn.on("click", function(e){	 	
		 
		var modal = $(".wishmodal");
		var modalRegisterBtn = $("#modalRegisterBtn");	
		var btn = document.getElementsByClassName("wishButton");
			
		var modalInputuserNum = modal.find("input[name='userNum']").val();
		var modalInputacmNum = modal.find("input[name='acmNum']").val();		
		var modalInputlistTitle = $("select[name='listTitle']").val();
		var modalInputlistContent = modal.find("input[name='listContent']").val();
		
	/* 	 $( '#wishButton' ).attr('class','fa fa-heart fa-2x'); */
	
		
		if(modalInputlistContent==""){
			
			/* 빈 값을 입력한다면, 리턴한다 */
			
			alert("비어있는 항목이 있습니다.");
			return;
		}
			
		
		 wishService.add({
			 userNum : modalInputuserNum, acmNum: modalInputacmNum, listTitle: modalInputlistTitle, listContent: modalInputlistContent 
		 }, function(result){
			 modal.modal('hide');		 
			
			 
			  if(result==("fail..")){
				 alert("이미 등록된 숙소입니다.")
			 }
		 }
		)
		 
		
		
	 });
})
</script>
<script type="text/javascript">
if(${pageMaker.total} == 0){
	$("#myTable").append("<h4><img src='../resources/img/crying.png' style='width:3em;margin: 1em;'> 조건에 맞는 숙소가 없습니다!</h4>	<hr style='border:2px solid #333333'> <h4>서울의 이런 숙소는 어떠세요?</h4>");
	<c:forEach items="${Nolist}" var="acm">
	var str = ""
str +='<div class="room room1 move"  href="<c:out value="${acm.acmNum}"/>" style="cursor: pointer;">	'	
	str +='<input type="hidden" id="acmTest"	value="<c:out value="${acm.acmNum}" />">'
		str +='<div class="room-images" style="height: 14em;" ><a href="#">'
		str +='<figure><img alt="객실사진"src="/display?fileName=<c:out value="${acm.acmPurl}" />s/<c:out value="${acm.acmPname}" />" /></figure></a></div>'
			str +='<div class="room-details"><h2 class="title"><a href="#"><c:out value="${acm.acmName}" /></a></h1>			'
			str +='<p class="address">'		
		str +='<c:out value="${acm.acmCity }" />'	
			str +='<c:out value="${acm.acmDistr }" />	'
			str +='<c:out value="${acm.acmDetailaddr }" /></p>	</div>	'
			str +='<input type="hidden" id="latitude"	value="<c:out value="${acm.latitude }" />">'	 
			str +='<input	type="hidden" id="longitude"value="<c:out value="${acm.longitude }" />"></div>	'										
													
	$("#myTable").append(str);													
	</c:forEach>
}
//Scroll-up
$(function(){
	$(window).on("scroll",function() {
	    if ($(this).scrollTop() > 100) {
	        $('.aside').fadeIn();
	    } else {
	        $('.aside').fadeOut();
	    }
	});
});
$(".aside").on("click",function(evt){
	$("html,body").stop().animate({
		scrollTop : 0
	},400);
	evt.preventDefault();
});
</script>



<%@include file="../includes/footer.jsp"%>



</html>