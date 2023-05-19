<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <!--메인 화면 공통 부분 JSP-->
  <%@ include file="../include/static-head.jsp" %>
  <%@ include file="../include/header.jsp" %>

  <!--메인 화면 CSS : main-static은 공통 + 추가 개별 CSS 넣기 -->
  <link rel="stylesheet" href="/assets/css/main-static.css">
  <link rel="stylesheet" href="/assets/css/profile.css">
  <link rel="stylesheet" href="/assets/css/neighborMap.css">

</head>
<body>
<div class="mapper">
  <div id="map"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a94d5e073ab51eafbcb28e8d1ee644b6"></script>

<script>

    // 지도에 폴리곤으로 표시할 영역데이터 배열입니다
    var areas = [
        {
            name: '광진구',
            path: [
                new kakao.maps.LatLng(37.55675982385771,
                    127.11525258096357),
                new kakao.maps.LatLng(37.55683041105989,
                    127.11331466591936),
                new kakao.maps.LatLng(37.55842942562878,
                    127.11386366517074),
                new kakao.maps.LatLng(37.55900050177959,
                    127.11229754253986),
                new kakao.maps.LatLng(37.55825336535832,
                    127.1103501493429),
                new kakao.maps.LatLng(37.55855426611634,
                    127.10751929692502),
                new kakao.maps.LatLng(37.55760666957415,
                    127.10952881946035),
                new kakao.maps.LatLng(37.55646172177944,
                    127.10639618951616),
                new kakao.maps.LatLng(37.55642163309852,
                    127.10492929820873),
                new kakao.maps.LatLng(37.557563927848186,
                    127.1042767557078),
                new kakao.maps.LatLng(37.55949382678838,
                    127.10185950212934),
                new kakao.maps.LatLng(37.56046599154358,
                    127.1012777477596),
                new kakao.maps.LatLng(37.56157990072918,
                    127.10120496305383),
                new kakao.maps.LatLng(37.56489633286704,
                    127.10225494384376),
                new kakao.maps.LatLng(37.57005008010175,
                    127.1034557350033),
                new kakao.maps.LatLng(37.57138765445174,
                    127.10423047494143),
                new kakao.maps.LatLng(37.572279457998924,
                    127.10312996750193),
                new kakao.maps.LatLng(37.57240065825183,
                    127.10166491936154),
                new kakao.maps.LatLng(37.573763490111496,
                    127.10088814254927),
                new kakao.maps.LatLng(37.57274768164161,
                    127.09947517285508),
                new kakao.maps.LatLng(37.57133681752635,
                    127.0963397308799),
                new kakao.maps.LatLng(37.570622241095066,
                    127.09561172598644),
                new kakao.maps.LatLng(37.57075578461431,
                    127.09479528990813),
                new kakao.maps.LatLng(37.56969487204596,
                    127.09041530788487),
                new kakao.maps.LatLng(37.570407110901634,
                    127.08752154224659),
                new kakao.maps.LatLng(37.570443040280075,
                    127.0861151345612),
                new kakao.maps.LatLng(37.570919708353614,
                    127.08573628657996),
                new kakao.maps.LatLng(37.57136992169587,
                    127.08332888897868),
                new kakao.maps.LatLng(37.57188663107485,
                    127.07822585293219),
                new kakao.maps.LatLng(37.571869753078474,
                    127.07820196232183),
                new kakao.maps.LatLng(37.571238919411186,
                    127.07799083838103),
                new kakao.maps.LatLng(37.56793018846005,
                    127.07687941496506),
                new kakao.maps.LatLng(37.566909231401105,
                    127.07603124042703),
                new kakao.maps.LatLng(37.56491513587839,
                    127.07437230242876),
                new kakao.maps.LatLng(37.564589546162395,
                    127.07409344535412),
                new kakao.maps.LatLng(37.560686317752534,
                    127.07267242652881),
                new kakao.maps.LatLng(37.560680399640944,
                    127.07267012334047),
                new kakao.maps.LatLng(37.55997893006315,
                    127.07239269906661),
                new kakao.maps.LatLng(37.559962600127896,
                    127.07238436492516),
                new kakao.maps.LatLng(37.559414430556636,
                    127.07373526396364),
                new kakao.maps.LatLng(37.54832943954858,
                    127.06746531494737),
                new kakao.maps.LatLng(37.542144344884434,
                    127.06397407440068),
                new kakao.maps.LatLng(37.53193392866375,
                    127.05621905441532),
                new kakao.maps.LatLng(37.52832385570593,
                    127.05821219845886),
                new kakao.maps.LatLng(37.52709070359654,
                    127.06015647724853),
                new kakao.maps.LatLng(37.52507028414661,
                    127.06545628742798),
                new kakao.maps.LatLng(37.52506859268495,
                    127.06546848102285),
                new kakao.maps.LatLng(37.52458374853896,
                    127.06750115244091),
                new kakao.maps.LatLng(37.52387158677025,
                    127.06866359431645),
                new kakao.maps.LatLng(37.523415175008616,
                    127.07205548042548),
                new kakao.maps.LatLng(37.52287010509398,
                    127.07431902616231),
                new kakao.maps.LatLng(37.52251509930528,
                    127.07695408839913),
                new kakao.maps.LatLng(37.52295067189457,
                    127.07997598265712),
                new kakao.maps.LatLng(37.52340885657236,
                    127.08110469333745),
                new kakao.maps.LatLng(37.524760598317876,
                    127.08563329753419),
                new kakao.maps.LatLng(37.527007534982275,
                    127.09014225188498),
                new kakao.maps.LatLng(37.54140813136226,
                    127.10828328245258),
                new kakao.maps.LatLng(37.543166258544034,
                    127.10914275985158),
                new kakao.maps.LatLng(37.546942930843684,
                    127.11146566220118),
                new kakao.maps.LatLng(37.550377615375695,
                    127.11153424893529),
                new kakao.maps.LatLng(37.554086569771385,
                    127.11409539214134),
                new kakao.maps.LatLng(37.55675982385771,
                    127.11525258096357)
            ]
        }
    ];

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
            strokeColor: '#004c80',
            strokeOpacity: 0.8,
            fillColor: '#fff',
            fillOpacity: 0.7
        });
        // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
        // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
        kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
            polygon.setOptions({fillColor: '#09f'});

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
            polygon.setOptions({fillColor: '#fff'});
            customOverlay.setMap(null);
        });

        // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
        kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
            var content = '<div class="info">' +
                '   <div class="title">' + area.name + '</div>' +
                '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></div>' +
                '</div>';

            infowindow.setContent(content);
            infowindow.setPosition(mouseEvent.latLng);
            infowindow.setMap(map);

            window.location.href = '/map/neighbor?addr=' + area.name;
        });
    }
</script>
</body>
</html>