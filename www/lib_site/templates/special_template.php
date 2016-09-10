<?
require $_SERVER['DOCUMENT_ROOT'] . '/lib/mail.php';

$special_offer = $_DATA['special_offer']['items'][$_GET['special']];

if ('POST' == $_SERVER['REQUEST_METHOD']) {
	$MY_POST = get_post();

	$special_offer_center = $MY_POST['special_offer_center'];
	$special_offer_phone = $MY_POST['special_offer_phone'];
	$special_offer_email = $MY_POST['special_offer_email'];
	$special_offer_name = $MY_POST['special_offer_name'];
	$special_offer_details = $MY_POST['special_offer_details'];
	$special_offer_message = $MY_POST['special_offer_message'];
	
	$special_offer_manager_message_text .= "Здравствуйте,\r\nНа сайте была оставлена заявка в разделе «Спецпредложения».";
		
	$special_offer_manager_message_text .= "\r\n";
	
	$special_offer_manager_message_text .= "\r\nДанные заявки";
	$special_offer_manager_message_text .= "\r\nОфис-центр: " . $special_offer_center;
	$special_offer_manager_message_text .= "\r\nСпецпредложеие: " . $special_offer_details;
	$special_offer_manager_message_text .= "\r\nИмя: " . $special_offer_name;
	$special_offer_manager_message_text .= "\r\nE-mail: " . $special_offer_email;
	$special_offer_manager_message_text .= "\r\nТелефон: " . $special_offer_phone;
	$special_offer_manager_message_text .= "\r\nСообщение: " . $special_offer_message;
	
	$special_offer_customer_message_text .= "Здравствуйте,\r\nВаше заявка по спецпредложению была принята.";
	
	$special_offer_customer_message_text .= "\r\n";
	
	$special_offer_customer_message_text .= "\r\nДанные заявки";
	$special_offer_customer_message_text .= "\r\nОфис-центр: " . $special_offer_center;
	$special_offer_customer_message_text .= "\r\nСпецпредложеие: " . $special_offer_details;
	$special_offer_customer_message_text .= "\r\nИмя: " . $special_offer_name;
	$special_offer_customer_message_text .= "\r\nE-mail: " . $special_offer_email;
	$special_offer_customer_message_text .= "\r\nТелефон: " . $special_offer_phone;
	$special_offer_customer_message_text .= "\r\nСообщение: " . $special_offer_message;
	
	if ($special_offer_center && $special_offer_phone && $special_offer_email && $special_offer_name && $special_offer_message && $special_offer_details) {
	
		if (mail_send($_SITE['settings']['email_request'], 'Новая заявка по спецпредложению', $about_contacts_manager_message_text)) {
			mail_send($special_offer_email, 'Ваша заявка по спецпредложению принята', $special_offer_customer_message_text);
			echo 'Спасибо, ваша заявка принята';
		} else {
			echo 'Ошибка при приеме заявки. Пожалуйста, попробуйте еще раз чуть позже';
		}

	}
	exit;
}
?>
<div class="vd_specialoffer">
	<div class="vd_specialoffer-header">
		<div class="g-container">
			<div class="vd_specialoffer-header-dates"><?=text_date_str($special_offer['date_from'], 'ru_RU', 'j M')?><?=$special_offer['date_to']?' – ' . text_date_str($special_offer['date_to'], 'ru_RU', 'j M'):''?></div>
		<?	foreach (explode(',', $special_offer['service_group_css_class']) as $special_offer_css) { ?>
				<div class="vd_specialoffer-header-<?=$special_offer_css?>"></div>
		<?	} ?>
			<h1><?=$special_offer['title']?></h1>
			<p><?=$special_offer['annotation']?></p>
		</div>
	</div>

	<div class="vd_specialoffer-offers">
		<div class="g-container">
			<div class="vd_specialoffer-offers-title">Бизнес-центры, в которых идет акция</div>
			<div class="vd_specialoffer-offers-list">
				<?
				
				$in_office_centers = explode(',', $special_offer['office_center_id']);

				foreach ($_DATA['office_center']['items'] as $special_offer_office_center) {
					
					if (false === array_search($special_offer_office_center['id'], $in_office_centers)) continue;
					
				?>
				<div class="vd_specialoffer-offers-list-element">
					<div class="vd_specialoffer-offers-list-element-header">
						<div class="vd_specialoffer-offers-list-element-header-office">
							<div class="vd_specialoffer-offers-list-element-header-office-img" style="background-image: url('<? echo $special_offer_office_center['ext_img_src']; ?>')"></div>
							<span><? echo $special_offer_office_center['title']; ?></span>
						</div>
						<div class="vd_specialoffer-offers-list-element-header-services">
							<?
								
							$special_offer_office_center_service_groups = explode(',', $special_offer_office_center['service_group']);
								
							foreach($special_offer_office_center_service_groups as $special_offer_office_center_service_group) {
								
								$special_offer_office_center_service_group_title = $_DATA['service_group']['items'][$special_offer_office_center_service_group]['title'];
								
							?>
							
							<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_<? echo $special_offer_office_center_service_group; ?>" title="<? echo $special_offer_office_center_service_group_title; ?>"></div>
							
							<?
								
							}	
							
							?>
						</div>
						<div class="vd_specialoffer-offers-list-element-header-place">
							<div class="reserve">ОСТАВИТЬ ЗАЯВКУ</div>
							<span class="price">
							<?
							
							if ($special_offer_office_center['metro_id_lookup'] != "") {
								echo '<div class="vd_specialoffer-offers-list-element-header-place-marker" style="background-color: ' . $special_offer_office_center['metro_color'] . ';"></div> ' . $special_offer_office_center['metro_id_lookup'];
							} else {
								echo $special_offer_office_center['city_id_lookup'];
							}
								
							?>
							</span>
						</div>
					</div>
					<div class="vd_specialoffer-offers-list-element-menu">
						<form method="post">
							<div class="vd_specialoffer-offers-list-element-menu-reserveform">
								<div class="vd_specialoffer-offers-list-element-menu-reserveform-left">
									<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-text">
										Если вас заинтересовало наше предложение – оставьте свои данные и наш менеджер свяжется с вами.
									</div>
									<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-photo">
										<img src="" />
									</div>
									<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-name">
										Ник Гевин
									</div>
									<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-phone">
										<? echo $special_offer_office_center['phone']; ?>
									</div>
									<div class="vd_specialoffer-offers-list-element-menu-reserveform-left-email">
										<a href="mailto:<? echo $special_offer_office_center['email_request']; ?>"><? echo $special_offer_office_center['email_request']; ?></a>
									</div>
								</div>
								<div class="vd_specialoffer-offers-list-element-menu-reserveform-right">
									<input type="hidden" name="special_offer_center" value="<? echo $special_offer_office_center['title']; ?>">
									<input type="hidden" name="special_offer_details" value="Вирутальный офис +4 часа переговорных в подарок">
									<input type="text" name="special_offer_phone" class="phone" value="" placeholder="+7 (___) ___-__-__">
									<input type="text" name="special_offer_email" class="email" value="" placeholder="E-mail">
									<input type="text" name="special_offer_name" class="name" value="" placeholder="Имя">
									<textarea name="special_offer_message" class="message" placeholder="Ваше сообщение"></textarea>
									<button>ОСТАВИТЬ ЗАЯВКУ</button>
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

<?	// count($_DATA['special_offer']['items']) == 1 meens that we've got one and only special offer and we are on its page
 	// but we want OTHER special offers to be here
	if (isset($_DATA['special_offer']) && count($_DATA['special_offer']['items']) > 1) { ?>
		<div class="vd_singleofficewrapper-content-special">
			<a name="special"></a>
			<div class="g-container">
				<div class="g-container-row">
					<h2 class="g-section-title">Другие спецпредложения</h2>

				<?	out_special_offers($_DATA['special_offer']['items'], (int)$_GET['special']); ?>

				</div>
			</div>
		</div>
<?	} ?>	
</div>