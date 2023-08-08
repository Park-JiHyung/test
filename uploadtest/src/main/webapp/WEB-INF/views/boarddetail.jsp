<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.xo.VO.HomeVO"%>
<%@ page import="com.xo.VO.FileVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<td>${list.wr_id}</td>
				<td>${list.wr_subject}</td>
				<td>${list.wr_name}</td>
				<td>${list.wr_datetime}</td>
				<td><a href="downloadFile?filename=${list.wr_1}"
					target="_BLANK">${list.wr_1}</a></td>
				<td><a href="downloadFile?filename=${list.wr_2}"
					target="_BLANK">${list.wr_2}</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>