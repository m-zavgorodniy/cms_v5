jQuery.fn.outerHTML = function(s) {
    return this[0].outerHTML ? this[0].outerHTML :
           s ? this.before(s).remove()
             : jQuery("<p>").append(this.eq(0).clone()).html();
};


function initMap() {

	map = new google.maps.Map(document.getElementById('vd_mapwrapper-map'), {
		center: {lat: 51.000, lng: 45.496},
		zoom: 5,
		styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
	});

	/* filling up the map on the office center list page */
	
	if (jQuery('.vd_officelistwrapper-office-coordinates').length > 0) {
	
		var officecenter_number = jQuery('.vd_officelistwrapper-office').length;
		
	// 	var infowindow = new google.maps.InfoWindow();
	
		var infowindow = new InfoBubble({
			map: map,
			minWidth: 200,
			minHeight: 80,
			content: '',
			shadowStyle: 0,
			padding: 9,
			backgroundColor: '#ffffff',
			borderRadius: 0,
			arrowSize: 0,
			borderWidth: 0,
			borderColor: '#ffffff',
			disableAutoPan: false,
			hideCloseButton: true,
			arrowPosition: 30,
			backgroundClassName: 'vd_office_markerinfowindow',
			arrowStyle: 0
	    });
	    
	    var content_list = {};
	    
	    var markers = [];
	    
	    var options = {
	        imagePath: '../images/m',
	        styles: [{
		        url: '../images/m1.png',
		        height: 72,
		        width: 72,
		        textColor: '#ffffff',
		        textSize: '30'
	        }, {
		        url: '../images/m1.png',
		        height: 72,
		        width: 72,
		        textColor: '#ffffff',
		        textSize: '30'
	        }, {
		        url: '../images/m1.png',
		        height: 72,
		        width: 72,
		        textColor: '#ffffff',
		        textSize: '30'
	        }, {
		        url: '../images/m1.png',
		        height: 72,
		        width: 72,
		        textColor: '#ffffff',
		        textSize: '30'
	        }, {
		        url: '../images/m1.png',
		        height: 72,
		        width: 72,
		        textColor: '#ffffff',
		        textSize: '30'
	        }]
	    };
		
		for (i = 0; i < officecenter_number; i++) {
			
			var coordinates = jQuery('.vd_officelistwrapper-office-coordinates', jQuery('.vd_officelistwrapper-office')[i]).val();
			var color = jQuery('.vd_officelistwrapper-office-color', jQuery('.vd_officelistwrapper-office')[i]).val();
			console.log(color);
			var coordinates_array = coordinates.split(', ');
			var marker = new google.maps.Marker({
				position: {lat: parseFloat(coordinates_array[0]), lng: parseFloat(coordinates_array[1])},
				title: 'xynta',
				icon: vd_get_pin(color)
			});
			
			markers.push(marker);
			
			var content_string = '<div class="vd_officeinfowindow-header" style="background-color: ' + color + ';"><p>' + jQuery('.vd_officelistwrapper-office-name', jQuery('.vd_officelistwrapper-office')[i]).text() + '</p></div>'+ jQuery('.vd_officelistwrapper-office-services', jQuery('.vd_officelistwrapper-office')[i]).outerHTML();
			
			content_list[i] = content_string;
			
			google.maps.event.addListener(marker, 'click', (function(marker, i) {
				return function() {
					infowindow.setContent(content_list[i]);
					infowindow.open(map, marker);
				}
			})(marker, i));
	
	
			/* close the marker's infowindow, if it doesn't have a map after zooming out (and becoming a part of the cluster) */
			google.maps.event.addListener(marker, 'map_changed', (function(marker, i) {
				return function() {
					if (this.getMap() != false ) {
						infowindow.close();
					}
				}
			})(marker, i));
			
		}
		
		var markerCluster = new MarkerClusterer(map, markers, options);

	} else if (jQuery('.vd_singleofficewrapper-content-contacts-coordinates').length == 1) {

		map.setZoom(17);

		var coordinates = jQuery('.vd_singleofficewrapper-content-contacts-coordinates').val();
		
		var color = jQuery('.vd_singleofficewrapper-content-contacts-color').val();

		var coordinates_array = coordinates.split(', ');

		map.setCenter({lat: parseFloat(coordinates_array[0]), lng: parseFloat(coordinates_array[1])});

		var marker = new google.maps.Marker({
			position: {lat: parseFloat(coordinates_array[0]), lng: parseFloat(coordinates_array[1])},
			title: 'xynta',
			icon: vd_get_pin(color),
			map: map
		});

	}
	
}

function vd_get_pin(color) {
	
	if (typeof color !== 'undefined') {
		color = color;
	} else {
		color = '#000000';
	}
	
	return {
		path: 'M288.828941,143.781474 C288.810935,64.372232 224.300012,0 144.70257,0 C65.0709159,0 0.52488162,64.372232 0.52488162,143.781474 C0.52488162,212.321324 107.908639,395.435198 137.33172,444.286398 C138.880255,446.874434 141.676623,448.454016 144.694467,448.454016 C147.711411,448.454016 150.517682,446.874434 152.048212,444.295378 C181.453287,395.444178 288.828941,212.321324 288.828941,143.781474 L288.828941,143.781474 Z M143.84038,215.524036 C102.660687,215.524036 69.1323645,182.105249 69.1323645,141.019859 C69.1323645,99.9398813 102.648629,66.515682 143.84038,66.515682 C185.03213,66.515682 218.524882,99.9398813 218.524882,141.019859 C218.524882,182.099837 185.026101,215.524036 143.84038,215.524036 L143.84038,215.524036 Z',
		fillColor: color,
		fillOpacity: 1.0,
		scale: 0.1,
		anchor: new google.maps.Point(130.0, 450.0)	
	};
}

jQuery(document).on('click', '.vd_serviceincenter_wrapper-layout-image-zoom', function() {
	jQuery.fancybox( jQuery('.vd_serviceincenter_wrapper-layout-image img').attr('src'), { helpers: {
		overlay: {
			locked: false
		}
	}
	});
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-freeoffices-list-element-header-price .reserve', function() {
	jQuery(this).parents('.vd_serviceincenter_wrapper-freeoffices-list-element').toggleClass('open');
});

jQuery(document).on('click', '.vd_specialoffer-offers-list-element-header-place .reserve', function() {
	jQuery(this).parents('.vd_specialoffer-offers-list-element').toggleClass('open');
});

jQuery(document).on('change', '.preview', function() {
	if (jQuery(this).is(":checked")) {
		jQuery('.vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit').removeClass('disabled');
		jQuery('.vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform-right button').addClass('disabled');
	} else {
		jQuery('.vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit').addClass('disabled');
		jQuery('.vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform-right button').removeClass('disabled');
	}
});

jQuery(document).ready(function() {
	jQuery('.time').selectmenu({
		position: { my : "center top+12", at: "center bottom" }
	});
	jQuery('.date').datepicker({
		minDate: 0,
		firstDay: 1,
		dateFormat: "dd.mm.yy",
		monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],
		dayNamesMin: [ "вс", "пн", "вт", "ср", "чт", "пт", "сб" ]
	});
	
	$.extend($.datepicker,{_checkOffset:function(inst,offset,isFixed){return { left: offset.left, top: offset.top+12 }}});
	jQuery('.phone').mask('+7 (999) 999-99-99', {placeholder: "+7 (___) ___-__-__"})
	
});

$(function() {
	// your javascript here
});