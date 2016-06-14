<?
/* populate reverse array for services in office centers: [service_id] => service_in_office_data */

if (isset($_DATA['office_center2service_group'])) {
	foreach($_DATA['office_center2service_group']['items'] as &$service_group) {
		$service_groups_reverse[$service_group['service_group_id']] = $service_group;
	}
	unset($service_group);
} ?>

<div class="g-container"><div class="g-container-row">
    <br><br>
<?
	/*
		service in office center
	*/

	if ($_DATA['office_center']['is_single'] && $_DATA['service_group']['is_single']) {
		$service_in_office_center = $service_groups_reverse[key($_DATA['service_group']['items'])]; ?>
		<h1><?=$service_in_office_center['title']?></h1>
		<div>
			<?=$service_in_office_center['body']?>
		</div>
<?
	/*
		single office center
	*/

	} else if ($_DATA['office_center']['is_single']) {
		$office_center = current($_DATA['office_center']['items']); ?>
		<h1><?=$office_center['title']?></h1>
		<div>
			<?=$office_center['body']?>
		</div>
        <div>
        <?
			/* list of the services delivered in this office center */

			$service_groups_in_center = explode(',', $office_center['service_group']);
			foreach($service_groups_in_center as &$service_group_id) {
				$service_group = $service_groups_reverse[$service_group_id];  ?>
				<div style="display: inline-block; width: 200px;">
					<?=$service_group['service_group_id_lookup']?><br>
					<?=$service_group['price']?><br>
					<a href="<?=$_SITE['section_paths']['office_centers']['path']?>?center=<?=$office_center['id']?>&service=<?=$service_group_id?>">Подробнее</a>
				</div>
        <?	}
			unset($service_group_id); ?>
        </div>
<?
	/*
		list of the office centers
	*/

	} else {
		foreach($_DATA['office_center']['items'] as &$office_center) { ?>
			<a href="<?=$_SITE['section_paths']['office_centers']['path']?>?center=<?=$office_center['id']?>"><?=$office_center['title']?></a><br>
	<?	}
		unset($office_center);
	} ?>
</div></div>