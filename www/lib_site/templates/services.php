<?
	
if ($_GET['azaza'] == 'true') {
	
	var_dump($_DATA); die;
	
}

if ($_GET['special']) {
		
	include('special_template.php');

/* if there's no service requested, then we'll output the service catalog */	

} elseif ($_GET['service'] == false) {
	
?>

<div class="g-container">
	<div class="g-container-row vd_services_header">
		<h1>Услуги</h1>
		<div class="vd_services_header-popular">
			Популярные услуги: <a href="">почасовая аренда офиса</a>, <a href="">офис под представительство в Москве</a>
		</div>
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
			$article = current($_DATA['article']['items']);
			echo $article['body'];

		?>
	</div>
	<div class="g-container-row vd_services2">
		<h2 class="g-section-title">Наши сервисы</h2>
		<div class="vd_services2_subtitle">Об условиях предоставления услуг уточняйте на странице конкретной услуги</div>
		<ul class="vd_services2_list">
		<?
		// group all the items by services
		$service_includes = array();
		if (isset($_DATA['service_includes'])) {
			foreach ($_DATA['service_includes']['items'] as &$subservice) {
				$service_includes[$subservice['service_id']][] = $subservice;
			}
			unset($subservice);
		}
		foreach ($_DATA['service']['items'] as $service_item) {
			
			?>
			
			<li class="vd_services2_list-item">
				<span class="vd_service2_list-item-image">
					<img src="<? echo $service_item['icon_img_src']; ?>" />
				</span>
				<span class="vd_service2_list-item-title">
					<? echo $service_item['title']; ?>
				</span>
				<div class="vd_services2_list-item-wrapper">
					<div class="vd_services2_list-item-wrapper-close">Закрыть</div>
					<div class="vd_services2_list-item-wrapper-title">
						<img src="<? echo $service_item['icon_img_src']; ?>" />
						<? echo $service_item['title']; ?>
					</div>
					<div class="vd_services2_list-item-wrapper-desc">
						<? echo $service_item['headline']; ?>
					</div>
					<div class="vd_subservice_list">
					<?	if (isset($service_includes[$service_item['id']])) {
							$previous_is_group = false;
							$sublist_is_open = false;
							foreach ($service_includes[$service_item['id']] as &$subservice) {
								if ($subservice['is_group_title'] and $sublist_is_open) { // end sublist ?>
									</div>
								<?	$sublist_is_open = false;
								}
								if (!$subservice['is_group_title'] and $previous_is_group) { ?>
									<div class="vd_subservice_list-item-sublist closed">
								<?	$sublist_is_open = true;
								}
								if ($subservice['is_group_title']) { ?>
									<div class="vd_subservice_list-item">
										<?=$subservice['title']?>
									</div>
							<?	} else { ?>
									<div class="vd_subservice_list-item-sublist-item">
										<div class="vd_subservice_list-item-sublist-item-price">
											<?=$subservice['price']?>
										</div>
										<div class="vd_subservice_list-item-sublist-item-name">
											<?=$subservice['title']?>
										</div>
									</div>
							<?	}
								$previous_is_group = $subservice['is_group_title'];
							}
							unset($subservice);
							if ($sublist_is_open) { ?>
								</div>
						<?	}
						} ?>
					</div>
				</div>
			</li>
			
			<?
			
		}
			
		?>
		</ul>
		<script>
			$(function() {
				$(".vd_subservice_list-item").each(function() {
					if ($(this).next().is(".vd_subservice_list-item-sublist")) {
						$(this).addClass("vd_subservice_list-item-with-sublist")
					}
				});
			});
		</script>
	</div>
<?	if (isset($_DATA['special_offer'])) { ?>
	<div class="g-container"><div class="g-container-row">
		<h2 class="g-section-title">Cпецпредложения</h2>
	<?  out_special_offers($_DATA['special_offer']['items']); ?>
	</div></div>
<?	} ?>
</div>

<?
	
} else {
	
	$vd_service_group_id_title = $_DATA['service_group']['items'][$_GET['service']]['title'];
	$vd_service_group_id_css = $_DATA['service_group']['items'][$_GET['service']]['css_signature'];
	
	/* check if there's a gallery to display and its id, if there's any */
	if (isset($_DATA['service_group_detail'])) {
		foreach ($_DATA['service_group_detail']['items'] as $service_group_detail_key => $service_group_detail_value) {
			
			if ($service_group_detail_value['office_center_detail_type_id'] == 'gallery') {
				
				$vd_service_group_id_show_gallery = $service_group_detail_key;
				
			}	
			
		}
	}
	
?>

<div class="vd_service_single_wrapper">
	<div class="vd_service_single_wrapper-header <? echo $vd_service_group_id_css; ?>">
		<div class="g-container">
			<div class="g-container-row">
				<div class="vd_serviceincenter_wrapper-header-price">
					<?
						/* calculating the lowest possible price for this service */
						/* since we don't have that kind of data in the databe */
						
						$all_prices_for_this_service = array();
						
						foreach ($_DATA['office_center2service_group']['items'] as $service_group_in_center) {
							
							if ($service_group_in_center['price']) {
								
								$all_prices_for_this_service[] = $service_group_in_center['price'];
								
							}
							
						}
						
						function vd_sort_prices($a, $b) {
							
							$matches_a = array();
							
							preg_match_all('/(\d+)/', $a, $matches_a);
							
							$a_value = (int) implode('', $matches_a[0]);
							
							$matches_b = array();
							
							preg_match_all('/(\d+)/', $b, $matches_b);
							
							$b_value = (int) implode('', $matches_b[0]);
							
							if ($a_value == $b_value) {
								return 0;
							} elseif ($a_value > $b_value) {
								return 1;
							} else {
								return -1;
							}
							
						}
						
						usort($all_prices_for_this_service, vd_sort_prices);
						
						$vd_service_in_center_price = $all_prices_for_this_service[0];
						
						$vd_service_in_center_price = preg_replace('/(\d+)/', '<span>$1</span>', $vd_service_in_center_price);
						
						echo $vd_service_in_center_price;
						
					?>
				</div>
				<div class="vd_service_single_wrapper-header-logo"></div>
				<h1><? echo $vd_service_group_id_title; ?></h1>
			</div>
		</div>		
	</div>
	<div class="vd_service_single_wrapper-menu">
		<div class="g-container">
			<div class="g-container-row">
				<ul>
					<li><a href="#about">Об услуге</a></li>
					<?
						if ($vd_service_group_id_show_gallery) {
					?>	
					<li><a href="#gallery">Галерея</a></li>	
					<?	
						}		
					?>
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
	
	<?
	if ($vd_service_group_id_show_gallery) {
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
			
				$vd_service_gallery_body = $_DATA['service_group_detail']['items'][$vd_service_group_id_show_gallery]['body'];
				
				$vd_service_gallery_items = gallery_html2array($vd_service_gallery_body);
				
				foreach ($vd_service_gallery_items as $vd_service_gallery_item) {
					
					echo '<a href="' . $vd_service_gallery_item[1] . '" class="fancybox-thumb" rel="fancybox-thumb"><img src="' . $vd_service_gallery_item[2] . '" data-original-src="' . $vd_service_gallery_item[1] . '" /></a>';
					
				}
				
			?>
		</div>
	</div>
	
	<?
	}
	?>
	
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
		$office_center2service_group_item_price = preg_replace('/(\d+)/', '<span>$1</span>', $office_center2service_group_item_price);
		$office_center2service_group_item_price_for_lookup = $office_center2service_group_item['price_for_lookup'];
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
						<img src="<? echo $office_center2service_group_item_center_img_int; ?>" />
						<div class="vd_officelistwrapper-office-price <? echo $vd_service_group_id_css; ?><? echo !$office_center2service_group_item_price_for_lookup?' no-term':''?>">
							<? echo $office_center2service_group_item_price; ?>
						<?	if ($office_center2service_group_item_price_for_lookup) { ?>
								<br />
								за <? echo $office_center2service_group_item_price_for_lookup; ?>
						<?	} ?>
						</div>
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

<?	if (isset($_DATA['special_offer'])) { ?>
	<div class="vd_serviceincenter_wrapper-special">
		<a name="special" /></a>
		<div class="g-container-row">
			<h2 class="g-section-title">Cпецпредложения</h2>
		<?  out_special_offers($_DATA['special_offer']['items']); ?>	
		</div>
	</div>
<?	} ?>
</div>

<?	
	
}	
	
?>