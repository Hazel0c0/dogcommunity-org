<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
      .mapper {
          position: relative;
          top: 150px;
      }
      .area {
          font-size: 1.5em;
          font-weight: 700;

          position: absolute;
          background: #fff;
          border: 1px solid #cd5c5c;
          border-radius: 5px;

          top: -5px;
          left: 15px;
          padding: 2px;
      }

      .info {
          font-size: 12px;
          padding: 5px;
      }

      .info .title {
          font-weight: bold;
      }
  </style>

  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
</head>

<body>

<div class="mapper">
  <div id="map" style="width:1000px;height:800px;"></div>
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

  // 지도에 영역데이터를 폴리곤으로 표시합니다
  for (var i = 0, len = areas.length; i < len; i++) {
    displayArea(areas[i]);
  }

  // 다각형을 생상하고 이벤트를 등록하는 함수입니다
  function displayArea(area) {

    // 다각형을 생성합니다
    var polygon = new kakao.maps.Polygon({
      map: map, // 다각형을 표시할 지도 객체
      path: area.path,
      strokeWeight: 2,
      strokeColor: '#cd5c5c',
      strokeOpacity: 0.8,
      fillColor: '#fff',
      fillOpacity: 0.7
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

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
    kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {

      window.location.href = '/map/neighbor?addr=' + area.name;
    });
  }
</script>
</body>

</html>