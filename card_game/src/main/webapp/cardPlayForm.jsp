<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>블랙잭 게임</h1>
	<div>
		<!--절대상대주소 /card_game/img/cardback.png--> 
		<!-- 절대주소 http://-->
		<!--상대주소 ./img/...-->
		<img src="<%=request.getContextPath()%>/img/cardback.png">  <!-- 절대주소-->
	</div>
	<div>
		<form method="post" action="<%=request.getContextPath()%>/cardPlayAction.jsp">
			<input type="radio" name="playerCount" value="2"> 2명
			<input type="radio" name="playerCount" value="3"> 3명
			<input type="radio" name="playerCount" value="4"> 4명
			<button type = "submit">시작</button>
		</form>
	</div>
</body>
</html>