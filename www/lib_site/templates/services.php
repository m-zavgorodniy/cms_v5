<?
	
if ($_GET['azaza'] == 'true') {
	
	var_dump($_DATA); die;
	
}
	
/* if there's no service requested, then we'll output the service catalog */	

if ($_GET['service'] == false) {
	
?>

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
	<div class="g-container-row">
		<h2 class="g-section-title">Основные услуги</h2>
		<ul class="vd_services_list">
		<?
		
		foreach ($_DATA['service_group']['items'] as $service_group_item) {
			
			?>
			<a href="/services/?service=<? echo $service_group_item['id']; ?>">
			<li class="vd_services_list-item <? echo $service_group_item['css_signature']; ?>">
				<span class="vd_services_list-item-title"><? echo $service_group_item['title']; ?></span>
			</li>
			</a>
			<?
			
		}
			
		?>
			<li class="vd_services_list-item helper"></li>
		</ul>
	</div>
	<div class="g-container-row vd_services_text">
		<?
			$vd_services_text = $_DATA['article']['items'][1]['body'];
			
			$vd_services_text_pattern = array(
				'/width="50%"/',
				'/width="30"/',
				'/width="50%"/'
			);
			
			$vd_services_text_replacement = array(
				'/width="48%"/',
				'/width="4%"/',
				'/width="48%%"/'
			);
			
			/* change the width values to have a more sane separator between the cells */
			
			$vd_services_text = preg_replace($vd_services_text_pattern, $vd_services_text_replacement, $vd_services_text);
			
			echo $vd_services_text;
			
		?>
	</div>
	<div class="g-container-row vd_services2">
		<h2 class="g-section-title">Наши сервисы</h2>
		<div class="vd_services2_subtitle">Об условиях предоставления услуг уточняйте на странице конкретной услуги</div>
		<ul class="vd_services2_list">
		<?
		
		foreach ($_DATA['service']['items'] as $service_group_item) {
			
			?>
			
			<li class="vd_services2_list-item">
				<span class="vd_service2_list-item-image"><img src="http://<? echo $_SERVER['HTTP_HOST'] . $service_group_item['icon_img_src']; ?>" /></span>
				<span class="vd_service2_list-item-title"><? echo $service_group_item['title']; ?></span>
			</li>
			
			<?
			
		}
			
		?>
		</ul>
	</div>
</div>

<?
	
} else {
	
	$vd_service_group_id_title = $_DATA['service_group']['items'][$_GET['service']]['title'];
	$vd_service_group_id_css = $_DATA['service_group']['items'][$_GET['service']]['css_signature'];
	
?>

<div class="vd_service_single_wrapper">
	<div class="vd_service_single_wrapper-header <? echo $vd_service_group_id_css; ?>">
		<div class="g-container">
			<div class="g-container-row">
				<div class="vd_service_single_wrapper-header-logo"></div>
				<div class="vd_service_single_wrapper-header-servicename">
					<? echo $vd_service_group_id_title; ?>
				</div>
			</div>
		</div>		
	</div>
	<div class="vd_service_single_wrapper-menu">
		<div class="g-container">
			<div class="g-container-row">
				<ul>
					<li><a href="#about">Об услуге</a></li>
					<li><a href="#gallery">Галерея</a></li>
					<li><a href="#office_centers">Бизнес-центры, предоставляющие услугу</a></li>
					<li><a href="#special">Спецпредложения</a></li>
					<li class="helper"></li>
				</ul>
			</div>
		</div>		
	</div>
	
	<div class="vd_service_single_wrapper-about">
		<div class="g-container">
			<div class="g-container-row">
				<a name="about" /></a>
				<h2 class="g-section-title">Об услуге</h2>
				<div class="vd_service_single_wrapper-about-list">
					<div class="vd_service_single_wrapper-about-list-sublist included">
						<div class="vd_service_single_wrapper-about-list-sublist-header">
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
								<div class="vd_service_single_wrapper-about-list-block">
									<div class="vd_service_single_wrapper-about-list-block-image">
										<? echo '<img src="' . $service2service_group_item_icon . '" />'; ?>
									</div>
									<div class="vd_service_single_wrapper-about-list-block-title">
										<span><? echo $service2service_group_item_title; ?></span>
									</div>
									<div class="vd_service_single_wrapper-about-list-block-desc">
										<?echo $service2service_group_item_desc; ?>
									</div>
								</div>
								<?
								
							}
							
						}		
						
						?>
					</div>
					<div class="vd_service_single_wrapper-about-list-sublist payed">
						<div class="vd_service_single_wrapper-about-list-sublist-header">
							За дополнительную плату
						</div>
						<?
						
						foreach ($_DATA['service2service_group']['items'] as $service2service_group_item) {
							
							if ($service2service_group_item['is_inclusive'] === '0') {
								
								$service2service_group_item_service_id = $service2service_group_item['service_id'];
								$service2service_group_item_icon = $_DATA['service']['items'][$service2service_group_item_service_id]['icon_img_src'];
								$service2service_group_item_title = $service2service_group_item['service_id_lookup'];
								$service2service_group_item_desc = $_DATA['service']['items'][$service2service_group_item_id]['headline'];
								
								?>
								<div class="vd_service_single_wrapper-about-list-block">
									<div class="vd_service_single_wrapper-about-list-block-image">
										<? echo '<img src="' . $service2service_group_item_icon . '" />'; ?>
									</div>
									<div class="vd_service_single_wrapper-about-list-block-title">
										<span><? echo $service2service_group_item_title; ?></span>
									</div>
									<div class="vd_service_single_wrapper-about-list-block-desc">
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
	</div>
	
	<div class="vd_service_single_wrapper-centers">
	<div class="g-container">
	<div class="g-container-row">
		<a name="office_centers" /></a>
		<h2 class="g-section-title">Бизнес-центры, предоставляющие услугу <? echo $vd_service_group_id_title; ?></h2>
	<?	
	
	foreach ($_DATA['office_center2service_group']['items'] as $office_center2service_group_item) {
		
		$office_center2service_group_item_id = $office_center2service_group_item['id'];
		$office_center2service_group_item_center_id = $office_center2service_group_item['office_center_id'];
		$office_center2service_group_item_name = $office_center2service_group_item['office_center_id_lookup'];
		$office_center2service_group_item_price = $office_center2service_group_item['price'];
		$office_center2service_group_item_price = preg_replace('/( |&nbsp;)(.*)( |&nbsp;)/', ' <span>$2</span> ', $office_center2service_group_item_price);
		$office_center2service_group_item_publised = $office_center2service_group_item['published'];
		
		if ($office_center2service_group_item_publised === '1') {
			
			$office_center2service_group_item_center = $_DATA["office_center"]["items"][$office_center2service_group_item_center_id];
			
			$office_center2service_group_item_center_city_label = $office_center2service_group_item_center['city_id_lookup'];
			$office_center2service_group_item_center_metro_id = $office_center2service_group_item_center['metro_id'];
			$office_center2service_group_item_center_metro_label = $office_center2service_group_item_center['metro_id_lookup'];
			$office_center2service_group_item_center_metro_color = $office_center2service_group_item_center['metro_color'];
			
			if ($office_center2service_group_item_center_metro_color == NULL) {
				$office_center2service_group_item_center_metro_color = '#000000';
			}
			
			$office_center2service_group_item_center_img_int = $office_center2service_group_item_center['int_img_src'];
			$office_center2service_group_item_center_annotation = $office_center2service_group_item_center['annotation'];
			$office_center2service_group_item_center_service_ids = $office_center2service_group_item_center['service_group'];
			$office_center2service_group_item_center_service_id_group = explode(',', $single_office_center_service_ids);
			
			?>
			
			<div class="vd_officelistwrapper-office">
				<a href="/business-centers/?center=<? echo $office_center2service_group_item_center_id; ?>&service=<? echo $_GET['service']; ?>">
					<div class="vd_officelistwrapper-office-photo">
						<img src="http://<? echo $_SERVER['HTTP_HOST'] . $office_center2service_group_item_center_img_int; ?>" />
						<div class="vd_officelistwrapper-office-price <? echo $vd_service_group_id_css; ?>"><? echo $office_center2service_group_item_price; ?></div>
					</div>
				</a>
				<div class="vd_officelistwrapper-office-services">
					<?
					
					foreach ($office_center2service_group_item_center_service_id_group as $office_center2service_group_item_center_service_id_single) {
						
						echo '<div class="vd_officelistwrapper-office-services-service vd_officelistwrapper-office-services-service_' . $office_center2service_group_item_center_service_id_single . '"></div>';
						
					}	
						
					?>
				</div>
				<a href="/business-centers/?center=<? echo $office_center2service_group_item_center_id; ?>&service=<? echo $_GET['service']; ?>">
					<div class="vd_officelistwrapper-office-name">
						<? echo $office_center2service_group_item_name; ?>
					</div>
				</a>
				<div class="vd_officelistwrapper-office-place">
					<?
					
					if ($office_center2service_group_item_center_metro_id != NULL) {
						
						echo '<div class="vd_officelistwrapper-office-place-marker" style="background-color: ' . $office_center2service_group_item_center_metro_color . ';"></div>';
					
						echo $office_center2service_group_item_center_metro_label;
						
					} else {
						
						echo $office_center2service_group_item_center_city_label;
						
					}
						
					?>
				</div>
				<div class="vd_officelistwrapper-office-text">
					<? echo $office_center2service_group_item_center_annotation; ?>
				</div>
			</div>
			
			<?
			
		}
		
	}
		
	?>	
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

<?	
	
}	
	
?>