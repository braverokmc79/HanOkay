<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<div class="container">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul class="bookbar">
					<li class="item1"><a href="/review/list">전체목록</a></li>
					<li class="item2"><a href="/review/writtenReviewlist">작성한 리뷰</a></li>
					<li class="item3 active" ><a href="/review/unwrittenReviewlist">미작성 리뷰</a></li>
				</ul>
			</div>


			<!-- /.panel-heading -->
			<div class="panel-body">
					<table
						class="table table-striped table-bordered table-hover bookList">
						<thead>
							<tr>
								<th>숙소이름</th>
								<th>예약번호</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>리뷰</th>
							</tr>
						</thead>


					</table>

				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
		//테이블 리스트 만들기
		<c:forEach items="${list }" var="rev">
		//리뷰유무확인
		if ("<c:out value="${rev.pstNum }" />" == "") {
			$(".bookList").append("<tr>");
			$(".bookList").append("<td><a href='/acm/get?type=&keyword=&person=1&in=&out=&acmNum=<c:out value="${rev.acmNum }" />'><c:out value="${rev.acmName }" /><a></td>");
			$(".bookList").append("<td ><c:out value="${rev.bookNum }" /></td>");
			$(".bookList").append("<td ><c:out value="${rev.checkInDay }" /></td>");
			$(".bookList").append("<td ><c:out value="${rev.checkOutDay }" /></td>");
			$(".bookList").append("<button class='button btn'><a href='/review/register?bookNum=<c:out value="${rev.bookNum }" />'>리뷰쓰기</button></a>");
		} 
		$(".bookList").append("</tr>");

		</c:forEach>
	</script>
</body>
<%@include file="../includes/footer.jsp"%>

</html>