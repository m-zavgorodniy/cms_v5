<!DOCTYPE html>
<html class="no-js" lang="<?=$_SITE['html_lang']?>">
<head>
	<meta charset="utf-8">
<?	// define any SEO_* constants in inner template ?>
	<title><?=$_SITE['seo_title']?$_SITE['seo_title']:(defined('SEO_PAGE_TITLE')?SEO_PAGE_TITLE . ' — ' . $_SITE['site_title']:$_SITE['page_title'])?></title>
<?	if (defined('SEO_PAGE_NOINDEX')) { ?>
	<meta name="robots" content="NOINDEX, NOFOLLOW">
<?	} else { ?>
	<meta name="robots" content="NOODP">
<?	} ?>
<?	if ($_SITE['seo_description']) { ?>
	<meta name="description" content="<?=$_SITE['seo_description']?>">
<?	} else if (defined('SEO_DESCRIPTION')) { ?>
	<meta name="description" content="<?=SEO_DESCRIPTION?>">
<?	}
	if ($_SITE['seo_keywords']) { ?>
	<meta name="keywords" content="<?=$_SITE['seo_keywords']?>">
<?	} else if (defined('SEO_KEYWORDS')) { ?>
	<meta name="keywords" content="<?=SEO_KEYWORDS?>">
<?	} ?>

	<link href="/css/styles.css" rel="stylesheet">
	<link href="/css/content.css" rel="stylesheet">

	<link rel="stylesheet" href="/fonts/font-awesome.min.css">

	<script src="/js/jquery-1.11.1.min.js"></script>

	<script src="/js/script.js"></script>
</head>
<body class="page-<?=$_SITE['section_type']?>">
    <header>
        page header
    </header>
    <div class="body g-clearfix">
        <div class="body-inner">
            <?=$__CMS__INNER_TEMPLATE_CONTENTS?>
        </div>
        <?=out_aside()?>
    </div>
    <footer>
        page footer
    </footer>
</body>
</html>