<?
	
	/* for development purposes only, remove when moving to the correct templates */

	if ($_GET['display_service']) {

		include('service_template.php'); 

	} elseif ($_GET['display_special']) {

		include('special_template.php'); 

	} else {

	/* single office center template */
	if ($_DATA['office_center']['is_single'] == true) {
		
		$single_office_center = $_DATA['office_center']["items"][$_GET['center']];
		
		$single_office_center_city_label = $single_office_center['city_id_lookup'];
		$single_office_center_city_id = $single_office_center['city_id'];
		
		$single_office_center_img_int = $single_office_center['int_img_src'];
		$single_office_center_img_ext = $single_office_center['ext_img_src'];
		
		$single_office_center_annotation = $single_office_center['annotation'];
		$single_office_center_body = $single_office_center['body'];
		
		$single_office_center_service_labels = $single_office_center['service_group_lookup'];
		
		$single_office_center_service_ids = $single_office_center['service_group'];
		
		$single_office_center_service_id_group = explode(',', $single_office_center_service_ids);
		
		$single_office_center_phone = $single_office_center['phone'];
		$single_office_center_email = $single_office_center['email_request'];
		
		$single_office_center_coordinates = $single_office_center['google_map'];
		
		$single_office_center_title = $single_office_center['title'];
		
?>

<div class="vd_singleofficewrapper">
	<div class="vd_singleofficewrapper-header" style="background-image: url(<?php echo $single_office_center_img_int; ?>); background-size: cover;">
		<div class="vd_singleofficewrapper-header-subtitle">
			Бизнес-центр
		</div>
		<div class="vd_singleofficewrapper-header-name">
			<? echo $single_office_center_title; ?>
		</div>
		<div class="vd_singleofficewrapper-header-body">
			<? echo $single_office_center_body; ?>
		</div>
	</div>
	<div class="vd_singleofficewrapper-menu">
		<ul>
			<li><a href="#about">О бизнес-центре</a></li>
			<li><a href="#gallery">Галерея</a></li>
			<li><a href="#services">Услуги бизнес-центра</a></li>
			<li><a href="#special">Спецпредложения центра</a></li>
			<li><a href="#contacts">Контакты</a></li>
		</ul>
	</div>
	<div class="vd_singleofficewrapper-content">
		<div class="vd_singleofficewrapper-content-about">
			<a name="about"></a>
			<div class="vd_singleofficewrapper-content-about-title">
				О бизнес-центре
			</div>
			<div class="vd_singleofficewrapper-content-about-block">
				<div class="vd_singleofficewrapper-content-about-block-image">
					
				</div>
				<div class="vd_singleofficewrapper-content-about-block-text">
					Деловая инфраструктура района предельно развита, более того, поблизости находятся значимые объекты культуры и архитектуры — Курский вокзал, музей геодезии и картографии, музей уникальных кукол, множество храмов и церквей.
				</div>
			</div>
			<div class="vd_singleofficewrapper-content-about-block">
				<div class="vd_singleofficewrapper-content-about-block-image">
					
				</div>
				<div class="vd_singleofficewrapper-content-about-block-text">
					К тому же, в каждое предложение входит ряд других услуг, которые помогут вам полностью сконцентрироваться на деловых вопросах и не отвлекаться на организационные и хозяйственные проблемы. Мы предлагаем аренду офиса от собственника без посредников, аренда офиса с ОЦ «Деловой», поэтому не стоит волноваться о дополнительных расходах.
Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!
				</div>
			</div>
			<div class="vd_singleofficewrapper-content-about-block">
				<div class="vd_singleofficewrapper-content-about-block-image">
					
				</div>
				<div class="vd_singleofficewrapper-content-about-block-text">
					Аренда офиса на Курской, в столь привлекательном районе Москвы, является, безусловно, выгоднейшим вложением в бизнес. А учитывая наши выгодные тарифы, снять офис на Курской стало абсолютно реальным.
				</div>
			</div>
			<div class="vd_singleofficewrapper-content-about-block">
				<div class="vd_singleofficewrapper-content-about-block-image">
					
				</div>
				<div class="vd_singleofficewrapper-content-about-block-text">
					Все помещения отличаются современным оснащением, поэтому можете быть уверены, что никаких проблем с техническими средствами не возникнет. Все, что требуется, — снять офис и приступить к работе!
				</div>
			</div>
		</div>
		<div class="vd_singleofficewrapper-content-gallery">
			<a name="gallery"></a>
			<div class="vd_singleofficewrapper-content-gallery-title">
				Галерея
			</div>
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
		<div class="vd_singleofficewrapper-content-services">
			<a name="services"></a>
			<div class="vd_singleofficewrapper-content-services-title">
				Услуги
			</div>
			<table class="vd_singleofficewrapper-content-services-table">
				<tr>
					<th class="service_header_label_block">Основные услуги</th>
					<th class="service_header_content_block office"><span>Офисы</span></th>
					<th class="service_header_content_block coworking"><span>Коворкинг</span></th>
					<th class="service_header_content_block negotiating"><span>Переговорные</span></th>
					<th class="service_header_content_block virtual"><span>Виртуальный офис</span></th>
				</tr>
				<tr>
					<td class="service_header_label_block">Стоимость услуг</td>
					<td class="service_price">от <span>13 490</span> руб./мес</td>
					<td class="service_price">от <span>12 490</span> руб./мес</td>
					<td class="service_price">от <span>520</span> руб./час</td>
					<td class="service_price">от <span>3 500</span> руб./мес</td>
				</tr>
				<tr>
					<td></td>
					<td class="detailed_block office"><a href=""><span>Подробнее</span></a></td>
					<td class="detailed_block coworking"><a href=""><span>Подробнее</span></a></td>
					<td class="detailed_block negotiating"><a href=""><span>Подробнее</span></a></td>
					<td class="detailed_block virtual"><a href=""><span>Подробнее</span></a></td>
				</tr>
				<tr>
					<td colspan="5" class="services_subtitle">Дополнительные сервисы, входящие в услуги</td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Секретарь</span></td>
					<td class="office_block"><div class="included"></div></td>
					<td class="coworking_block"><div class="included"></div></td>
					<td class="negotiating_block"><div class="included"></div></td>
					<td class="virtual_block"><div class="included"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Мебель</span></td>
					<td class="office_block"><div class="included"></div></td>
					<td class="coworking_block"><div class="included"></div></td>
					<td class="negotiating_block"><div class="included"></div></td>
					<td class="virtual_block"><div class="not_included"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Интернет</span></td>
					<td class="office_block"><div class="included"></div></td>
					<td class="coworking_block"><div class="included"></div></td>
					<td class="negotiating_block"><div class="included"></div></td>
					<td class="virtual_block"><div class="not_included"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Почтовый адрес</span></td>
					<td class="office_block"><div class="included"></div></td>
					<td class="coworking_block"><div class="included"></div></td>
					<td class="negotiating_block"><div class="not_included"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Телефония</span></td>
					<td class="office_block"><div class="payed"></div></td>
					<td class="coworking_block"><div class="payed"></div></td>
					<td class="negotiating_block"><div class="payed"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Курьер</span></td>
					<td class="office_block"><div class="payed"></div></td>
					<td class="coworking_block"><div class="payed"></div></td>
					<td class="negotiating_block"><div class="payed"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>IT поддержка</span></td>
					<td class="office_block"><div class="payed"></div></td>
					<td class="coworking_block"><div class="payed"></div></td>
					<td class="negotiating_block"><div class="payed"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Поиск персонала</span></td>
					<td class="office_block"><div class="payed"></div></td>
					<td class="coworking_block"><div class="payed"></div></td>
					<td class="negotiating_block"><div class="payed"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Юрист</span></td>
					<td class="office_block"><div class="payed"></div></td>
					<td class="coworking_block"><div class="payed"></div></td>
					<td class="negotiating_block"><div class="payed"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Юридический адрес</span></td>
					<td class="office_block"><div class="payed"></div></td>
					<td class="coworking_block"><div class="payed"></div></td>
					<td class="negotiating_block"><div class="payed"></div></td>
					<td class="virtual_block"><div class="payed"></div></td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Видео конференция</span></td>
					<td class="office_block last_block"><div class="not_included"></div></td>
					<td class="coworking_block last_block"><div class="not_included"></div></td>
					<td class="negotiating_block last_block"><div class="payed"></div></td>
					<td class="virtual_block last_block"><div class="not_included"></div></td>
				</tr>
			</table>
		</div>
		<div class="vd_singleofficewrapper-content-contacts">
			<a name="contacts"></a>
			<div class="vd_singleofficewrapper-content-contacts-title">
				Контакты
			</div>
			<div class="vd_singleofficewrapper-content-contacts-details">
				<div class="vd_singleofficewrapper-content-contacts-details-left">
					Москва, Нижний Сусальный переулок, 5, стр. 19, 3 этаж
					<ul>
						<li>Курская, 5 минут пешком</li>
					</ul>
				</div>
				<div class="vd_singleofficewrapper-content-contacts-details-right">
					<table class="vd_singleofficewrapper-content-contacts-details-right-contactstable">
						<tr>
							<td>Телефон:</td>
							<td><? echo $single_office_center_phone; ?></td>
						</tr>
						<tr>
							<td>Е-mail:</td>
							<td><? echo $single_office_center_email; ?></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" class="vd_singleofficewrapper-content-contacts-coordinates" value="<? echo $single_office_center_coordinates; ?>" />
		</div>
		<div class="vd_mapwrapper">
			<div id="vd_mapwrapper-map"></div>
		</div>
		<div class="vd_singleofficewrapper-content-special">
			<a name="special"></a>
			<div class="vd_singleofficewrapper-content-special-title">
				Cпецпредложения
			</div>
			<div class="vd_singleofficewrapper-content-special-list">
				<div class="vd_singleofficewrapper-content-special-list-item office">
					<div class="vd_singleofficewrapper-content-special-list-item-text"><!--
						--><span>Получите скидку 10% на аренду офиса</span>
					</div>
					<div class="vd_singleofficewrapper-content-special-list-item-date">
						1 февраля – 29 апреля 2016
					</div>
					<a href="" class="vd_singleofficewrapper-content-special-list-item-details">
						<span>Подробнее</span>
					</a>
				</div>
				<div class="vd_singleofficewrapper-content-special-list-item virtual">
					<div class="vd_singleofficewrapper-content-special-list-item-text"><!--
						--><span>Виртуальный офис + 4 часа переговорных в подарок</span>
					</div>
					<div class="vd_singleofficewrapper-content-special-list-item-date">
						20 марта – 18 мая  2016
					</div>
					<a href="" class="vd_singleofficewrapper-content-special-list-item-details">
						<span>Подробнее</span>
					</a>
				</div>
				<div class="vd_singleofficewrapper-content-special-list-item negotiating">
					<div class="vd_singleofficewrapper-content-special-list-item-text"><!--
						--><span>Акция февраля – скидка 70% на аренду переговорных</span>
					</div>
					<div class="vd_singleofficewrapper-content-special-list-item-date">
						1 февраля – 29 апреля 2016
					</div>
					<a href="" class="vd_singleofficewrapper-content-special-list-item-details">
						<span>Подробнее</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="vd_singleofficewrapper-other">
		<div class="vd_singleofficewrapper-other-title">
			Другие бизнес-центры
		</div>
		<div class="vd_singleofficewrapper-other-list">
			<div class="vd_officelistwrapper-office">
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-photo">
						<img src="http://dev.viaduct.pro/uploads/images/office_centers/alekseevskaya/alekseevskaya_ext_460x171.jpg">
					</div>
				</a>
				<div class="vd_officelistwrapper-office-services">
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_1"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_3"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_4"></div>
				</div>
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-name">Алексеевская Башня</div>
				</a>
				<div class="vd_officelistwrapper-office-place">Москва</div>
				<div class="vd_officelistwrapper-office-text"><p>Офисный центр «Деловой» предлагает в аренду полностью оборудованные помещения в современном Бизнес-центре «Алексеевская Башня» (ст.м. ВДНХ), оснащенные всем необходимым для работы.&nbsp;10&nbsp;минут пешком от м.ВДНХ / 1&nbsp;км от Проспекта Мира</p>
				</div>
			</div>
			<div class="vd_officelistwrapper-office">
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-photo">
						<img src="http://dev.viaduct.pro/uploads/images/office_centers/alekseevskaya/alekseevskaya_ext_460x171.jpg">
					</div>
				</a>
				<div class="vd_officelistwrapper-office-services">
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_1"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_3"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_4"></div>
				</div>
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-name">Алексеевская Башня</div>
				</a>
				<div class="vd_officelistwrapper-office-place">Москва</div>
				<div class="vd_officelistwrapper-office-text"><p>Офисный центр «Деловой» предлагает в аренду полностью оборудованные помещения в современном Бизнес-центре «Алексеевская Башня» (ст.м. ВДНХ), оснащенные всем необходимым для работы.&nbsp;10&nbsp;минут пешком от м.ВДНХ / 1&nbsp;км от Проспекта Мира</p>
				</div>
			</div>
			<div class="vd_officelistwrapper-office">
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-photo">
						<img src="http://dev.viaduct.pro/uploads/images/office_centers/alekseevskaya/alekseevskaya_ext_460x171.jpg">
					</div>
				</a>
				<div class="vd_officelistwrapper-office-services">
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_1"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_3"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_4"></div>
				</div>
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-name">Алексеевская Башня</div>
				</a>
				<div class="vd_officelistwrapper-office-place">Москва</div>
				<div class="vd_officelistwrapper-office-text"><p>Офисный центр «Деловой» предлагает в аренду полностью оборудованные помещения в современном Бизнес-центре «Алексеевская Башня» (ст.м. ВДНХ), оснащенные всем необходимым для работы.&nbsp;10&nbsp;минут пешком от м.ВДНХ / 1&nbsp;км от Проспекта Мира</p>
				</div>
			</div>
			<div class="vd_officelistwrapper-office">
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-photo">
						<img src="http://dev.viaduct.pro/uploads/images/office_centers/alekseevskaya/alekseevskaya_ext_460x171.jpg">
					</div>
				</a>
				<div class="vd_officelistwrapper-office-services">
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_1"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_3"></div>
					<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_4"></div>
				</div>
				<a href="?center=1">
					<div class="vd_officelistwrapper-office-name">Алексеевская Башня</div>
				</a>
				<div class="vd_officelistwrapper-office-place">Москва</div>
				<div class="vd_officelistwrapper-office-text"><p>Офисный центр «Деловой» предлагает в аренду полностью оборудованные помещения в современном Бизнес-центре «Алексеевская Башня» (ст.м. ВДНХ), оснащенные всем необходимым для работы.&nbsp;10&nbsp;минут пешком от м.ВДНХ / 1&nbsp;км от Проспекта Мира</p>
				</div>
			</div>
		</div>
	</div>
	<div class="vd_singleofficewrapper-footer">
		<p>«Деловой» предлагает гораздо большее: современную недвижимость для малого предпринимателя, помощь в оптимизации расходов на аренду и выход на новый уровень ведения бизнеса. Цены на аренду офисов начинаются от 11 и до 15,5 тыс. рублей за 1 рабочее место в месяц, а расценки на аренду переговорных 700 (в 3-х центрах) и 1800 рублей в час (в Гостином Дворе). При этом чем больше часов вы у нас работаете, тем больше скидка. Наши цены оптимальны и справедливы, не занижены искусственно за счет дополнительных скрытых платежей.</p>
	</div>
</div>

<?		
	
	/* office center catalog template */	
	} else {

?>

<div class="vd_officelistwrapper-map">
	<div class="vd_mapwrapper">
		<div id="vd_mapwrapper-map"></div>	
	</div>
</div>

<div class="vd_officelistwrapper">
<?
	$vd_office_centers = $_DATA["office_center"]["items"];
	
	foreach ($vd_office_centers as $single_office_center) {
		
		$single_office_center_id = $single_office_center['id'];
		
		$single_office_center_city_label = $single_office_center['city_id_lookup'];
		$single_office_center_city_id = $single_office_center['city_id'];
		
		$single_office_center_img_int = $single_office_center['int_img_src'];
		$single_office_center_img_ext = $single_office_center['ext_img_src'];
		
		$single_office_center_annotation = $single_office_center['annotation'];
		$single_office_center_body = $single_office_center['body'];
		
		$single_office_center_service_labels = $single_office_center['service_group_lookup'];
		
		$single_office_center_service_ids = $single_office_center['service_group'];
		
		$single_office_center_service_id_group = explode(',', $single_office_center_service_ids);
		
		$single_office_center_phone = $single_office_center['phone'];
		$single_office_center_email = $single_office_center['email_request'];
		
		$single_office_center_coordinates = $single_office_center['google_map'];
		
		$single_office_center_title = $single_office_center['title'];
		
		$single_office_center_published = $single_office_center['published'];
		
		if ($single_office_center_published == '1') {
			
			echo '<div class="vd_officelistwrapper-office">';
			
				echo '<input type="hidden" class="vd_officelistwrapper-office-coordinates" value="' . $single_office_center_coordinates . '">';
			
				echo '<a href="?center=' . $single_office_center_id . '">';
			
					echo '<div class="vd_officelistwrapper-office-photo">';
					
						echo '<img src="http://' . $_SERVER['HTTP_HOST'] . $single_office_center_img_int . '">';
					
					echo '</div>';
					
				echo '</a>';
				
				echo '<div class="vd_officelistwrapper-office-services">';
				
				foreach ($single_office_center_service_id_group as $single_office_center_service_id_single) {
					
					echo '<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_' . $single_office_center_service_id_single . '"></div>';
					
				}
				
				echo '</div>';
				
				echo '<a href="?center=' . $single_office_center_id . '">';
				
					echo '<div class="vd_officelistwrapper-office-name">' . $single_office_center_title . '</div>';
					
				echo '</a>';
				
				echo '<div class="vd_officelistwrapper-office-place">' . $single_office_center_city_label . '</div>';
				
				echo '<div class="vd_officelistwrapper-office-text">' . $single_office_center_annotation . '</div>';
			
			echo '</div>';
			
		}
		
	}
?>	
</div>

<div class="vd_officelistdata">
	<div class="vd_officelistdata-block">
		<div class="vd_officelistdata-block-title">
			Проблема аренды площадей
		</div>
		<div class="vd_officelistdata-block-text">
			<p>В Москве каждый год появляются новые офисные центры, аренда площадей в которых считается престижным и выгодным капиталовложением. В каждом из таких центров доступны сотни самых разных помещений со всеми коммуникациями и современным дизайном.</p>
			<p>Однако зачастую представители малого бизнеса обходят их стороной, опасаясь высоких расценок и кабальных условий договоров аренды.</p>
			<p>Натыкаясь на объявления в Интернете: «офисные центры аренда», мелкие предприниматели даже не пытаются узнать условия у арендодателя. Не торопятся идти навстречу мелким арендаторам и сами владельцы бизнес-центров, ведь гораздо выгодней сдавать в аренду большие объемы площадей на длительные сроки.</p>
		</div>
	</div>
	<div class="vd_officelistdata-block">
		<div class="vd_officelistdata-block-title">
			Аренда в офисном центре –оптимальное решение
		</div>
		<div class="vd_officelistdata-block-text">
			<p>Сеть офисных центров «Деловой» создана именно для того, что бы решить эту проблему и сделать аренду в офисных центрах доступной для небольших компаний. Это первая сеть в России, цель которой создать достойную инфраструктуру для малого бизнеса.</p>
			<p>Теперь к услугам малых предпринимателей аренда в офисных центрах, которой можно пользоваться и оплачивать понедельно.</p>
			<p>Иными словами, есть возможность забронировать офис как столик в ресторане или билет в кинотеатр. Такие малые офисы сдаются в четырех бизнес-центрах класса B+ и А: «Омега-плаза», «Алексеевская башня», «Гостиный двор» и «Арма», которые расположены в самых престижных районах города.</p>
		</div>
	</div>
	<div class="vd_officelistdata-block">
		<div class="vd_officelistdata-block-title">
			Очевидный эффект
		</div>
		<div class="vd_officelistdata-block-text">
			<p>За умеренную плату арендатор получает:</p>
				<ul>
					<li>Офисы или переговорные комнаты</li>
					<li>Бесплатный интернет и телефонию</li>
					<li>Услуги секретарей, юристов, системных администраторов и инженеров и курьеров</li>
					<li>Услуги профессиональной охраны</li>
					<li>Парковку</li>
					<li>Всю инфраструктуру делового центра (фитнес-залы, рестораны, кафе, банки, страховые компании, магазины, шоу-румы и пр.).</li>
				</ul>
			<p>При этом совсем необязательно заключать долгосрочный договор аренды, вносить большой депозит и страховать офис от несчастного случая. Если вам нужно встретиться с важными людьми или провести совещание с коллегами, то лучшего варианта, чем аренда переговорной в сети центров «Деловой», не найти. Этот вариант очень удобен тогда, когда в компании работает всего несколько человек, а встречи с клиентами проходят 2-3 раза в месяц.</p>
		</div>
	</div>
</div>

<?
}

}

?>


