<?
// this file is auto-included in all the php templates
// the functions you add here are available to use in the templates

function out_paginator($page, $items_on_page, $count, $prev_text = '<', $next_text = '>') {
	global $__;

	if (!(int)$page) $page = 1;
	if ($count > $items_on_page) {
		$pages_num = ceil($count / $items_on_page);
		$page_query = (false === strpos($_SERVER['REQUEST_URI'], '?')?'?':'&') . 'page=';
		$url = current(explode($page_query, $_SERVER['REQUEST_URI'])) . $page_query; ?>

        <div class="paginator" id="paginator1"></div>
        <div class="paginator_pages"><?=$pages_num?> pages</div>
		<div class="paginator_next">
		<?	if ($page < $pages_num) { ?>
        	<a href="<?=$url?><?=$page+1?>">Next page</a>
        <?	} else { ?>
        	<a>Next page</a>
        <?	} ?>
        </div>
        <script type="text/javascript">
            pag1 = new Paginator('paginator1', <?=$pages_num?>, <?=$items_on_page?>, <?=$page?>, "<?=$url?>");
        </script>
<?	}
}

function out_sharing() { ?>
   	<!-- code for sharing -->
<?
}

function out_special_offers($special_offers) {
    global $_SITE; ?>
    <h2 class="g-section-title">Cпецпредложения</h2>
    <ul class="offers-items">
    <?  foreach ($special_offers as &$special_offer) { ?>
        <li>
            <div class="offers-item">
                <div class="offers-item-title c-icon c-<?=$special_offer['service_group_css_class']?>">
                    <?=$special_offer['title']?>
                </div>
                <div class="offers-item-date">
                    <?=text_date_str($special_offer['date_from'], 'ru_RU', 'j M')?><?=$special_offer['date_to']?' – ' . text_date_str($special_offer['date_to'], 'ru_RU', 'j M'):''?>
                </div>
                <div class="offers-item-link"><a href="<?=$_SITE['section_paths']['services']['path']?>?service=<?=$special_offer['service_group_id']?>&special=<?=$special_offer['id']?>" class="g-button c-<?=$special_offer['service_group_css_class']?>">ПОДРОБНЕЕ</a></div>
            </div>
        </li>
    <?  }
        unset($special_offer); ?>
    </ul>
<?
}

function gallery_html2array($str) {
    preg_match_all('/<a\s.*?href="([^"]*)".*?<img\s.*?src="([^"]*)"/is', $str, &$matches, PREG_SET_ORDER);
    return $matches;
}

function db_insert_booking($data) {
    global $_SITE;
    $res = false;
    if (is_array($data)) {
        foreach ($data as $field => &$value) {
            if (null !== $value and '' !== ($value = trim($value))) {
                $value = mysql_real_escape_string($value, $_SITE['conn']);
            }
        }
        $res = db_mysql_query("INSERT INTO booking (" . implode(',', array_keys($data)) . ", created) VALUES ('" . implode("','", $data) . "', NOW())", $_SITE['conn']);
    }
    return true === $res;
}
?>