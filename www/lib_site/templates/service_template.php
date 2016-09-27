<?
	/* populate reverse array for services in office centers: [service_id] => service_in_office_data */

	if (isset($_DATA['office_center2service_group'])) {
		
		foreach($_DATA['office_center2service_group']['items'] as &$service_group) {
			
			$service_groups_reverse[$service_group['service_group_id']] = $service_group;
			
		}
		
		unset($service_group);
		
	}

	require $_SERVER['DOCUMENT_ROOT'] . '/lib/mail.php';

	if ('POST' == $_SERVER['REQUEST_METHOD']) {

		$MY_POST = get_post();

		/* prepare some needed data */
		
		if ($MY_POST['form_type'] == 'previewform') {
			
			$vd_send_form_date = $MY_POST['date'];
			$vd_send_form_time = $MY_POST['time'];
			$vd_send_form_name = $MY_POST['name'];
			$vd_send_form_email = $MY_POST['email'];
			$vd_send_form_phone = $MY_POST['phone'];
			
			$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на предварительный просмотр офиса.";
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nДанные объекта";
			$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_manager_message_text .= "\r\nОфис: " . $MY_POST['office_number'];
			$vd_send_form_manager_message_text .= "\r\nПлощадь: " . $MY_POST['office_area'];
			$vd_send_form_manager_message_text .= "\r\nРабочих мест: " . $MY_POST['office_seats_num'];
			
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
			$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_customer_message_text .= "\r\nОфис: " . $MY_POST['office_number'];
			$vd_send_form_customer_message_text .= "\r\nПлощадь: " . $MY_POST['office_area'];
			$vd_send_form_customer_message_text .= "\r\nРабочих мест: " . $MY_POST['office_seats_num'];
			$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $MY_POST['office_cost_seat'];
/*			$vd_send_form_customer_message_text .= "\r\nИтого: " . $MY_POST['office_cost_total'];*/
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nВаши данные";
			$vd_send_form_customer_message_text .= "\r\nИмя: " . $vd_send_form_name;
			$vd_send_form_customer_message_text .= "\r\nЭлектронная почта: " . $vd_send_form_email;
			$vd_send_form_customer_message_text .= "\r\nТелефон: " . $vd_send_form_phone;
			$vd_send_form_customer_message_text .= "\r\nДата просмотра: " . $vd_send_form_date;
			$vd_send_form_customer_message_text .= "\r\nВремя просмотра: " . $vd_send_form_time;
			
			if (true === mail_send($_SITE['settings']['email_request'], 'Заявка на просмотр офиса', $vd_send_form_manager_message_text)) {
				mail_send($MY_POST['email'], 'Ваша заявка принята', $vd_send_form_customer_message_text);
				echo 'Спасибо, ваша заявка принята';

				$db_data = array(
					'office_center_id' => $MY_POST['business_center_id'],
					'service_group_id' => $MY_POST['business_center_service_group_id'],
					'office_center_room_id' => $MY_POST['business_center_room_id'],
					'name' => $vd_send_form_name,
					'email' => $vd_send_form_email,
					'phone' => $vd_send_form_phone,
					'message' => $MY_POST['message'],
					'office_seat_num' => $MY_POST['office_seats_num'],
					'office_seat_price' => $MY_POST['office_cost_seat'],
					'office_price_total' => $MY_POST['office_cost_total'],
					'viewing_needed' => 1,
					'viewing_date' => date('Y-m-d', strtotime($vd_send_form_date)),
					'viewing_time' => $vd_send_form_time
				);
				
				db_insert_booking($db_data);

			} else {
				echo 'Ошибка при приеме заявки. Пожалуйста, попробуйте еще раз чуть позже';
			}
	
			
			
		} elseif ($MY_POST['form_type'] == 'reserveform') {
			
			$vd_send_form_name = $MY_POST['name'];
			$vd_send_form_email = $MY_POST['email'];
			$vd_send_form_phone = $MY_POST['phone'];
			$vd_send_form_message = $MY_POST['message'];
			
			$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на бронирование офиса.";
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nВы забронировали";
			$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_manager_message_text .= "\r\nОфис: " . $MY_POST['office_number'];
			$vd_send_form_manager_message_text .= "\r\nПлощадь: " . $MY_POST['office_area'];
			$vd_send_form_manager_message_text .= "\r\nРабочих мест: " . $MY_POST['office_seats_num'];
			$vd_send_form_manager_message_text .= "\r\nСтоимость: " . $MY_POST['office_cost_seat'];
/*			$vd_send_form_manager_message_text .= "\r\nИтого: " . $MY_POST['office_cost_total'];*/
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nДанные заявки";
			$vd_send_form_manager_message_text .= "\r\nИмя: " . $vd_send_form_name;
			$vd_send_form_manager_message_text .= "\r\nЭлектронная почта: " . $vd_send_form_email;
			$vd_send_form_manager_message_text .= "\r\nТелефон: " . $vd_send_form_phone;
			
			$vd_send_form_customer_message_text .= "Здравствуйте,\r\nВаша заявка на бронирование офиса была получена.";
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nДанные объекта";
			$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_customer_message_text .= "\r\nОфис: " . $MY_POST['office_number'];
			$vd_send_form_customer_message_text .= "\r\nПлощадь: " . $MY_POST['office_area'];
			$vd_send_form_customer_message_text .= "\r\nРабочих мест: " . $MY_POST['office_seats_num'];
			$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $MY_POST['office_cost_seat'];
/*			$vd_send_form_customer_message_text .= "\r\nИтого: " . $MY_POST['office_cost_total'];*/
			
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

			if (true === mail_send($_SITE['settings']['email_request'], 'Заявка на бронирование офиса', $vd_send_form_manager_message_text)) {
				mail_send($MY_POST['email'], 'Ваша заявка принята', $vd_send_form_customer_message_text);
				echo 'Спасибо, ваша заявка принята';

				$db_data = array(
					'office_center_id' => $MY_POST['business_center_id'],
					'service_group_id' => $MY_POST['business_center_service_group_id'],
					'office_center_room_id' => $MY_POST['business_center_room_id'],
					'name' => $vd_send_form_name,
					'email' => $vd_send_form_email,
					'phone' => $vd_send_form_phone,
					'message' => $_POST['message'],
					'office_seat_num' => $MY_POST['office_seats_num'],
					'office_seat_price' => $MY_POST['office_cost_seat'],
					'office_price_total' => $MY_POST['office_cost_total'],
					'viewing_needed' => 0,
					'viewing_date' => '',
					'viewing_time' => ''
				);
				
				db_insert_booking($db_data);

			} else {
				echo 'Ошибка при приеме заявки. Пожалуйста, попробуйте еще раз чуть позже';
			}
			
		} elseif ($MY_POST['form_type'] == 'book_virtualoffice') {
			
			$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на виртуальный офис.";
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nВы забронировали";
			$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_manager_message_text .= "\r\nТариф: " . $MY_POST['virtual_office_rate'];
			$vd_send_form_manager_message_text .= "\r\nСтоимость: " . $MY_POST['virtual_office_price'];
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nДанные заявки";
			$vd_send_form_manager_message_text .= "\r\nИмя: " . $MY_POST['name'];
			$vd_send_form_manager_message_text .= "\r\nЭлектронная почта: " . $MY_POST['email'];
			$vd_send_form_manager_message_text .= "\r\nТелефон: " . $MY_POST['phone'];
			
			$vd_send_form_customer_message_text .= "Здравствуйте,\r\nВаша заявка на виртуальный офис была получена.";
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nДанные объекта";
			$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_customer_message_text .= "\r\nТариф: " . $MY_POST['virtual_office_rate'];
			$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $MY_POST['virtual_office_price'];
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nВаши данные";
			$vd_send_form_customer_message_text .= "\r\nИмя: " . $MY_POST['name'];
			$vd_send_form_customer_message_text .= "\r\nЭлектронная почта: " . $MY_POST['email'];
			$vd_send_form_customer_message_text .= "\r\nТелефон: " . $MY_POST['phone'];
			
			if ($vd_send_form_message != "") {
				$vd_send_form_manager_message_text .= "\r\nСообщение: " . $MY_POST['message'];
				$vd_send_form_customer_message_text .= "\r\nСообщение: " . $MY_POST['message'];
			}

			if (true === mail_send($_SITE['settings']['email_request'], 'Заявка на виртуальный офис', $vd_send_form_manager_message_text)) {
				mail_send($MY_POST['email'], 'Ваша заявка принята', $vd_send_form_customer_message_text);
				echo 'Спасибо, ваша заявка принята';

				$virtual_office_total_price = $MY_POST['virtual_office_price'] * $MY_POST['term'];
				
				$db_data = array(
					'office_center_id' => $MY_POST['business_center_id'],
					'service_group_id' => $MY_POST['business_center_service_group_id'],
					'office_center_room_id' => $MY_POST['business_center_room_id'],
					'name' => $MY_POST['name'],
					'email' => $MY_POST['email'],
					'phone' => $MY_POST['phone'],
					'message' => $MY_POST['message'],
					'office_seat_num' => $MY_POST['term'],
					'office_seat_price' => $MY_POST['virtual_office_price'],
					'office_price_total' => $virtual_office_total_price,
					'viewing_needed' => 0
				);
				
				db_insert_booking($db_data);

			} else {
				echo 'Ошибка при приеме заявки. Пожалуйста, попробуйте еще раз чуть позже';
			}		
			
		} elseif ($MY_POST['form_type'] == 'book_meeting') {
			
			$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на переговорную.";
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nВы забронировали";
			$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_manager_message_text .= "\r\nТариф: " . $MY_POST['meeting_rate'];
			$vd_send_form_manager_message_text .= "\r\nСтоимость: " . $MY_POST['meeting_price'];
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nДанные заявки";
			$vd_send_form_manager_message_text .= "\r\nИмя: " . $MY_POST['name'];
			$vd_send_form_manager_message_text .= "\r\nЭлектронная почта: " . $MY_POST['email'];
			$vd_send_form_manager_message_text .= "\r\nТелефон: " . $MY_POST['phone'];
			
			$vd_send_form_customer_message_text .= "Здравствуйте,\r\nВаша заявка на переговорную была получена.";
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nДанные объекта";
			$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_customer_message_text .= "\r\nТариф: " . $MY_POST['meeting_rate'];
			$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $MY_POST['meeting_price'];
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nВаши данные";
			$vd_send_form_customer_message_text .= "\r\nИмя: " . $MY_POST['name'];
			$vd_send_form_customer_message_text .= "\r\nЭлектронная почта: " . $MY_POST['email'];
			$vd_send_form_customer_message_text .= "\r\nТелефон: " . $MY_POST['phone'];
			
			if ($vd_send_form_message != "") {
				$vd_send_form_manager_message_text .= "\r\nСообщение: " . $MY_POST['message'];
				$vd_send_form_customer_message_text .= "\r\nСообщение: " . $MY_POST['message'];
			}

			if (true === mail_send($_SITE['settings']['email_request'], 'Заявка на переговорную', $vd_send_form_manager_message_text)) {
				mail_send($MY_POST['email'], 'Ваша заявка принята', $vd_send_form_customer_message_text);
				echo 'Спасибо, ваша заявка принята';

				$meeting_price_total = $MY_POST['meeting_price'] * $MY_POST['meeting_duration'];
			
				$db_data = array(
					'office_center_id' => $MY_POST['business_center_id'],
					'service_group_id' => $MY_POST['business_center_service_group_id'],
					'office_center_room_id' => $MY_POST['business_center_room_id'],
					'name' => $MY_POST['name'],
					'email' => $MY_POST['email'],
					'phone' => $MY_POST['phone'],
					'message' => $MY_POST['message'],
					'office_seat_price' => $MY_POST['meeting_price'],
					'office_price_total' => $meeting_price_total,
					'meeting_date' => date('Y-m-d', strtotime($MY_POST['date'])),
					'meeting_time' => $MY_POST['meeting_time'],
					'meeting_duration' => $MY_POST['meeting_duration'],
					'meeting_needs_service' => $MY_POST['additionalservice'],
				);
				
				db_insert_booking($db_data);

			} else {
				echo 'Ошибка при приеме заявки. Пожалуйста, попробуйте еще раз чуть позже';
			}
			
		} elseif ($MY_POST['form_type'] == 'book_coworking') {
			
			$vd_send_form_manager_message_text .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка на коворкинг.";
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nВы забронировали";
			$vd_send_form_manager_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_manager_message_text .= "\r\nТариф: " . $MY_POST['coworking_rate'];
			$vd_send_form_manager_message_text .= "\r\nСтоимость: " . $MY_POST['coworking_price'];
			
			$vd_send_form_manager_message_text .= "\r\n";
			
			$vd_send_form_manager_message_text .= "\r\nДанные заявки";
			$vd_send_form_manager_message_text .= "\r\nИмя: " . $MY_POST['name'];
			$vd_send_form_manager_message_text .= "\r\nЭлектронная почта: " . $MY_POST['email'];
			$vd_send_form_manager_message_text .= "\r\nТелефон: " . $MY_POST['phone'];
			
			$vd_send_form_customer_message_text .= "Здравствуйте,\r\nВаша заявка на коворкинг была получена.";
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nДанные объекта";
			$vd_send_form_customer_message_text .= "\r\nБизнес-центр: " . $MY_POST['business_center'];
			$vd_send_form_customer_message_text .= "\r\nТариф: " . $MY_POST['coworking_rate'];
			$vd_send_form_customer_message_text .= "\r\nСтоимость: " . $MY_POST['coworking_price'];
			
			$vd_send_form_customer_message_text .= "\r\n";
			
			$vd_send_form_customer_message_text .= "\r\nВаши данные";
			$vd_send_form_customer_message_text .= "\r\nИмя: " . $MY_POST['name'];
			$vd_send_form_customer_message_text .= "\r\nЭлектронная почта: " . $MY_POST['email'];
			$vd_send_form_customer_message_text .= "\r\nТелефон: " . $MY_POST['phone'];
			
			if ($vd_send_form_message != "") {
				$vd_send_form_manager_message_text .= "\r\nСообщение: " . $MY_POST['message'];
				$vd_send_form_customer_message_text .= "\r\nСообщение: " . $MY_POST['message'];
			}

			if (true === mail_send($_SITE['settings']['email_request'], 'Заявка на коворкинг', $vd_send_form_manager_message_text)) {
				mail_send($MY_POST['email'], 'Ваша заявка принята', $vd_send_form_customer_message_text);
				echo 'Спасибо, ваша заявка принята';

				$coworking_price_total = $MY_POST['coworking_price'] * $MY_POST['coworking_workplaces'];
				
				$db_data = array(
					'office_center_id' => $MY_POST['business_center_id'],
					'service_group_id' => $MY_POST['business_center_service_group_id'],
					'office_center_room_id' => $MY_POST['business_center_room_id'],
					'name' => $MY_POST['name'],
					'email' => $MY_POST['email'],
					'phone' => $MY_POST['phone'],
					'message' => $MY_POST['message'],
					'office_seat_num' => $MY_POST['coworking_workplaces'],
					'office_seat_price' => $MY_POST['coworking_price'],
					'office_price_total' => $coworking_price_total
				);
				
				db_insert_booking($db_data);

			} else {
				echo 'Ошибка при приеме заявки. Пожалуйста, попробуйте еще раз чуть позже';
			}
			
		}

		exit();

	}
	
	$g_office_center_id = (int)$_GET['center'];

	$vd_service_in_center_id = $_GET['service'];
	
	$vd_service_in_center_title = $service_groups_reverse[$vd_service_in_center_id]['service_group_id_lookup'];
	
	$vd_service_in_center_office_title = $service_groups_reverse[$vd_service_in_center_id]['office_center_id_lookup'];

	$vd_service_in_center_price = $service_groups_reverse[$vd_service_in_center_id]['price'];
	
	$vd_service_in_center_price = preg_replace('/(\d+)/', '<span>$1</span>', $vd_service_in_center_price);
	
	$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_in_center_id]['css_signature'];

	$vd_service_presentation_url = $_DATA['service_group']['items'][$vd_service_in_center_id]['presentation_url'];
	
	/* check if there's a gallery for this business center */
		
	$vd_show_gallery = false;
	
	foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
		
		if ($office_center_detail['office_center_detail_type_id'] == 'gallery') {
			
			$vd_show_gallery = true;
			
		}
		
	}
	
	/* check if there's an office plan for this business center and its id, if there's any */
	
	if (isset($_DATA['service_group_detail'])) {
		
		foreach ($_DATA['service_group_detail']['items'] as $service_group_detail_key => $service_group_detail_value) {
		
			if ($service_group_detail_value['office_center_detail_type_id'] == 'plan') {
				
				$vd_service_group_plans[] = $service_group_detail_value;
////				$vd_service_group_id_show_plan = $service_group_detail_key;
				
			}	
			
		}
	}
	
?>
<a href="#" class="scroll_to_top"></a>
<div class="vd_serviceincenter_wrapper">
	<div class="vd_serviceincenter_wrapper-header <? echo $vd_service_group_id_css; ?>">
		<div class="g-container">
			<div class="g-container-row">
				<div class="vd_serviceincenter_wrapper-header-price">
					<? echo $vd_service_in_center_price; ?>
				</div>
				<div class="vd_serviceincenter_wrapper-header-logo"></div>
				<h1><? echo $vd_service_in_center_title; ?><br />
					в бизнес-центре «<? echo $vd_service_in_center_office_title; ?>»</h1>
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
						if (isset($vd_service_group_plans)) {
					?>
					<li><a href="#layout">План офисов</a></li>
					<?
						}
					?>
					<?
						if (count($_DATA['office_center_room']['items']) > 0) {	
							
							if ($_DATA['service_group']['items'][$_GET['service']]['css_signature'] == 'office') {
								
								?>
								
								<li><a href="#freeoffices">Свободные офисы бизнес-центра</a></li>
								
								<?
								
							} else {
								
								?>
								
								<li><a href="#freeoffices">Тарифы</a></li>
								
								<?
								
							}
							
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
	if (isset($vd_service_group_plans)) {
	?>
	<div class="vd_serviceincenter_wrapper-layout">
		<a name="layout" /></a>
		<h2 class="g-section-title">План офисов</h2>
	<?	foreach ($vd_service_group_plans as $vd_service_group_plan) { ?>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-plan">
				<div class="vd_serviceincenter_wrapper-layout-image">
					<img src="<? echo $vd_service_group_plan['img_src']; ?>" data-src-big="<? echo $vd_service_group_plan['img_src_big']; ?>" />
					<div class="vd_serviceincenter_wrapper-layout-image-zoom">
						увеличить
					</div>
				</div>
				<div class="vd_serviceincenter_wrapper-layout-text text-content">
					<? echo $vd_service_group_plan['body']; ?>
				</div>
			</div>
		</div>
	<?	} ?>
	</div>
	<?
	}
	
	if (count($_DATA['office_center_room']['items']) > 0) {
		
		if ($_DATA['service_group']['items'][$_GET['service']]['css_signature'] == 'office')	{
		
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
							<span class="price"><span><? echo $single_office_center_room_price; ?></span> руб / <? echo $single_office_center_room_price_for_lookup . ' в ' . $single_office_center_room_price_term_lookup; ?></span>
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
							<input type="hidden" name="office_cost_seat" value="<? echo $single_office_center_room_price; ?> руб / <? echo $single_office_center_room_price_for_lookup . ' в ' . $single_office_center_room_price_term_lookup; ?>">
							<input type="hidden" name="office_cost_total" value="<? echo $single_office_center_room_price_full; ?> руб / <? echo $single_office_center_room_price_term_lookup; ?>">
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
										<td>Номер офиса</td>
										<td>
										<?
											echo filter_var($single_office_center_room['title'], FILTER_SANITIZE_NUMBER_INT);
											
										?>
										</td>
									</tr>
								<? /*
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
									</tr> */ ?>
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
			
		} elseif ($_DATA['service_group']['items'][$_GET['service']]['css_signature'] == 'virtual')	{
		
	?>
	
	<div class="vd_serviceincenter_wrapper-virtualrates">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Тарифы</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-virtualrates-list">
				<div class="vd_serviceincenter_wrapper-virtualrates-list-header">
					<table class="virtualrates_main_table">
					<tr>
						<td class="virtualrates_main_table_cell">
							<table>
								<tr class="table_header_main">
									<th class="label">Тарифы</th>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
						<?

							$ys_tariff_details = array(
								'<div class="icons"><img src="/uploads/images/icons/svg/address.svg"></div>Предоставляет для вашей компании почтовый адрес  для приема почтовой корреспонденции в современном БЦ.',
								'<div class="icons"><img src="/uploads/images/icons/svg/telephone.svg"><img src="/uploads/images/icons/svg/secretary.svg"></div>Это московский телефонный номер для Вашей компании и обработка входящих звонков «живым» секретарем.',
								'<div class="icons"><img src="/uploads/images/icons/svg/address.svg"><img src="/uploads/images/icons/svg/telephone.svg"><img src="/uploads/images/icons/svg/secretary.svg"></div>Тариф предоставляет Вашей компании почтовый адрес в современном БЦ, московский телефонный номер и обработка входящих звонков «живым» секретарем',
								'<div class="icons"><img src="/uploads/images/icons/svg/company-address.svg"><img src="/uploads/images/icons/svg/telephone.svg"><img src="/uploads/images/icons/svg/secretary.svg"></div>Это предоставление для Вашей компании единого юридического (для регистрации в ИФНС) и почтового адреса в современном БЦ, московского телефонного номера и обработка входящих звонков «живым» секретарем'
							);

							$ys_tariff_detail_num = 0;
							
							foreach ($_DATA['office_center_room']['items'] as $single_virtual_office) {

								$single_virtual_office_price = number_format($single_virtual_office['price'], 0, '', ' ');

								echo '<td class="virtualrates_main_table_cell">';

								echo '<table>';

								echo '<tr class="table_header">';
								
								echo '<th>' . $single_virtual_office['title'] . '</th>';

								echo '</tr>';

								echo '<tr class="details">';
								
								echo '<td>' . $ys_tariff_details[$ys_tariff_detail_num] . '</td>';

								echo '</tr>';

								echo '<tr class="prices">';
								
								echo '<td>от <span>' . $single_virtual_office_price . '</span> руб./мес</td>';

								echo '</tr>';

								echo '<tr class="reverse_buttons">';
								
								echo '<td><span class="reserve" data-virtual-form-id="' . $single_virtual_office['id'] . '">Забронировать</span></td>';

								echo '</tr>';

								echo '</table>';

								echo '</td>';

								$ys_tariff_detail_num++;
								
							}	
								
							?>
						
					</tr>
					</table>
				</div>
				<div class="vd_serviceincenter_wrapper-virtualrates-list-forms">
					<?
							
					foreach ($_DATA['office_center_room']['items'] as $single_virtual_office) {
						
						$single_virtual_office_price = number_format($single_virtual_office['price'], 0, '', ' ');
						
					?>
						
					<div class="vd_serviceincenter_wrapper-virtualrates-list-form" data-virtual-form="<? echo $single_virtual_office['id']; ?>">
						<form method="post" action="">
							<input type="hidden" name="form_type" value="book_virtualoffice" />
							<input type="hidden" name="business_center" value="<? echo $single_virtual_office['office_center_id_lookup']; ?>" />
							<input type="hidden" name="business_center_id" value="<? echo $single_virtual_office['office_center_id']; ?>" />
							<input type="hidden" name="business_center_room_id" value="<? echo $single_virtual_office['id']; ?>" />
							<input type="hidden" name="business_center_service_group_id" value="<? echo $single_virtual_office['service_group_id']; ?>" />
							<input type="hidden" name="virtual_office_price" value="<? echo $single_virtual_office['price']; ?>" />
							<input type="hidden" name="virtual_office_rate" value="<? echo $single_virtual_office['title']; ?>" />
							<h2>Данные бронирования</h2>
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-rigth">
								<input type="text" class="phone" name="phone" placeholder="+7 (___) ___-__-__" maxlength="18">
								<input type="text" class="email" name="email" placeholder="E-mail">
								<input type="text" class="name" name="name" placeholder="Имя">
								<textarea class="message" name="message" placeholder="Ваше сообщение"></textarea>
								<button class="book">Забронировать виртуальный офис</button>
								<button class="disabled consultation" data-url="<?=$_SITE['section_paths']['request']['path']?>">Получить консультацию</button>
							</div>
							<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left">
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
										Бизнес-центр
									</div>
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
										<select name="business_center_select" class="business_center_select">
										<?

											foreach ($_DATA['office_center']['items'] as $business_center_select_item) {

												$business_center_select_item_services = explode(',', $business_center_select_item['service_group']);

												if (in_array($_GET['service'], $business_center_select_item_services)) {

													if ($business_center_select_item['id'] == $g_office_center_id) {

														echo '<option value="' . $business_center_select_item['id'] . '" selected="selected">' . $business_center_select_item['title'] . '</option>';

													} else {

														echo '<option value="' . $business_center_select_item['id'] . '">' . $business_center_select_item['title'] . '</option>';

													}

												}

											}

										?>
										</select>
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
										Тариф
									</div>
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
										<? echo $single_virtual_office['title']; ?>
									</div>
								</div>
							<? /*
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
										Стоимость
									</div>
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
										<? echo $single_virtual_office_price; ?> рублей в месяц
									</div>
								</div> */?>
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item">
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-label">
										Срок
									</div>
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-item-value">
										<select name="term"  class="virtual_office_term">
											<option value="1">1 месяц</option>
											<option value="3">3 месяцев</option>
											<option value="6">6 месяцев</option>
											<option value="12">12 месяцев</option>
										</select>
									</div>
								</div>
							<? /*
								<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-total">
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-total-label">
										Итого
									</div>
									<div class="vd_serviceincenter_wrapper-virtualrates-list-form-left-total-value">
										<span class="total_virtual_office_price"><?php echo $single_virtual_office_price; ?></span> рублей
									</div>
								</div> */ ?>
							</div>
						</form>
					</div>	
						
					<?
						
					}	
						
					?>
				</div>
			</div>
		</div>
	</div>
<?	
if (isset($_DATA['tariff_includes']['items']) && isset($_DATA['office_center_room']['items'])) {
	// getting reverse arrays of services included in tariff, for search below
	function reverse_tariff_includes($item) {
		$item['tariff_includes_id'] = array_flip(explode(',', $item['tariff_includes_id']));
		return $item;
	}
	$_DATA['office_center_room']['items'] = array_map('reverse_tariff_includes', $_DATA['office_center_room']['items']); ?>
	<div class="vd_serviceincenter_wrapper-virtualrates-details">
		<div class="g-container">
		<div class="vd_serviceincenter_wrapper-virtualrates-details-list">
		<?	$first_item = current($_DATA['tariff_includes']['items']);
			if (!$first_item['is_group_title']) {
				array_unshift($_DATA['tariff_includes']['items'], array('title' => 'Сервисы', 'is_group_title' => 1));
			}
			$i = 0;
			foreach ($_DATA['tariff_includes']['items'] as $tariff_service_id => &$tariff_service) {
				if ($tariff_service['is_group_title']) { 
					if (0 != $i++) { ?>
							</table>
						</div>
					</div>
				<?	} ?>
					<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item open">
						<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-header">
							<?=$tariff_service['title']?>
						</div>
						<div class="vd_serviceincenter_wrapper-virtualrates-details-list-item-table">
							<table>
			<?	} else { ?>
					<tr>
						<td class="label"><?=$tariff_service['title']?>
						<?	if ($tariff_service['annotation']) { ?>
							<div class="tooltip" data-tooltip-content="#tooltip_<?=$tariff_service_id?>"></div>
							<div class="tooltip_content_wrapper">
							<div class="tooltip_content" id="tooltip_<?=$tariff_service_id?>">
								<p><?=$tariff_service['annotation']?></p>
							</div>
							</div>
					<?	} ?>
						</td>
					<?	foreach ($_DATA['office_center_room']['items'] as $tariff_id => &$tariff) {
							$is_included = isset($tariff['tariff_includes_id'][$tariff_service_id]); ?>
							<td><span class="tariff_name_in_cell"><?=$tariff['title']?></span><div class="<?=!$is_included?'not_':''?>included" title="<?=$is_included?'Входит в стоимость услуги':'Не предоставляется'?>"></div></td>
					<?	}
						unset($tariff); ?>
					</tr>
			<?	}
			}
			unset($tariff_service); ?>
							</table>
						</div>
					</div>
		</div>
		</div>
	</div>
<?
}
			
		} elseif ($_DATA['service_group']['items'][$_GET['service']]['css_signature'] == 'meeting')	{
		
	?>
	
	<div class="vd_serviceincenter_wrapper-meetingrates">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Переговорные в бизнес-центре «<? echo $_DATA['office_center']['items'][$g_office_center_id]['title']; ?>»</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-meetingrates-list">
				<?
					
				foreach ($_DATA['office_center_room']['items'] as $single_metting_office) {
					
					$single_meeting_office_price = number_format($single_metting_office['price'], 0, '', ' ');
					
				?>
				
				<div class="vd_serviceincenter_wrapper-meetingrates-list-item">
					<form method="post" action="">
						<input type="hidden" name="form_type" value="book_meeting" />
						<input type="hidden" name="business_center" value="<? echo $single_metting_office['office_center_id_lookup']; ?>" />
						<input type="hidden" name="business_center_id" value="<? echo $single_metting_office['office_center_id']; ?>" />
						<input type="hidden" name="business_center_room_id" value="<? echo $single_metting_office['id']; ?>" />
						<input type="hidden" name="business_center_service_group_id" value="<? echo $single_metting_office['service_group_id']; ?>" />
						<input type="hidden" name="meeting_price" value="<? echo $single_metting_office['price']; ?>" />
						<input type="hidden" name="meeting_rate" value="<? echo $single_metting_office['title']; ?>" />						
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header">
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-photo">
								<img src="<? echo $single_metting_office['img_src']; ?>" />
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-name">
								<span><? echo $single_metting_office['title']; ?></span>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-area">
								<? echo $single_metting_office['floor_area_m2']; ?> кв. м
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-people">
								до <? echo $single_metting_office['seats_num']; ?> человек
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-header-price">
							<?	$sitem_value = reset($_DATA['office_center2service_group']['items']);
								
								$price_term = $sitem_value['price_term_lookup']; ?>

								<span><? echo $single_meeting_office_price; ?></span> руб/<?=$price_term?>
							<? 	if ($single_metting_office['price_bonus']) {
								
									echo '<br><span class="special">' . $single_metting_office['price_bonus'] . '</span>';
								
								}
							?>
								<button>Забронировать</button>
							</div>
						</div>
						<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form">
							<h2>Данные бронирования</h2>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-right">
								<input type="text" class="phone" name="phone" placeholder="+7 (___) ___-__-__" maxlength="18">
								<input type="text" class="email" name="email" placeholder="E-mail">
								<input type="text" class="name" name="name" placeholder="Имя">
								<textarea class="message" name="message" placeholder="Ваше сообщение"></textarea>
								<button class="meeting_submit">Забронировать</button>
								<button class="disabled consultation" data-url="<?=$_SITE['section_paths']['request']['path']?>">Получить консультацию</button>
							</div>
							<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left">
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-label">
										Бизнес-центр
									</div>
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-value">
										<? echo $single_metting_office['office_center_id_lookup']; ?>
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-label">
										Переговорная
									</div>
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-value">
										<? echo $single_metting_office['title']; ?>
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-wide">
										Дата / время / продолжительность встречи
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-widecontrols">
										<input type="text" class="date" name="date" placeholder="Выбор даты">
										<select name="meeting_time">
											<option>10.00</option>
											<option>12.00</option>
											<option>14.00</option>
											<option>16.00</option>
										</select>
										<select name="meeting_duration" class="meeting_duration">
											<option value="1">1 час</option>
											<option value="2">2 часа</option>
											<option value="3">3 часа</option>
											<option value="6">6 часов</option>
										</select>
									</div>
								</div>
							<? /*
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-label">
										Стоимость
									</div>
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-value">
										<? echo $single_metting_office['price']; ?> рублей<br />
										(при аренде от 6 часов)
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-total">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-total-label">
										Итого
									</div>
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-total-value">
										<span class="total_meeting_price"><? echo $single_metting_office['price']; ?></span> рублей
									</div>
								</div> */ ?>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-left-item-widetall">
										<label class="additionalservice_label"><input type="checkbox" name="additionalservice" class="additionalservice" value="1"><span></span>Нужно дополнительное обслуживание</label>
									</div>
								</div>
							</div>
						<?	if ($single_metting_office['comment1'] || $single_metting_office['comment2'] || $single_metting_office['comment3']) { ?>
								<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-bottom">
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-bottom-right">
									<?	if ($single_metting_office['comment3']) { ?>
											<div class="warning">
												<?=$single_metting_office['comment3']?>
											</div>
									<?	}
										if ($single_metting_office['comment2']) { ?>
											<div class="info">
												<?=$single_metting_office['comment2']?>
											</div>
									<?	} ?>
									</div>
								<?	if ($single_metting_office['comment1']) { ?>
									<div class="vd_serviceincenter_wrapper-meetingrates-list-item-form-bottom-left">
										<?=$single_metting_office['comment1']?>
									</div>
								<?	} ?>
								</div>
						<?	} ?>
						</div>
					</form>
				</div>
				
				<?	
					
				}	
					
				?>
			</div>
		</div>
	</div>
	
	<?	
			
		} elseif ($_DATA['service_group']['items'][$_GET['service']]['css_signature'] == 'coworking')	{
		
	?>
	
	<div class="vd_serviceincenter_wrapper-coworkingrates">
		<a name="freeoffices" /></a>
		<h2 class="g-section-title">Тарифы</h2>
		<div class="g-container">
			<div class="vd_serviceincenter_wrapper-coworkingrates-list">
				<?
				
				foreach ($_DATA['office_center_room']['items'] as $single_coworking) {
					
					$single_coworking_price = number_format($single_coworking['price'], 0, '', ' ');
					
					$single_coworking_center_room_service_item_value = reset($_DATA['office_center2service_group']['items']);
					
					$single_coworking_center_room_price_for_lookup = $single_coworking_center_room_service_item_value['price_for_lookup'];
					
					$single_coworking_center_room_price_term_lookup = ($single_coworking['price_term']?$single_coworking['price_term_lookup']:$single_coworking_center_room_service_item_value['price_term_lookup']);
				?>
				
				<div class="vd_serviceincenter_wrapper-coworkingrates-list-item">
					<form method="post" action="">
						<input type="hidden" name="form_type" value="book_coworking" />
						<input type="hidden" name="business_center" value="<? echo $single_coworking['office_center_id_lookup']; ?>" />
						<input type="hidden" name="business_center_id" value="<? echo $single_coworking['office_center_id']; ?>" />
						<input type="hidden" name="business_center_room_id" value="<? echo $single_coworking['id']; ?>" />
						<input type="hidden" name="business_center_service_group_id" value="<? echo $single_coworking['service_group_id']; ?>" />
						<input type="hidden" name="coworking_price" value="<? echo $single_coworking['price']; ?>" />
						<input type="hidden" name="coworking_rate" value="<? echo $single_coworking['title']; ?>" />	
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header">
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-name">
								<span><? echo $single_coworking['title']; ?></span>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-features">
								<? echo $single_coworking['annotation']; ?>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-price">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-header-price-text">
									<span><? echo $single_coworking_price; ?></span> руб.<? echo $single_coworking_center_room_price_term_lookup?'/'.$single_coworking_center_room_price_term_lookup:'' ;?>
								<? 	if ($single_coworking['price_bonus']) {
									
										echo '<span class="special">' . $single_coworking['price_bonus'] . '</span>';
									
									} ?>
								</div>
								<button>Забронировать</button>
							</div>
						</div>
						<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form">
							<h2>Данные бронирования</h2>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-right">
								<input type="text" class="phone" name="phone" placeholder="+7 (___) ___-__-__" maxlength="18">
								<input type="text" class="email" name="email" placeholder="E-mail">
								<input type="text" class="name" name="name" placeholder="Имя">
								<textarea class="message" name="message" placeholder="Ваше сообщение"></textarea>
								<button class="coworking_submit">Забронировать коворкинг</button>
								<button class="disabled consultation" data-url="<?=$_SITE['section_paths']['request']['path']?>">Получить консультацию</button>
							</div>
							<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left">
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
										Бизнес-центр
									</div>
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
										<? echo $single_coworking['office_center_id_lookup']; ?>
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
										Тариф
									</div>
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
										<? echo $single_coworking['title']; ?>
									</div>
								</div>
							<?	if ($single_coworking_center_room_price_term_lookup) { ?>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
										Минимальный срок
									</div>
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
										<? echo $single_coworking_center_room_price_term_lookup; ?>
									</div>
								</div>
							<?	} ?>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item">
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
										Стоимость
									</div>
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
										<? echo $single_coworking_price; ?> руб.<?=$single_coworking_center_room_price_term_lookup?'/'.$single_coworking_center_room_price_term_lookup:''?>
									</div>
								</div>
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item input">
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-label">
										Рабочих мест
									</div>
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-item-value">
										<input type="number" class="coworking_workplaces" name="coworking_workplaces" value="1" min="1">
									</div>
								</div>
							<? /*
								<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-total">
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-total-label">
										Итого
									</div>
									<div class="vd_serviceincenter_wrapper-coworkingrates-list-item-form-left-total-value">
										<span class="total_coworking_price"><? echo $single_coworking_price; ?></span> руб./месяц
									</div>
								</div> */ ?>
							</div>
						</div>
					</form>
				</div>
				
				<?	
					
				}	
					
				?>
			</div>
		</div>
	</div>
	<?	
			
		}

		
	} 

	out_presentation($vd_service_presentation_url, $vd_service_group_id_css);

	out_special_offers_by_center($g_office_center_id, $vd_service_in_center_office_title); ?>
</div>