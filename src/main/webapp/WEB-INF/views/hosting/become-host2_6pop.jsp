<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
   .room {
      width: 350px;
   }

   .exp {
      font-size: 8px;
   }

   #image_container {
      border: 1px dotted blue;
   }
   
    input[type=checkbox] {
        display:none;
        margin:10px;
    }

    input[type=checkbox] + label {
        display:inline-block;
        margin:2px;
        padding: 4px 10px;
        background-color: #e7e7e7;
        border-color: #ddd;
        border-radius: 10px;
    }
    /*
     Change background color for label next to checked radio button
     to make it look like highlighted button
    */
    input[type=checkbox]:checked + label {
       background-image: none;
        background-color:cornflowerblue;
        color: white;
    }
        
	
</style>
<%@include file="../includes/becomehostheader.jsp"%>
<script type="text/javascript">
	
	//acmNum넘겨받는부분
	function _GET(search) {
	    var obj = {};
	    var uri = decodeURI(search);
	        uri = uri.slice(1,uri.length);
	
	    var param = uri.split('&');
	    
	    for (var i = 0; i < param.length; i++) {
	        var devide = param[i].split('=');
	        obj[devide[0]] = devide[1];
	    }
	
	    return obj;
	}
	
	window.onload = function () {
	    var search = window.location.search;
	    var getData =  _GET(search);
	    var acmNum = document.querySelector('#ACM_NUM'); //hidden된 acmNum을 읽는다4
	    acmNum.value=getData.acmNum.trim();
//	    acmNum.innerText=getData.acmNum;

	}
	
</script>
<body>
<div id="page-wrapper" style="padding-bottom:50px;">
   <input type="hidden" id="ACM_NUM" name="ACM_NUM" value="" readonly="readonly">
   <!-- 숙소 방 추가 모달로 띄우기-->
   <form action="/hosting/become-host2_6" method="get">
      <h4>6-2.개별객실(베드룸) 추가하기</h4>

     <!-- <div id="image_container" style="width:200px;height:200px;"></div>
      <input type="file" id="ROM_PURL" name="ROM_PURL" placeholder="객실 사진" onchange="setThumbnail(event);"> --> 

      <div class="room" id="room">
      	<label for="ROM_TYPE">객실 타입</label>
         <select name="ROM_TYPE" id="ROM_TYPE">
            <option value="싱글룸">싱글</option>
            <option value="더블룸">더블</option>
            <option value="프리미엄">프리미엄</option>
            <option value="도미토리">도미토리</option>
         </select><br>
        
         <input type="text" id="ROM_NAME" name="ROM_NAME" placeholder="객실 이름"><br>
		<label for="ROM_CAPA">객실 최대 인원수</label>
          <select name="ROM_CAPA" id="ROM_CAPA">
            <option value="1">1명</option>
            <option value="2">2명</option>
            <option value="3">3명</option>
            <option value="4">4명</option>
            <option value="5">5명</option>
            <option value="6">6명</option>
            <option value="7">7명</option>
            <option value="8">8명</option>
            <option value="9">9명</option>
            <option value="10">10명</option>
         </select><br>
         <label for="BED_TYPE">침대유형</label>
          <select name="BED_TYPE" id="BED_TYPE">
            <option value="온돌">온돌(이불)</option>
            <option value="싱글">싱글</option>
            <option value="퀸">퀸</option>
            <option value="킹">킹</option>
            <option value="2층침대">2층침대</option>
            
         </select><br>
         <label for="BED_CNT">침대갯수</label>
          <select name="BED_CNT" id="BED_CNT">
            <option value="0">온돌(이불)</option>
            <option value="1">1개</option>
            <option value="2">2개</option>
            <option value="3">3개</option>
            <option value="4">4개</option>
            <option value="5">5개</option>
         </select><br>
         
         <input type="text" id="ROM_SIZE" name="ROM_SIZE" placeholder="객실크기 m2" numberOnly><br>
         <input type="text" id="ROM_PRICE" name="ROM_PRICE" placeholder="객실가격" numberOnly><br>

      </div>
      <!-- 여기에 appendChild하고 싶닷 -->

      <h4>2-2.객실 옵션</h4>

      <!-- checkbox는 name값을 key값으로 갖기때문에 같게 두고, value값만 다르게 준다 -->
      <input type="checkbox" name="romOptcode" id="RM_OPT_ES" value="1"><label for="RM_OPT_ES">필수품목(수건,화장지, 이불, 씻는도구)</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_WF" value="2"><label for="RM_OPT_WF">무선인터넷</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_TV" value="4"><label for="RM_OPT_TV">tv</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_HT" value="8"><label for="RM_OPT_HT">난방/에어컨</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_IO" value="16"><label for="RM_OPT_IO">다림질 도구</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_HR" value="32"><label for="RM_OPT_HR">헤어드라이어</label><br>
      <input type="checkbox" name="romOptcode" id="RM_OPT_CP" value="64"><label for="RM_OPT_CP"> 커피/티메이커 </label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_WM" value="128"><label for="RM_OPT_WM"> 세탁기 </label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_DK" value="256"><label for="RM_OPT_DK">업무 가능한 공간/책상</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_DW" value="512"><label for="RM_OPT_DW">옷장/서랍장</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_WP" value="1024"><label for="RM_OPT_WP">반려동물 동반 가능</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_BT" value="2048"><label for="RM_OPT_BT">욕조</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_RG" value="4096"><label for="RM_OPT_RG">냉장고</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_BC" value="8192"><label for="RM_OPT_BC">발코니/테라스</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_SM" value="16384"><label for="RM_OPT_SM">흡연</label>
      <input type="checkbox" name="romOptcode" id="RM_OPT_KC" value="32768"><label for="RM_OPT_KC">개별주방</label>


      <br>
      <button type="button" onclick="if(readyForreg()){romRegit()}">등록하기</button>
   </form>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	var chkArr = []; //배열 초기화
	var romOptcode=0;


	function readyForreg() {
		
		var roomNotNull = $(".room input");
		var flag = true;
		 chkArr = [];
		$(".room input").each(function () {
			val = $(this).val().trim();
			if (val == '') {
				alert('모든 항목을 입력해주십시오.');
				$(this).focus();
				flag = false;
				return false; // break
			}
		});

		
		$("input[name=romOptcode]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
			//console.log('checkbox값:'+$(this).val());
			chkArr.push($(this).val());
			romOptcode=romOptcode+($(this).val());
		});

		if(chkArr.length==0){
			alert('하나 이상의 옵션을 선택해주세요.');
			$(this).focus();
			flag = false;
			
		}

		
		if($("#ROM_CAPA").val() > 25){
			alert('25명 이하의 숫자만 등록 가능합니다.');
			flag = false;
		};//객실최대인원수
		if($("#ROM_SIZE").val()> 500){
			alert('500이하의 숫자만 등록 가능합니다.');
			flag = false;
		};//객실크기
		
		
		
		return flag;
	}

	
	function romRegit() {
		

		var acmNum = $("#ACM_NUM").val();//숙소번호
		var romName = $("#ROM_NAME").val();//객실이름
		var romCapa = $("#ROM_CAPA").val();//객실최대인원수
		var bedType = $("#BED_TYPE").val();//침대유형
		var bedCnt = $("#BED_CNT").val();//침대갯수
		var romSize = $("#ROM_SIZE").val();//객실크기
		var romPrice = $("#ROM_PRICE").val();//객실가격
		var romType = $("#ROM_TYPE").val();//룸타입
		

		//name/value 형태로 담는다
		var allData = {
			"acmNum": acmNum, "romType": romType, "romName": romName,
			"romCapa": romCapa, "bedType": bedType, "bedCnt": bedCnt, "romSize": romSize,
			"romPrice": romPrice, "romOptcode": romOptcode
		}

		$.ajax({
			url: 'become-host2_6pop',
			type: "POST",
			data: allData,
			success: function (data) {
				alert("객실이 추가되었습니다.");
				self.close();
				opener.document.location.href="/hosting/become-host2_6?acmNum="+acmNum;

			}
		});

	}

	//숫자만 입력가능하게만드는 부분
	$("input:text[numberOnly]").on("keyup", function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});

</script>
</html>