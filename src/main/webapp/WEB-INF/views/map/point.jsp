<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Insert title here</title>

  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
  <link rel="stylesheet" href="/assets/css/neighborMap.css">
  <link rel="stylesheet" href="/assets/css/place.css">

</head>
<body>

<div class="map-title"> ${map.addr} </div>
<div>
  <button></button>
</div>
<div class="wrapper">
  <div id="map"></div>
</div>

<div class="theme">
  <c:forEach var="t" items="${themeList}">
    <button type="button" class="theme-btn">${t}</button>
  </c:forEach>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a94d5e073ab51eafbcb28e8d1ee644b6"></script>
<script>

  //지도생성
  const addr = '${map.addr}';
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
      <%--center: new kakao.maps.LatLng(${map.lat}, ${map.lng}), // 지도의 중심좌표--%>
      center: new kakao.maps.LatLng(${map.lat}, ${map.lng}), // 지도의 중심좌표
      level: 5 // 지도의 확대 레벨
    };
  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


  var markers = []; // 지도에 표시된 마커 객체를 가지고 있을 배열입니다

  fetch(`api/point/\${addr}`)
    .then(response => response.json())
    .then(placeList => {
      for (const p of placeList) {
        const {img, lng, lat, place, url} = p;
        // console.log('list :', p);

        makeMark(img, lng, lat, place, url);
      }
    })
    .catch(error => {
      console.error('Error:', error);
    });

  [...document.querySelectorAll('.theme-btn')].forEach(btn => {
    btn.onclick = function () {
      hideMarkers();

      let keyword = btn.innerText;
      console.log("클릭 함 btnText : ", keyword)

      fetch(`api/point/\${addr}/\${keyword}`)
        .then(response => response.json())
        .then(placeList => {
          for (const p of placeList) {
            const {img, lng, lat, place, url} = p;
            console.log('list :', p);

            makeMark(img, lng, lat, place, url);
          }
        })
        .catch(error => {
          console.error('Error:', error);
        });
    };
  });

  function makeMark(img, lng, lat, place, url) {
    console.log("mark")

    var imageSrc = img,
      imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
      imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
      markerPosition = new kakao.maps.LatLng(lng, lat); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition,
      image: markerImage // 마커이미지 설정
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content =
      '<div class="customoverlay">' +
      '  <a href=' + url + ' target="_blank">' +
      '    <span class="title">' + place + '</span>' +
      '  </a>' +
      '</div>';

    // 커스텀 오버레이가 표시될 위치입니다
    var position = new kakao.maps.LatLng(lng, lat);

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
      map: map,
      position: position,
      content: content,
      yAnchor: 1
    });
  }

  function addMarker(position) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: position
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);
  }


  // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
  function hideMarkers() {
    setMarkers(null);
  }
  // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
  function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(map);
    }
  }
</script>
</body>
</html>