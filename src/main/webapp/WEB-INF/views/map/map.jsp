<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert title here</title>
  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
  <link rel="stylesheet" href="/assets/css/neighborMap.css">

</head>

<body>

<div class="wrapper">
  <div id="map"></div>
  <p id="result"></p>

  <div class="city-list">

  </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a94d5e073ab51eafbcb28e8d1ee644b6">
</script>
<script src="/assets/js/map.js"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
      level: 8 // 지도의 확대 레벨
    };

  var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true});


  for (var i = 0, len = areas.length; i < len; i++) {
    displayArea(areas[i]);
  }

  // 폴리곤 생성
  function displayArea(area) {


    var polygon = new kakao.maps.Polygon({
      map: map,
      path: area.path,
      strokeWeight: 2,
      strokeColor: '#cd5c5c',
      strokeOpacity: 0.8,
      fillColor: '#fff',
      fillOpacity: 0.7
    });

    kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {

      var latlng = mouseEvent.latLng;

      var lat = latlng.getLat();
      var lng =latlng.getLng();

      // window.location.href = '/map/api/point?lng='+lng+'&lat='+lat+'&addr='+area.name;
      window.location.href = '/map/point?lng='+lng+'&lat='+lat+'&addr='+area.name;

    });

    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
      polygon.setOptions({
        fillColor: '#ea9999'
      });

      customOverlay.setContent('<div class="area">' + area.name + '</div>');

      customOverlay.setPosition(mouseEvent.latLng);
      customOverlay.setMap(map);

    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다
    kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {

      customOverlay.setPosition(mouseEvent.latLng);
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다
    kakao.maps.event.addListener(polygon, 'mouseout', function () {
      polygon.setOptions({
        fillColor: '#fff'
      });
      customOverlay.setMap(null);
    });


  }
</script>
</body>
</html>