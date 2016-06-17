<?

	/* populate reverse array for services in office centers: [service_id] => service_in_office_data */

	if (isset($_DATA['office_center2service_group'])) {
		
		foreach($_DATA['office_center2service_group']['items'] as &$service_group) {
			
			$service_groups_reverse[$service_group['service_group_id']] = $service_group;
			
		}
		
		unset($service_group);
		
	}

	/* prepare some needed data */
	
	$vd_service_in_center_id = $_GET['service'];
	
	$vd_service_in_center_title = $service_groups_reverse[$vd_service_in_center_id]['service_group_id_lookup'];
	
	$vd_service_in_center_office_title = $service_groups_reverse[$vd_service_in_center_id]['office_center_id_lookup'];

	$vd_service_in_center_price = $service_groups_reverse[$vd_service_in_center_id]['price'];
	
	$vd_service_in_center_price = preg_replace('/( |&nbsp;)(.*)( |&nbsp;)/', ' <span>$2</span> ', $vd_service_in_center_price);
	
	$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_in_center_id]['css_signature'];
	
?>

<div class="vd_serviceincenter_wrapper">
	<div class="vd_serviceincenter_wrapper-header <? echo $vd_service_group_id_css; ?>">
		<div class="g-container">
			<div class="g-container-row">
				<div class="vd_serviceincenter_wrapper-header-price">
					<? echo $vd_service_in_center_price; ?>
				</div>
				<div class="vd_serviceincenter_wrapper-header-logo"></div>
				<div class="vd_serviceincenter_wrapper-header-servicename">
					<? echo $vd_service_in_center_title; ?>
				</div>
				<div class="vd_serviceincenter_wrapper-header-centername">
					в бизнес-центре «<? echo $vd_service_in_center_office_title; ?>»
				</div>
			</div>
		</div>		
	</div>
	<div class="vd_serviceincenter_wrapper-menu">
		<div class="g-container">
			<div class="g-container-row">
				<ul>
					<li><a href="#about">Об услуге</a></li>
					<li><a href="#gallery">Галерея</a></li>
					<li><a href="#layout">План офисов</a></li>
					<li><a href="#freeoffices">Свободные офисы бизнес-центра</a></li>
					<li><a href="#special">Спецпредложения</a></li>
					<li class="helper"></li>
				</ul>
			</div>
		</div>		
	</div>
	<div class="vd_serviceincenter_wrapper-about">
		<a name="about" /></a>
		<h2 class="g-section-title">Об услуге</h2>
		<div class="vd_serviceincenter_wrapper-about-list">
			<div class="vd_serviceincenter_wrapper-about-list-sublist included">
				<div class="vd_serviceincenter_wrapper-about-list-sublist-header">
					В услугу входит
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Секретарь</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Мебель</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Интернет</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Секретарь</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Почтовый адрес</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
			</div>
			<div class="vd_serviceincenter_wrapper-about-list-sublist payed">
				<div class="vd_serviceincenter_wrapper-about-list-sublist-header">
					За дополнительную плату
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Курьер</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Поиск персонала</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Юрист</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Телефония</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>IT-поддержка</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
				<div class="vd_serviceincenter_wrapper-about-list-block">
					<div class="vd_serviceincenter_wrapper-about-list-block-image"></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-title"><span>Юридическая поддержка</span></div>
					<div class="vd_serviceincenter_wrapper-about-list-block-desc">Встреча гостей, организация кофе-брейков, заказ товаров, вызов курьера, работа с корреспонденцией</div>
				</div>
			</div>
		</div>
	</div>
	<div class="vd_serviceincenter_wrapper-gallery">
		<a name="gallery" /></a>
		<h2 class="g-section-title">Галерея</h2>
		<div class="cycle-slideshow"
			data-cycle-timeout="0"
			data-cycle-fx="carousel"
			data-cycle-carousel-visible="3"
			data-cycle-carousel-fluid="true"
		>
		    <div class="cycle-prev"></div>
			<div class="cycle-next"></div>
			<img src="http://malsup.github.io/images/beach3.jpg">
			<img src="http://malsup.github.io/images/beach4.jpg">
			<img src="http://malsup.github.io/images/beach1.jpg">
			<img src="http://malsup.github.io/images/beach2.jpg">
		</div>
	</div>
	<div class="vd_serviceincenter_wrapper-layout">
		<a name="layout" /></a>
		<h2 class="g-section-title">План офисов</h2>
		<div class="vd_serviceincenter_wrapper-layout-image">
			<img src="/images/fake_office_layout.png" />
			<div class="vd_serviceincenter_wrapper-layout-image-zoom">
				увеличить
			</div>
		</div>
		<div class="vd_serviceincenter_wrapper-layout-text">
			<p>Вставить текст про этаж/варианты площадей/переговорные/зоны входа/парковку и инфраструктуру.</p>
			<p>Ссылка на информацию о бизнес-центре</p>
			<p>Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!</p>
		</div>
	</div>
	<div class="vd_serviceincenter_wrapper-freeoffices">
		<a name="freeoffices" /></a>
		<div class="vd_serviceincenter_wrapper-freeoffices-title">Свободные офисы в бизнес-центре «Арма»</div>
		<div class="vd_serviceincenter_wrapper-freeoffices-list">
			<div class="vd_serviceincenter_wrapper-freeoffices-list-element">
				<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header">
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-office">
						<img src="" />
						<span>Офис №21</span>
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-area">
						21 кв. м
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-people">
						до 4 человек
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-price">
						<div class="reserve">ЗАБРОНИРОВАТЬ</div>
						<span class="price"><span>15 990</span> P / место месяц</span>
						<span class="special">+ 4 часа переговорных</span>
					</div>
				</div>
				<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu">
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-title">
						Данные бронирования
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform">
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform-left">
							<table>
								<tr>
									<td>Бизнес-центр</td>
									<td>Арма</td>
								</tr>
								<tr>
									<td>Офис</td>
									<td>21</td>
								</tr>
								<tr>
									<td>Площадь</td>
									<td>21 кв. м</td>
								</tr>
								<tr>
									<td>Рабочих мест</td>
									<td>4</td>
								</tr>
								<tr>
									<td>Стоимость</td>
									<td>15 990 Р / место месяц</td>
								</tr>
								<tr class="special">
									<td></td>
									<td>+ 4 часа переговорных</td>
								</tr>
								<tr class="total">
									<td>Итого</td>
									<td><span>63 960</span> Р/месяц</td>
								</tr>
							</table>
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform-right">
							<input type="text" class="phone" value="" placeholder="+7 (___) ___-__-__">
							<input type="text" class="email" value="" placeholder="E-mail">
							<input type="text" class="name" value="" placeholder="Имя">
							<textarea class="message" placeholder="Ваше сообщение"></textarea>
							<div class="warning">Обратите внимание! Услуга бронируется <span>только</span> до конца следующего дня</div>
							<button>ЗАБРОНИРОВАТЬ</button>
						</div>
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform">
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-left">
							<p>Перед бронированием вы можете осмотреть выбранный офис. Для этого отметьте удобную дату и время просмотра и наш менеджер свяжется с вами.</p>
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right">
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-preview">
								<label class="preview_label"><input type="checkbox" class="preview"><span></span>Заказать предварительный просмотр офиса</label>
							</div>
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-datetime">
								<label class="date_label">Выберите дату просмотра <input type="text" class="date" placeholder="Выберите дату"></label><label class="time_label">Время просмотра <select class="time">
									<option disabled="disabled">Выберите время</option>
									<option value="volvo" selected="selected">10.00 – 11.00</option>
									<option value="volvo">12.00 – 13.00</option>
									<option value="volvo">14.00 – 15.00</option>
									<option value="volvo">16.00 – 17.00</option>
									<option value="volvo">17.00 – 18.00</option>
								</select></label>
							</div>
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit disabled">
								ЗАКАЗАТЬ ПРОСМОТР
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="vd_serviceincenter_wrapper-special">
		<a name="special" /></a>
		<h2 class="g-section-title">Cпецпредложения</h2>
		<div class="vd_serviceincenter_wrapper-special-list">
			<div class="vd_serviceincenter_wrapper-special-list-item office">
				<div class="vd_serviceincenter_wrapper-special-list-item-text"><!--
					--><span>Получите скидку 10% на аренду офиса</span>
				</div>
				<div class="vd_serviceincenter_wrapper-special-list-item-date">
					1 февраля – 29 апреля 2016
				</div>
				<a href="" class="vd_serviceincenter_wrapper-special-list-item-details">
					<span>Подробнее</span>
				</a>
			</div>
			<div class="vd_serviceincenter_wrapper-special-list-item virtual">
				<div class="vd_serviceincenter_wrapper-special-list-item-text"><!--
					--><span>Виртуальный офис + 4 часа переговорных в подарок</span>
				</div>
				<div class="vd_serviceincenter_wrapper-special-list-item-date">
					20 марта – 18 мая  2016
				</div>
				<a href="" class="vd_serviceincenter_wrapper-special-list-item-details">
					<span>Подробнее</span>
				</a>
			</div>
			<div class="vd_serviceincenter_wrapper-special-list-item negotiating">
				<div class="vd_serviceincenter_wrapper-special-list-item-text"><!--
					--><span>Акция февраля – скидка 70% на аренду переговорных</span>
				</div>
				<div class="vd_serviceincenter_wrapper-special-list-item-date">
					1 февраля – 29 апреля 2016
				</div>
				<a href="" class="vd_serviceincenter_wrapper-special-list-item-details">
					<span>Подробнее</span>
				</a>
			</div>
		</div>		
	</div>
</div>