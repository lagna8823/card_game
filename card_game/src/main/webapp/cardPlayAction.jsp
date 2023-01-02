<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Card" %>
<%
	//52장 카드를 초기화
	Card[] deck = new Card[52]; // index 0 ~ 51, new로 Card[52] 52개 만듬
	
	//[0]  1번	spade
	//[1]  2번	spade
	//[12] 13번	spade
	//[13] 1번	diamond
	// ... 
	//[51] 13번	clover
	
	
	//초기화 알고리즘 
	for(int i=0; i<deck.length; i=i+1){
		
		deck[i] = new Card();
		// deck[0] = new Card(); <-- deck[0].kind = null/ deck[0].num = 0
		// ...
		// deck[51] = new Card(); <-- deck[51].kind= null/ deck[51].num = 0
		
		//무늬 지정 알고리즘
		if(i/13 == 0) { // i : 0~12 / 13 --> 0 --> spade
			deck[i].kind = "spade";
		} else if(i/13 == 1) { // i : 13~25 / 13 --> 1 --> diamond
			deck[i].kind = "diamond";
		} else if(i/13 == 2) { // i : 26~38 / 13 --> 2 --> heart
			deck[i].kind = "heart";
		} else if(i/13 == 3) { // i : 39~51 / 13 --> 3 --> clover
			deck[i].kind = "clover";
		}

		
		
	
	// 번호 지정 알고리즘
	// i : 0 ->1 		%13 --> 0
	// i : 1 ->2		%13 --> 1
	// ...
	// i : 12 ->13
	// i : 13 ->1
	// i : 14 ->2
	// i : 15 ->3
	// ...
	// i : 25 ->13
	// i : 26 ->1
	// i : 27 ->2
	// ...
	// i : 39 ->13
	// i : 39 ->1
	// ...
	// i : 51 ->13
		deck[i].num = (i%13)+1;
	}
	
	//초기화 디버깅
	
	/*
	for(int i=0; i<deck.length; i=i+1) {
		System.out.println("["+i+"]"+deck[i].kind + "("+deck[i].num+")");
	}
	*/

	// 
	for(int i=0; i<50000; i=i+1){
	Card temp = deck[0]; // 0번쨰 카드를 복사해두고
	
	int r = (int)(Math.random() * 52); // 0~51 임의의 숫자 --> r
	deck[0] =  deck[r]; // 0번째 카드에는 r번째 카드를 복사
	deck[r] = temp; // 복사해둔 0번째의 카드를 r번쨰에 복사 -> 0번째와 r번째 swap
	}
	
	//섞기 후 디버깅
	/*for(int i=0; i<deck.length; i=i+1) {
		System.out.println("["+i+"]"+deck[i].kind + "("+deck[i].num+")");
	}
	*/
	
	int playerCount = Integer.parseInt(request.getParameter("playerCount")); //참가자 수
	int cardPerPlayer = 3; // 참가자당 카드 수
	
	// i = 1 첫번째 player카드(deck카드의 0,1,2), i=2 두번째 player카드(deck카드의 3,4,5), ...
	/*
	for(int i=0; i<playerCount; i=i+1){
		System.out.println((i+1)+"번째 참가자의 카드(3장)");
		for(int j=0; j<cardPerPlayer; j=j+1){
			System.out.println(deck[j+(i*3)].kind + " " +deck[j+(i*3)].num);	// i=1 012, i=2
		}
		System.out.println("---------------------------------------------------------------");
	}
	*/
	
	// 중복 for문보다 단일 for문이 로직을 간단하게 표현
	// 점수계산
	// 3장의 합이 21을 넘으면 탈락
	// 3장의 합이 21에 가장 가까운 합이 승리
	// 11, 12, 13 -> 10 
	for(int i=0; i<playerCount; i=i+1){
		int sum = 0;
		for(int j=0; j<cardPerPlayer; j=j+1){
			//디버깅
			System.out.println(deck[j+(i*3)].num);
			int temp = 0;			
			if(deck[j+(i*3)].num == 11 || deck[j+(i*3)].num == 12 || deck[j+(i*3)].num == 13){
				temp = 10;
			} else {
				temp = deck[j+(i*3)].num;
			}
			// 1->11
			if(deck[j+(i*3)].num ==1) {
				temp = 11;
			}
			
			sum = sum + temp;
		
		}
		System.out.println(i+"번째 참가자 합 : " + sum);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//중복 for문보다 단일 for문이 로직을 간단하게 표현
	// 출력
	for(int i=0; i<playerCount*cardPerPlayer; i=i+1){
		//System.out.println(deck[i].kind + "" + deck[i].num);
%>
		<img src="<%=request.getContextPath()%>/img/<%=deck[i].kind+deck[i].num%>.jpg">
<%
		if((i+1)%cardPerPlayer == 0){
%>
			<br>
<%
		}
	}
%>
</body>
</html>