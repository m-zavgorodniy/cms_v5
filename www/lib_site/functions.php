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