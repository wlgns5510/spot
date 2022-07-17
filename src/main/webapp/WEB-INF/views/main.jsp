<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6544d76c3912585c75cfd126a875faf"></script>
    <title>마커 생성하기</title>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>



</body>
<script>
// var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
//     mapOption = { 
//         center: new kakao.maps.LatLng(37.483884, 126.99261), // 지도의 중심좌표
//         level: 3 // 지도의 확대 레벨
//     };

// var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// // 마커가 표시될 위치입니다 
// var position  = new kakao.maps.LatLng(37.483884, 126.99261); 

// // 마커를 생성합니다
// var marker = new kakao.maps.Marker({
//     position: position,
//     clickable: true
// });

// // 마커가 지도 위에 표시되도록 설정합니다
// marker.setMap(map);

// // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// // marker.setMap(null);   
// var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/37.483884, 126.99261" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/37.483884, 126.99261" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//     iwPosition = new kakao.maps.LatLng(37.483884, 126.99261); //인포윈도우 표시 위치입니다
//     iwRemoveable = true;

// // 인포윈도우를 생성합니다
// var infowindow = new kakao.maps.InfoWindow({
//     content : iwContent,
//     removable : iwRemoveable
// });
  
// kakao.maps.event.addListener(marker, 'click', function() {
//     // 마커 위에 인포윈도우를 표시합니다
//     infowindow.open(map, marker);  
// });
// //마커에 마우스오버 이벤트를 등록합니다
// kakao.maps.event.addListener(marker, 'mouseover', function() {
//   // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
//     infowindow.open(map, marker);
// });

// // 마커에 마우스아웃 이벤트를 등록합니다
// kakao.maps.event.addListener(marker, 'mouseout', function() {
//     // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
//     infowindow.close();
// });

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            mVo = {};
            mVo.lat = lat;
            mVo.lon = lon;
            
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = "<div style='padding:5px;'>I'm Here!</div>"; // 인포윈도우에 표시될 내용입니다
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
        $.ajax({
    		
    		url : "${pageContext.request.contextPath}/now",		
    		type : "post",
    		contentType : "application/json",
    		data : JSON.stringify(mVo),

    		dataType : "json",
    		success : function(result){
    			if (result == 1) {
    				document.write("good!")
    			}
    		},
    		error : function(XHR, status, error) {
    			console.error(status + " : " + error);
    		}
    	});

            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    


</script>
</html>