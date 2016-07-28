<?
	
	if ($_GET['azaza'] == 'true') {
		
		var_dump($_DATA); die;
		
	}
	
	/* for development purposes only, remove when moving to the correct templates */

	if ($_GET['display_service']) {

		include('service_template.php'); 

	} elseif ($_GET['display_special']) {

		include('special_template.php'); 

	} elseif ($_GET['display_blog']) {

		include('blog_template.php'); 

	} elseif ($_GET['display_about']) {

		include('about_template.php'); 

	} else {
	

	// we've got all the office centers in the data even on the single center page (to display the other centers)
	// so we don't have $_DATA['office_center']['is_single'] here - work directly with the parameter
	$g_office_center_id = (int)$_GET['center'];

	/* single service in office center */
		
	if ($g_office_center_id && $_DATA['service_group']['is_single']) {
		
		include('service_template.php');
	
	/* single office center */	
		
	} elseif ($g_office_center_id) {
		
		$single_office_center = $_DATA['office_center']['items'][$g_office_center_id];
		
		
		$single_office_center_city_label = $single_office_center['city_id_lookup'];
		$single_office_center_city_id = $single_office_center['city_id'];
		
		$single_office_center_metro_id = $single_office_center['metro_id'];
		
		$single_office_center_metro_label = $single_office_center['metro_id_lookup'];
		$single_office_center_metro_color = $single_office_center['metro_color'];
		
		if ($single_office_center_metro_color == NULL) {
			$single_office_center_metro_color = '#000000';
		}
		
		$single_office_center_color = $single_office_center['color'];
		
		if ($single_office_center_color == NULL) {
			$single_office_center_color = '#000000';
		}
		
		$single_office_center_img_int = $single_office_center['int_img_src'];
		$single_office_center_img_ext = $single_office_center['ext_img_src'];
		
		$single_office_center_annotation = $single_office_center['annotation'];
		
		$single_office_center_body = $single_office_center['body'];
		
		$single_office_center_service_labels = $single_office_center['service_group_lookup'];
		
		$single_office_center_service_ids = $single_office_center['service_group'];
		
		$single_office_center_service_id_group = explode(',', $single_office_center_service_ids);
		
		$single_office_center_address = $single_office_center['address'];
		$single_office_center_phone = $single_office_center['phone'];
		$single_office_center_email = $single_office_center['email_request'];
		
		$single_office_center_coordinates = $single_office_center['google_map'];
		
		$single_office_center_title = $single_office_center['title'];
		
		/* check if there's a gallery for this business center */
		
		$vd_show_gallery = false;
		
		foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
			
			if ($office_center_detail['office_center_detail_type_id'] == 'gallery') {
				
				$vd_show_gallery = true;
				
			}
			
		}
		
?>

<div class="vd_singleofficewrapper">
	<div class="vd_singleofficewrapper-header" style="background-image: url(<?php echo $single_office_center_img_ext; ?>); background-size: cover;">
		<div class="vd_singleofficewrapper-header-subtitle">
			Бизнес-центр
		</div>
		<h1>
			<? echo $single_office_center_title; ?>
		</h1>
		<div class="vd_singleofficewrapper-header-body">
			<? echo $single_office_center_annotation; ?>
		</div>
	</div>
	<div class="vd_singleofficewrapper-menu">
		<div class="g-container">
		<div class="g-container-row">	
		<ul>
			<li><a href="#about">О бизнес-центре</a></li>
			<?
				if ($vd_show_gallery) {
			?>
			<li><a href="#gallery">Галерея</a></li>
			<?
				}
			?>
			<li><a href="#services">Услуги бизнес-центра</a></li>
			<li><a href="#special">Спецпредложения центра</a></li>
			<li><a href="#contacts">Контакты</a></li>
			<li class="helper"></li>
		</ul>
		</div>
		</div>
	</div>
	<div class="vd_singleofficewrapper-content">
		<div class="vd_singleofficewrapper-content-about">
			<div class="g-container">
			<a name="about"></a>
			<h2 class="g-section-title">О бизнес-центре</h2>
			<?
				
			/* count the number of text detail items */
				
			$office_center_details_count = 0;
			
			foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
				if ($office_center_detail['office_center_detail_type_id'] == 'text') {
					$office_center_details_count++;
				}
			}
			
			/* count the number of items in the columns */
			
			$office_center_details_column_count = (int) ceil($office_center_details_count / 2);
			
			$office_center_details_number = 1;
			
			foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
				
				if ($office_center_detail['office_center_detail_type_id'] == 'text') {
					
					/* open the column if the item is first or we are after half of them */
					
					if ($office_center_details_number == 1 || $office_center_details_number == ($office_center_details_column_count + 1)) {
						
						echo '<div class="vd_singleofficewrapper-content-about-column">';
						
					}
					
					?>
					
					<div class="vd_singleofficewrapper-content-about-block">
						<div class="vd_singleofficewrapper-content-about-block-image">
							<?
							
							if ($office_center_detail['img_src'] != "") {
								echo '<img src="' . $office_center_detail['img_src'] . '" />';
							} else {
								echo '<img src="/uploads/images/icons/svg/infrastructure.svg" />';
							}
								
							?>
						</div>
						<div class="vd_singleofficewrapper-content-about-block-text">
							<? echo $office_center_detail['body']; ?>
						</div>
					</div>		
					
					<?
						
					/* close the column if the item is last or we are at half of them */
						
					if ($office_center_details_number == $office_center_details_column_count || $office_center_details_number == $office_center_details_count) {
						
						echo '</div>';
						
					}
					
					$office_center_details_number++;
					
				}
				
			}	
				
			?>
			</div>
		</div>
		<?
		
		if ($vd_show_gallery == true) {
			
		?>
		<div class="vd_singleofficewrapper-content-gallery">
			<a name="gallery"></a>
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
		<div class="vd_singleofficewrapper-content-services">
			<div class="g-container">
			<a name="services"></a>
			<h2 class="g-section-title">Услуги</h2>
			<table class="vd_singleofficewrapper-content-services-table">
				<tr>
					<th class="service_header_label_block">Основные услуги</th>
				<?
				
					/* outputing the service table header, using the service group title and css signature */
					
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['service_group_id_lookup'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_office_center_service_group_id]['css_signature'];
						
						if ($vd_office_center_service_group_published === '1') {
							
							echo '<th class="service_header_content_block ' . $vd_service_group_id_css . '"><span>' . $vd_office_center_service_group_title . '</span></th>';
							
						}
						
					}
						
				?>
					

				</tr>
				<tr>
					<td class="service_header_label_block">Стоимость услуг</td>
				<?
					
					/* outputing the service price cells, styling the price to bolden the digits */
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						
						$vd_office_center_service_group_price = preg_replace('/(\d+)/', '<span>$1</span>', $vd_office_center_service_group_price);
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="service_price ' . $vd_service_group_id_css . '">' . $vd_office_center_service_group_price . '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td></td>
				<?
					/* outputing the service detail links, using the service group ids and office center ids */
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_office_center_service_group_id]['css_signature'];
						$vd_office_center_service_group_center_id = $vd_office_center_service_group['office_center_id'];
						
						if ($vd_office_center_service_group_published === '1') {
							
							echo '<td><a class="g-button c-' . $vd_service_group_id_css . '"href="?center=' . $vd_office_center_service_group_center_id . '&service=' . $vd_office_center_service_group_id . '">Подробнее</a></td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td colspan="5" class="services_subtitle">Дополнительные сервисы, входящие в услуги</td>
				</tr>
				<?
					
				/* get the last element key to check against in the table */
				
				$last_service_single_key = end(array_keys($_DATA['service']['items']));
				
				/* loop over all availible services, such as it support, internet, etc */
				
				// let's get the rows in an array first, to sort them before display
				$out_service_rows = array();
				ob_start();

				foreach ($_DATA['service']['items'] as $service_single_key => $service_single) {
					
					$service_single_id = $service_single['id'];
					$service_single_title = $service_single['title'];
					
					/* start the output by displaying a table row, if this service is published */
					
					if ($service_single['published'] === '1') {
						
						// will hold the 'inclusive' value for the first column
						// 1 - included, 0 - included for a fee, -1 - not included
						$is_inclusive_in_first_column = null; // nuke it before getting into the loop by columns

						echo '<tr>';

						echo '<td class="service_label_block"><span>' . $service_single_title . '</span></td>';
						
						/* loop over the parent service groups of this office center, to keep the same structure as the table header */
						
						foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
							
							$vd_office_center_service_group_id = $vd_office_center_service_group['service_group_id'];
							$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_office_center_service_group_id]['css_signature'];
							
							/* display the table cell of this service in this service group */
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							$service_was_displayed = false;
							
							/* loop over all services to find out those, that should go here */
							/* based on the service group (e.g. coworking) and service id (e.g. it support) */
							
							foreach ($_DATA['service2service_group']['items'] as $vd_service2service_group) {
								
								$vd_service2service_group_service_id = $vd_service2service_group['service_id'];
								$vd_service2service_group_service_group_id = $vd_service2service_group['service_group_id'];
								$vd_service2service_group_is_inclusive = $vd_service2service_group['is_inclusive'];
								$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service2service_group_service_group_id]['css_signature'];
								
								if ($vd_service2service_group_service_id === $service_single_id && $vd_service2service_group_service_group_id === $vd_office_center_service_group_id) {
									
									/* check if the this service is included for this service group */
									
									if ($vd_service2service_group_is_inclusive === '1') {
										
										echo '<div class="included" title="Входит в стоимость услуги"></div>';
										
										$service_was_displayed = true;
										
									} else {
										
										echo '<div class="payed" title="Предоставляется за дополнительную плату"></div>';
										
										$service_was_displayed = true;
										
									}
									
									if (null === $is_inclusive_in_first_column) { // get into here only for the first time (first column)
										$is_inclusive_in_first_column = $vd_service2service_group_is_inclusive;
									}

								}
								
							}
							
							if ($service_was_displayed == false) {
								
								echo '<div class="not_included" title="Не предоставляется"></div>';
								
								if (null === $is_inclusive_in_first_column) { // get into here only for the first time (first column)
									$is_inclusive_in_first_column = -1;
								}
							}
							
							$service_was_displayed = false;
							
							echo '</td>';	
							
						}
						
						echo '</tr>';	
						
					}
					
					// link the contents of the row with 'inclusive'
					$out_service_row = & $out_service_rows[];
					$out_service_row['is_inclusive'] = $is_inclusive_in_first_column;
					$out_service_row['tr'] = ob_get_contents();
					ob_clean();

				}

				ob_end_clean();

				// now order the rows by 'inclusive' and display them
				// client's hosting uses php 5.2 - orly? - hence can't use anonymous functions
				function orly_1($a, $b) {return $b['is_inclusive'] - $a['is_inclusive'];}
				usort($out_service_rows, orly_1);
				function orly_2($row) {return $row['tr'];}
				echo implode('', array_map(orly_2, $out_service_rows));
				?>
			</table>
			</div>
		</div>
		<div class="vd_singleofficewrapper-content-contacts">
			<a name="contacts"></a>
			<div class="g-container">
			<h2 class="g-section-title">Контакты</h2>
			<div class="vd_singleofficewrapper-content-contacts-details">
				<div class="vd_singleofficewrapper-content-contacts-details-left">
				<?	if ($single_office_center_metro_label) {
						echo preg_replace('/(' . $single_office_center_metro_label . ')/u', '<div class="vd_officelistwrapper-office-place-marker" style="background-color: ' . $single_office_center_metro_color . '"></div>$1', $single_office_center_address);
					} else {
						echo $single_office_center_address;
					} ?>
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
			<input type="hidden" class="vd_singleofficewrapper-content-contacts-color" value="<? echo $single_office_center_color; ?>" />
		</div>
		<div class="vd_mapwrapper">
			<div id="vd_mapwrapper-map"></div>
		</div>
		<div class="vd_singleofficewrapper-content-special">
			<a name="special"></a>
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
	</div>
	<div class="vd_singleofficewrapper-other">
		<h2 class="g-section-title">Другие бизнес-центры</h2>
		<div class="vd_singleofficewrapper-other-list">

        <?	out_office_centers($_DATA['office_center']['items'], $g_office_center_id); ?>

		</div>
	</div>
	<div class="vd_singleofficewrapper-footer">
		<div class="g-container">
		<p>«Деловой» предлагает гораздо большее: современную недвижимость для малого предпринимателя, помощь в оптимизации расходов на аренду и выход на новый уровень ведения бизнеса. Цены на аренду офисов начинаются от 11 и до 15,5 тыс. рублей за 1 рабочее место в месяц, а расценки на аренду переговорных 700 (в 3-х центрах) и 1800 рублей в час (в Гостином Дворе). При этом чем больше часов вы у нас работаете, тем больше скидка. Наши цены оптимальны и справедливы, не занижены искусственно за счет дополнительных скрытых платежей.</p>
		</div>
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
	out_office_centers($_DATA['office_center']['items']);
?>
</div>

<div class="vd_officelistdata">
	<div class="g-container"><div class="g-container-row">
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
	</div></div>
</div>

<?
}

}

function out_office_centers($vd_office_centers, $exclude_office_center_id = null) {
	global $_DATA;

	foreach ($vd_office_centers as $single_office_center) {
		
		$single_office_center_id = $single_office_center['id'];
		
		if ($single_office_center_id == $exclude_office_center_id) {
			continue;
		}

		$single_office_center_city_label = $single_office_center['city_id_lookup'];
		$single_office_center_city_id = $single_office_center['city_id'];
		
		$single_office_center_metro_id = $single_office_center['metro_id'];
		
		$single_office_center_metro_label = $single_office_center['metro_id_lookup'];
		$single_office_center_metro_color = $single_office_center['metro_color'];
		
		if ($single_office_center_metro_color == NULL) {
			$single_office_center_metro_color = '#000000';
		}
		
		$single_office_center_color = $single_office_center['color'];
		
		if ($single_office_center_color == NULL) {
			$single_office_center_color = '#000000';
		}
		
		$single_office_center_img_int = $single_office_center['int_img_src'];
		$single_office_center_img_ext = $single_office_center['ext_img_src'];
		
		$single_office_center_annotation = $single_office_center['annotation'];
		$single_office_center_body = $single_office_center['body'];
		
		$single_office_center_service_labels = $single_office_center['service_group_lookup'];
		
		$single_office_center_service_ids = $single_office_center['service_group'];

		$single_office_center_service_id_group = explode(',', $single_office_center_service_ids);
		
		// set the same order as for the main list of services
		$single_office_center_service_id_group = array_intersect(array_keys($_DATA['service_group']['items']), $single_office_center_service_id_group);

		$single_office_center_phone = $single_office_center['phone'];
		$single_office_center_email = $single_office_center['email_request'];
		
		$single_office_center_coordinates = $single_office_center['google_map'];
		
		$single_office_center_title = $single_office_center['title'];
		
		$single_office_center_published = $single_office_center['published'];
		
		if ($single_office_center_published == '1') {
			
			echo '<div class="vd_officelistwrapper-office">';
			
				// let's consider $exclude_office_center_id like a flag for the single office center page - don't show the other centers on the map then
				if (!$exclude_office_center_id) {
					echo '<input type="hidden" class="vd_officelistwrapper-office-coordinates" value="' . $single_office_center_coordinates . '">';
					
					echo '<input type="hidden" class="vd_officelistwrapper-office-color" value="' . $single_office_center_color . '">';
				}
			
				echo '<a href="?center=' . $single_office_center_id . '">';
			
					echo '<div class="vd_officelistwrapper-office-photo">';
					
						echo '<img src="http://' . $_SERVER['HTTP_HOST'] . $single_office_center_img_int . '">';
					
					echo '</div>';
					
				echo '</a>';
				
				echo '<div class="vd_officelistwrapper-office-services">';
				
				foreach ($single_office_center_service_id_group as $single_office_center_service_id_single) {
					
					$single_office_center_service_id_single_title = $_DATA['service_group']['items'][$single_office_center_service_id_single]['title'];
					
					echo '<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_' . $single_office_center_service_id_single . '" title="' . $single_office_center_service_id_single_title . '"></div>';
					
				}
				
				echo '</div>';
				
				echo '<a href="?center=' . $single_office_center_id . '">';
				
					echo '<div class="vd_officelistwrapper-office-name">' . $single_office_center_title . '</div>';
					
				echo '</a>';
				
				if ($single_office_center_metro_id != NULL) {
					
					echo '<div class="vd_officelistwrapper-office-place">';
					
					echo '<div class="vd_officelistwrapper-office-place-marker" style="background-color: ' . $single_office_center_metro_color . ';"></div>';
					
					echo $single_office_center_metro_label;
					
					echo '</div>';
					
				} else {
					
					echo '<div class="vd_officelistwrapper-office-place">' . $single_office_center_city_label . '</div>';
					
				}
				
				echo '<div class="vd_officelistwrapper-office-text">' . $single_office_center_annotation . '</div>';
			
			echo '</div>';
			
		}
		
	}
}
?>


