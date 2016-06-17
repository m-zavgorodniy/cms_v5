<?
	
	if ($_GET['azaza'] == 'true') {
		
		var_dump($_DATA); die;
		
	}
	
	/* for development purposes only, remove when moving to the correct templates */

	if ($_GET['display_service']) {

		include('service_template.php'); 

	} elseif ($_GET['display_special']) {

		include('special_template.php'); 

	} else {
	
	/* single service in office center */
		
	if ($_DATA['office_center']['is_single'] && $_DATA['service_group']['is_single']) {
		
		include('service_template.php');
	
	/* single office center */	
		
	} elseif ($_DATA['office_center']['is_single'] == true) {
		
		$single_office_center = $_DATA['office_center']["items"][$_GET['center']];
		
		
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
			<? echo $single_office_center_annotation; ?>
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
			<h2 class="g-section-title">О бизнес-центре</h2>
			<?
			
			foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
				
				if ($office_center_detail['office_center_detail_type_id'] == 'text') {
					
					?>
					
			<div class="vd_singleofficewrapper-content-about-block">
				<div class="vd_singleofficewrapper-content-about-block-image">
					
				</div>
				<div class="vd_singleofficewrapper-content-about-block-text">
					<? echo $office_center_detail['body']; ?>
				</div>
			</div>		
					
					<?
					
				}
				
			}	
				
			?>
		</div>
		<div class="vd_singleofficewrapper-content-gallery">
			<a name="gallery"></a>
			<h2 class="g-section-title">Галерея</h2>
			<div class="cycle-slideshow"
				data-cycle-timeout="0"
				data-cycle-fx="carousel"
				data-cycle-carousel-visible="3"
				data-cycle-carousel-fluid="true"
				data-cycle-slides="> a"
			>
			    <div class="cycle-prev"></div>
				<div class="cycle-next"></div>
			<?
			
			foreach ($_DATA['office_center_detail']['items'] as $office_center_detail) {
				
				if ($office_center_detail['office_center_detail_type_id'] == 'gallery') {
					
					$office_center_detail_body = $office_center_detail['body'];
					
					preg_match('/<a.*\/a>/', $office_center_detail_body, $office_center_gallery);
					
					echo $office_center_gallery[0];
					
				}
				
			}	
				
			?>
			</div>
		</div>
		<div class="vd_singleofficewrapper-content-services">
			<a name="services"></a>
			<h2 class="g-section-title">Услуги</h2>
			<table class="vd_singleofficewrapper-content-services-table">
				<tr>
					<th class="service_header_label_block">Основные услуги</th>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<th class="service_header_content_block ' . $vd_service_group_id_css . '"><span>' . $vd_service_group_id_title . '</span></th>';
							
						}
						
					}
						
				?>
					

				</tr>
				<tr>
					<td class="service_header_label_block">Стоимость услуг</td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						
						$vd_office_center_service_group_price = preg_replace('/( |&nbsp;)(.*)( |&nbsp;)/', ' <span>$2</span> ', $vd_office_center_service_group_price);
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="service_price ' . $vd_service_group_id_css . '">' . $vd_office_center_service_group_price . '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						$vd_office_center_service_group_center_id = $vd_office_center_service_group['office_center_id'];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="detailed_block ' . $vd_service_group_id_css . '"><a href="?center=' . $vd_office_center_service_group_center_id . '&service=' . $vd_service_group_id . '"><span>Подробнее</span></a></td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td colspan="5" class="services_subtitle">Дополнительные сервисы, входящие в услуги</td>
				</tr>
				<tr>
					<td class="service_label_block"><span>Секретарь</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Мебель</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Интернет</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Почтовый адрес</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Телефония</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Курьер</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>IT поддержка</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Поиск персонала</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Юрист</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Юридический адрес</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
				<tr>
					<td class="service_label_block"><span>Видео конференция</span></td>
				<?
				
					foreach ($_DATA['office_center2service_group']['items'] as $vd_office_center_service_group) {
						
						$vd_office_center_service_group_id = $vd_office_center_service_group['id'];
						$vd_office_center_service_group_title = $vd_office_center_service_group['title'];
						$vd_office_center_service_group_price = $vd_office_center_service_group['price'];
						$vd_office_center_service_group_published = $vd_office_center_service_group['published'];
						$vd_service_group_id = $vd_office_center_service_group['service_group_id'];
						$vd_service_group_id_css = $_DATA['service_group']['items'][$vd_service_group_id]['css_signature'];
						$vd_service_group_id_pricing_term = $_DATA['service_group']['items'][$vd_service_group_id]['pricing_term'];
						$vd_service_group_id_title = $_DATA['service_group']['items'][$vd_service_group_id]['title'];
						
						/* since we currently don't have any real data in the DB, randomize some for output */
						
						$vd_random_css_list = array('included',
						'not_included',
						'payed');
						
						$vd_random_value = rand(0,2);
						
						$vd_random_css = $vd_random_css_list[$vd_random_value];
						
						if ($vd_office_center_service_group['published'] == '1') {
							
							echo '<td class="' . $vd_service_group_id_css . '_block last_block">';
							
							echo '<div class="' . $vd_random_css . '"></div>';
							
							echo '</td>';
							
						}
						
					}
						
				?>
				</tr>
			</table>
		</div>
		<div class="vd_singleofficewrapper-content-contacts">
			<a name="contacts"></a>
			<h2 class="g-section-title">Контакты</h2>
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
			<input type="hidden" class="vd_singleofficewrapper-content-contacts-color" value="<? echo $single_office_center_color; ?>" />
		</div>
		<div class="vd_mapwrapper">
			<div id="vd_mapwrapper-map"></div>
		</div>
		<div class="vd_singleofficewrapper-content-special">
			<a name="special"></a>
			<h2 class="g-section-title">Cпецпредложения</h2>
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
		<h2 class="g-section-title">Другие бизнес-центры</h2>
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
		
		$single_office_center_phone = $single_office_center['phone'];
		$single_office_center_email = $single_office_center['email_request'];
		
		$single_office_center_coordinates = $single_office_center['google_map'];
		
		$single_office_center_title = $single_office_center['title'];
		
		$single_office_center_published = $single_office_center['published'];
		
		if ($single_office_center_published == '1') {
			
			echo '<div class="vd_officelistwrapper-office">';
			
				echo '<input type="hidden" class="vd_officelistwrapper-office-coordinates" value="' . $single_office_center_coordinates . '">';
					
				echo '<input type="hidden" class="vd_officelistwrapper-office-color" value="' . $single_office_center_color . '">';
			
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


