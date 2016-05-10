<?
function out_aside() {
	global $_SITE, $_DATA, $__; ?>
    <aside>
		side contents
    </aside>
<?
}

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
	<div class="sharing">
    	<!-- sharing code -->
    </div>
<?
}

// forms
function set_checked_attr($value, $param, $is_select = false) {
	if (is_array($param)) {
		if(in_array($value, $param)) {
			$res = true;
		}
	} else {
		if ($value === $param) {
			$res = true;
		}
	}
	echo $res?($is_select?' selected=""':' checked=""'):'';
}
?>