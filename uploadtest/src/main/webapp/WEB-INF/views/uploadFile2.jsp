<%@page import="com.xo.VO.FileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload File</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

h1 {
	text-align: center;
}

form {
	max-width: 400px;
	margin: 0 auto;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="file"], input[type="text"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1>첨부파일 업로드</h1>
	<form method="POST" action="uploadFile2" enctype="multipart/form-data">
		<label for="file">파일 업로드:</label> <input type="file" id="file"
			name="file" onchange="setFilename(this)"> <label for="name">파일
			이름 설정:</label> <input type="text" class="form-control" id="name" name="name">
		<div>
			<font id="id_feedback" size="2"></font>
		</div>
		<button id="checkBtn" type="button">파일명 중복 확인</button>
		<input type="submit" value="Upload" disabled>
	</form>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#checkBtn').click(function() {
				let attach_filename = $('#name').val();

				// Check if file is selected
				let file = $('#file').prop('files')[0];
				if (!file) {
					alert("파일이 없습니다.");
					return false; // Prevent form submission
				}

				$.ajax({
					url : "./filecheck",
					type : "post",
					data : {
						attach_filename : attach_filename
					},
					dataType : 'json',
					success : function(result) {
						if (result == 1) {
							$("#id_feedback").html('이미 사용중인 파일명입니다.');
							$("#id_feedback").css('color', '#dc3545');
							$('input[type="submit"]').prop('disabled', true);
						} else {
							$("#id_feedback").html('사용할 수 있는 파일명입니다.');
							$("#id_feedback").css('color', '#2fb380');
							$('input[type="submit"]').prop('disabled', false);
						}
					},
					error : function() {
						alert("서버 요청 실패");
					}
				});
			});

			$('input[type="submit"]').click(function() {
				let attach_filename = $('#name').val();
				if (attach_filename === '') {
					alert('파일이 없습니다.');
					return false; // Prevent form submission
				} else {
					let file = $('#file').prop('files')[0];
					if (!file) {
						alert('파일이 없습니다.');
						return false; // Prevent form submission
					} else {
						$('form').submit();
					}
				}
			});
		});

		function setFilename(input) {
			var filename = input.files[0].name;
			document.getElementById('name').value = filename;
		}
	</script>



</body>
</html>
