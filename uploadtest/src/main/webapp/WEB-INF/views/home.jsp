<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.xo.VO.HomeVO"%>
<%@ page import="com.xo.VO.FileVO"%>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CDN 파일 summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- CDN 한글화 -->
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<title>Home</title>
</head>

<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<form id="insertalertboard" action="insertalertboard" method="post">

		<input type="hidden" value="a" name="wr_10"> <input
			type="hidden" value="a" name="wr_9"> <input type="hidden"
			value="a" name="wr_8"> <input type="hidden" value="a"
			name="wr_7"> <input type="hidden" value="a" name="wr_6">
		<input type="hidden" value="a" name="wr_5"> <input
			type="hidden" value="a" name="wr_4"> <input type="hidden"
			value="a" name="wr_3"> <input type="hidden" value="a"
			name="wr_facebook_user"> <input type="hidden" value="a"
			name="wr_twitter_user"> <input type="hidden" value="a"
			name="wr_homepage"> <input type="hidden"
			value="${sessionScope.userIp}" name="wr_ip"> <input
			type="hidden" value="${sessionScope.email}" name="wr_email">
		<input type="hidden" value="${sessionScope.Nick}" name="wr_name">
		<input type="hidden" value="${sessionScope.userId}" name="mb_id">
		<input type="hidden" value="0" name="wr_password"> <input
			type="hidden" value="0" name="wr_seo_title"> <input
			type="hidden" value="0" name="wr_option"> <input
			type="hidden" value="0" name="ca_name"> <input type="hidden"
			value="0" name="wr_reply"> <input type="hidden" value="Repl1"
			name="wr_comment_reply"> <input type="hidden" name="uid"
			value="2023061513395533"> <input type="hidden" name="w"
			value=""> <input type="hidden" name="bo_table" value="7_3_1">
		<input type="hidden" name="wr_id" value="0"> <input
			type="hidden" name="sca" value=""> <input type="hidden"
			name="sfl" value=""> <input type="hidden" name="stx" value="">
		<input type="hidden" name="spt" value=""> <input type="hidden"
			name="sst" value=""> <input type="hidden" name="sod" value="">
		<input type="hidden" name="page" value=""> <input
			type="hidden" value="html1" name="html">
		<div class="bo_w_info write_div"></div>

		<div class="write_div">
			<span class="sound_only">옵션</span>
		</div>

		<div class="bo_w_tit write_div">
			<label for="wr_subject" class="sound_only">제목<strong>필수</strong></label>

			<div id="autosave_wrapper" class="write_div">
				<input type="text" name="wr_subject" value="" id="wr_subject"
					required="" class="frm_input full_input required" size="50"
					maxlength="255" placeholder="제목">
			</div>

		</div>

		<textarea name="wr_content" id="BOARDCONT" maxlength="10000" cols="30"
			rows="5" placeholder="내용을 입력해주세요" class="with-border">
		</textarea>



		<div class="bo_w_link write_div">
			<label for="wr_link1"><i class="fa fa-link"
				aria-hidden="true"></i><span class="sound_only"> 링크 #1</span></label> <input
				type="text" name="wr_link1" value="" id="wr_link1"
				class="frm_input full_input" size="50" placeholder="연결할 URL을 입력해주세요">
		</div>
		<div class="bo_w_link write_div">
			<label for="wr_link2"><i class="fa fa-link"
				aria-hidden="true"></i><span class="sound_only"> 링크 #2</span></label> <input
				type="text" name="wr_link2" value="" id="wr_link2"
				class="frm_input full_input" size="50" placeholder="연결할 URL을 입력해주세요">
		</div>



		<div class="errorItem">
			<label for="" class="errorLabel">첨부파일</label>
			<div class="errorInsert">
				<!--select id="" multiple="multiple" size="5" class="multiSelectBox"></select-->
				<div>
					<button type="button" class="input" size="60" maxlength="60"
						accept=".jpg,.png,.gif,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.hwp,.hwpx"
						onclick="openUploadWindow()">파일첨부</button>
					<input type="text" id="wr_1" name="wr_1">
				</div>
			</div>
		</div>
		<div class="errorItem">
			<div class="errorInsert">
				<!--select id="" multiple="multiple" size="5" class="multiSelectBox"></select-->
				<div>
					<button type="button" class="input" size="60" maxlength="60"
						accept=".jpg,.png,.gif,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.hwp,.hwpx"
						onclick="openUploadWindow2()">파일첨부</button>
					<input type="text" id="wr_2" name="wr_2">
					<p>10mb이하로만 업로드가 가능합니다.</p>
				</div>
				<p>업로드 가능확장자: jpg, png, gif, doc, docx, xls, xlsx, ppt, pptx,
					hwp, hwpx</p>
			</div>
		</div>
		<button type="submit">저장</button>
	</form>
	<div>
		<table>
			<thead>
				<tr>
					<th scope="col" class="all_chk chk_box" width="60px"></th>
					<th scope="col" width="90px">번호</th>
					<th scope="col" width="450px">제목</th>
					<th scope="col" width="150px">글쓴이</th>
					<th scope="col" width="300px">날짜</th>
					<th scope="col" width="200px">첨부파일1</th>
					<th scope="col" width="200px">첨부파일2</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<tr>
						<td></td>
						<td>${vo.wr_id}</td>
						<td>${vo.wr_subject}</td>
						<td>${vo.wr_name}</td>
						<td>${vo.wr_datetime}</td>
						<td>${vo.wr_1}</td>
						<td>${vo.wr_2}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div>
		<table>
			<thead>
				<tr>
					<th scope="col" class="all_chk chk_box" width="60px"></th>
					<th scope="col" width="90px">테이블명</th>
					<th scope="col" width="150px">테이블 seq</th>
					<th scope="col" width="450px">파일명</th>
					<th scope="col" width="300px">파일사이즈</th>
					<th scope="col" width="200px">파일타입</th>
					<th scope="col" width="200px">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list1}" varStatus="i">
					<tr>
						<td></td>
						<td>${vo.bo_table}</td>
						<td>${vo.wr_id}</td>
						<td>${vo.bf_source}</td>
						<td>${vo.bf_filesize}</td>
						<td>${vo.bf_type}</td>
						<td>${vo.bf_datetime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div></div>





	<script>
		$('#BOARDCONT').summernote(
				{
					height : 300, // 에디터 높이
					minHeight : null, // 최소 높이
					maxHeight : null, // 최대 높이
					focus : true, // 에디터 로딩후 포커스를 맞출지 여부
					lang : "ko-KR", // 한글 설정
					placeholder : '최대3000자까지 쓸 수 있습니다',//placeholder 설정
					toolbar : [
							// [groupName, [list of button]]
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[ 'color', [ 'color' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'insert', [ 'picture', 'link', 'video' ] ], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
							[ 'view', [ 'codeview', 'fullscreen', 'help' ] ], // 코드 보기, 전체 화면, 도움말 옵션
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
							'바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ],

				});
	</script>
	<script>
		function openUploadWindow() {
			var url = "./uploadFile";
			var width = 600;
			var height = 400;
			var left = (window.innerWidth - width) / 2;
			var top = (window.innerHeight - height) / 2;
			var options = "width=" + width + ",height=" + height + ",left="
					+ left + ",top=" + top;

			window.open(url, "_blank", options);
		}
	</script>
	<script>
		function openUploadWindow2() {
			var url = "./uploadFile2";
			var width = 600;
			var height = 400;
			var left = (window.innerWidth - width) / 2;
			var top = (window.innerHeight - height) / 2;
			var options = "width=" + width + ",height=" + height + ",left="
					+ left + ",top=" + top;

			window.open(url, "_blank", options);
		}
	</script>
</body>

</html>
