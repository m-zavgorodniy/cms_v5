var MOBILE_WIDTH = 767;

$( document ).ready(function() {
	$('.header-menu').click(function(e) {
		$('.header-menu').toggleClass('open_menu');
		$('.header-menu ul').css('display', 'block');
		$('.header-phone').removeClass('open_menu_phone');
	});

	$('.header-menu li').click(function(e) {
		e.stopPropagation();
	});
	
	$('.header-phone').click(function() {
		$('.header-phone').toggleClass('open_menu_phone');
		$('.header-phone-number').css('display', 'block');
		$('.header-phone-button.g-button').css('display', 'block');
		$('.header-menu').removeClass('open_menu');
	});

	$('.header-phone-number').click(function(e) {
		e.stopPropagation();
	});

	// scroll to ancors
	$('a[href*="#"]:not([href="#"])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if (target.length) {
				$('html, body').animate({
					scrollTop: target.offset().top
				}, 1000);
				return false;
			}
		}
	});
	$('.scroll_to_top').click(function(){
		$('html, body').animate({
			scrollTop: 0
		}, 1000);
		return false;
	});
});

jQuery.fn.outerHTML = function(s) {
    return this[0].outerHTML ? this[0].outerHTML :
           s ? this.before(s).remove()
             : jQuery("<p>").append(this.eq(0).clone()).html();
};


function initMap() {
	
	if (jQuery('#vd_about_wrapper-contacts-inner-map').length > 0) {
		
		map = new google.maps.Map(document.getElementById('vd_about_wrapper-contacts-inner-map'), {
			center: {lat: 55.754364, lng: 37.62511},
			zoom: 17,
			scrollwheel: false,
			//styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
		});
		
		var marker = new google.maps.Marker({
			position: {lat: 55.754364, lng: 37.62511},
			title: '',
			icon: vd_get_pin("#578f0b"),
			map: map
		});

		calculateAndDisplayRoute(3, map);

	}
	
	if (jQuery('#vd_mapwrapper-map').length > 0) {

		isDraggable = ($(document.body).width() > MOBILE_WIDTH);

		map = new google.maps.Map(document.getElementById('vd_mapwrapper-map'), {
			center: {lat: 55.757761, lng: 37.644837},
			zoom: 11,
			scrollwheel: false,
			draggable: isDraggable,
//			styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
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
				disableAutoPan: true,
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
				
				var link = jQuery('a', jQuery('.vd_officelistwrapper-office')[i]).attr('href');
				
				var coordinates_array = coordinates.split(',');
				var marker = new google.maps.Marker({
					position: {lat: parseFloat(coordinates_array[0]), lng: parseFloat(coordinates_array[1])},
					title: '',
					icon: vd_get_pin(color)
				});
				
				markers.push(marker);
				
				var content_string = '<a href="' + link + '"><div class="vd_officeinfowindow-header" style="background-color: ' + color + ';"><p>' + jQuery('.vd_officelistwrapper-office-name', jQuery('.vd_officelistwrapper-office')[i]).text() + '</p></div>' + jQuery('.vd_officelistwrapper-office-services', jQuery('.vd_officelistwrapper-office')[i]).outerHTML() + '</a>';
				
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

			map.setZoom(19);

			var coordinates = jQuery('.vd_singleofficewrapper-content-contacts-coordinates').val();
			
			var color = jQuery('.vd_singleofficewrapper-content-contacts-color').val();
	
			var coordinates_array = coordinates.split(',');
	
			map.setCenter({lat: parseFloat(coordinates_array[0]), lng: parseFloat(coordinates_array[1])});
	
			var marker = new google.maps.Marker({
				position: {lat: parseFloat(coordinates_array[0]), lng: parseFloat(coordinates_array[1])},
				title: '',
				icon: vd_get_pin(color),
				map: map
			});

			calculateAndDisplayRoute(jQuery('#vd_mapwrapper-map').attr("data-id"), map);
	
		}
		
	}
	
}

function calculateAndDisplayRoute(id, map) {
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
  var routes = {};
  var markers = {};
  routes[1] = {
    origin: {"lat": 55.819665, "lng": 37.640518},
    destination: {"lat": 55.817326, "lng": 37.655099}
  };
  markers[1] = {
    origin: {
    	position: {lat: 55.819665, lng: 37.640518},
    	icon:'/images/maps/or-3-3.png'
    }
  };

  routes[2] = {
    origin: {"lat": 55.708573, "lng": 37.657297},
    destination: {"lat": 55.7090415, "lng": 37.6532068}
  };
  markers[2] = {
    origin: {
    	position: {lat: 55.708611, lng: 37.657331},
    	icon:'/images/maps/or-1-2.png'
    }/*,
    destination: {
    	position: {lat: 55.708689, lng: 37.653165},
    	icon:'/images/maps/de-1.png'
    }*/
  };

  routes[3] = {
    origin: {"lat": 55.756376, "lng": 37.623248},
    destination: {"lat": 55.754386, "lng": 37.625434}
  };
  routes[5] = {
    origin: {"lat": 55.760205, "lng": 37.661732},
    destination: {"lat": 55.759550, "lng": 37.665019}
  };
  markers[5] = {
    origin: {
    	position: {lat: 55.760005, lng: 37.661732},
    	icon:'/images/maps/or-4-4.png'
    }
  };

  jQuery.extend(routes[id], {travelMode: google.maps.TravelMode.WALKING})
  if (undefined !== routes[id]) {
	  directionsService.route(
	  	routes[id],
	  	function(response, status) {
	      if (status === google.maps.DirectionsStatus.OK) {
	        directionsDisplay.setDirections(response);
	      } else {
	      }
	    });
	  if (undefined !== markers[id]) {
	  	if (undefined !== markers[id].origin) {
	  		var marker=new google.maps.Marker(markers[id].origin);
	  		marker.setMap(map);
	  	}
	  	if (undefined !== markers[id].destination) {
	  		var marker2=new google.maps.Marker(markers[id].destination);
	  		marker2.setMap(map);
	    }
	  }
	  directionsDisplay.setMap(map);
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

jQuery(document).on('click', 'button.consultation', function(e) {
	e.preventDefault();
	var url = jQuery(this).data('url');
	window.location.href = url;
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-layout-image-zoom', function() {
	var $imgContainer = jQuery(this).closest('.vd_serviceincenter_wrapper-layout-image');
	jQuery.fancybox( jQuery('img', $imgContainer).data('src-big'), { helpers: {
		overlay: {
			locked: false
		}
	}
	});
});

jQuery(document).on('click',
	'.vd_serviceincenter_wrapper-freeoffices-list-element-header-office, .vd_serviceincenter_wrapper-meetingrates-list-item-header-photo',
	function() {
	jQuery.fancybox( $(this).attr("href"), { helpers: {
		overlay: {
			locked: false
		}
	}
	});
	return false;
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-freeoffices-list-element-header-price .reserve', function() {
	//jQuery(this).parents('.vd_serviceincenter_wrapper-freeoffices-list-element').toggleClass('open');
    var $block = jQuery(this).closest(".vd_serviceincenter_wrapper-freeoffices-list-element");
    $block.toggleClass('open');
	//jQuery(".preview_label", $block).click();   
});

jQuery(document).on('click', '.vd_specialoffer-offers-list-element-header-place .reserve', function() {
	jQuery(this).parents('.vd_specialoffer-offers-list-element').toggleClass('open');
});

jQuery(document).on('change', '.preview', function() {
	if (jQuery(this).is(":checked")) {
		jQuery('.vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit').removeClass('disabled');
		jQuery('.serviceincente-book button').addClass('disabled');
	} else {
		jQuery('.vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit').addClass('disabled');
		jQuery('.serviceincente-book button').removeClass('disabled');
	}
});

jQuery(document).ready(function() {
	
	jQuery('.vd_serviceincenter_wrapper-virtualrates-list-form select').selectmenu({
		position: { my : "center top+12", at: "center bottom" }
	});
	
	jQuery('.vd_serviceincenter_wrapper-meetingrates-list-item-form-left select').selectmenu({
		position: { my : "center top+12", at: "center bottom" }
	});
	
	jQuery('.time').selectmenu({
		position: { my : "center top+12", at: "center bottom" }
	});
	jQuery('.date').datepicker({
		minDate: 0,
		firstDay: 1,
		dateFormat: "dd.mm.yy",
		monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ],
		dayNamesMin: [ "вс", "пн", "вт", "ср", "чт", "пт", "сб" ],
		beforeShowDay: jQuery.datepicker.noWeekends
	});
	
	$.extend($.datepicker,{_checkOffset:function(inst,offset,isFixed){return { left: offset.left, top: offset.top+12 }}});
	jQuery('.phone').mask('+7 (999) 999-99-99', {placeholder: "+7 (___) ___-__-__"})
	
	jQuery(".fancybox-thumb").fancybox({
		margin		: [25, 0, 60, 0],
		prevEffect	: 'none',
		nextEffect	: 'none',
		helpers	: {
			title	: {
				type: 'outside'
			},
			thumbs	: {
				width	: 50,
				height	: 50
			},
			overlay: {
				locked: false
    		}
		}
	});
	
});

function validateEmail($email) {
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	return emailReg.test($email);
}

/* enable the preview office form */

jQuery(document).on('click', '.vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit', function(){
	if (jQuery(this).hasClass('disabled') == false) {
		
		var send = true;

		var $form = jQuery(this).parents('form');
		
		if (jQuery('input.date', jQuery(this).parents('form')).val().length < 10) {
			send = false;
			jQuery('input.date', jQuery(this).parents('form')).addClass('error');
		}
		
		if (jQuery('select.time', jQuery(this).parents('form')).val().length != 13) {
			send = false;
			jQuery('select.time', jQuery(this).parents('form')).addClass('error');
		}
		
		if (jQuery('input.phone', jQuery(this).parents('form')).val().length < 18) {
			send = false;
			jQuery('input.phone', jQuery(this).parents('form')).addClass('error');
		}
		
		if (validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()) == false) {
			send = false;
			console.log(validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()));
			jQuery('input.email', jQuery(this).parents('form')).addClass('error');
		}
		
		if (jQuery('input.email', jQuery(this).parents('form')).val().length == 0) {
			send = false;
			console.log(jQuery('input.email', jQuery(this).parents('form')).val().length);
			jQuery('input.email', jQuery(this).parents('form')).addClass('error');
		}
		
		if (jQuery('input.name', jQuery(this).parents('form')).val().length < 2) {
			send = false;
			jQuery('input.name', jQuery(this).parents('form')).addClass('error');
		}
		
		if (send == true) {
			jQuery('.form_type', jQuery(this).parents('form')).val('previewform');
			var $button = jQuery(this);
			loader_add($button);
	
			var url_ajax = document.location.href + '?ajax_inner=1';
			var form_data = $form.serialize();
			jQuery.post(url_ajax, form_data, function(message) {
				loader_remove($button);
				vd_fake_alert(message);
			});
			
		} else {
			return false;
		}
		
	}
});

/* enable the reverse office form */

jQuery(document).on('click', '.serviceincente-book button', function(e){
	
	e.preventDefault();
	
	if (jQuery(this).hasClass('disabled') == true) {
		return false;
	}
	
	var send = true;

	var $form = jQuery(this).parents('form');
	
	if (jQuery('input.phone', jQuery(this).parents('form')).val().length < 18) {
		send = false;
		jQuery('input.phone', jQuery(this).parents('form')).addClass('error');
	}
	
	if (validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()) == false) {
		send = false;
		console.log(validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()));
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.email', jQuery(this).parents('form')).val().length == 0) {
		send = false;
		console.log(jQuery('input.email', jQuery(this).parents('form')).val().length);
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.name', jQuery(this).parents('form')).val().length < 2) {
		send = false;
		jQuery('input.name', jQuery(this).parents('form')).addClass('error');
	}
	
	if (send == true) {
		jQuery('.form_type', jQuery(this).parents('form')).val('reserveform');
		var $button = jQuery(this);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(message) {
			loader_remove($button);
			vd_fake_alert(message);
		});
		
	}
	
});



jQuery(document).on('click', '.vd_services2_list-item', function() {

	jQuery('.vd_services2_list-item-wrapper').hide();
	jQuery(this).children('.vd_services2_list-item-wrapper').show();
	jQuery('html, body').animate({
        scrollTop: jQuery(this).children('.vd_services2_list-item-wrapper').offset().top - 50
    }, 600);


	/* close service details pop-ups when clicked outside of them */

	jQuery(document).on('click.hideserviceinfo', function(e){

		if (jQuery('.vd_services2_list-item-wrapper:visible').length &&
			jQuery(e.target).closest('.vd_services2_list-item-wrapper').length === 0) {
	
			jQuery('.vd_services2_list-item-wrapper:visible .vd_services2_list-item-wrapper-close').click();
		}

	});

});

jQuery(document).on('click', '.vd_services2_list-item-wrapper-close', function() {
	jQuery(this).parents('.vd_services2_list-item-wrapper').hide();
	jQuery(document).off('click.hideserviceinfo');

	return false;
});

jQuery(document).on('focus', 'input.phone, input.email, input.name, textarea.message, input.date, select.time', function(){
	jQuery(this).removeClass('error');
});

/* opening the subservice menu when clicking on the service icon */
/* initializing the fake scrollbar for the subservice list, if it wasn't already */

jQuery(document).on('click', '.vd_subservice_list-item-with-sublist', function() {
	jQuery(this).toggleClass('open');
	console.log(jQuery(this).next('.vd_subservice_list-item-sublist'));
	jQuery(this).next('.vd_subservice_list-item-sublist').toggleClass('closed');
	if (jQuery(this).next('.vd_subservice_list-item-sublist').hasClass('jspScrollable') == false) {
		jQuery(this).next('.vd_subservice_list-item-sublist').jScrollPane();
	}
	return false;
});

/* about us contacts form interactivity */

jQuery(document).on('submit', '.vd_about_wrapper-contacts-inner-data-form form', function(e) {
	
 	e.preventDefault();
	
	var send = true;

	var $form = jQuery(this);
	
	var $email = jQuery('[name="about_contacts_email"]', jQuery(this));
	var $name = jQuery('[name="about_contacts_name"]', jQuery(this));
	var $message = jQuery('[name="about_contacts_message"]', jQuery(this));
	if (validateEmail($email.val()) == false) {
		send = false;
		$email.addClass('error');
	}
	
	if ($email.val().length == 0) {
		send = false;
		$email.addClass('error');
	}
	
	if ($name.val().length < 2) {
		send = false;
		$name.addClass('error');
	}
	
	if ($message.val().length == 0) {
		send = false;
		$message.addClass('error');
	}

	if (send == true) {
		var $button = jQuery("button", $form);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(data) {
			var r = $.parseJSON(data);
			loader_remove($button);
			vd_fake_alert(r.message);
			if (0 === r.code) {
				dataLayer = window.dataLayer || [];
				dataLayer.push({"event": "form_contacts"});
			}
		});
		
	}
	
});

/* special offers form interactivity */

jQuery(document).on('submit', '.vd_specialoffer-offers-list-element-menu form', function(e) {

	var send = true;

	var $form = jQuery(this);
	
	if (jQuery('input.phone', $form).val().length < 18) {
		send = false;
		jQuery('input.phone', $form).addClass('error');
	}
	
	if (validateEmail(jQuery('input.email', $form).val()) == false) {
		send = false;
		jQuery('input.email', $form).addClass('error');
	}
	
	if (jQuery('input.email', $form).val().length == 0) {
		send = false;
		jQuery('input.email', $form).addClass('error');
	}
	
	if (jQuery('input.name', $form).val().length < 2) {
		send = false;
		jQuery('input.name', $form).addClass('error');
	}
	
	if (jQuery('textarea.message', $form).val().length == 0) {
		send = false;
		jQuery('textarea.message', $form).addClass('error');
	}
	
	if (send == true) {
		var $button = jQuery("button", $form);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(data) {
			var r = $.parseJSON(data);
			loader_remove($button);
			vd_fake_alert(r.message);
			if (0 === r.code) {
				dataLayer = window.dataLayer || [];
				dataLayer.push({"event": "form_skidka_" + r.data.bc_gtm_id});
			}
		});
		
	}

	return false;
	
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-virtualrates-list-header .reserve', function(){
	jQuery('.vd_serviceincenter_wrapper-virtualrates-list-header .reserve').removeClass('active');
	jQuery(this).addClass('active');
	var virtual_form_id = jQuery(this).data('virtual-form-id');
	jQuery('.vd_serviceincenter_wrapper-virtualrates-list-form').removeClass('open');
	jQuery('.vd_serviceincenter_wrapper-virtualrates-list-form[data-virtual-form="' + virtual_form_id + '"]').addClass('open');
	jQuery('html, body').animate({
        scrollTop: jQuery('.vd_serviceincenter_wrapper-virtualrates-list-form.open').offset().top
    }, 600);
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-virtualrates-list-form button.book', function(e){
	
	e.preventDefault();
	
	var send = true;

	var $form = jQuery(this).parents('form');
	
	if (jQuery('input.phone', jQuery(this).parents('form')).val().length < 18) {
		send = false;
		jQuery('input.phone', jQuery(this).parents('form')).addClass('error');
	}
	
	if (validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()) == false) {
		send = false;
		console.log(validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()));
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.email', jQuery(this).parents('form')).val().length == 0) {
		send = false;
		console.log(jQuery('input.email', jQuery(this).parents('form')).val().length);
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.name', jQuery(this).parents('form')).val().length < 2) {
		send = false;
		jQuery('input.name', jQuery(this).parents('form')).addClass('error');
	}

	if (send == true) {
		var $button = jQuery(this);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(message) {
			loader_remove($button);
			vd_fake_alert(message);
		});
		
	}
	
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-coworkingrates-list-item button', function(e) {
	e.preventDefault();
	jQuery('.vd_serviceincenter_wrapper-coworkingrates-list-item').removeClass('open');
	jQuery(this).parents('.vd_serviceincenter_wrapper-coworkingrates-list-item').addClass('open');
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-coworkingrates-list-item .coworking_submit', function(e) {
	e.preventDefault();
	
	var send = true;

	var $form = jQuery(this).parents('form');
	
	if (jQuery('input.phone', jQuery(this).parents('form')).val().length < 18) {
		send = false;
		jQuery('input.phone', jQuery(this).parents('form')).addClass('error');
	}
	
	if (validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()) == false) {
		send = false;
		console.log(validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()));
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.email', jQuery(this).parents('form')).val().length == 0) {
		send = false;
		console.log(jQuery('input.email', jQuery(this).parents('form')).val().length);
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.name', jQuery(this).parents('form')).val().length < 2) {
		send = false;
		jQuery('input.name', jQuery(this).parents('form')).addClass('error');
	}

	if (send == true) {
		var $button = jQuery(this);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(message) {
			loader_remove($button);
			vd_fake_alert(message);
		});
		
	}

});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-virtualrates table th.label', function() {
	jQuery('.vd_serviceincenter_wrapper-virtualrates-list-header tr.details').toggleClass('open');
	jQuery(this).toggleClass('open');
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-virtualrates-details-list-item-header', function() {
	jQuery(this).parent().toggleClass('open');
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-meetingrates-list-item button', function(e) {
	e.preventDefault();
	jQuery('.vd_serviceincenter_wrapper-coworkingrates-list-item').removeClass('open');
	jQuery('.vd_serviceincenter_wrapper-meetingrates-list-item button').removeClass('active');
	jQuery(this).addClass('active');
	jQuery(this).parents('.vd_serviceincenter_wrapper-meetingrates-list-item').addClass('open');
});

jQuery(document).on('click', '.vd_serviceincenter_wrapper-meetingrates-list-item .meeting_submit', function(e){
	
	e.preventDefault();
	
	var send = true;

	var $form = jQuery(this).parents('form');
	
	if (jQuery('input.phone', jQuery(this).parents('form')).val().length < 18) {
		send = false;
		jQuery('input.phone', jQuery(this).parents('form')).addClass('error');
	}
	
	if (validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()) == false) {
		send = false;
		console.log(validateEmail(jQuery('input.email', jQuery(this).parents('form')).val()));
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.email', jQuery(this).parents('form')).val().length == 0) {
		send = false;
		console.log(jQuery('input.email', jQuery(this).parents('form')).val().length);
		jQuery('input.email', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.name', jQuery(this).parents('form')).val().length < 2) {
		send = false;
		jQuery('input.name', jQuery(this).parents('form')).addClass('error');
	}
	
	if (jQuery('input.date', jQuery(this).parents('form')).val().length == 0) {
		send = false;
		jQuery('input.date', jQuery(this).parents('form')).addClass('error');
	}

	if (send == true) {
		var $button = jQuery(this);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(message) {
			loader_remove($button);
			vd_fake_alert(message);
		});
		
	}

	
});

/* a basic function to format numbers with spaces as thousands separators */

function formatNumber (num) {

    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1 ")

}

/* change the total coworking price in the coworking service form, when the user updates the workplace count */

jQuery(document).on('change', '.coworking_workplaces', function() {

	var value = jQuery(this).val();

	var base_price = jQuery(this).parents('form').find('input[name="coworking_price"]').val();

	var new_value = base_price * value;

	jQuery(this).parents('form').find('.total_coworking_price').text(formatNumber(new_value));

});

/* change the total meeting price in the meeting service form, when the user updates the hours count */

jQuery(document).on('selectmenuchange', 'select.meeting_duration', function() {

	var value = parseInt(jQuery(this).val());

	var base_price = jQuery(this).parents('form').find('input[name="meeting_price"]').val();

	var new_value = base_price * value;

	jQuery(this).parents('form').find('.total_meeting_price').text(formatNumber(new_value));

});

/* change the total virtual office price in the virual office service form, when the user updates the months count */

jQuery(document).on('selectmenuchange', 'select.virtual_office_term', function() {

	var value = jQuery(this).val();

	var base_price = jQuery(this).parents('form').find('input[name="virtual_office_price"]').val();

	var new_value = base_price * value;

	jQuery(this).parents('form').find('.total_virtual_office_price').text(formatNumber(new_value));

});

/* change the office center id and name, when the user changes the office center in the virtual office select menu */

jQuery(document).on('selectmenuchange', 'select.business_center_select', function() {

	var value = jQuery(this).val();

	var text = jQuery('option:selected', jQuery(this)).text();

	jQuery(this).parents('form').find('input[name="business_center_id"]').val(value);

	jQuery(this).parents('form').find('input[name="business_center"]').val(text);

});

jQuery(document).ready(function(){
	jQuery('.tooltip').tooltipster({
    	contentCloning: true,
    	theme: 'tooltipster-shadow',
    	trigger: 'click',
    	side: ['right', 'bottom'],
    	functionBefore: function(instance, helper) {
	    	jQuery(helper.origin).addClass('active');
    	},
    	functionAfter: function(instance, helper) {
	    	var item = instance._$origin[0];
	    	jQuery(item).removeClass('active');
    	}
	});
});

/* Check to see if the window is top, if not then display button */

jQuery(window).scroll(function(){
	if (jQuery(this).scrollTop() > 500) {
		jQuery('.scroll_to_top').fadeIn();
	} else {
		jQuery('.scroll_to_top').fadeOut();
	}
});

/* request form scripting */

jQuery(document).on('submit', '.vd_request_wrapper-form form', function(e) {
	
	e.preventDefault();
	
	var send = true;

	var $form = jQuery(this);
	
	if (jQuery('input.phone', $form).val().length < 18) {
		send = false;
		jQuery('input.phone', $form).addClass('error');
	}
	
	if (validateEmail(jQuery('input.email', $form).val()) == false) {
		send = false;
		console.log(validateEmail(jQuery('input.email', $form).val()));
		jQuery('input.email', $form).addClass('error');
	}
	
	if (jQuery('input.email', $form).val().length == 0) {
		send = false;
		console.log(jQuery('input.email', $form).val().length);
		jQuery('input.email', $form).addClass('error');
	}
	
	if (jQuery('input.name', $form).val().length < 2) {
		send = false;
		jQuery('input.name', $form).addClass('error');
	}

	if (send == true) {
		var $button = jQuery('button', $form);
		loader_add($button);

		var url_ajax = document.location.href + '?ajax_inner=1';
		var form_data = $form.serialize();
		jQuery.post(url_ajax, form_data, function(data) {
			var r = $.parseJSON(data);
			loader_remove($button);
			vd_fake_alert(r.message);
			if (0 === r.code) {
				dataLayer = window.dataLayer || [];
				dataLayer.push({"event": r.data.mode});
			}
		});
		
	}

});

jQuery(document).on('click', 'form[name="subscribe"] button', function(){

	var $input = jQuery('[name="email"]', jQuery(this).parents('form'));
	var email = $input.val();

	if ('' === $.trim(email) || !(/[^\s@]+@[^\s@]+\.[^\s@]+/.test(email))) {
		$input.addClass('error');
	} else {
		$input.removeClass('error');

		var $button = jQuery(this);
		loader_add($button);

		var jqxhr = $.post("/ajax/send_deck.php", {email: email}, function() {
			vd_fake_alert("Спасибо! Ваш адрес добавлен.");
		});
		jqxhr.fail(function() {
			vd_fake_alert("Ошибка! Пожалуйста, попробуйте подписаться чуть позже.");
		});
        loader_remove($button);
	}

	return false;
});

jQuery(document).on("change", "[name='additionalservice']", function() {
	var $options = $(".additionalservice-options", $(this.form)); 
	if ($(this).is(":checked")) {
		$options.fadeIn();
	} else {
		$options.fadeOut();
	}
});

function vd_fake_alert(message) {
	jQuery('.vd_fake_ajax_alert').remove();
	jQuery('<div class="vd_fake_ajax_alert">' + message + '<div class="vd_fake_ajax_alert-close">Закрыть</div></div>').appendTo('body');
}

jQuery(document).on('click', '.vd_fake_ajax_alert-close', function(){
	jQuery(this).parent().remove();
});

$(function() {
	// your javascript here
});

function loader_add(obj) {
	obj.prop("disabled", true);
	obj.attr("data-label", obj.html());
	obj.html('');
	obj.addClass("g-loader");
}
function loader_remove(obj) {
	obj.prop("disabled", false);
	obj.html(obj.attr("data-label"));
	obj.removeClass("g-loader");
}
