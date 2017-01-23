<?
$mode = $_SITE['section_type']; // request|callback

$message_texts = array(
	'request' => array(
		'subject' => 'запрос на консультацию'
	),
	'callback' => array(
		'subject' => 'заказ обратного звонка'
	)
);

// use this email if no business centers have been ticked in the form - otherwise send to the email of any of the ticked centers
$manager_email_default = $_SITE['settings']['email_request'];

if (isset($_POST['vd_send_request']) && $_POST['vd_send_request'] == 'true') {
	
	if (!catch_spam('jcode', 'position', 'email')) {
		exit;
	}

	require $_SERVER['DOCUMENT_ROOT'] . '/lib/mail.php';
	
	$MY_POST = get_post();
	
	$vd_request_phone = $MY_POST['phone'];
	
	$vd_request_email = $MY_POST['email'];
	
	$vd_request_name = $MY_POST['name'];
	
	$vd_request_message = $MY_POST['message'];
	
	$vd_request_office_centers = $MY_POST['vd_request_office_centers'];
	
	$vd_request_services = $MY_POST['vd_request_services'];
	
	$vd_request_manager_message_details = '';
	
	//$vd_request_manager_message_details .= "\r\nИмя: " . $vd_request_name;
	$vd_request_manager_message_details .= "\r\nЭлектронная почта: " . $vd_request_email;
	$vd_request_manager_message_details .= "\r\nТелефон: " . $vd_request_phone;
	if ($vd_request_message) {
		$vd_request_manager_message_details .= "\r\n___messagetitle___:\r\n" . $vd_request_message;
	}
	
	/* add office centers as list to manager message text */
	
	if (isset($vd_request_office_centers) && count($vd_request_office_centers) > 0) {
		
		$vd_request_manager_message_details .= "\r\n\r\nБизнес-центры: ";
		
		foreach ($vd_request_office_centers as $vd_request_office_center) {
			
			$vd_request_manager_message_details .= $_DATA['office_center']['items'][$vd_request_office_center]['title'] . ", ";

			if (!isset($manager_email_bc) && $_DATA['office_center']['items'][$vd_request_office_center]['email_request']) {
				$manager_email_bc = $_DATA['office_center']['items'][$vd_request_office_center]['email_request'];
			}
			
		}

		$vd_request_manager_message_details = rtrim($vd_request_manager_message_details, ', ');
		
	}
	
	/* add services as list to manager message text */
	
	if (isset($vd_request_services) && count($vd_request_services) > 0) {
		
		$vd_request_manager_message_details .= "\r\n\r\nУслуги: ";
		
		foreach ($vd_request_services as $vd_request_service) {
			
			$vd_request_manager_message_details .= $vd_request_service . ", ";
			
		}

		$vd_request_manager_message_details = rtrim($vd_request_manager_message_details, ', ');
		
	}

	$manager_email = ($manager_email_bc?$manager_email_bc:$manager_email_default);
	
	if (true === mail_send($manager_email, 'Новый ' . $message_texts[$mode]['subject'] . ' на сайте', str_replace('___messagetitle___', "\r\nСообщение",
		"\r\nИмя: " . $vd_request_name . $vd_request_manager_message_details))) {
		
		$client_message = "Здравствуйте, " . $vd_request_name . "

мы получили Ваш " . $message_texts[$mode]['subject'] . ". Наш менеджер свяжется с Вами в рабочее время по будням с 10.00 до 19.00\r\n\r\n" .
		"Ваши данные" .
		$vd_request_manager_message_details . "\r\n\r\n\r\n\r\n" . 
		htmlspecialchars_decode($_SITE['settings']['client_email_footer']);
		mail_send($vd_request_email, 'Мы получили Ваш ' . $message_texts[$mode]['subject'], str_replace('___messagetitle___', "\r\nВаше сообщение", $client_message));
		$response['code'] = 0;
		$response['message'] = 'Спасибо, ваш ' . $message_texts[$mode]['subject'] . ' принят.';
	} else {
		$response['code'] = 500;
		$response['message'] = 'Ошибка. Попробуйте отправить запрос чуть позже.';
	}

	echo '{"code":' . $response['code'] . ',"message":"' . $response['message'] .'","data":{"mode":"' . $mode . '"}}';
	exit;
	
}
?>
<a href="#" class="scroll_to_top"></a>
<div class="vd_specialoffer-header">
	<div class="g-container">
		<div class="g-container-row">
			<div class="vd_request_wrapper-content">
				<h1><?=$_SITE['section_title']?></h1>
				<div class="<?=$_SITE['config']['CONTENT_CSS_CLASS_NAME']?>">
				<p></p>
				<?	// текст над формой, меняется в системе управления
					if (isset($_DATA['article']['items'])) {
						$article = current($_DATA['article']['items']);
						if (trim($article['body'])) { ?>
							<?=$article['body']?>
					<?	}
					} ?>
				</div>
			</div>
			<div class="vd_request_wrapper-form">
				<form method="POST">
					<input type="hidden" name="vd_send_request" value="true" />
					<input type="text" name="phone" class="phone" value="" placeholder="+7 (___) ___-__-__">
					<input type="text" name="email" class="email" value="" placeholder="E-mail">
					<input type="text" name="position" class="position" placeholder="Повторите Е-mаil" autocomplete="off">
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
					<input name="jcode" type="hidden" value="j<?=time()?>">
					<div class="vd_request_wrapper-button">
						<button>Отправить заявку</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>