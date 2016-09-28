<?
// the code in here runs before all


// from http://seoprofy.ua/blog/optimizaciya-sajtov/301-redirekt, modified
// редирект с любого урла на url только в нижнем регистре
$lowerURI = strtolower($_SERVER['REQUEST_URI']);
if ($_SERVER['REQUEST_URI'] != $lowerURI) {
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: " . $lowerURI);
    exit();
}

/*
// a little naughty hack - see SQL-filter in /admin/edit.php?type=meta_table&id=special_offer:
// special_offer.published > 0 AND [FIND_IN_SET({center}, office_center_id)] AND [FIND_IN_SET({service}, service_group_id)] OR [{special} > 0 AND special_offer.published > 0]
if (!isset($_GET['special'])) $_GET['special'] = 0;
*/

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

function out_presentation($url, $css_signature) { 
    if (!$url) return; ?>
    <script>
        $(function() {
            $("#senddeck [type='button']").on("click", function() {
                var email = $("#senddeck [name='email']").val();
                if ('' === $.trim(email) || !(/[^\s@]+@[^\s@]+\.[^\s@]+/.test(email))) {
                    $("#senddeck_error").show();
                } else {
                    var data = {email: email, link: $("#senddeck input[name='link']").val()};
                    $("#senddeck button").prop("disabled", true);
                    $("#senddeck form").html('<img src="/images/ajax_loader_big.gif" alt="">').show();
                    var jqxhr = $.post("/ajax/send_deck.php", data, function(data) {
                        $("#senddeck form").html('<div class="vd_serviceincenter_wrapper-get_presentation-error g-error">Презентация выслана на ваш e-mail.</div>');
                    });
                    jqxhr.fail(function() {
                        $("#senddeck form").html('<div class="vd_serviceincenter_wrapper-get_presentation-error g-error">Ошибка при отправке презентации.</div>');
                    });
                }
            });
        });
    </script>
    <div id="senddeck" class="vd_serviceincenter_wrapper-get_presentation">
        <div class="g-container">
            <h2 class="g-section-title">Узнайте подробности наших услуг в презентации</h2>
            <p>Оставьте свои контакты, и мы через минуту вышлем на почту подробную презентацию. Без спама.</p>
            <form>
                <input type="email" name="email" class="email" placeholder="Введите ваш e-mail">
                <input type="hidden" name="link" value="<?=$url?>">
                <input type="button" class="get_presentation <?=$css_signature?>" value="Получить презентацию" />
                <div class="g-clearfix"></div>
                <div id="senddeck_error" class="vd_serviceincenter_wrapper-get_presentation-error g-error" style="display: none;">Пожалуйста, введите e-mail
                </div>
           </form>
        </div>
    </div>
<?
}

function out_special_offers($special_offers, $exclude_offer_id = 0) {
    global $_SITE, $_DATA; ?>
    <ul class="offers-items">
    <?  foreach ($special_offers as &$special_offer) {
            if ($exclude_offer_id == $special_offer['id']) continue; ?>
            <li>
                <div class="offers-item">
                <?  // todo! select "main" service to use icon from or something, in replacement of 'end(explode(..'
                    if (false === strpos($special_offer['service_group_css_class'], ',')) {
                        $service_group_css_class = $special_offer['service_group_css_class'];
                    } else {
                        $service_group_css_class = end(explode(',', $special_offer['service_group_css_class']));
                    } ?>
                    <div class="offers-item-title c-icon c-<?=$service_group_css_class?>">
                        <?=$special_offer['title']?>
                    </div>
                    <div class="offers-item-date">
                        <span class="g-nobr"><?=text_date_str($special_offer['date_from'], 'ru_RU', 'j M')?><?=$special_offer['date_to']?' – ' . text_date_str($special_offer['date_to'], 'ru_RU', 'j M'):''?></span>
                    </div>
                    <div class="offers-item-center">
                        <?=str_replace('/', '&nbsp;/ ', str_replace(' ', '&nbsp;', str_replace(', ', '/', $special_offer['office_center_id_lookup'])))?>
                    </div>
                    <div class="offers-item-link"><a href="<?=$_SITE['section_paths']['special']['path']?>?special=<?=$special_offer['id']?>" class="g-button c-<?=$service_group_css_class?>">ПОДРОБНЕЕ</a></div>
                </div>
            </li>
    <?  }
        unset($special_offer); ?>
    </ul>
<?
}

function out_special_offers_by_center($office_center_id, $office_center_title = '') {
    global $_DATA;
    if (isset($_DATA['special_offer'])) {
        if ($office_center_id) {
            foreach ($_DATA['special_offer']['items'] as &$special_offer) {
                $special_offer_ids = explode(',', $special_offer['office_center_id']);
                if (in_array($office_center_id, $special_offer_ids)) {
                    $special_offers_center[] = $special_offer;
                } else {
                    $special_offers_other[] = $special_offer;
                }
            }
            unset($special_offer);
        } ?>
        <div class="vd_singleofficewrapper-content-special">
            <a name="special"></a>
        <? if (isset($special_offers_center)) { ?>
            <div class="g-container">
                <div class="g-container-row">
                    <h2 class="g-section-title">Cпецпредложения в бизнес-центре «<?=$office_center_title?>»</h2>
                <?  out_special_offers($special_offers_center); ?>
                </div>
            </div>
        <?  }
            if (isset($special_offers_other)) { ?>
            <div class="g-container">
                <div class="g-container-row">
                    <h2 class="g-section-title"><?=isset($special_offers_center)?'Cпецпредложения в других бизнес-центрах':'Cпецпредложения'?></h2>
                <?  out_special_offers($special_offers_other); ?>
                </div>
            </div>
        <?  } ?>
        </div>
<?  }
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