<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
      .customoverlay {
          position: relative;
          bottom: 85px;
          border-radius: 6px;
          border: 1px solid #ccc;
          border-bottom: 2px solid #ddd;
          float: left;
      }

      .customoverlay:nth-of-type(n) {
          border: 0;
          box-shadow: 0px 1px 2px #888;
      }

      .customoverlay a {
          display: block;
          text-decoration: none;
          color: #000;
          text-align: center;
          border-radius: 6px;
          font-size: 14px;
          font-weight: bold;
          overflow: hidden;
          background: #d95050;
          background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
      }

      .customoverlay .title {
          display: block;
          text-align: center;
          background: #fff;
          margin-right: 35px;
          padding: 10px 15px;
          font-size: 14px;
          font-weight: bold;
      }

      .customoverlay:after {
          content: '';
          position: absolute;
          margin-left: -12px;
          left: 50%;
          bottom: -12px;
          width: 22px;
          height: 12px;
          background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
      }
  </style>
</head>
<body>

<h1>여기는 ${map.addr} 입니다</h1>
<div id="map" style="width:1000px;height:800px;"></div>
<p id="result"></p>
<div class="place-img">

</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a94d5e073ab51eafbcb28e8d1ee644b6"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(${map.lat}, ${map.lng}), // 지도의 중심좌표
      level: 5 // 지도의 확대 레벨
    };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  var placeList = `${placeList}`;
  for (var i = 0; i < placeList.length; i++) {
    var imageSrc = placeList[i].img, // 마커이미지의 주소입니다
      imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
      imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
      markerPosition = new kakao.maps.LatLng(placeList[i].lng, placeList[i].lat); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition,
      image: markerImage // 마커이미지 설정
    });
    
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content = '<div class="customoverlay">' +
      '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
      '    <span class="title">'+ placeList[i].place +'</span>' +
      '  </a>' +
      '</div>';

    // 커스텀 오버레이가 표시될 위치입니다
    var position = new kakao.maps.LatLng(37.54990, 126.92337);

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
      map: map,
      position: position,
      content: content,
      yAnchor: 1

    });
  }
</script>
</body>
</html>