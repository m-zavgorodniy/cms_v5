<?

// отправлять заявку на этот адрес, если не один БЦ не отмечен
$feedback_email_default = $_SITE['settings']['email_feedback'];

if (isset($_POST['vd_send_request']) && $_POST['vd_send_request'] == 'true') {
	
	require $_SERVER['DOCUMENT_ROOT'] . '/lib/mail.php';
	
	$vd_request_phone = $_POST['phone'];
	
	$vd_request_email = $_POST['email'];
	
	$vd_request_name = $_POST['name'];
	
	$vd_request_message = $_POST['message'];
	
	$vd_request_office_centers = $_POST['vd_request_office_centers'];
	
	$vd_request_services = $_POST['vd_request_services'];
	
	$vd_request_manager_message = '';
	
	$vd_request_manager_message .= "Здравствуйте,\r\nНа сайте была оформлена новая заявка.";
	$vd_request_manager_message .= "\r\n";
	
	$vd_request_manager_message .= "\r\nДанные заявки";
	$vd_request_manager_message .= "\r\nИмя: " . $vd_request_name;
	$vd_request_manager_message .= "\r\nЭлектронная почта: " . $vd_request_email;
	$vd_request_manager_message .= "\r\nТелефон: " . $vd_request_phone;
	
	/* add office centers as list to manager message text */
	
	if (isset($vd_request_office_centers) && count($vd_request_office_centers) > 0) {
		
		$vd_request_manager_message .= "\r\n\r\nБизнес-центры";
		
		foreach ($vd_request_office_centers as $vd_request_office_center) {
			
			$vd_request_manager_message .= "\r\n" . $_DATA['office_center']['items'][$vd_request_office_center]['title'];
			
		}
		
	}
	
	/* add services as list to manager message text */
	
	if (isset($vd_request_services) && count($vd_request_services) > 0) {
		
		$vd_request_manager_message .= "\r\n\r\nУслуги";
		
		foreach ($vd_request_services as $vd_request_service) {
			
			$vd_request_manager_message .= "\r\n" . $vd_request_service;
			
		}
		
	}
	
	/* send requests to office center emails, if there were selected any */
	/* otherwise send to the default email message address */
	
	if (isset($vd_request_office_centers) && count($vd_request_office_centers) > 0) {
		
		foreach ($vd_request_office_centers as $vd_request_office_center) {
			
 			$vd_request_manager_email = $_DATA['office_center']['items'][$vd_request_office_center]['email_request'];
			
			mail_send($vd_request_manager_email, 'Новая заявка на сайте', $vd_request_manager_message);
			
		}
		
	} else {
		
		mail_send($feedback_email_default, 'Новая заявка на сайте', $vd_request_manager_message);
		
	}
	
	echo 'Спасибо, ваша заявка принята';
	
	exit;
	
}

?>
<div class="vd_specialoffer-header">
	<div class="g-container">
		<div class="g-container-row">
			<div class="vd_request_wrapper-content">
				<h1><?=$_SITE['section_title']?></h1>
				<div class="<?=$_SITE['config']['CONTENT_CSS_CLASS_NAME']?>">
					<p>
				<?	// текст над формой, меняется в системе управления
					if (isset($_DATA['article']['items'])) {
						$article = current($_DATA['article']['items']);
						if (trim($article['body'])) { ?>
							<?=$article['body']?>
					<?	}
					} ?>
					</p>
				</div>
			</div>
			<div class="vd_request_wrapper-form">
				<form method="POST">
					<input type="hidden" name="vd_send_request" value="true" />
					<input type="text" name="phone" class="phone" value="" placeholder="+7 (___) ___-__-__">
					<input type="text" name="email" class="email" value="" placeholder="E-mail">
					<input type="text" name="name" class="name" value="" placeholder="Имя">
					<textarea class="message" name="message" placeholder="Ваше сообщение"></textarea>
					<div class="vd_request_center_service">
						<div class="vd_request_center_service_list">
							<span>Бизнес-центры</span>
						<?
						
						foreach ($_DATA['office_center']['items'] as $office_center_item) {
							
							echo '<label><input type="checkbox" name="vd_request_office_centers[]" value="' . $office_center_item['id'] . '" /> ' . $office_center_item['title'] . '</label>';
							
						}	
							
						?>	
						</div>
						<div class="vd_request_center_service_list">
							<span>Услуги</span>
						<?
						
						foreach ($_DATA['service_group']['items'] as $service_group_item) {
							
							echo '<label><input type="checkbox" name="vd_request_services[]" value="' . $service_group_item['title'] . '" /> ' . $service_group_item['title'] . '</label>';
							
						}
							
						?>	
						</div>
					</div>
					<div class="vd_request_wrapper-button">
						<button>Отправить заявку</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>