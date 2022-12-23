import "@hotwired/turbo-rails"
import "controllers"
let center_main = [55.76309371185999,37.622504000000006]
let center = [55.792710124305536,37.798927264314194];
function init() {
	let map = new ymaps.Map('yandex_map', {
		center: center_main,
		zoom: 10
	});

    let placemark = new ymaps.Placemark(center, {
        		balloonContent: `
			<div class="balloon">
				<div><h3>yanAirways</h3></div>
				<div class="balloon__contacts">
					<h5><a href="tel:+79535580348">+79535580348</a></h5>
				</div>
			</div>
            `
    }, {
		iconLayout: 'default#image',
		iconImageHref: 'https://cdn-icons-png.flaticon.com/512/3177/3177361.png',
		iconImageSize: [40, 40],
		iconImageOffset: [-19, -44]
	});

    map.controls.remove('geolocationControl'); 
    map.controls.remove('searchControl'); 
    map.controls.remove('trafficControl'); 
    map.controls.remove('typeSelector'); 
    map.controls.remove('fullscreenControl'); 
    map.controls.remove('rulerControl');

    map.geoObjects.add(placemark);
    }
ymaps.ready(init);