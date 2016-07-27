<?

	/* populate reverse array for services in office centers: [service_id] => service_in_office_data */

	if (isset($_DATA['office_center2service_group'])) {
		
		foreach($_DATA['office_center2service_group']['items'] as &$service_group) {
			
			$service_groups_reverse[$service_group['service_group_id']] = $service_group;
			
		}
		
		unset($service_group);
		
	}

	/* prepare some needed data */
	
	if ($_POST['form_type'] == 'previewform') {
		
		$vd_send_form_date = $_POST['date'];
		$vd_send_form_time = $_POST['time'];
		$vd_send_form_name = $_POST['name'];
		$vd_send_form_email = $_POST['email'];
		$vd_send_form_phone = $_POST['phone'];
		
		$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на предварительный просмотр офиса.";
		
		$vd_send_form_manager_message_text .= "\r\n";
		
		$vd_send_form_manager_message_text .= "\r\nДанные объекта";
		$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $_POST['business_center'];
		$vd_send_form_manager_message_text .= "\r\nОфис: " . $_POST['office_number'];
		$vd_send_form_manager_message_text .= "\r\nПлощадь: " . $_POST['office_area'];
		$vd_send_form_manager_message_text .= "\r\nРабочих мест: " . $_POST['office_seats_num'];
		
		$vd_send_form_manager_message_text .= "\r\n";
		
		$vd_send_form_manager_message_text .= "\r\nДанные заявки";
		$vd_send_form_manager_message_text .= "\r\nДата просмотра: " . $vd_send_form_date;
		$vd_send_form_manager_message_text .= "\r\nВремя просмотра: " . $vd_send_form_time;
		$vd_send_form_manager_message_text .= "\r\nИмя: " . $vd_send_form_name;
		$vd_send_form_manager_message_text .= "\r\nЭлектронная почта: " . $vd_send_form_email;
		$vd_send_form_manager_message_text .= "\r\nТелефон: " . $vd_send_form_phone;
		
		$vd_send_form_customer_message_text .= "Здравствуйте,\r\nВаша заявка на предварительный просмотр офиса была получена.";
		
		$vd_send_form_customer_message_text .= "\r\n";
		
		$vd_send_form_customer_message_text .= "\r\nДанные объекта";
		$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $_POST['business_center'];
		$vd_send_form_customer_message_text .= "\r\nОфис: " . $_POST['office_number'];
		$vd_send_form_customer_message_text .= "\r\nПлощадь: " . $_POST['office_area'];
		$vd_send_form_customer_message_text .= "\r\nРабочих мест: " . $_POST['office_seats_num'];
		$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $_POST['office_cost_seat'];
		$vd_send_form_customer_message_text .= "\r\nИтого: " . $_POST['office_cost_total'];
		
		$vd_send_form_customer_message_text .= "\r\n";
		
		$vd_send_form_customer_message_text .= "\r\nВаши данные";
		$vd_send_form_customer_message_text .= "\r\nИмя: " . $vd_send_form_name;
		$vd_send_form_customer_message_text .= "\r\nЭлектронная почта: " . $vd_send_form_email;
		$vd_send_form_customer_message_text .= "\r\nТелефон: " . $vd_send_form_phone;
		$vd_send_form_customer_message_text .= "\r\nДата просмотра: " . $vd_send_form_date;
		$vd_send_form_customer_message_text .= "\r\nВремя просмотра: " . $vd_send_form_time;
		
		mail('e.izmalkova@gmail.com', 'Заявка на просмотр офиса', $vd_send_form_manager_message_text);
		
		//mail('yojmm@yandex.ru', 'Заявка на просмотр офиса', $vd_send_form_manager_message_text);
		
		mail($vd_send_form_email, 'Ваша заявка принята', $vd_send_form_customer_message_text);

		$db_data = array(
			'office_center_id' => $_POST['business_center_id'],
			'service_group_id' => $_POST['business_center_service_group_id'],
			'office_center_room_id' => $_POST['business_center_room_id'],
			'name' => $vd_send_form_name,
			'email' => $vd_send_form_email,
			'phone' => $vd_send_form_phone,
			'message' => $_POST['message'],
			'office_seat_num' => $_POST['office_seats_num'],
			'office_seat_price' => $_POST['office_cost_seat'],
			'office_price_total' => $_POST['office_cost_total'],
			'viewing_needed' => 1,
			'viewing_date' => $vd_send_form_date,
			'viewing_time' => $vd_send_form_time
		);
		
		db_insert_booking($db_data);
		
	} elseif ($_POST['form_type'] == 'reserveform') {
		
		$vd_send_form_name = $_POST['name'];
		$vd_send_form_email = $_POST['email'];
		$vd_send_form_phone = $_POST['phone'];
		$vd_send_form_message = $_POST['message'];
		
		$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на бронирование офиса.";
		
		$vd_send_form_manager_message_text .= "\r\n";
		
		$vd_send_form_manager_message_text .= "\r\nВы забронировали";
		$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $_POST['business_center'];
		$vd_send_form_manager_message_text .= "\r\nОфис: " . $_POST['office_number'];
		$vd_send_form_manager_message_text .= "\r\nПлощадь: " . $_POST['office_area'];
		$vd_send_form_manager_message_text .= "\r\nРабочих мест: " . $_POST['office_seats_num'];
		$vd_send_form_manager_message_text .= "\r\nСтоимость: " . $_POST['office_cost_seat'];
		$vd_send_form_manager_message_text .= "\r\nИтого: " . $_POST['office_cost_total'];
		
		$vd_send_form_manager_message_text .= "\r\n";
		
		$vd_send_form_manager_message_text .= "\r\nДанные заявки";
		$vd_send_form_manager_message_text .= "\r\nИмя: " . $vd_send_form_name;
		$vd_send_form_manager_message_text .= "\r\nЭлектронная почта: " . $vd_send_form_email;
		$vd_send_form_manager_message_text .= "\r\nТелефон: " . $vd_send_form_phone;
		
		$vd_send_form_customer_message_text .= "Здравствуйте,\r\nВаша заявка на бронирование офиса была получена.";
		
		$vd_send_form_customer_message_text .= "\r\n";
		
		$vd_send_form_customer_message_text .= "\r\nДанные объекта";
		$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $_POST['business_center'];
		$vd_send_form_customer_message_text .= "\r\nОфис: " . $_POST['office_number'];
		$vd_send_form_customer_message_text .= "\r\nПлощадь: " . $_POST['office_area'];
		$vd_send_form_customer_message_text .= "\r\nРабочих мест: " . $_POST['office_seats_num'];
		$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $_POST['office_cost_seat'];
		$vd_send_form_customer_message_text .= "\r\nИтого: " . $_POST['office_cost_total'];
		
		$vd_send_form_customer_message_text .= "\r\n";
		
		$vd_send_form_customer_message_tomorrow = new DateTime('tomorrow');
		
		$vd_send_form_customer_message_text .= "\r\nБронь сохраняется до вечера " . $vd_send_form_customer_message_tomorrow->format('d.m.Y');
		
		$vd_send_form_customer_message_text .= "\r\n";
		
		$vd_send_form_customer_message_text .= "\r\nВаши данные";
		$vd_send_form_customer_message_text .= "\r\nИмя: " . $vd_send_form_name;
		$vd_send_form_customer_message_text .= "\r\nЭлектронная почта: " . $vd_send_form_email;
		$vd_send_form_customer_message_text .= "\r\nТелефон: " . $vd_send_form_phone;
		
		if ($vd_send_form_message != "") {
			$vd_send_form_manager_message_text .= "\r\nСообщение: $vd_send_form_message";
			$vd_send_form_customer_message_text .= "\r\nСообщение: $vd_send_form_message";
		}
		
		mail('e.izmalkova@gmail.com', 'Заявка на бронирование офиса', $vd_send_form_manager_message_text);
		
		//mail('yojmm@yandex.ru', 'Заявка на бронирование офиса', $vd_send_form_manager_message_text);
		
		mail($vd_send_form_email, 'Ваша заявка принята', $vd_send_form_customer_message_text);
		
		$db_data = array(
			'office_center_id' => $_POST['business_center_id'],
			'service_group_id' => $_POST['business_center_service_group_id'],
			'office_center_room_id' => $_POST['business_center_room_id'],
			'name' => $vd_send_form_name,
			'email' => $vd_send_form_email,
			'phone' => $vd_send_form_phone,
			'message' => $_POST['message'],
			'office_seat_num' => $_POST['office_seats_num'],
			'office_seat_price' => $_POST['office_cost_seat'],
			'office_price_total' => $_POST['office_cost_total'],
			'viewing_needed' => 0,
			'viewing_date' => '',
			'viewing_time' => ''
		);
		
		db_insert_booking($db_data);
		
	}
	
	$vd_service_in_center_id = $_GET['service'];
	
	$vd_service_in_center_title = $service_groups_reverse[$vd_service_in_center_id]['service_group_id_lookup'];
	
	$vd_service_in_center_office_title = $service_groups_reverse[$vd_service_in_center_id]['office_center_id_lookup'];

	$vd_service_in_center_price = $service_groups_reverse[$vd_service_in_center_id]['price'];
	
	$vd_service_in_center_price = preg_replace('/(\d+)/', '<span>$1</span>', $vd_service_in_center_price);
	
	$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_in_center_id]['css_signature'];
	
	/* check if there's a gallery for this business center */
		
	$vd_show_gallery = false;
	
	foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
		
		if ($office_center_detail['office_center_detail_type_id'] == 'gallery') {
			
			$vd_show_gallery = true;
			
		}
		
	}
	
	/* check if there's an office plan for this business center and its id, if there's any */
	
	foreach ($_DATA['service_group_detail']['items'] as $service_group_detail_key => $service_group_detail_value) {
	
		if ($service_group_detail_value['office_center_detail_type_id'] == 'plan') {
			
			$vd_service_group_id_show_plan = $service_group_detail_key;
			
		}	
		
	}
	
?>

<div class="vd_serviceincenter_wrapper">
	<div class="vd_serviceincenter_wrapper-header <? echo $vd_service_group_id_css; ?>">
		<div class="g-container">
			<div class="g-container-row">
				<div class="vd_serviceincenter_wrapper-header-price">
					<? echo $vd_service_in_center_price; ?>
				</div>
				<div class="vd_serviceincenter_wrapper-header-logo"></div>
				<h1>
					<? echo $vd_service_in_center_title; ?><br />
					в бизнес-центре «<? echo $vd_service_in_center_office_title; ?>»
				</h1>
			</div>
		</div>		
	</div>
	<div class="vd_serviceincenter_wrapper-menu">
		<div class="g-container">
			<div class="g-container-row">
				<ul>
					<li><a href="#about">Об услуге</a></li>
					
					<?
						if ($vd_show_gallery) {
					?>
					<li><a href="#gallery">Галерея</a></li>
					<?
						}
					?>
					<?
						if ($vd_service_group_id_show_plan) {
					?>
					<li><a href="#layout">План офисов</a></li>
					<?
						}
					?>
					<?
						if (count($_DATA['office_center_room']['items']) > 1) {	
					?>
					<li><a href="#freeoffices">Свободные офисы бизнес-центра</a></li>
					<?
						}	
					?>
					<li><a href="#special">Спецпредложения</a></li>
					<li class="helper"></li>
				</ul>
			</div>
		</div>		
	</div>
	<div class="vd_serviceincenter_wrapper-about">
		<a name="about" /></a>
		<h2 class="g-section-title">Об услуге</h2>
			<div class="g-container">
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
	</div>
	<?
	
	if ($vd_show_gallery) {	
		
	?>
	<div class="vd_service-gallery">
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
	<?
		
	}
	
	?>
	
	
	<?
	if ($vd_service_group_id_show_plan) {
		
		$vd_service_group_id_show_plan_content = $_DATA['service_group_detail']['items'][$vd_service_group_id_show_plan];
		
		$vd_service_group_id_show_plan_img_src = $vd_service_group_id_show_plan_content['img_src'];
		$vd_service_group_id_show_plan_img_src_big = $vd_service_group_id_show_plan_content['img_src_big'];
		$vd_service_group_id_show_plan_body = $vd_service_group_id_show_plan_content['body'];
		
	?>
	<div class="vd_serviceincenter_wrapper-layout">
		<a name="layout" /></a>
		<h2 class="g-section-title">План офисов</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-layout-image">
				<img src="<? echo $vd_service_group_id_show_plan_img_src; ?>" data-src-big="<? echo $vd_service_group_id_show_plan_img_src_big; ?>" />
				<div class="vd_serviceincenter_wrapper-layout-image-zoom">
					увеличить
				</div>
			</div>
			<div class="vd_serviceincenter_wrapper-layout-text">
				<? echo $vd_service_group_id_show_plan_body; ?>
			</div>
		</div>
	</div>
	<?
	}
	
	if ($_GET['show_virtual_details'] == 'true') {
		
	?>
	
	<div class="vd_serviceincenter_wrapper-virtualrates">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Тарифы</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-virtualrates-list">
				<div class="vd_serviceincenter_wrapper-virtualrates-list-header">
					<table>
						<tr class="table_header">
							<th class="label">Тарифы</th>
							<th>Почтовый адрес</th>
							<th>Виртуальный офис</th>
							<th>Виртуальный офис +</th>
							<th>Виртуальный офис +<br />юридический адрес</th>
						</tr>
						<tr class="details">
							<td></td>
							<td><div class="icons"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/address.svg"></div>Предоставляет для вашей компании почтовый адрес  для приема почтовой корреспонденции в современном БЦ.</td>
							<td><div class="icons"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/telephone.svg"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/secretary.svg"></div>Это московский телефонный номер для Вашей компании и обработка входящих звонков «живым» секретарем.</td>
							<td><div class="icons"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/address.svg"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/telephone.svg"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/secretary.svg"></div>Тариф предоставляет Вашей компании почтовый адрес в современном БЦ, московский телефонный номер и обработка входящих звонков «живым» секретарем</td>
							<td><div class="icons"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/law.svg"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/telephone.svg"><img src="http://dev.viaduct.pro/uploads/images/icons/svg/secretary.svg"></div>Это предоставление для Вашей компании единого юридического (для регистрации в ИФНС) и почтового адреса в современном БЦ, московского телефонного номера и обработка входящих звонков «живым» секретарем</td>
						</tr>
						<tr class="prices">
							<td></td>
							<td>от <span>3 490</span> руб./мес</td>
							<td>от <span>4 490</span> руб./мес</td>
							<td>от <span>7 490</span> руб./мес</td>
							<td>от <span>9 500</span> руб./мес</td>
						</tr>
						<tr class="reverse_buttons">
							<td></td>
							<td>
								<span class="reserve reserved" data-virtual-form-id="1">
									Забронировано
								</span>
							</td>
							<td>
								<span class="reserve" data-virtual-form-id="2">
									Забронировать
								</span>
							</td>
							<td>
								<span class="reserve" data-virtual-form-id="3">
									Забронировать
								</span>
							</td>
							<td>
								<span class="reserve" data-virtual-form-id="4">
									Забронировать
								</span>
							</td>
						</tr>
					</table>
				</div>
				<div class="vd_serviceincenter_wrapper-virtualrates-list-forms">
					<div class="vd_serviceincenter_wrapper-virtualrates-list-form" data-virtual-form="2">
						<h2>Данные бронирования</h2>
						<div class="vd_serviceincenter_wrapper-virtualrates-list-form-rigth">
							<input type="text" class="phone" placeholder="+7 (___) ___-__-__" maxlength="18">
							<input type="text" class="email" placeholder="E-mail">
							<input type="text" class="name" placeholder="Имя">
							<textarea class="message" placeholder="Ваше сообщение"></textarea>
							<button>Забронировать виртуальный офис</button>
							<button class="disabled">Получить консультацию</button>
						</div>
						<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left">
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
									Бизнес-центр
								</div>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
									<select>
										<option>Арма</option>
										<option>Башня</option>
										<option>Горный</option>
									</select>
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
									Тариф
								</div>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
									Виртуальный офис +
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
									Стоимость
								</div>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
									7 400 рублей в месяц
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
									Срок
								</div>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
									<select>
										<option>1 месяц</option>
										<option>3 месяцев</option>
										<option>6 месяцев</option>
										<option>12 месяцев</option>
									</select>
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-total">
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-total-label">
									Итого
								</div>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-total-value">
									<span>44 400</span> рублей
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="vd_serviceincenter_wrapper-virtualrates-details">
		<div class="g-container">
		<div class="vd_serviceincenter_wrapper-virtualrates-details-list">
			<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item">
				<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-header">
					Основные сервисы
				</div>
				<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-table">
					<table>
						<tr>
							<td class="label">Предоставление почтового адреса</td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">Голосовой почтовый ящик</td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">Юридический адрес</td>
							<td><div class="not_included"></div></td>
							<td><div class="not_included"></div></td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item">
				<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-header">
					Обработка корреспонденции, уведомления
				</div>
				<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-table">
					<table>
						<tr>
							<td class="label">Прием и сортировка</td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">Хранение</td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">Прием факсов</td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">Уведомления о поступлении корр-ции  на эл. почту</td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item">
				<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-header">
					Телефонные номера, прием и переадресация входящих звонков
				</div>
				<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-table">
					<table>
						<tr>
							<td class="label">Телефонный номер<br />в коде 495 / 499</td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">На городские<br />номера Москвы</td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div><span>Включено 1500 минут</span></td>
							<td><div class="included"></div><span>Включено 1500 минут</span></td>
							<td><div class="included"></div><span>Включено 1500 минут</span></td>
						</tr>
						<tr>
							<td class="label">На городские<br />номера РФ<div class="tooltip" data-tooltip-content="#tooltip_content"></div></td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">На мобильные<br />номера Москвы и РФ</td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
						<tr>
							<td class="label">На мобильные<br />и городские номера зарубежья<div class="tooltip" data-tooltip-content="#tooltip_content"></div></td>
							<td><div class="not_included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
							<td><div class="included"></div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<div class="vd_serviceincenter_wrapper-get_presentation">
		<div class="g-container">
			<h2 class="g-section-title">Узнайте подробности наших услуг в презентации</h2>
			<p>Оставьте свои контакты, и мы через минуту вышлем на почту подробную презентацию. Без спама.</p>
			<form>
				<input type="text" class="email" placeholder="Введите ваш e-mail">
				<input type="submit" class="get_presentation virtual" value="Получить презентацию" />
			</form>
		</div>
	</div>		
	
	<div id="tooltip_content_wrapper">
	<div id="tooltip_content">
		<span class="title">Телефонные номера, прием и переадресация входящих звонков на мобильные и городские номера зарубежья</span>
		<p>Сюда вносим информацию по условиям и особенностям пункта.</p>
		<p>Прием и переадресация входящих звонков осуществляется по будням с 10.00 до 18.00 по Московскому времени</p>
		<p>* Дополнительно вносится обеспечительный платеж в размере 45 000 руб, который возвращается при прекращении договора и смене юрадреса на новый</p>
		<p>** Оплачивается только стоимость звонков согласно тарифам провайдера</p>
	</div>
	</div>
	
	<?	
		
	}
	
	if ($_GET['show_meeting_details'] == 'true') {
		
	?>
	
	<div class="vd_serviceincenter_wrapper-meetingrates">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Переговорные в бизнес-центре «Алексеевская Башня»</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-meetingrates-list">
				<div class="vd_serviceincenter_wrapper-meetingrates-list-item">
					<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header">
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-photo">
							<img src="http://dev.viaduct.pro/uploads/images/office_centers/arma/gallery/.resize/21_MOR_5963.175x100.jpg" />
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-name">
							<span>Большой зал</span>
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-area">
							38 кв. м
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-people">
							до 18 человек
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-price">
							<span>1 225 – 2 800 ₽</span>/час
							<button>Забронировать</button>
						</div>
					</div>
					<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form">
						<h2>Данные бронирования</h2>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-right">
							<input type="text" class="phone" placeholder="+7 (___) ___-__-__" maxlength="18">
							<input type="text" class="email" placeholder="E-mail">
							<input type="text" class="name" placeholder="Имя">
							<textarea class="message" placeholder="Ваше сообщение"></textarea>
							<button>Забронировать</button>
							<button class="disabled">Получить консультацию</button>
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left">
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-label">
									Бизнес-центр
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-value">
									Алексеевская Башня
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-label">
									Переговорная
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-value">
									Большой зал
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-wide">
									Дата / время / продолжительность встречи
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-widecontrols">
									<input type="text" class="date" placeholder="Выбор даты">
									<select class="azaza">
										<option>10.00</option>
										<option>12.00</option>
										<option>14.00</option>
										<option>16.00</option>
									</select>
									<select>
										<option>1 час</option>
										<option>2 часа</option>
										<option>3 часа</option>
										<option>6 часов</option>
									</select>
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-label">
									Стоимость
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-value">
									1 225 рублей<br />
									(при аренде от 6 часов)
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-total">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-total-label">
									Итого
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-total-value">
									<span>2 500</span> рублей
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-widetall">
									<label class="additionalservice_label"><input type="checkbox" class="additionalservice"><span></span>Нужно дополнительное обслуживание</label>
								</div>
							</div>
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-bottom">
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-bottom-right">
								<div class="warning">
									Возврат ранее оплаченного бронирования переговорной комнаты возможен только при уведомлении об отказе бронирования не менее чем за 3 рабочих дня!
								</div>
								<div class="info">
									<p class="subheading">Наценка</p>
									<p><span>+ 50%</span> к стоимости аренды</p>
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-bottom-left">
								<p class="subheading">Скидки</p>
								<p><span>1 400</span> руб/час (при аренде зала от 3 часов)</p>
								<p><span>1 225</span> руб/час (при аренде от 6 часов)</p>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="vd_serviceincenter_wrapper-get_presentation">
		<div class="g-container">
			<h2 class="g-section-title">Узнайте подробности наших услуг в презентации</h2>
			<p>Оставьте свои контакты, и мы через минуту вышлем на почту подробную презентацию. Без спама.</p>
			<form>
				<input type="text" class="email" placeholder="Введите ваш e-mail">
				<input type="submit" class="get_presentation meeting" value="Получить презентацию" />
			</form>
		</div>
	</div>	
	
	<?	
		
	}
	
	if ($_GET['show_coworking_details'] == 'true') {
		
	?>
	
	<div class="vd_serviceincenter_wrapper-coworkingrates">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Тарифы</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-coworkingrates-list">
				<div class="vd_serviceincenter_wrapper-coworkingrates-list-item">
					<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header">
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-name">
							<span>Постоянный</span>
						</div>
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-features">
							<ul>
								<li>- Незакреплённое рабочее место</li>
								<li>- 4 часа переговорной комнаты в неделю</li>
								<li>- Личный ящик</li>
								<li>- Возможность заморозить абонемент на 2 недели</li>
								<li>- Скидка 11% при покупке тарифа более, чем на 2 месяца</li>
								<li>- Бесплатный доступ на все мероприятия коворкинга в течение месяца</li>
							</ul>
						</div>
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-price">
							<span>15 490</span> руб./мес
							<button>Забронировать</button>
						</div>
					</div>
					<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form">
						<h2>Данные бронирования</h2>
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-right">
							<input type="text" class="phone" placeholder="+7 (___) ___-__-__" maxlength="18">
							<input type="text" class="email" placeholder="E-mail">
							<input type="text" class="name" placeholder="Имя">
							<textarea class="message" placeholder="Ваше сообщение"></textarea>
							<button>Забронировать коворкинг</button>
							<button class="disabled">Получить консультацию</button>
						</div>
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left">
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
									Бизнес-центр
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
									Алексеевская Башня
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
									Тариф
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
									Постоянный
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
									Минимальный срок
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
									месяц
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
									Стоимость
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
									15 400 руб./мес
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item input">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
									Рабочих мест
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
									<input type="number" class="coworking_workplaces" min="1">
								</div>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-total">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-total-label">
									Итого
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-total-value">
									<span>30 800</span> руб./месяц
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="vd_serviceincenter_wrapper-get_presentation">
		<div class="g-container">
			<h2 class="g-section-title">Узнайте подробности наших услуг в презентации</h2>
			<p>Оставьте свои контакты, и мы через минуту вышлем на почту подробную презентацию. Без спама.</p>
			<form>
				<input type="text" class="email" placeholder="Введите ваш e-mail">
				<input type="submit" class="get_presentation coworking" value="Получить презентацию" />
			</form>
		</div>
	</div>
	
	<?php	
		
	}
	
	
	if (count($_DATA['office_center_room']['items']) > 1) {	
		
	?>
	<div class="vd_serviceincenter_wrapper-freeoffices">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Свободные офисы в бизнес-центре «<? echo $vd_service_in_center_office_title; ?>»</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-freeoffices-list">
				<?
				
				foreach ($_DATA['office_center_room']['items'] as $single_office_center_room) {
					
					$single_office_center_room_price = number_format($single_office_center_room['price'], 0, '', ' ');
					
					$single_office_center_room_price_full = number_format(($single_office_center_room['price'] * $single_office_center_room['seats_num']), 0, '', ' ');
					
					$single_office_center_room_service_item_value = reset($_DATA['office_center2service_group']['items']);
					
					$single_office_center_room_price_for_lookup = $single_office_center_room_service_item_value['price_for_lookup'];
					
					$single_office_center_room_price_term_lookup = $single_office_center_room_service_item_value['price_term_lookup'];
					
				?>
				
				<div class="vd_serviceincenter_wrapper-freeoffices-list-element">
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header">
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-office">
							<img src="<? echo $single_office_center_room['img_src']; ?>" />
							<span><? echo $single_office_center_room['title']; ?></span>
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-area">
							<? echo number_format($single_office_center_room['floor_area_m2']); ?> кв. м
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-people">
							до <? echo $single_office_center_room['seats_num']; ?> человек
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-header-price">
							<div class="reserve">ЗАБРОНИРОВАТЬ</div>
							<span class="price"><span><? echo $single_office_center_room_price; ?></span> ₽ / <? echo $single_office_center_room_price_for_lookup . ' в ' . $single_office_center_room_price_term_lookup; ?></span>
							<?
							
							if ($single_office_center_room['price_bonus']) {
								
								echo '<span class="special">' . $single_office_center_room['price_bonus'] . '</span>';
								
							}
								
							?>
						</div>
					</div>
					<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu">
						<form action="" method="post">
							<input type="hidden" name="form_type" class="form_type" value="">
							<input type="hidden" name="business_center" value="<? echo $single_office_center_room['office_center_id_lookup']; ?>">
							<input type="hidden" name="business_center_id" value="<? echo $single_office_center_room['office_center_id']; ?>">
							<input type="hidden" name="business_center_room_id" value="<? echo $single_office_center_room['id']; ?>">
							<input type="hidden" name="business_center_service_group_id" value="<? echo $single_office_center_room['service_group_id']; ?>">
							<input type="hidden" name="office_number" value="<? echo filter_var($single_office_center_room['title'], FILTER_SANITIZE_NUMBER_INT); ?>">
							<input type="hidden" name="office_area" value="<? echo number_format($single_office_center_room['floor_area_m2']); ?> кв. м">
							<input type="hidden" name="office_seats_num" value="<? echo $single_office_center_room['seats_num']; ?>">
							<input type="hidden" name="office_cost_seat" value="<? echo $single_office_center_room_price; ?> ₽ / <? echo $single_office_center_room_price_for_lookup . ' в ' . $single_office_center_room_price_term_lookup; ?>">
							<input type="hidden" name="office_cost_total" value="<? echo $single_office_center_room_price_full; ?> ₽ / <? echo $single_office_center_room_price_term_lookup; ?>">
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-title">
							Данные бронирования
						</div>
						<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform">
							<div class="vd_serviceincenter_wrapper-freeoffices-list-element-menu-reserveform-left">
								<table>
									<tr>
										<td>Бизнес-центр</td>
										<td><? echo $single_office_center_room['office_center_id_lookup']; ?></td>
									</tr>
									<tr>
										<td>Офис</td>
										<td>
										<?
											echo filter_var($single_office_center_room['title'], FILTER_SANITIZE_NUMBER_INT);
											
										?>
										</td>
									</tr>
									<tr>
										<td>Площадь</td>
										<td><? echo number_format($single_office_center_room['floor_area_m2']); ?> кв. м</td>
									</tr>
									<tr>
										<td>Рабочих мест</td>
										<td><? echo $single_office_center_room['seats_num']; ?></td>
									</tr>
									<tr>
										<td>Стоимость</td>
										<td><? echo $single_office_center_room_price; ?> ₽ / <? echo $single_office_center_room_price_for_lookup . ' в ' . $single_office_center_room_price_term_lookup; ?></td>
									</tr>
									<?
									
									if ($single_office_center_room['price_bonus']) {
										
										echo '<tr class="special"><td></td><td>' . $single_office_center_room['price_bonus'] . '</td></tr>';
										
									}
										
									?>
									<tr class="total">
										<td>Итого</td>
										<td><span><? echo $single_office_center_room_price_full; ?></span> ₽ / <? echo $single_office_center_room_price_term_lookup; ?></td>
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
						</div>
						</form>
					</div>
				</div>
				
				<?	
					
				}	
					
				?>
				
			</div>
		</div>
	</div>
	<?
		
	}	
	
	?>
	<div class="vd_serviceincenter_wrapper-special">
		<a name="special" /></a>
		<div class="g-container">
			<div class="g-container-row">
				<h2 class="g-section-title">Cпецпредложения</h2>
				<ul class="offers-items">
			        <li>
			            <div class="offers-item">
			                <div class="offers-item-title c-icon c-office">
			                    Получите скидку 10% на аренду офиса
			                </div>
			                <div class="offers-item-date">
			                    1 февраля – 29 апреля 2016
			                </div>
			                <div class="offers-item-link"><a href="#" class="g-button c-office">ПОДРОБНЕЕ</a></div>
			            </div>
			        </li>
			        <li>
			            <div class="offers-item">
			                <div class="offers-item-title c-icon c-virtual">
			                    Виртуальный офис + 4 часа переговорных в подарок
			                </div>
			                <div class="offers-item-date">
			                    20 марта – 18 мая  2016
			                </div>
			                <div class="offers-item-link"><a href="#" class="g-button c-virtual">ПОДРОБНЕЕ</a></div>
			            </div>
			        </li>
			        <li>
			            <div class="offers-item">
			                <div class="offers-item-title c-icon c-meeting">
			                    Акция февраля – скидка 70% на аренду переговорных
			                </div>
			                <div class="offers-item-date">
			                    1 февраля – 29 апреля  2016
			                </div>
			                <div class="offers-item-link"><a href="#" class="g-button c-meeting">ПОДРОБНЕЕ</a></div>
			            </div>
			        </li>
			    </ul>		
			</div>
		</div>	
	</div>
</div>