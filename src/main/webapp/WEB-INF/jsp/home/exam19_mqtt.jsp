<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam19</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
	<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	<!-- https://www.eclipse.org/paho/clients/js/ 2번째꺼 복사 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
</head>

<body>	
	<h5 class="alert alert-info">/exam19_mqtt.jsp</h5>
	<img id="cameraView">




</body>
<script type="text/javascript">
$(function(){
	
	client = new Paho.MQTT.Client(location.hostname, 61614 , new Date().getTime.toString());
	//[설명] location.hostname이란 : 192.168.3.210 와같은  IP를 가리키는 코드
	//[설명] location.port or 61614란  web socet이다. (browser는 통신을 할 수없기 때문에 web socet을 사용하여 통신을 한다.)
	//[설명] clientId란 : 사용이유 : 동일한 mqtt를 주면 에러가 난다. / 모두 다른 값으로 지정해줘야한다. 다른값을 지정하려면 제일 편한건 시간!! ->new Date().getTime.toString()그래서 이 코드 사용함
	
	client.onMessageArrived = onMessageArrived;
	//[설명] client.onMessageArrived = onMessageArrived;란 : 콜백함수 실행하기 위해 사용
	client.connect({onSuccess:onConnect});
});
 
	function onConnect() {
		console.log("mqtt broker connected")
	  client.subscribe("/camerapub");
	  
	}
	
	function onMessageArrived(message) {
		if(message.destinationName == "/camerapub"){
			var cameraView = $("#cameraView").attr("src", "data:image/jpg;base64," + message.payloadString);
		}
		console.log(message.payloadString);
	}	
	
	
	
	
	
	

</script>
</html>