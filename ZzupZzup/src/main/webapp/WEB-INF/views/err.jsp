<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		background-color : white;
	}
	h3 {
		color : black;
	}
</style>
</head>
<body>
	<div>
		<h3>[ 오류 발생 ]</h3>
		<table border = "1">
			<tbody>
				<tr>
					<td>오류명</td><td>${err }</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>