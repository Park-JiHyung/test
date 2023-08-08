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
	<form method="POST" action="uploadFile" enctype="multipart/form-data">
		<table>
			<tr>
			<td><input type="hidden" name="board"value="${seq}"/></td> 
				<td>Select File</td>
				<td><input type="file" name="uploadFile" /></td>
				<td>
					<button type="submit">Upload</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
