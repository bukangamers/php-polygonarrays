<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Draw Polygon</title>

	<!-- Replace the value of the key parameter with your own API key. -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgdfSdzt4cecSHPziSxNGDsXSUUVr0oLA&libraries=drawing&callback=initMap" async defer></script>	

	<style type="text/css">
		html,
		body {
			height: 100%;
			margin: 0;
			padding: 0;
		}

		#map {
			height: 100%;
		}
	</style>
</head>
<body>

	<div id="map"></div>
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center: {
					lat: 0.794541, 
					lng: 102.048664
				},
				zoom: 8
			});
			var infoWindow = new google.maps.InfoWindow();
			var drawingManager = new google.maps.drawing.DrawingManager({
				drawingMode: google.maps.drawing.OverlayType.POLYGON,
				drawingControl: true,
				drawingControlOptions: {
					position: google.maps.ControlPosition.TOP_RIGHT,
					drawingModes: ['polygon']
					// drawingModes: ['polygon', 'rectangle', 'marker', 'circle', 'polyline']
				}
			});

			drawingManager.setMap(map);
			google.maps.event.addListener(drawingManager, 'polygoncomplete', function(polygon) {
				drawingManager.setDrawingMode(null);
				var arr=[];
				polygon.getPath().forEach(function(latLng){arr.push(latLng.toString());})
				var coordsrec = arr.join(',\n');

				contentsr = '<div id="content">'+
		            '<div id="siteNotice">'+
		            '</div>'+
		            '<h1 id="firstHeading" class="firstHeading"><center>Tambah Data</center></h1>'+
		            '<div id="bodyContent">'+
		            '<form action="SaveData.php" method="POST">'+
		            '<p><b>Nama Kecamatan : </b><br><input type="text" size="30" name="region_name"/><br>' +
		            '<input type="hidden" name="region_type" value="2"><br>'+
		            '<b>Koordinat : </b><br><textarea name="coords" cols="45" rows="5">'+coordsrec+'</textarea><br>'+
		            '<center><input type="submit" value="Simpan" name="save_region"></center>'+
		            '</form>'+
		            '</div>'+
		            '</div>';

				var boundsr = new google.maps.LatLng(arr.join(',\n'));
				
				infoWindow.setContent(contentsr);
				infoWindow.setPosition(boundsr); 
				drawingManager.setDrawingMode(null);
				infoWindow.open(map);
			});

			// google.maps.event.addListener(drawingManager, 'rectanglecomplete', function(rectangle) {
			//     var ne = rectangle.getBounds().getNorthEast();
			//     var sw = rectangle.getBounds().getSouthWest();
			//     var nelat = ne.lat();
			//     var nelng = ne.lng();
			//     var swlat = sw.lat();
			//     var swlng = sw.lng();
			//     var coordsrec = nelat.toFixed(6) + ';' + nelng.toFixed(6)+ ';' + swlat.toFixed(6) + ';' + swlng.toFixed(6);


			// 	contentsr = '<form action="SaveData.php" method="POST"><b>Region Name : </b><br/><input type="text" size="20" name="region_name"/><input type="hidden" name="region_type" value="2"><br/><b>Description : </b><br/><textarea name="region_desc" cols="20" rows="3"></textarea><br/>Coordinates:<br/><input name="coords" type="text" size="40" value="'+coordsrec+'"/><br/><center><br/><input type="submit" value="Save Region" name="save_region"></center></form>'; 

			// 	var boundsr = new google.maps.LatLng(ne.lat(), ne.lng());

			// 	infoWindow.setContent(contentsr);
			// 	infoWindow.setPosition(boundsr); 
			// 	drawingManager.setDrawingMode(null);
			// 	infoWindow.open(map);
			// });
		}
	</script>
</body>
</html>