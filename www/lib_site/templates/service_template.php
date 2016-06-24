<?

	/* populate reverse array for services in office centers: [service_id] => service_in_office_data */

	if (isset($_DATA['office_center2service_group'])) {
		
		foreach($_DATA['office_center2service_group']['items'] as &$service_group) {
			
			$service_groups_reverse[$service_group['service_group_id']] = $service_group;
			
		}
		
		unset($service_group);
		
	}

	/* prepare some needed data */
	
	if ($_POST['type'] == 'previewform') {
		
		$vd_send_form_date = $_POST['date'];
		$vd_send_form_time = $_POST['time'];
		$vd_send_form_name = $_POST['name'];
		$vd_send_form_email = $_POST['email'];
		$vd_send_form_phone = $_POST['phone'];
		
		$vd_send_form_message_text = "Здравствуйте,\r\nНа сайте была оформлена новая заявка на предварительный просмотр офиса.\r\nДата просмотра: $vd_send_form_date\r\nВремя просмотра: $vd_send_form_time\r\nИмя: $vd_send_form_name\r\nЭлектронная почта: $vd_send_form_email\r\nТелефон: $vd_send_form_phone";
		
		mail('e.izmalkova@gmail.com', 'Заявка на просмотр офиса', $vd_send_form_message_text);
		
		mail($vd_send_form_email, 'Ваша заявка принята', 'Ваша заявка на предварительный просмотр офиса была принята');
		
	} elseif ($_POST['type'] == 'reserveform') {
		
		$vd_send_form_name = $_POST['name'];
		$vd_send_form_email = $_POST['email'];
		$vd_send_form_phone = $_POST['phone'];
		$vd_send_form_message = $_POST['message'];
		
		$vd_send_form_message_text = "Здравствуйте,\r\nНа сайте была оформлена новая заявка на бронирование офиса.\r\nИмя: $vd_send_form_name\r\nЭлектронная почта: $vd_send_form_email\r\nТелефон: $vd_send_form_phone";
		
		if ($vd_send_form_message != "") {
			$vd_send_form_message_text = $vd_send_form_message_text . "\r\nСообщение: $vd_send_form_message";
		}
		
		mail('e.izmalkova@gmail.com', 'Заявка на бронирование офиса', $vd_send_form_message_text);
		
		mail($vd_send_form_email, 'Ваша заявка принята', 'Ваша заявка на бронирование офиса была принята');
		
	}
	
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
				<?
						
				foreach ($_DATA['service2service_group']['items'] as $service2service_group_item) {
					
					if ($service2service_group_item['is_inclusive'] === '1') {
						
						$service2service_group_item_service_id = $service2service_group_item['service_id'];
						$service2service_group_item_icon = $_DATA['service']['items'][$service2service_group_item_service_id]['icon_img_src'];
						$service2service_group_item_title = $service2service_group_item['service_id_lookup'];
						$service2service_group_item_desc = $_DATA['service']['items'][$service2service_group_item_service_id]['headline'];
						
						?>
						<div class="vd_serviceincenter_wrapper-about-list-block">
							<div class="vd_serviceincenter_wrapper-about-list-block-image">
								<? echo '<img src="' . $service2service_group_item_icon . '" />'; ?>
							</div>
							<div class="vd_serviceincenter_wrapper-about-list-block-title">
								<span><? echo $service2service_group_item_title; ?></span>
							</div>
							<div class="vd_serviceincenter_wrapper-about-list-block-desc">
								<?echo $service2service_group_item_desc; ?>
							</div>
						</div>
						<?
						
					}
					
				}		
				
				?>
			</div>
			<div class="vd_serviceincenter_wrapper-about-list-sublist payed">
				<div class="vd_serviceincenter_wrapper-about-list-sublist-header">
					За дополнительную плату
				</div>
				<?
						
				foreach ($_DATA['service2service_group']['items'] as $service2service_group_item) {
					
					if ($service2service_group_item['is_inclusive'] === '0') {
						
						$service2service_group_item_service_id = $service2service_group_item['service_id'];
						$service2service_group_item_icon = $_DATA['service']['items'][$service2service_group_item_service_id]['icon_img_src'];
						$service2service_group_item_title = $service2service_group_item['service_id_lookup'];
						$service2service_group_item_desc = $_DATA['service']['items'][$service2service_group_item_service_id]['headline'];
						
						?>
						<div class="vd_serviceincenter_wrapper-about-list-block">
							<div class="vd_serviceincenter_wrapper-about-list-block-image">
								<? echo '<img src="' . $service2service_group_item_icon . '" />'; ?>
							</div>
							<div class="vd_serviceincenter_wrapper-about-list-block-title">
								<span><? echo $service2service_group_item_title; ?></span>
							</div>
							<div class="vd_serviceincenter_wrapper-about-list-block-desc">
								<?echo $service2service_group_item_desc; ?>
							</div>
						</div>
						<?
						
					}
					
				}		
				
				?>
			</div>
		</div>
	</div>
	<div class="vd_serviceincenter_wrapper-gallery">
		<a name="gallery" /></a>
		<h2 class="g-section-title">Галерея</h2>
		<div class="cycle-slideshow"
			data-cycle-timeout="0"
			data-cycle-allow-wrap="false"	
			data-cycle-fx="carousel"
			data-cycle-carousel-fluid="false"
			data-cycle-slides="> a"
		>
		    <div class="cycle-prev"></div>
			<div class="cycle-next"></div>
			<?
			
			foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
				
				if ($office_center_detail['office_center_detail_type_id'] == 'gallery') {
					
					$office_center_detail_body = $office_center_detail['body'];
					
					$office_center_detail_gallery = gallery_html2array($office_center_detail_body);
					
					foreach ($office_center_detail_gallery as $office_center_detail_gallery_item) {
						
						echo '<a href="' . $office_center_detail_gallery_item[1] . '" class="fancybox-thumb" rel="fancybox-thumb"><img src="' . $office_center_detail_gallery_item[2] . '" data-original-src="' . $office_center_detail_gallery_item[1] . '" /></a>';
						
					}
					
				}
				
			}	
				
			?>
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
						<form action="" method="post">
							<input type="hidden" name="type" value="reserveform">
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
							<input type="text" name="phone" class="phone" value="" placeholder="+7 (___) ___-__-__">
							<input type="text" name="email" class="email" value="" placeholder="E-mail">
							<input type="text" name="name" class="name" value="" placeholder="Имя">
							<textarea class="message" name="message" placeholder="Ваше сообщение"></textarea>
							<div class="warning">Обратите внимание! Услуга бронируется <span>только</span> до конца следующего дня</div>
							<button>ЗАБРОНИРОВАТЬ</button>
						</div>
						</form>
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform">
						<form action="" method="post">
							<input type="hidden" name="type" value="previewform">
							
							<input type="hidden" name="name" class="name">
							<input type="hidden" name="email" class="email">
							<input type="hidden" name="phone" class="phone">
							
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-left">
							<p>Перед бронированием вы можете осмотреть выбранный офис. Для этого отметьте удобную дату и время просмотра и наш менеджер свяжется с вами.</p>
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right">
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-preview">
								<label class="preview_label"><input type="checkbox" class="preview"><span></span>Заказать предварительный просмотр офиса</label>
							</div>
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-datetime">
								<label class="date_label">Выберите дату просмотра <input type="text" name="date" class="date" placeholder="Выберите дату"></label><label class="time_label">Время просмотра <select class="time" name="time">
									<option disabled="disabled">Выберите время</option>
									<option value="10.00 – 11.00" selected="selected">10.00 – 11.00</option>
									<option value="12.00 – 13.00">12.00 – 13.00</option>
									<option value="14.00 – 15.00">14.00 – 15.00</option>
									<option value="16.00 – 17.00">16.00 – 17.00</option>
									<option value="17.00 – 18.00">17.00 – 18.00</option>
								</select></label>
							</div>
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-previewform-right-submit disabled">
								ЗАКАЗАТЬ ПРОСМОТР
							</div>
						</div>
						</form>
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